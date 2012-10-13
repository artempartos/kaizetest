source 'https://rubygems.org'

gem 'rails'
gem 'jquery-rails'
gem 'gravatar_image_tag'
gem 'simple_form'
gem "twitter-bootstrap-rails"
gem 'bootstrap-will_paginate'
gem 'faker'
gem 'will_paginate'
gem 'bcrypt-ruby'
gem 'state_machine'
gem 'haml-rails', '>= 0.3.4'

group :test do
  gem 'minitest'
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
end

group :production, :staging do
  gem "pg"
end

group :development, :test  do
  gem 'annotate', '2.4.1.beta1'
  gem "pg"
end

group :assets do
  gem 'therubyracer'
  gem 'uglifier'
end
