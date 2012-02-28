# from thor
require 'thor'
require 'thor/group'

# functionality
require 'xspf'

# ourselves
require "xspf2m3u/xspf_patch"
require "xspf2m3u/version"
require "xspf2m3u/help"
require "xspf2m3u/app"

module Xspf2m3u
  App.start
end
