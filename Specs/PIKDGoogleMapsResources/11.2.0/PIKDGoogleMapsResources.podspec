# Resources from Google's exact upstream SwiftPM revision, without rehosting them.
Pod::Spec.new do |s|
  s.name = 'PIKDGoogleMapsResources'
  s.version = '11.2.0'
  s.summary = 'Google Maps resources for PIKD CocoaPods compatibility.'
  s.homepage = 'https://github.com/googlemaps/ios-maps-sdk'
  s.author = 'Google LLC'
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.source = { :git => 'https://github.com/googlemaps/ios-maps-sdk.git', :commit => 'e096f5c46d84c01c0a0a55df7263d5c6631535d6' }
  s.ios.deployment_target = '16.0'
  s.resources = 'Maps/Resources/GoogleMapsResources/GoogleMaps.bundle'
end
