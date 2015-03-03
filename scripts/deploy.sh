#!/bin/bash
PARSED_OPTIONS=$(getopt -o hni:f:t: --long "help,name,id:,from:,to:" -- "$@")
if [ $? -ne 0 ];
then
  exit 1
fi
eval set -- "$PARSED_OPTIONS"
while true;
do
  case "$1" in

    -h|--help)
      echo "usage -n -i -f -t OR --name --id --from --to"
      shift;;

    -n|--name)
      if [ -n "$2" ];
      then
        JOB_NAME=$2
      fi
      shift 2;;

    -i|--id)
      if [ -n "$2" ];
      then
        BUILD_ID=$2
      fi
      shift 2;;

    -f|--from)
      if [ -n "$2" ];
      then
        FROM=$2
      fi
      shift 2;;

    -t|--to)
      if [ -n "$2" ];
      then
        WORKDIR=$2
      fi
      shift 2;;

    --)
      shift
      break;;
  esac
done

# TODO:
# Fazer backup do banco, fazer backup dos arquivos.

mkdir -p $WORKDIR
cd $WORKDIR
if [[ -d LATEST && -f build_id ]] ; then
  mkdir -p /tmp/jenkins_builds
  # Move a última build
  mv LATEST /tmp/jenkins_builds/`cat build_id`
fi

cp -fr $FROM LATEST
echo $BUILD_ID > build_id
ln -sf LATEST/docroot docroot

# Cria a pasta de arquivos compartilhados por todas as builds
mkdir -p shared_files

# Configura a pasta files para usar a pasta de arquivos compartilhados
ln -sf $WORKDIR/shared_files $WORKDIR/LATEST/docroot/sites/default/files

# Aponta o arquivo settings.local.php pro arquivo de configurações compartilhado por todas as builds.
ln -sf $WORKDIR/settings.local.php $WORKDIR/LATEST/docroot/sites/default/settings.local.php

# Cria pasta temporária
mkdir -p $WORKDIR/LATEST/docroot/tmp

# Ajusta as permissões
chown -R $USER:$USER $WORKDIR
chmod -R 777 $WORKDIR/shared_files

# Ajustes pré-deploy do Drupal
# Faz update do banco de dados, reverte todas as features e limpa o cache.
cd $WORKDIR/LATEST
phing -buildfile $FROM/build.xml
# drush build -y
