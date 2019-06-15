
Pod::Spec.new do |s|
  s.name             = 'FOXAdditions'
  s.version          = '0.3.0'
  s.summary          = 'FOXAdditions blah.'
  s.description      = <<-DESC
FOXAdditions blah blah.
                       DESC

  s.homepage         = 'https://kfxtech@bitbucket.org/kfx_pods/foxadditions.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianFox' => 'christianfox890@icloud.com' }
  s.source           = { :git => 'https://kfxtech@bitbucket.org/kfx_pods/foxadditions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'FOXAdditions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FOXAdditions' => ['FOXAdditions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
