variable "account_id" {
    type = string
    description = "Cloudflare Account Id"
}

variable "zone" {
    type = string
    description = "Cloudflare Zone"
}

variable "website_domain" {
    type = string
    description = "Email associated with Cloudflare account"
}

variable "notion_page_slug" {
    type = string
    description = "Page slug of the Notion page"
}

variable "notion_page_title" {
    type = string
    description = "The title of Notion page"
}

variable "notion_page_description" {
    type = string
    description = "The description of Notion page"
}