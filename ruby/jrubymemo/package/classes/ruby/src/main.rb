require 'java'
require 'jrubyfx'

class App < JRubyFX::Application
  def start(stage)
    with(stage, width: 800, height: 600, title: 'Hello JRubyFX') do
      layout_scene do
        web_view do |v|
          v.engine.load "http://google.com/"
        end
      end
      show
    end
  end
end

App.launch
