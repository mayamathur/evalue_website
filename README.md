# Website

Based on the [Minimal Mistakes Jekyll theme](https://mmistakes.github.io/minimal-mistakes/)
under and MIT license.

## Site configuration

See full [config](https://mmistakes.github.io/minimal-mistakes/docs/configuration/).

- edit `_config.yml` to update site metadata, Google Analytics etc
- edit `_data/navigation` to add more tabs to the top navigation

## Adding pages

Open the `site.Rproj` file in RStudio IDE.
Open Rmd files you'd like to edit. Click render.
Jekyll will ignore Rmd, and will deploy html based on the md files.

Adding a new page under `http://site.com/path/dir/`:

1. create folder `path/dir`
2. add `index.Rmd` into the folder (see below for what goes into the header)
3. Edit Rmd then render md

This is the part that goes into the Rmd header:

```
---
title: Add your title here
layout: archive
output:
  md_document:
    variant: gfm
    preserve_yaml: true
---
```

Keeping the layout and output is important, so that it will show up as expected.

Note: if images are included as part of the Rmd, those will be placed
relative to the `index.Rmd` file and need to be added to git.

See [this](https://rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf) cheat sheet for markdown formatting.

## Shiny apps

Adding apps:

Create new folder in the root, e.g. `app` and add `app/index.md` file
with the following content: change the app url

```
---
layout: app
app_url: http://www.evalue-calculator.com/
---
```

Important note: in the GitHub pages settings, do NOT force https if the shiny app is not served over https. Otherwise the iframe won't display the app. This is the case with the Heroku free tier. So use http protocol. Alternatively, set up SSL via [Cloudflare for Heroku](https://support.cloudflare.com/hc/en-us/articles/205893698-Configure-Cloudflare-and-Heroku-over-HTTPS) for free:

- set SSL/TLS encryption mode to Flexible
- Page Rules: you can only set 3 for free for a given domain name, e.g `*.evalue-calculator.com/*`, Always Use HTTPS

See [this post](https://stackoverflow.com/questions/52185560/heroku-set-ssl-certificates-on-free-plan) for troubleshooting tips.

## Deployment

GitHub pages use Jekyll, so no additional steps are required.
Commit changes and done. Make sure you go to the Settings tab
of the repo and set GitHub pages deployment from the root folder of
the master branch. 

## Custom domains

I would recommend setting up a www subdomain: `http://www.evalue-calculator.com/`
following [this](https://docs.github.com/en/github/working-with-github-pages/about-custom-domains-and-github-pages#using-an-apex-domain-for-your-github-pages-site) and [this](https://docs.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site) guide.

