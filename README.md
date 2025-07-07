# Opella DevOps Technical Challenge – Azure Terraform Infrastructure

This project demonstrates a reusable, scalable, and secure Azure infrastructure setup using **Terraform** and **GitHub Actions**, built for the Opella DevOps challenge.

---

## Project Structure

```
.
├── environments/
│   ├── dev/               # Dev environment with tfvars and root module calls
│   ├── prod/              # Placeholder for production (to scale)
│   ├── qa/                # Placeholder for QA (optional)
│
├── modules/
│   ├── automation_account/
│   ├── azure_functions/
│   ├── keyvault/
│   ├── network/
│   │   ├── nsg/
│   │   └── vnet/
│   ├── resource-group/
│   ├── storage-account/
│   ├── vm/
│
├── pipelines/
│   └── github-actions.yml # GitHub Actions workflow for CI/CD
```

---

## Features

- Reusable **Terraform modules** for all major Azure resources
- Deployable **multi-environment structure** (`dev`, `prod`, `qa`)
- Modular **GitHub Actions** pipeline for CI/CD
- Support for **NSGs**, **VNETs**, **VMs**, **Key Vaults**, **Automation Accounts**
- Documentation and tagging best practices
- Supports `terraform-docs`, `tflint`, and `tfsec` for quality and security

---

## Modules

Each module (e.g. `vnet`, `vm`, `storage-account`) includes:
- `main.tf`: Resource definitions
- `variables.tf`: Input interface
- `outputs.tf`: Useful exports

Modules are consumed by environment configs like `environments/dev/main.tf`.

---

## How to Use

### 1. Initialize Terraform in your environment
```bash
cd environments/dev
terraform init
```

### 2. Plan and apply infrastructure
```bash
terraform plan -out=tfplan
terraform apply tfplan
```

### 3. Configure backend storage (optional)
If using remote state, pre-create a storage account and use a `backend.tf`.

---

## GitHub Actions Pipeline

Location: `pipelines/github-actions.yml`

- Runs on `push` to `main`
- Matrix-deploys `dev`, `prod`
- Uses `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, `ARM_SUBSCRIPTION_ID` from GitHub secrets

---

## Secrets Setup

In your GitHub repo:
- Go to **Settings > Secrets > Actions**
- Add the following:
  - `ARM_CLIENT_ID`
  - `ARM_CLIENT_SECRET`
  - `ARM_SUBSCRIPTION_ID`
  - `ARM_TENANT_ID`

---

## Quality Tools (Suggested)

- `tflint` – Linter for Terraform code
- `tfsec` – Security scanner for Terraform
- `checkov` – Policy enforcement and IaC scanning
- `terraform-docs` – Auto-generate module documentation

---

## Notes

- Designed with flexibility: you can easily expand to more environments and regions
- Resources are properly tagged and named
- Error handling is modular — e.g., NSG rules via dynamic blocks