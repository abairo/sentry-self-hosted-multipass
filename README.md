# Sentry self-hosted com Ubuntu Multipass

## Configurando a VM

Configure a vm com os seguintes recursos (Configuração recomendada):

```bash
multipass launch  23.10 --name vm-ubuntu-sentry
multipass stop vm-ubuntu-sentry
multipass set local.vm-ubuntu-sentry.cpus=4
multipass set local.vm-ubuntu-sentry.disk=20G
multipass set local.vm-ubuntu-sentry.memory=16G
multipass start vm-ubuntu-sentry
```

## Instalando e configurando Sentry self-hosted

Acesse a vm:

```bash
multipass shell vm-ubuntu-sentry
```

Atualize a VM e Instale a última versão do docker

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install docker.io
sudo usermod -aG docker $USER
```

Instale a última versão do docker-compose, será necessário realizar a instalação manual:

```bash
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
# se o comando docker-compose falhar
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chgrp docker /usr/local/bin/docker-compose
sudo chmod 750 /usr/local/bin/docker-compose
```

## As instruções a seguir foram retiradas da [Documentação oficial](https://develop.sentry.dev/self-hosted/)

Acesse https://github.com/getsentry/self-hosted/releases/tag/23.11.2 (última versão)

baixe o arquivo .tar.gz dentro da vm e extraia seu conteúdo

```bash
wget -c https://github.com/getsentry/self-hosted/archive/refs/tags/23.11.2.tar.gz
tar -vzxf 23.11.2.tar.gz
```

Acesse a pasta extraída, inicie o processo de instalação e finalize rodando a aplicação

```bash
cd self-hosted-23.11.2/
./install.sh
docker-compose up -d
```

Se tudo ocorreu bem, nesse momento você poderá acessar o sentry via web: `endereco_vm:9000`

> Você poderá alterar a porta e outras configurações editando o arquivo .env
> gerado automaticamente durante o processo de instalação.
