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

---

## Secrets Setup

To be continued in GitHub repo:
- **Settings > Secrets > Actions**
- Adding the following: (for now I've pushed with these visible, testing purpose)
  - `ARM_CLIENT_ID`
  - `ARM_CLIENT_SECRET`
  - `ARM_SUBSCRIPTION_ID`
  - `ARM_TENANT_ID`

---

## Quality Tools

- `tflint` – Linter for Terraform code (used)
- `tfsec` – Security scanner for Terraform (used)
- `checkov` – Policy enforcement and IaC scanning (used)
- `terraform-docs` – Auto-generate module documentation (haven't used it in the past)

---

## Notes

- Designed with flexibility to expand to more environments and regions
- Resources are properly tagged (most of them)
- Error handling is modular —> NSG rules via dynamic blocks