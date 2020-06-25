# terraform-workshop
O objetivo deste repositório é proporcionar ferramentas de estudo do Terraform. Dentro de cada diretório teremos arquivo do tipo md, detalhando os passos para execução e os resultados esperados.
O Terraform usa uma linguagem própria de configuração que foi desenhada para permitir uma descrição concisa da infraestrutura. A linguagem do Terraform é declarativa, descrevendo um objetivo ao invés de descrever os passos para alcançar tal objetivo.
### Pré-requisitos
- Terraform 0.12.26
- Conta da AWS com uma VPC padrão
### Instalação
Para funcionar corretamente o binário do terraform deve ser copiado para um local no PATH do sistema. Para fazer essa verificação basta digitar. Sugestão é mover para o /usr/local/bin
$ echo $PATH
Os passos para realizar o download e instalação estão abaixo:
```
$ wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
$ unzip terraform_0.12.26_linux_amd64.zip
$ sudo mv terraform /usr/local/bin
```
### Uso
O primeiro passo antes de criarmos qualquer coisas é executar o comando `terraform init`. Esta ação vai inicializar o terraform no diretório.
Após podemos verificar o que será criado com `terraform plan`. Esses passos ainda não validam nada da infraestrutura na nuvem. Se houver algum conflito será apontado no apply.
Para criarmos a estruturar basta executar um `terraform apply`. Nesse passo precisaremos de credenciais válidas para efetivar as nossas alterações.
E por fim podemos destruir a estrutura criada com `terraform destroy`
### Índice
[1 - Resources e Modules](./1-resources_e_modules/README.md)
 
> [1.1 - Resources](./1-resources_e_modules/1.1-resources/RESOURCES.md)
 
> [1.2 - Variáveis](./1-resources_e_modules/1.2-variaveis/VARIAVEIS.md)
 
> [1.3 - Module](./1-resources_e_modules/1.3-modules/MODULE.md)

[2 - Compartilhando o código](./2-compartilhando_codigo/README.md)
> [2.1 - Remote State](./2-compartilhando_codigo/2.1-remote_state/REMOTE_STATE.md)

> [2.2 - Data](./2-compartilhando_codigo/2.2-data/DATA.md)