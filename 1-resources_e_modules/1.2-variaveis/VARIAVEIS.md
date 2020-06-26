# Variáveis
Servem para parametrizar o nosso código, deixando ele pronto para ser usado de maneiras diferentes. Os valores das variáveis podem ser assinalados via bloco de comando, linha de comando, módulo e arquivo de configuração.
 
Existem dois tipos de variáveis de input e output.
 
### Input
Servem como parâmetros para um módulo do terraform, permitindo que ele seja customizado sem alterar o código fonte do módulo.
 
O terraform suporta três tipos de variáveis string, number e bool. E estruturas como list, set, map object e tuple.
 
```
variable "ami_id" {
   type = string
   default = "ami-09d95fab7fff3776c"
   description = "Amazon Linux 2 da região us-east-1"
}
```
 
O terraform carrega as variáveis na seguinte ordem, onde os últimos valores sobrescrevem os primeiros
 
- Variáveis de ambiente
- arquivo `terraform.tfvars`
- arquivo `terraform.tfvars.json`
- qualquer arquivo `*.auto.tfvars` ou *.auto.tfvars.json` em ordem alfabética.
- Opções -var e -var-file da linha de comando
 
### Output
 
São valores de retorno do apply do terraform. Estes valores tem diversos usos. 

- Um módulo que foi executado pode expor esses valores para o módulo que fez a chamada. 
- Pode servir de retorno depois de um terraform apply
- Quando usamos um remote state, essas informações ficam expostas para outros módulos. 

```
output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
  description = "Ip privado da instância"
}
```
