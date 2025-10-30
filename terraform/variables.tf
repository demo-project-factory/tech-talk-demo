variable "billing_account" {
  description = "El ID de la cuenta de facturación."
  type        = string
}

variable "organization_id" {
  description = "OPCIONAL: El ID de la organización de GCP. Usar esto si el proyecto no va dentro de una carpeta."
  type        = string
  default     = null
}
variable "folder_id" {
  description = "OPCIONAL: El ID de la carpeta de GCP donde se creará el proyecto."
  type        = string
  default     = null
}

variable "project_name" {
  description = "El nombre para el nuevo proyecto de GCP."
  type        = string
}


variable "project_services" {
  description = "Lista de APIs a activar en el proyecto."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Etiquetas a aplicar al proyecto."
  type        = map(string)
  default     = {}
}

variable "iam_bindings" {
  description = "Mapa de roles de IAM a una lista de miembros"
  type        = map(list(string))
  default     = {}
}

variable "org_policies" {
  description = "Mapa de políticas de organización para aplicar al proyecto."
  type        = map(string)
  default     = {}
}

variable "enable_cicd_bootstrap" {
  description = "Si es true, crea el bucket de backend y la configuración de Workload Identity para CI/CD."
  type        = bool
  default     = false # por defecto no se activa
}

variable "github_owner" {
  description = "El nombre de la organización o usuario en GitHub (ej: 'mi-empresa')."
  type        = string
  default     = "" # dejar vacío si no se activa el bootstrap
}

variable "github_repo" {
  description = "El nombre del repositorio en GitHub que gestionará el proyecto."
  type        = string
  default     = "" # dejar vacío si no se activa el bootstrap
}

variable "sa_predefined_roles" {
  description = "Lista de roles predefinidos de GCP que se asignarán a la SA de despliegue para que Terraform pueda funcionar."
  type        = list(string)
  default = [
    "roles/resourcemanager.projectIamAdmin",
  ]
}