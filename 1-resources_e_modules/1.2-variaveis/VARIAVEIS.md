# Variáveis
Servem para parametrizar o nosso código, deixando mais reaproveitável. Os valores das variáveis podem ser assinalados via bloco de comando, linha de comando, módulo e arquivo de configuração.
 
Existem dois tipos de variáveis as de input e output.
 
### Input
Servem como parâmetros para um módulo do terraform, permitindo que ele seja customizado sem alterar o código fonte do módulo.
 
O terraform suporta três tipos de variáveis string, number e bool. E estruturas como list, set, map, object e tuple.
 
```
variable "ami_id" {
   description = "Amazon Linux 2 da região us-east-1"
   type = string
   default = "ami-09d95fab7fff3776c"
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

- Referenciar recursos criados em um módulo filho,
- Relatório dos recursos que foram criados após um `terraform apply`,
- Retorno do comando `terraform output`,
- Reaproveitado quando consultamos um estado remoto. Exemplo: Temos um módulo terraform que cria a VPC e outro módulo que consulta o estado remoto e utiliza essas informações, com o recurso data. 

```
output "private_ip" {
  description = "Ip privado da instância"
  value = aws_instance.ec2_instance.private_ip
}
```
