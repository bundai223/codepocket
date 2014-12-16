#!/usr/bin/env bash

# rawrプロジェクトの作成
jruby -S rawr install

# 依存gemの追加と設定
mkdir -p ./lib/ruby
jruby -S gem install -i ./lib/ruby jrubyfx jrubyfx-fxmlloader --no-rdoc --no-ri

cat ./build_configuration.rb | sed 's/#c.source_dirs = \["src"\]/c.source_dirs = \["src", "lib\/ruby"\]/g' >./tmp_build_configuration.rb
mv -f tmp_build_configuration.rb build_configuration.rb

