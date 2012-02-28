# Extended m3u format driver for gem 'xspf'
module XSPFPatch

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods

  end # ClassMethods

  module InstanceMethods

    def to_xm3u
      xslt_path = File.join(File.dirname(__FILE__), "xsl", "xspf2m3u.xsl")
      xslt = XML::XSLT.new
      xslt.xml = self.to_xml
      xslt.xsl = REXML::Document.new(File.new(xslt_path))
      xslt.serve
    end

  end # InstanceMethods

end

class XSPF
  include XSPFPatch
end
