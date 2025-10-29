output "project_id" {
  description = "El ID único del proyecto de GCP creado."
  value       = module.project_factory.project_id
}

output "project_number" {
  description = "El número del proyecto de GCP creado."
  value       = module.project_factory.project_number
}

output "cicd_tfstate_backend_bucket" {
  description = "El nombre del bucket para el backend de Terraform del nuevo proyecto."
  value       = var.enable_cicd_bootstrap ? google_storage_bucket.tfstate_backend[0].name : "No creado."
}

output "cicd_service_account_email" {
  description = "El email de la SA de despliegue para usar en el secreto GCP_SERVICE_ACCOUNT_EMAIL de GitHub."
  value       = var.enable_cicd_bootstrap ? google_service_account.cicd_runner_sa[0].email : "No creada."
}

output "cicd_workload_identity_provider" {
  description = "El identificador del proveedor de WIF para usar en el secreto GCP_WORKLOAD_IDENTITY_PROVIDER de GitHub."
  value       = var.enable_cicd_bootstrap ? google_iam_workload_identity_pool_provider.github_provider[0].name : "No creado."
}
