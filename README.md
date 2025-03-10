# examen-iaw-2-eval  
## Ejercicio1  
```
aws ec2 create-security-group \
    --group-name grupo_seguridad_ejercicio_1 \
    --description "Reglas de seguridad"
```
```
aws ec2 authorize-security-group-ingress \
    --group-name grupo_seguridad_ejercicio_1 \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0
```
```
aws ec2 run-instances \
    --image-id ami-04b4f1a9cf54c11d0 \
    --count 1 \
    --instance-type t2.small \
    --key-name vockey \
    --block-device-mapping DeviceName=/dev/sda1,Ebs={VolumeSize=20} \
    --security-groups grupo_seguridad_ejercicio_1 \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=instancia_ejercicio_1}]"
```

## Ejercicio2  
En primer lugar hay que descargar los plugins necesarios del proveedor que se especifica en el archivo de configuración.
```
terraform init
```

Terraform nos proporciona un comando para formatear el archivo de configuración para que sea más legible. Algunas de las tareas que realiza este comando son, ajustar la indentación, ordenar los argumentos de los bloques de configuración, etc.
```
terraform fmt
```
Para validar la sintaxis del archivo de configuración podemos utilizar el siguiente comando.
```
terraform validate
```

Compara la configuración del archivo de Terraform con la que existe actualmente en el proveedor de infraestructura y muestra las acciones que se tienen que realizar para conseguir la configuración deseada. Permite al usuario verificar los cambios antes de aplicarlos en el proveedor.
```
terraform plan
```

Crea los recursos del archivo de configuración en su cuenta de AWS.
```
terraform apply -auto-approve
```

## Ejercicio3  
Para lanzar el script de la instalación de docker mediante ansible utilizamos:
```
ansible-playbook -i ../inventory/inventario install_docker.yaml
```
