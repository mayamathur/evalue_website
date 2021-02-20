# change here is you want to pin R version
# r-base is slow because it has no packages installed
#FROM rocker/r-base:latest

# this has shiny etc and is much faster to set up
# R version is pinned
FROM analythium/r-shiny:4.0.3

# change maintainer here
LABEL maintainer="Peter Solymos <peter@analythium.io>"

# add system dependencies for packages as needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# we need remotes and renv
RUN install2.r -e remotes renv

# create non root user
RUN addgroup --system app \
    && adduser --system --ingroup app app

# switch over to the app user home
WORKDIR /home/app

# install R packages based on lock file
COPY ./renv.lock .
RUN Rscript -e "options(renv.consent = TRUE);renv::restore(lockfile = '/home/app/renv.lock', repos = c(CRAN = 'https://cloud.r-project.org'), library = '/usr/local/lib/R/site-library', prompt = FALSE)"
RUN rm -f renv.lock

# copy everything inside the app folder
COPY app .

# permissions
RUN chown app:app -R /home/app

# change user
USER app

# EXPOSE can be used for local testing, not supported in Heroku's container runtime
EXPOSE 8080

# web process/code should get the $PORT environment variable
ENV PORT=8080

# command we want to run
CMD ["R", "-e", "shiny::runApp('/home/app', host = '0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
