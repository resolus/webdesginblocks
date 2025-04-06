FROM ruby:3.4
ENV LANG=C.UTF-8 \
    APP_HOME=/app

RUN mkdir -p $APP_HOME && \
    apt-get update -qq && \
    apt-get install -y \
        apt-transport-https \
        apt-utils \
        build-essential \
        curl \
        vim \
        wget

WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/usr/local/bundle \
    DOCKER=1

RUN gem install bundler
RUN apt-get clean && rm -f /var/lib/apt/lists/*_*

ENV TAILWIND_VER=4.1.3
RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/x644/) && \
    echo ${arch} && \
    curl -o /usr/local/bin/tailwindcss -sL https://github.com/tailwindlabs/tailwindcss/releases/download/v${TAILWIND_VER}/tailwindcss-linux-${arch} && \
    chmod +x /usr/local/bin/tailwindcss

ADD . $APP_HOME


