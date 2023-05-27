# this is much faster to set up
# uses latest R version
FROM ghcr.io/analythium/deps:latest

# change maintainer here
LABEL maintainer="Maya Mathur <mmathur@stanford.edu>"

# create non root user
RUN addgroup --system app && adduser --system --ingroup app app

# switch over to the app user home
WORKDIR /home/app


# copy everything inside the app folder
COPY app .

# install dependencies
RUN deps-cli all

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
