require 'rexml/document'

doc = REXML::Document.new(open("test.xml"))

# XPath.first(doc, "//output")
REXML::XPath.each(doc, "//output") { |element|
  REXML::XPath.each(element, "child::node()//item") { |item|
    puts item
  }
}
