# amplify-ready-sample
This is a sample app to deploy to AWS Amplify, to be used together with my article in Medium. Check the README for more info.

# Sample Amplify App for DevOps Tutorial

This is a minimal Vite-based static web app meant to be deployed on **AWS Amplify** as part of a hands-on DevOps tutorial.

It includes placeholders for **New Relic Browser** environment variables, which will be injected by Amplify during build/deploy.

---

## Running locally
```bash
npm install
npm run dev
```

Quite simple, uh?
The app will be available at [http://localhost:5173](http://localhost:5173).

---

## Deploying
This app is designed to be forked and connected to **AWS Amplify**.

Steps:
1. Fork this repository into your own GitHub account.
2. In the DevOps tutorial, you'll write Terraform/Terragrunt to:
   - Create an Amplify app
   - Connect it to your fork
   - Inject `NR_BROWSER_APP_ID` and `NR_BROWSER_LICENSE_KEY` as env vars
3. Push to your `main` branch → Amplify builds and serves the app.

---

## New Relic integration
In `src/index.html`, you’ll see placeholders:
```html
<script>
  window.NRBAID = "${NR_BROWSER_APP_ID}";
  window.NRBLK  = "${NR_BROWSER_LICENSE_KEY}";
</script>
```
When you add these as Amplify environment variables, New Relic Browser can instrument your app.