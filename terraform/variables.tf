variable "region" {
  description = "Región de AWS donde se creará la instancia"
  type        = string
  default     = "us-east-1"
}

variable "allowed_ingress_ports" {
  description = "Puertos de entrada del grupo de seguridad"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "sg_name" {
  description = "Nombre del grupo de seguridad"
  type        = string
  default     = "grupo_seguridad_ejercicio_2"
}

variable "sg_description" {
  description = "Descripción del grupo de seguridad"
  type        = string
  default     = "Grupo de seguridad para la instancia de ejercicio 2"
}

variable "ami_id" {
  description = "Identificador de la AMI"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "Nombre de la clave pública"
  type        = string
  default     = "vockey"
}

variable "instance_name" {
  description = "Nombre de la instancia"
  type        = string
  default     = "instancia_ejercicio_2"
}