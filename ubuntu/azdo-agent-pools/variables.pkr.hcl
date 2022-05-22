variable "client_id" {
  description = "The client ID to authenticate with"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "The client secret to authenticate with"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The subscription ID to authenticate with"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The tenant ID to authenticate with"
  type        = string
  sensitive   = true
}

variable "image_name" {
  description = "The name of the image to use"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the image will be build in/saved"
  type        = string
  default     = "rg-packer"
}

variable "base_vm_size" {
  description = "The size of the base VM to use to build the image"
  type        = string
  default     = "Standard_A1"
}

variable "base_image_sku" {
  description = "The SKU of the base image to use"
  type        = string
  default     = "18.04-LTS"
}

variable "tags" {
  description = "The tags to apply to the image"
  type        = map(string)
  default = {
    "created_by"  = "packer"
    "environment" = "production"
  }
}