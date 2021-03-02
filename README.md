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

## Adding Shiny app pages

Here is how you can add Shiny apps that are already deployed. (See
Shiny app deployment below.)

Create new folder in the root, e.g. `app` and add `app/index.md` file
with the following content: change the app url

```
---
layout: app
app_url: http://shiny-app1.heroku.com/
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
following [this](https://docs.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site) guide.

1. Go to the Settings tab of the repo, scroll down to the GitHub Pages section
2. Add `www.evalue-calculator.com` to the Custom Domain field and click Save
3. Go to your DNS settings on your provider's page (see [here](https://support.google.com/domains/answer/9211383?hl=en))
  - In the first field, enter `www` or the required subdomain
  - In the dropdown menu, select CNAME
  - In the TTL field, enter 1H
  - In the data field, enter `mayamathur.github.io`
  - Click Add
  
  
## Editing the outer UI of the website

To edit the outer framework exclusive of the Shiny app iFrame itself (e.g., the Resources tab), just edit and knit the relevant .Rmd file, commit as normal (with no special message), and push. Remember that need to knit the .Rmd file or else the changes will not be reflected in the .md file, which is what the website ultimately uses.

To change the Minimal Mistakes default aesthetics (e.g., fonts), edit _sass/minimal-mistakes/_variables.scss.

## Deploy Shiny apps

The shiny apps live inside the `_shinyapps` folder (Jekyll ignores directories
that begin with underscore, thus we don't need to worry about publishing the
source code as part of the website.)

The apps can be placed inside this folder, e.g.

- `_shinyapps/evalue`
- `_shinyapps/app2`

The structure inside the app folders can be identical:

- `_shinyapps/evalue/app/global.R`: the global script
- `_shinyapps/evalue/app/ui.R`: the UI
- `_shinyapps/evalue/app/server.R`: the server function
- `_shinyapps/evalue/Dockerfile`: see comments inside the file and prompts for where to edit.
- `_shinyapps/evalue/renv.lock`: run `renv::init()` and/or `renv::snapshot()` to capture dependencies in the `renv.lock` file.

Edit the `.R` files as needed, add other scripts and data objects inside the `app` folder (this is copied into the Docker image).

### Heroku deployment

This workflow works with public and private repositories.

1. Log into Heroku, in the dashboard, click on 'New' then select 'Create new App'.
Give a name (e.g. `shiny-example`, if available, this will create the app at https://shiny-example.herokuapp.com/) to the app and create the app.
2. In your Heroku dashboard, go to your personal settings, find your API key, click on reveal and copy it, you'll need it later.
3. Go to the Settings tab of the GitHub repo, scroll down to Secrets and add the
following new repository secrets:
  - `HEROKU_EMAIL`: your Heroku email that you use to log in
  - `HEROKU_API_KEY`: your Heroku api key, you can find it under your personal settings, click on reveal and copy
4. Trigger the GitHub action by a new commit to the repo (see below).

See the `.github/workflows/deploy.yml` file for additional options:

- set the `appdir` variable to e.g. `_shinyapps/evalue`
- add the Heroku app name (shiny-example)

The plan is to add multiple Shiny apps in the same GitHub repo,
thus we need a mechanisms that only deploys one app at a time.
The solution is to make the GitHub action jobs conditional
on certain words in the commit message. E.g.
it only deploys if the message contains `deploy evalue`.

When you add a new app, the Heroku email and API key will remain the same.
You will have to add a new job to the `deploy.yml` file (see section that
is commented out), specify the trigger words, app directory, and app name.

Once the app is deployed, you can add a page and navigation entry for the new app as desribed above.

## Local development with jekyll

Install jekyll (one time setup inside the directory): skip steps as appropriate, e.g. if you have Ruby installed etc (`ruby -v` should return Ruby version).
https://jekyllrb.com/docs/installation/

This will install jekyll to `evalue_website/vendor`. Important: To avoid errors in `bundle install`, the entire file path to ruby (which will be in `evalue_website/vendor`) needs to not have spaces in the directory names. Chagne them to underscores before the installation.

```bash
# Install Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Ruby
brew install ruby

# Add the brew ruby path to your shell configuration:
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Install Jekyll
gem install --user-install bundler jekyll

# Install gems (dependencies) for the template
bundle install
```

When you edit your files and want to check locally how the site looks, use this:

```bash
bundle exec jekyll serve
```

This will build the site that you can check at `http://127.0.0.1:4000` in
your browser. When you change the source it will reload the changes
(hot reload). Stop the server with Ctrl+C.
