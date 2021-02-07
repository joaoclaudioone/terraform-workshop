# Resources e Modules
O principal propósito da linguagem do Terraform é a declaração de resources. Todas as outras funcionalidades existem apenas para fazer essa definição mais conveniente e flexível.
 
### Arquitetura
A arquitetura do terraform é composta de dois componentes 
- Terraform Core:
    - TF-Config: são os recursos descritos pelo usuário
    - State: arquivo de estado estado da infraestrutura
- Providers: 
    - São as configurações dos provedores de serviço onde a infraestrutura será criada (AWS, Azure, Google e etc..).
 
O terraform utiliza esses elementos para definir um plano de como será criada a infraestrutura. Ele faz isso utilizando o que foi escrito na configuração, comparando com o que tem no arquivo de estado. Deste ponto ele cria o plano do que deve ser feito para realizar as alterações (criar, alterar ou destruir). 
Os providers vão informar quais são os recursos que podem ser criados. Por exemplo, usando o provider da AWS temos acesso a criação de EC2s, usuários no IAM e etc. Terraform tem centenas de providers e é possível o escrever um provider personalizado, caso não esteja na lista. A lista completa pode ser conferida em https://registry.terraform.io/browse/providers
 
### Sintaxe
A sintaxe consiste em apenas alguns elementos básicos:
```
resource "aws_vpc" "main" {
    cidr_block = var.base_cidr_block
}
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
    # Block body
    <IDENTIFIER> = <EXPRESSION> # Argument
}
```
* Block Type é o tipo de estrutura da linguagem que está sendo declarada. Os tipos resources, modules e provider são alguns exemplos.
* Block Label são identificadores do que está sendo criado. O primeiro é sempre o recurso que será criado, sempre são declarados entre aspas, estes são definidos pela linguagem. Alguns exemplos: aws_instances e aws_vpc. O segundo é definido pelo usuário e vai ajudar a identificar o recurso que está sendo criado.
* Block body é a parte onde teremos os parâmetros da estrutura que estamos declarando. O formato é sempre identifier que é o nome requerido pela estrutura e expression que é definido pelo usuário.
 
### Organização do código
Os arquivos de configuração são do formato .tf. Também tem a possibilidade de usar uma variante baseada em json (https://www.terraform.io/docs/configuration/syntax-json.html).
 
### Terraform State
O terraform armazena a infraestrutura criada em um arquivo chamado `terraform.tfstate`. Por padrão esse arquivo fica armazenado localmente, mas também pode ser armazenado remotamente. Esse arquivo é criado automaticamente.
 
O state pode ser verificado, porém alterações manuais são desencorajadas.
