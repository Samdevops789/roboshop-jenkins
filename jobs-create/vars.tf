variable "folders" {
  default = ["infrastructure", "applications"]
}

variable "infra-jobs" {
  default = ["terraform-mutable-infra", "cart-infra", "catalogue-infra", "user-infra", "payment-infra", "shipping-infra", "frontend-infra"]
}

variable "app-jobs" {
  default = ["cart", "catalogue", "user", "payment", "shipping", "frontend"]
}
