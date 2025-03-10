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
