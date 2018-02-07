FROM centos/ruby-24-centos7
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
RUN scl enable rh-ruby24 "bundle install"
CMD ["scl", "enable", "rh-ruby24", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
