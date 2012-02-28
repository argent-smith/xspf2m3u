module Xspf2m3u

  # Help helpers :)
  class Help

    # Toplevel program's banner.
    PROG_BANNER = <<-EOF.gsub(/^ {4}/, '')

      xspf -> m3u converter

    EOF

    # Toplevel program's usage message.
    GENERAL_USAGE = <<-EOF.gsub(/^ {4}/, '')

      xspf2m3u [task] [options]

      Converts xspf playlist file (-i option) to m3u playlist file (-o option).

    EOF

    # Usage example
    EXAMPLE = <<-EOF.gsub(/^ {4}/, '')

      xspf2m3u -i 1.xspf -o 1.m3u

    EOF


    class << self

      # General help message.
      def general_message
        <<-EOF.gsub(/^ {8}/, '')
        Xspf2m3u:
        #{PROG_BANNER}
        Usage:
        #{GENERAL_USAGE}
        Example:
        #{EXAMPLE}
        EOF
      end
    end
  end
end
