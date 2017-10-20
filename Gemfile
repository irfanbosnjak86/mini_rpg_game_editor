source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Added Gems
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem "haml-rails", "~> 1.0"
gem 'devise', '~> 4.3'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'



group :development, :test do
  gem 'rspec-rails', '~> 3.7', '>= 3.7.1'
  gem 'cucumber-rails', :require => false
  gem 'selenium-webdriver', '~> 3.6'
  gem 'geckodriver-helper' #Added because of selenium
  gem 'database_cleaner'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
