# Kaize Test
[![Build
Status](https://secure.travis-ci.org/artempartos/kaizetest.png)](http://travis-ci.org/artempartos/kaizetest)

## Installation and running way
  git clone https://github.com/artempartos/kaizetest.git
  cd kaizetest
  bundle install
  cp config/database.yml.sample config/database.yml
  bundle exec rake db:setup
  bundle exec unicorn_rails

  Теперь в браузере можно будет открыть сайт, по умолчанию он находится
по ссылке http://localhost:8080/
