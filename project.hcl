locals {
  project = get_env("GOOGLE_PROJECT","crested-plexus-280002")
  region  = get_env("GOOGLE_REGION","us-central1")
  zone    = get_env("GOOGLE_ZONE","us-central1-a")
}
