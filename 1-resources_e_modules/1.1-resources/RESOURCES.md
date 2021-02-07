# Resource
Este é o elemento mais importante da linguagem. Cada resource descreve um ou mais objetos de infraestrutura. Neste exemplo vamos construir a vpc que iremos utilizar nos demais exemplos. 
Um recurso gera valores de saída que podem ser acessados referenciando os block labels e o valor que desejamos. Isso é muito útil pois com um script podemos criar estruturas complexas. Esses valores também podem ser atribuídos a variáveis que veremos mais a frente.
Exemplo:
```
resource "aws_vpc" "vpc_base" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_base.id
}
```

### Provider
Provider é uma estrutura necessária para definirmos qual cloud usaremos e quais as chaves de acesso. Neste repositório apenas criaremos estruturas na AWS. Assumiremos que as credenciais estão no ~/.aws ou em variaveis de ambiente. Por questões de segurança, não é recomendando definir credenciais aqui. Todos os parâmetros são opcionais.

Exemplo:
```
provider "aws" {
  version = "~> 2.0" 
  region  = "us-east-1"
}
``` 

version = versão do framework do terraform, se não for definda será feito o download da ultima versão.
region = região da aws que será usada


 
