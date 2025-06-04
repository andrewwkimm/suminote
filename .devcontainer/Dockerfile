FROM mcr.microsoft.com/devcontainers/ruby:1-3.2-bullseye

# Install Rails and development tools
RUN su vscode -c "gem install rails webdrivers bundler"
RUN su vscode -c "/usr/local/rvm/bin/rvm fix-permissions"

# Install Node.js and Yarn for asset pipeline
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install development tools
RUN apt-get update && apt-get install -y \
    imagemagick \
    redis-tools \
    && rm -rf /var/lib/apt/lists/* \
    gem install overcommit

# Rails development environment
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev,.preview.app.github.dev,.app.github.dev"
ENV RAILS_ENV=development