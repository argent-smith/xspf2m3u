module Xspf2m3u
  # Top-level app
  class App < Thor

    include Thor::Actions

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
      from = options[:infile]
      to = options[:outfile]

      begin
        xspf = XSPF.new(File.read from)
        create_file to do
          xspf.to_xm3u
        end
      rescue Errno::ENOENT => message
        raise Thor::Error, message
      rescue NoMethodError
        raise Thor::Error, "Error parsing #{from}"
      end

    end

    default_task :convert

    def help task = nil, subcommand = false
      say Help.general_message if task.nil?
      super
    end

  end
end
