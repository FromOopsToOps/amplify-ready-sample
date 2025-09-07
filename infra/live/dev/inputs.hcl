inputs = {
  name        = "fromoopstoops-demo"
  description = "Amplify app for NR Browser demo"
  platform    = "WEB"

  # If you want the module to connect Amplify ↔ GitHub automatically, keep these:
  repository  = "https://github.com/FromOopsToOps/amplify-ready-sample"
  oauth_token = ""  # leave empty locally; set via TF_VAR_oauth_token in CI if you use it

  enable_auto_branch_creation   = true
  auto_branch_creation_patterns = ["main"]
  enable_branch_auto_build      = true

  branches = {
    main = { enable_auto_build = true, stage = "PRODUCTION" }
  }

  environment_variables = {
    VITE_NR_BROWSER_APP_ID      = get_env("NR_BROWSER_APP_ID")
    VITE_NR_BROWSER_LICENSE_KEY = get_env("NR_BROWSER_LICENSE_KEY")
  }
}
