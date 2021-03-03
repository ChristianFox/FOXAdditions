
Pod::Spec.new do |s|
  s.name             = 'FOXAdditions'
  s.version          = '1.1.2'
  s.summary          = 'Handy Swift Extensions.'
  s.description      = <<-DESC
FOXAdditions - Some handy Swift extensions
                       DESC

  s.homepage         = 'https://github.com/ChristianFox/FOXAdditions.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianFox' => 'christianfox@kfxtech.com' }
  s.source           = { :git => 'https://github.com/ChristianFox/FOXAdditions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'FOXAdditions/Classes/**/*'

end
