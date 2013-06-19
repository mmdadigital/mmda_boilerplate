#!/bin/bash
JOB_NAME=$1
BUILD_ID=$2
WORKSPACE=$3

# Seta modo de debug para imprimir cada linha antes de executar:
set -x

# Faz backup do banco de dados atual.
## cd /var/www/$JOB_NAME/$BUILD_ID # TODO

# Cria a pasta de arquivos compartilhados por todas as builds
mkdir -p /var/www/$JOB_NAME/shared_files/
# Copia a build atual pra pasta de builds
cp -fr $WORKSPACE /var/www/$JOB_NAME/$BUILD_ID/
# Cria um symlink da última build
ln -sf /var/www/$JOB_NAME/$BUILD_ID/ /var/www/$JOB_NAME/LATEST
ls -la /var/www/$JOB_NAME/$BUILD_ID/
# Linka a pasta do projeto pra última build.
ln -sf /var/www/$JOB_NAME/LATEST /www/$JOB_NAME
# Configura a pasta files para usar a pasta de arquivos compartilhados
ln -sf /var/www/$JOB_NAME/shared_files/ /www/$JOB_NAME/docroot/sites/default/files
ls -la
# Remove todas as builds exceto as 4 últimas, a pasta shared_files e LATEST
rm -rf `ls -td /var/www/$JOB_NAME/*/ | tail -n +5 | grep -v "shared_files$\|LATEST$"`
# Aponta o arquivo settings.local.php pro arquivo de configurações compartilhado por todas as builds.
ln -sf /var/www/$JOB_NAME/settings.local.php /www/$JOB_NAME/docroot/sites/default/settings.local.php
# Ajusta as permissões
#chown -R www-data:www-data /var/www/$JOB_NAME/shared_files
chmod -R 777 /var/www/$JOB_NAME/shared_files

# Ajustes pré-deploy do Drupal
# Faz update do banco de dados, reverte todas as features e limpa o cache.
cd /www/$JOB_NAME/docroot
drush build --yes
