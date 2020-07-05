require_relative 'boot'
require 'csv'
require 'rails/all'

Bundler.require(*Rails.groups)

module GoshimeiApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

    config.generators do |g|
        g.test_framework :rspec,
        #fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false
    end
    config.time_zone = 'Tokyo'
  end
end

def Company.search(search, company_or_post)
  if company_or_post == "1"
      Company.where(['name LIKE ?', "%#{search}%"])
  else
      Company.all
  end
end

def Post.search(search, company_or_post)
  if company_or_post == "2"
    Post.where(['title LIKE ?', "%#{search}%"])
  else
    Post.all
  end
end
