# Data
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