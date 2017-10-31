# README
[![Maintainability](https://api.codeclimate.com/v1/badges/3ec9fa1c98d0a7845be0/maintainability)](https://codeclimate.com/github/renanrboliveira/wit-cart/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3ec9fa1c98d0a7845be0/test_coverage)](https://codeclimate.com/github/renanrboliveira/wit-cart/test_coverage)


Wit pratical test

---

### Requirements ###

* **[Ruby 2.4.2](https://www.ruby-lang.org/en/)**
* **[Rails 5.1.4](http://guides.rubyonrails.org/)**
* **[PostgreSQL 9.6](https://www.postgresql.org/)**

## First step
You can choose use the [traditional installation](#traditional-installation) **or** use the project with [Docker](#docker-optional-installation).


## Traditional Installation

Install RVM: [see RVM installation guide](http://rvm.io).

### Install Ruby
```sh
$ rvm install ruby-2.4.2
```

### Install bundler
```sh
$ gem install bundler --no-ri --no-rdoc
```

### Perform bundle install
```sh
$ bundle install
```

### Install PostgreSQL

*Ubuntu 16.10*

```sh
$ sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install postgresql-9.6
```
*Or see PostgreSQL installation [WIKI](https://wiki.postgresql.org/wiki/Detailed_installation_guides)*.

### Setup your .env(s)

```bash
$ cp -pRfv .env.production.sample .env.production
$ cp -pRfv .env.development.sample .env.development
$ cp -pRfv .env.test.sample .env.test
```
Update your .env.prouction, .env.development or .env.test if necessary.

### configure bundle for postgresql
```sh
$ bundle config build.pg --with-pg-config=/path/to/pg_config
```

### Configure the database development
```sh
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```


### Run application
```sh
$ bundle exec rails s -b 0.0.0.0
```

### Testing

**Configure the database tests**
```sh
$ RAILS_ENV=test bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:test:prepare
```

**Rspec**
```sh
$ bundle exec rspec
```



