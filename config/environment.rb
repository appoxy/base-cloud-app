# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')


require 'aws'
require 'simple_record'
require 'local_cache'
require 'cloud_cache'
require "simple_worker"


Rails::Initializer.run do |config|
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{RAILS_ROOT}/extras )

    # Specify gems that this application depends on and have them installed with rake gems:install
    # config.gem "bj"
    # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
    # config.gem "sqlite3-ruby", :lib => "sqlite3"
    # config.gem "aws-s3", :lib => "aws/s3"

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Skip frameworks you're not going to use. To use Rails without a database,
    # you must remove the Active Record framework.

    config.frameworks -= [ :active_record ]

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    # config.i18n.default_locale = :de
end

test_obj = ["dogs", "cats", "badgers"]

CONFIG = YAML::load_file(File.expand_path("~/.appoxy/keys.yml"))


# These are Appoxy Sandbox credentials.  Nothing will be guaranteed to be saved here so
# after starting up, make sure to replace with different credentials.
AWS_ACCESS_KEY = CONFIG['aws']['access_key']
AWS_SECRET_KEY = CONFIG['aws']['secret_key']
SDB_DOMAIN_PREFIX = "myproject_prod_"

# Setup Simple_Record connection
SimpleRecord::Base.set_domain_prefix(SDB_DOMAIN_PREFIX)
SimpleRecord.establish_connection(AWS_ACCESS_KEY,AWS_SECRET_KEY, {:connection_mode => :per_thread})


# Setup S3 Connection (if needed)
S3 = Aws::S3.new(AWS_ACCESS_KEY, AWS_SECRET_KEY, {:connection_mode => :per_request})


# Setup CloudCache connection (fast in-memory cloud caching - infinite scale - production)
CC_ACCESS_KEY = CONFIG['cloud_cache']['access_key']
CC_SECRET_KEY = CONFIG['cloud_cache']['secret_key']
CLOUD_CACHE = CloudCache.new(CC_ACCESS_KEY, CC_SECRET_KEY)

# Setup Local cache (for fast local development cache)
LOCAL_CACHE = LocalCache.new

# Select the cache method (Now use CACHE.get CACHE.put in application)
CACHE = CLOUD_CACHE






