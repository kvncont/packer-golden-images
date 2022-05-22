source "azure-arm" "azdo-agent-pool" {
  // Authentication
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  // Build
  build_resource_group_name = var.resource_group_name # Specify an existing resource group to run the build in
  vm_size                   = var.base_vm_size        # VM size for the build, Default: Standard_A1 (CPU: 1, RAM: 1.75GB)
  os_type                   = "Linux"
  image_publisher           = "Canonical"
  image_offer               = "UbuntuServer"
  image_sku                 = var.base_image_sku

  // Result
  managed_image_name                = "image-${lower(var.image_name)}"
  managed_image_resource_group_name = var.resource_group_name # The resource group must already exist

  azure_tags = var.tags
}

build {
  sources = ["source.azure-arm.azdo-agent-pool"]

  provisioner "shell" {
    scripts = ["install_packages.sh"]
  }

  post-processor "manifest" {}
}