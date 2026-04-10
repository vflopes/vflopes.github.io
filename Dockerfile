FROM jekyll/jekyll:4.2.2

USER root
WORKDIR /srv/jekyll
RUN chown -R jekyll:jekyll /srv/jekyll /usr/local/bundle

COPY --chown=jekyll:jekyll Gemfile Gemfile.lock* ./
USER jekyll
RUN bundle config set path /usr/local/bundle \
    && bundle install

EXPOSE 4000 35729

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
