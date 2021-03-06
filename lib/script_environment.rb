#
# Loads up our models environment for use by scripts.

require "rubygems"
require "bundler/setup"
require "grit"

$LOAD_PATH.push(".") unless $LOAD_PATH.include?(".")

require "config/environment"
REPO_PATHS = Dir.glob "#{REPOS_ROOT}/*/"

require "lib/ruby_extensions"
require "lib/logging"
require "lib/models"
require "lib/emails"
require "lib/background_jobs"
require "lib/git_helper"
require "lib/meta_repo"
require "redis"
require "lib/redis_manager"

unless ENV["RACK_ENV"] == "test"
  logger = Logger.new(STDOUT)
  logger.level = Logger::DEBUG
  MetaRepo.configure(logger, REPO_PATHS)
end
