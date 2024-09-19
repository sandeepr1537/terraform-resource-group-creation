variable "resource_groups_csv" {
  description = "Path to the CSV file containing resource group information"
  type        = string
}

variable "resource_groups" {
  type = list(object({
    resource_group_name = string
    location            = string
  }))
  description = "List of resource groups to be created"
}

