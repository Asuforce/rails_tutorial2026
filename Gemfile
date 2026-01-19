source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.1"

gem "rails",           "7.1.6"
gem "sass-embedded",   "1.97.2"
gem "sprockets-rails", "~> 3.5"
gem "importmap-rails", "2.2.3"
gem "turbo-rails",     "2.0.21"
gem "stimulus-rails",  "~> 1.3"
gem "jbuilder",        "2.14.1"
gem "puma",            "7.1.0"
gem "bootsnap",        "~> 1.18", require: false
gem "sqlite3",         "~> 1.7"
gem "concurrent-ruby", "~> 1.3"

group :development, :test do
  gem "reline", "0.6.3"
  gem "debug",   "1.11.1", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console",         "~> 4.2.0"
  gem "solargraph",          "~> 0.58"
  gem "irb",                 "~> 1.11"
  gem "repl_type_completor", "~> 0.1"
end

group :test do
  gem "capybara",                 "~> 3.39"
  gem "selenium-webdriver",       "~> 4.19"
  gem "rails-controller-testing", "~> 1.0"
  gem "minitest",                 "~> 5.20"
  gem "minitest-reporters",       "~> 1.7"
  gem "guard",                    "~> 2.18"
  gem "guard-minitest",           "~> 2.4"
  gem "rb-readline",              "~> 0.5"
end
