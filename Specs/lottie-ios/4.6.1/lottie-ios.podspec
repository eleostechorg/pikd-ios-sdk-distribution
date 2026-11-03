# Same official precompiled Lottie artifact as the SwiftPM dependency.
Pod::Spec.new do |s|
  s.name = 'lottie-ios'
  s.module_name = 'Lottie'
  s.version = '4.6.1'
  s.summary = 'Lottie binary compatibility specification for PIKD consumers.'
  s.homepage = 'https://github.com/airbnb/lottie-ios'
  s.author = 'Airbnb'
  s.license = { :type => 'Apache-2.0', :text => 'Copyright Airbnb. Apache License 2.0: https://github.com/airbnb/lottie-ios/blob/4.6.1/LICENSE' }
  s.source = { :http => 'https://github.com/airbnb/lottie-ios/releases/download/4.6.1/Lottie.xcframework.zip', :sha256 => '03d3f3b085da9479bcab7b0ad4b6d75a88425d27bf3c7582698fddce14c9181f' }
  s.ios.deployment_target = '18.0'
  s.swift_version = '5.0'
  s.vendored_frameworks = 'Lottie.xcframework'
end
