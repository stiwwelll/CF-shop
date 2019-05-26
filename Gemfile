source 'https://rubygems.org'

ruby '2.6.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'jquery-rails'

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'sqlite3'

  gem 'rspec-rails', '~> 3.7'
  gem "factory_bot_rails", "~> 4.0"
end

group :development do

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.20'
end

gem 'devise'

gem 'cancancan', '~> 1.10'

gem 'will_paginate', '~> 3.1.0'

gem 'rails-controller-testing'

gem 'stripe'

gem 'rails-html-sanitizer'

gem 'dalli'

gem 'memcachier'

gem 'redis-rails'
