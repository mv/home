#
# ~/.irbrc
#

require 'irb/completion'
require 'awesome_print'
require 'pp'

require 'json'
require 'yaml'

require 'open-uri'
require 'net/http'

begin
  require "pry"
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load pry"
end

# vim:ft=ruby:

