# Overview
Terraform module to host website using Notion and Cloudflare. This module make use of Cloudflare worker to handle user traffic destined to a custom domain and render the Notion page.
The script included here is from this blog post: https://dev.to/koddr/using-the-notion-page-as-a-personal-website-with-your-domainc-on-cloudflare-1pi7

# How to use this repo
You will need to specify CLOUDFLARE_API_TOKEN environment variable:
```
export CLOUDFLARE_API_TOKEN=foo
```
The token should has the at least the following permissions:
- Account - Worker Scripts:Edit
- Zone - Zone:Edit, Zone Settings:Edit, Worker Routes:Edit, DNS:Edit

Other required variables are defined in `variables.tf`. Please check `variables.tfvars.example` for example.