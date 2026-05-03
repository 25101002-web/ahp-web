Deploying this static AHP demo to GitHub Pages

1) Create a new GitHub repository and push this folder as the repository root.

2) Update `index.html` <head> canonical/og:url/logo and `sitemap.xml`/`robots.txt` to use your real domain or GitHub Pages URL.

3) Enable GitHub Pages via the `gh-pages` branch or use the built-in Actions workflow below.

Quick steps (command-line):

```powershell
# from repo root
git init
git add .
git commit -m "Initial AHP site"
git branch -M main
git remote add origin https://github.com/<your-user>/<repo>.git
git push -u origin main
```

GitHub Actions: a simple workflow is included to publish `main` to `gh-pages` branch automatically.

Notes:
- The site is static HTML/JS; no server required. All features run client-side.
- To serve on your own server, copy files to your webroot (nginx/apache) or use static hosting (Netlify, Vercel, GitHub Pages).
- For SEO: set canonical URLs, add structured data, and update sitemap/robots accordingly.
