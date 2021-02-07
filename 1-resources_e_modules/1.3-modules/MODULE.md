# Module
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
 
### Estrutura
Nesse exemplo temos um módulo filho que cria uma ou mais EC2s com security group e keypair que é parametrizado por um modulo raiz. Para isso basta parametrizar o arquivo variables.tf do módulo root.