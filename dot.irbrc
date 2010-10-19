#
# ~/.irbrc
#

require 'rubygems'
require 'utility_belt'

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

###

# vim:ft=ruby:

