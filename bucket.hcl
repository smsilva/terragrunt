locals {
  project = get_env("GOOGLE_PROJECT")
  region  = get_env("GOOGLE_REGION")
  zone    = get_env("GOOGLE_ZONE")
}
