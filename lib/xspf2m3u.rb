# from thor
require 'thor'
require 'thor/group'

# ourselves
require "xspf2m3u/version"
require "xspf2m3u/help"
require "xspf2m3u/app"

module Xspf2m3u
  App.start
end
