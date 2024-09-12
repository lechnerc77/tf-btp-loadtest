# Load Test via Terramate

## Basic Setup

- Install Terramate if not already available on your system (see [documentation](https://terramate.io/docs/cli/installation)).
- Create a `.env` file with the following content

   ```text
   BTP_USERNAME='<YOUR USERNAME>'
   BTP_PASSWORD='<YOUR PASSWORD>'
   TF_VAR_globalaccount='<YOUR GLOBAL ACCOUNT SUBDOMAIN>'
   ```
- Open a terminal and execute:

   ```bash
   export $(xargs <.env)
   ```
- Run the following command to make sure that the generated sources are up to date:

   ```bash
   terramate generate
   ```

### Execute Terraform

- Trigger the planning for the four stack (= four subaccounts) in parallel

   ```bash
   terramate script run -X -j 4 plan
   ```

### Execute OpenTofu

- Trigger the planning for the four stack (= four subaccounts) in parallel

   ```bash
   terramate script run -X -j 4 plan-tofu
   ```
