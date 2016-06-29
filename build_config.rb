def gem_config(conf)
  conf.gembox 'default'

  # be sure to include this gem (the cli app)
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  toolchain :gcc

  conf.enable_bintest
  #conf.enable_debug
  conf.enable_test

  gem_config(conf)
end

# Just build for Linux...
MRuby::Build.new('x86_64-pc-linux-gnu') do |conf|
  toolchain :gcc

  gem_config(conf)
end

# MRuby::CrossBuild.new('i686-pc-linux-gnu') do |conf|
#   toolchain :gcc

#   [conf.cc, conf.cxx, conf.linker].each do |cc|
#     cc.flags << "-m32"
#   end

#   gem_config(conf)
# end