locals {
  location = "japaneast"
  project = "tfstack-testing"
}

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
    inputs = {
        identity_token = identity_token.azurerm.jwt
        client_id = "aa6f3287-ff8d-464f-b6ba-d3af822d5249"
        subscription_id = "2e740db1-fd52-4fad-aa9e-c524bc9f96e6"
        tenant_id = "e9a036ff-e906-4e58-94dc-2f5f2693d5fd"

        location = local.location
        prefix = "tf-stack-dev"
        suffix = "202501"
        cidr_range = "10.0.0.0/16"
        subnets = {
            subnet1 = ["10.0.0.0/24"]
        }
        tags = {
            environment = "dev"
            project = local.project
        }
    }
}

deployment "prod" {
    inputs = {
        identity_token = identity_token.azurerm.jwt
        client_id = "aa6f3287-ff8d-464f-b6ba-d3af822d5249"
        subscription_id = "2e740db1-fd52-4fad-aa9e-c524bc9f96e6"
        tenant_id = "e9a036ff-e906-4e58-94dc-2f5f2693d5fd"

        location = local.location
        prefix = "tf-stack-prod"
        suffix = "202412"
        cidr_range = "10.1.0.0/16"
        subnets = {
            subnet1 = ["10.1.0.0/24"]
        }
        tags = {
            environment = "prod"
            project = local.project
        }
    }
}