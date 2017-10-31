CURRENT_DIRECTORY := $(shell pwd)

DCMP = docker-compose
APP = witcart
DCMP_EXEC_APP = ${DCMP} exec ${APP}
DCMP_RUN_APP = ${DCMP} run ${APP}

up:
	${DCMP} up

down:
	${DCMP} down

bash:
	${DCMP_RUN_APP} bash

console:
	${DCMP_EXEC_APP} bundle exec rails c

rebuild:
	${DCMP} build --no-cache
	${DCMP_RUN_APP} bundle install

docker-bundle:
	${DCMP_RUN_APP} bundle install

docker-createdb:
	${DCMP_RUN_APP} make createdb

docker-dropdb:
	${DCMP_RUN_APP} make dropdb

docker-migratedb:
	${DCMP_RUN_APP} make migratedb

dropdb:
	bundle exec rake db:drop
	bundle exec rake db:drop RAILS_ENV=test

createdb:
	bundle exec rake db:create && \
	bundle exec rake db:migrate && \
	bundle exec rake db:create RAILS_ENV=test && \
	bundle exec rake db:migrate RAILS_ENV=test && \
  bundle exec rake db:test:prepare RAILS_ENV=test 

migratedb:
	bundle exec rake db:migrate && \
	bundle exec rake db:migrate RAILS_ENV=test

run:
	bundle install
	rm -f tmp/pids/server.pid
	bundle exec rails s -b 0.0.0.0
