#!/bin/bash
source arg_getter.sh

# TODO:
# Fazer backup do banco, fazer backup dos arquivos.

mkdir -p $WORKDIR
cd $WORKDIR
if [[ -d LATEST && -f build_id ]] ; then
  mkdir -p /tmp/builds
  # Move a última build
  mv LATEST /tmp/builds/`cat build_id`
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

# Ajusta as permissões
chown -R $USER:$USER $WORKDIR
chmod -R 777 $WORKDIR/shared_files

# Ajustes pré-deploy do Drupal
# Faz update do banco de dados, reverte todas as features e limpa o cache.
cd $WORKDIR/LATEST/docroot
drush -y dis devel
drush -y dis views_ui
drush -y dis context_ui
drush -y dis update
drush -y dis l10n_update
drush -y dis dblog
drush -y dis rules_ui
drush -y dis update
drush -y dis field_ui
drush updb
drush cc all
drush fra -y
