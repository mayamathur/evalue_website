# Shiny app

This is a Shiny web application. You can run the application locally by clicking
the 'Run App' button after opening any of the following files in RStudio IDE:
`global.R`, `ui.R`, or `server.R`.

## Deployment workflow

### Organizing the app for Docker based deployment

Revised the files:

- `startup.R` is now `global.R`,
- deleted `app.R`, no need for that when there is global/ui/server files
- made `server.R` to contain `server <- function() {...}`
- made `ui.R` to contain `ui <- navbarPage(...)`
- moved the app specific files into the `/app` folder so that nothing else gets copied into the Docker image
- added counter set at 50 seconds interval is added to `/app/server.R` (see end of the file) to prevent [time out after 55 seconds](https://devcenter.heroku.com/articles/limits#http-timeouts)
- added `Dockerfile`: see comments inside the file and prompts for where to edit.
- run `renv::init()` and/or `renv::snapshot()` to capture dependencies in the `renv.lock` file


### Heroku deployment examples

This workflow works with public and privare repositories.

1. Log into Heroku, in the dashboard, click on 'New' then select 'Create new App'.
Give a name (e.g. `shiny-example`, if available, this will create the app at https://shiny-example.herokuapp.com/) to the app and create the app.
2. In your Heroku dashboard, go to your personal settings, find your API key, click on reveal and copy it, you'll need it later.
3. Go to the Settings tab of the GitHub repo, scroll down to Secrets and add the
following new repository secrets:
  - `HEROKU_EMAIL`: your Heroku email that you use to log in
  - `HEROKU_API_KEY`: your Heroku api key, you can find it under your personal settings, click on reveal and copy
4. Trigger the GitHub action by a new commit to the repo.

See the `.github/workflows/deploy.yml` file for additional options:

- set the `appdir` variable to e.g. `_shinyapps/evalue`
- add the Heroku app name (shiny-example)

Because the plan is to add multiple Shiny apps in the same GitHub repo,
we need a mechanisms that only deploys one app at a time.
The solution is to make the GitHub action jobs conditional
on certain words in the commit message. E.g.
it only deploys if the message contains `deploy evalue`.

When you add a new app, the Heroku email and API key will remain the same.
You will have to add a new job to the `deploy.yml` file (see section that
is commented out), specify the trigger words, app directory, and app name.

### Possible issues when applying this approach to other apps

System requirements need to be updated if a package installation fails.
E.g. I had to add `libxml2-dev` for the xml2 package.

Solutions:

- find the error log in GitHub action output: `Error: install of package 'xml2' failed`
- find system dependencies (often listed near the error): `Configuration failed because libxml-2.0 was not found. Try installing: deb: libxml2-dev (Debian, Ubuntu, etc)`
- if it is not listed, see https://github.com/rstudio/r-system-requirements or https://github.com/r-hub/sysreqsdb

## Other topics

### Monitoring Heroku apps' dyno usage

You can check on how much of the Heroku account's monthly dyno quota has been used either in the CLI (`heroku ps -a <app-name>`) or in the Heroku website "Billing" tab. Note that Heroku apparently counts active hours much more liberally than Google Analytics' session duration metrics.



