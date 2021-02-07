# Reaproveitando o código
Nesta parte trabalharemos com o conceito de módulos, estado remoto e data sources. 

## Módulo
Um módulo é um conjunto de recursos utilizados. 
 
Toda configuração do terraform tem ao menos um módulo, que é chamado de *módulo raiz*. Que são os recursos criados nos arquivos .tf do diretório corrente. 
 
Um módulo pode executar outros módulos, com isso é possível incluir *recursos filho* na configuração. Módulos também podem ser executados múltiplas vezes, com a mesma configuração ou com configurações diferentes. Permitindo que configurações de recursos sejam empacotadas e reutilizadas.
 
### Executando módulo
A estrutura module permite a execução de outro módulo. O *block label* é a identificação local do módulo que é definida pelo usuário. O parâmetro source é obrigatório e informa onde está o módulo. Os demais parâmetros são as variáveis do *módulo filho*.
```
module "servers" {
  source = "./app-cluster"
 
  servers = 5
}
```
 
Um módulo filho pode estar localizado na estrutura de diretório local, terraform registry, github, bitbucket, http url, s3 bucket e gcp bucket. 
 
Os retornos de um módulo filho são encapsulados, para o módulo raiz acessar o retorno do módulo é necessário declarar variáveis de output. 

## Remote State
Por padrão o arquivo de estado do terraform é armazenado localmente. Porém para que possamos compartilhar, armazenar e consumir informações, existe a opção de definir um local remoto para este arquivo de estado. Esse arquivo pode ser armazenado no Terraform Cloud, Consul, S3, Alibaba Cloud e outros.

```
terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "terraform-workshop"
        key = "states/2_1_remote_state.tfstate"
    }
}
```

### Inicialização 
Quando definimos um backend, essa estrutura é a primeira a ser inicializada. Logo, não podemos declarar variáveis dentro do arquivo terraform.tfvars. Tem algumas maneiras de definir esses valores
* Interativamente: o terraform irá perguntar por cada valor que ele necessitar
* Arquivo: um arquivo de configuração pode ser definido no `init`. Para tal basta usar `terraform init -backend-config=PATH`
* Linha de comando: também pode ser usado a linha de comando no formato `terraform init -backend-config="KEY=VALUE"`
* No próprio arquivo como no exemplo do repositório.

## Data source
É uma estrutura que permite buscar ou cosultar dados para ser usado na configuração do terraform. Podemos usar informações de fonte de fora do terraform ou criadas por outras coonfigurações. 

Esse é uma estrutura que permite vários usos. Aqui no nosso exemplo veremos como usar uma a ultima versão da Amazon Linux e consumir os recursos criados no exemplo 2.1.

```
data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = ["amazon"]

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
 }
}
```

## Estrutura
Nesse exemplo temos um módulo filho que cria uma ou mais EC2s com security group e keypair que é parametrizado por um modulo raiz. Para isso basta parametrizar o arquivo variables.tf do módulo root. O módulo filho já traz algumas facilidades como retornar qual a vpc, subnets e ami. Dispensando a configuração pelo usuário