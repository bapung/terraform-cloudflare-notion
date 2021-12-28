terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  account_id = var.account_id
  # Set creds as environment variable
}

resource "cloudflare_zone" "zone" {
    zone = var.zone
}

resource "cloudflare_record" "A_root" {
  zone_id = cloudflare_zone.zone.id
  name    = var.website_domain
  value   = "192.0.2.1"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "AAAA_root" {
  zone_id = cloudflare_zone.zone.id
  name    = var.website_domain
  value   = "100::"
  type    = "AAAA"
  proxied = true
  ttl     = 1
}

resource "cloudflare_worker_route" "website" {
  zone_id = cloudflare_zone.zone.id
  pattern = "${var.website_domain}/*"
  script_name = cloudflare_worker_script.notion_script.name
}

resource "cloudflare_worker_script" "notion_script" {
  name = "notion_js"
  content = templatefile("notion.js", {
    website_domain: var.website_domain,
    notion_page_slug: var.notion_page_slug,
    notion_page_title: var.notion_page_title,
    notion_page_description: var.notion_page_description
  })
}