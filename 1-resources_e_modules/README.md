# Resources e Modules
O principal propósito da linguagem do Terraform é a declaração de Resources. Todos as outras funcionalidades existem apenas para fazer essa definição mais conveniente e flexível.
 
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
* Block Label são identificadores do que está sendo criado. O primeiro é sempre o recurso que será criado, sempre são declarados entre aspas, esses são definidos pela linguagem. Alguns exemplos: aws_instances e aws_vpc. O segundo é definido pelo usuário e vai ajudar a identificar o recurso que está sendo criado.
* Block body é a parte onde teremos os parâmetros da estrutura que estamos declarando. O formato é sempre identifier que é o nome requerido pela estrutura e expression que é definido pelo usuário.
 
### Organização do código
Os arquivos de configuração são do formato .tf. Também tem a possibilidade de usar uma variante baseada em json (https://www.terraform.io/docs/configuration/syntax-json.html).
 
### Terraform State
O terraform armazena a infraestrutura criada em um arquivo chamado `terraform.tfstate`. Por padrão esse arquivo fica armazenado localmente, mas também pode ser armazenado remotamente.
 
O state pode ser verificado, porém alterações manuais são desencorajadas.