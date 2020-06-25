# Module
Módulo é um conjunto de recursos que são usados em conjunto. 

Toda configuração do terraform tem ao menos um módulo, que é chamado de *módulo raiz*. Que são os recursos criados nos arquivos .tf do diretório corrente. 

Um módulo pode executar outros módulos, com isso é possível incluir *recursos filho* na configuração. Módulos também podem ser executado multiplas vezes, com a mesma configuração ou com configurações diferentes. Permitindo que configurações de recursos sejam empacotada e reusadas. 

### Executando módulo
A estrutura module permite a execução de outro módulo. O *block label* é a identificação local do módulo que é definida pelo usuário. O parâmetro source é obrigatório e informa aonde está o módulo. Os demais parâmetros são as variáveis do *módulo filho*.
```
module "servers" {
  source = "./app-cluster"

  servers = 5
}
```

Um módulo filho pode estar localizado na estrutura de diretório local, terraform registry, github, bitbucket, http url, s3 bucket e gcp bucket. 

Os retornos de um módulo filho são encapsulados, para o módulo raiz acessar o retorno do modulo é necessário usar o outputs. 

### Estrutura
Nesse exemplo temos um módulo raiz que pode ser parametrizado para criar instâncias EC2, usando um modulo filho.

No diretório ec2-root temos o módulo raiz aonde podemos parametrizar o módulo filho ec2-module