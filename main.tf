provider "azurerm" {
  features {}
}

# Read CSV file
data "local_file" "resource_groups_csv" {
  filename = var.resource_groups_csv
}

# Parse CSV content
locals {
  csv_content = csvdecode(data.local_file.resource_groups_csv.content)
}

# Create resource groups
resource "azurerm_resource_group" "rg" {
  for_each = { for rg in local.csv_content : rg.resource_group_name => rg }

  name     = each.value.resource_group_name
  location = each.value.location
}
