gem_group :development, :test do
  gem 'rspec-rails'
end

gem_group :development do
  gem 'reek', require: false
end

gem_group :test do
  gem 'simplecov', require: false
end
