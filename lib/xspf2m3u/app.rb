module Xspf2m3u
  # Top-level app
  class App < Thor

    map %w{-V --version} => :version

    desc "version", "Displays the program's version"
    def version
      say "xspf2m3u version #{VERSION}"
    end

    desc "convert", "Runs the converter"

    method_option :infile,
      :desc     => "Input file",
      :aliases  => ["-i"],
      :type     => :string,
      :required => true

    method_option :outfile,
      :desc     => "Output file",
      :aliases  => ["-o"],
      :type     => :string,
      :required => true

    def convert
    end

    def help task = nil, subcommand = false
      say Help.general_message if task.nil?
      super
    end

  end
end
