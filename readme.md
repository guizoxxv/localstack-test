Ao iniciar o container pela primeira vez executar

`/root/localstack/config/config.sh`

Este script irá criar o bucket, a fila, adicionar as regras ACL disponíveis no arquivo `localstack/config/notification_template.json` ao bucket, criar as configurações de notificação no bucket e importar o conteúdo da pasta `localstack/s3/data` do hospedeiro para o bucket.