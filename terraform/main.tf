provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Author = "Ubiratan Junior"
    }
  }
}
