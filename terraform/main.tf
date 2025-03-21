# Configuramos el proveedor de AWS
provider "aws" {
  region = var.region
}

# Creamos el grupo de seguridad
resource "aws_security_group" "grupo_seguridad_ejercicio_2" {
  name        = var.sg_name
  description = var.sg_description
}

# Creamos las reglas de entrada del grupo de seguridad. 
# Utilizamos un bucle para recorrer la lista de puertos definida como variable
resource "aws_security_group_rule" "ingress" {
  security_group_id = aws_security_group.grupo_seguridad_ejercicio_2.id
  type              = "ingress"

  count       = length(var.allowed_ingress_ports)
  from_port   = var.allowed_ingress_ports[count.index]
  to_port     = var.allowed_ingress_ports[count.index]
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# Creamos las reglas de salida del grupo de seguridad.
resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.grupo_seguridad_ejercicio_2.id
  type              = "egress"

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# Creamos una instancia EC2
resource "aws_instance" "instancia_ejercicio_2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.grupo_seguridad_ejercicio_2.name]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = var.instance_name
  }
}

# Creamos una IP elástica y la asociamos a la instancia
resource "aws_eip" "ip_elastica" {
  instance = aws_instance.instancia_ejercicio_2.id
}
