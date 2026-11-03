# PIKD-maintained compatibility metadata; Google's original artifact is unchanged.
Pod::Spec.new do |s|
  s.name = 'GoogleMaps'
  s.version = '11.2.0'
  s.summary = 'Google Maps SDK binary compatibility specification for PIKD consumers.'
  s.homepage = 'https://developers.google.com/maps/documentation/ios-sdk'
  s.author = 'Google LLC'
  s.license = { :type => 'Commercial', :text => 'Google Maps Platform Terms of Service: https://cloud.google.com/maps-platform/terms' }
  s.source = { :http => 'https://dl.google.com/geosdk/swiftpm/11.2.0/GoogleMaps_3p.xcframework.zip', :sha256 => '3678d0581cfbdf4dc84546bc55b11defb21ba517656a0fb1cd845d68d01ea4f3' }
  s.ios.deployment_target = '16.0'
  s.vendored_frameworks = 'GoogleMaps.xcframework'
  # Offline filename/plist adaptation after download verification; binary bytes unchanged.
  s.prepare_command = <<-'CMD'
set -eu
PIKD_MAPS_INFO="GoogleMaps.xcframework/Info.plist"
PIKD_MAPS_INDEX=0
while PIKD_MAPS_SLICE=$(/usr/libexec/PlistBuddy -c "Print :AvailableLibraries:${PIKD_MAPS_INDEX}:LibraryIdentifier" "${PIKD_MAPS_INFO}" 2>/dev/null); do
  PIKD_MAPS_LIBRARY=$(/usr/libexec/PlistBuddy -c "Print :AvailableLibraries:${PIKD_MAPS_INDEX}:LibraryPath" "${PIKD_MAPS_INFO}")
  case "${PIKD_MAPS_LIBRARY}" in
    GoogleMaps.a)
      mv "GoogleMaps.xcframework/${PIKD_MAPS_SLICE}/GoogleMaps.a" "GoogleMaps.xcframework/${PIKD_MAPS_SLICE}/libGoogleMaps.a"
      /usr/libexec/PlistBuddy -c "Set :AvailableLibraries:${PIKD_MAPS_INDEX}:LibraryPath libGoogleMaps.a" "${PIKD_MAPS_INFO}"
      ;;
    libGoogleMaps.a) test -f "GoogleMaps.xcframework/${PIKD_MAPS_SLICE}/libGoogleMaps.a" ;;
    *) echo "Unexpected Google Maps library layout" >&2; exit 1 ;;
  esac
  PIKD_MAPS_INDEX=$((PIKD_MAPS_INDEX + 1))
done
test "${PIKD_MAPS_INDEX}" -gt 0
CMD
  s.libraries = 'c++', 'z'
  s.frameworks = 'Accelerate', 'Contacts', 'CoreData', 'CoreGraphics', 'CoreImage', 'CoreLocation', 'CoreTelephony', 'CoreText', 'GLKit', 'ImageIO', 'Metal', 'OpenGLES', 'QuartzCore', 'Security', 'SystemConfiguration', 'UIKit', 'MetricKit'
  s.dependency 'PIKDGoogleMapsResources', '11.2.0'
  s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -ObjC' }
end
