# Resource
Este é o elemento mais importante da linguagem. Cada resource descreve um ou mais objetos de infraestrutura.
Neste exemplo vamos criar uma instância EC2 na região us-east-1, usando uma AMI Amazon Linux 2. Altere os dados de subnet para 
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


 
