# Remote State
Por padrão o arquivo de estado do terraform é armazenado localmente. Porém para que possamos compartilhar, armazenar e consumir informações, existe a opção de definir um local remoto para este arquivo de estado. Esse arquivo pode ser armazenado no Terraform Cloud, Consul, S3, Alibaba Cloud e outros.

```
terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "m4u-terraform-workshop"
        key = "states/2_1_remote_state.tfstate"
    }
}
```

# Inicialização 
Quando definimos um backend, essa estrutura é a primeira a ser inicializada. Logo, não podemos declarar variáveis dentro do arquivo terraform.tfvars. Tem algumas maneiras de definir esses valores
* Interativamente: o terraform irá perguntar por cada valor que ele necessitar
* Arquivo: um arquivo de configuração pode ser definido no `init`. Para tal basta usar `terraform init -backend-config=PATH`
* Linha de comando: também pode ser usado a linha de comando no formato `terraform init -backend-config="KEY=VALUE"`
* No próprio arquivo como no exemplo do repositório.

