locals {
  providers = {
    google = {
      project = get_env("GOOGLE_PROJECT", "gcloud-project")
      region  = get_env("GOOGLE_REGION", "us-central1")
      zone    = get_env("GOOGLE_ZONE", "us-central1-a")
      version = get_env("GOOGLE_PROVIDER_VERSION", "3.72.0")
    }
  }
}
