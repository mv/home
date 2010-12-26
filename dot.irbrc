#
# ~/.irbrc
#

require 'rubygems'
#equire "utility_belt" rescue nil
require 'ap'

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue
  puts "irb: wirble: NOT FOUND."
end

### Ref: Programming Ruby, by Dave Thomas

require 'irb/completion'

IRB.conf[:PROMPT][:MY_PROMPT] = {
  :PROMPT_I => "%N (%m): %03n:%i > ",
  :PROMPT_S => "%N (%m): %03n:%i %l ",
  :PROMPT_C => "%N (%m): %03n:%i : ",
  :RETURN   => "\nResult: %s\n\n"
}

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :MY_PROMPT

def ri(*names)
  system( %{ ri #{ names.map {|name| name.to_s}.join(" ") } } )
end

def show_regexp(string, pattern)
  match = pattern.match(string)
  if match
#   "#{match.pre_match}\[\e[01;33m\]#{match[0]}\[\e[0m\]#{match.post_match}"
    "#{match.pre_match}[>>>[#{match[0]}]<<<] #{match.post_match}"
  else
    ".No match."
  end
end

###

### Ref: http://robots.thoughtbot.com/post/159806033/irb-script-console-tips

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && Object.const_defined?('RAILS_DEFAULT_LOGGER')
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  puts "Adding SQL Logging to STDOUT"
end

# vim:ft=ruby:

