Pod::Spec.new do |s|
  s.name = 'PikdIOSSDK'
  s.version = '0.8.0-beta.15'
  s.summary = 'PIKD compiled SDK libraries for native iOS hosts.'
  s.homepage = 'https://www.pikd.app'
  s.author = { 'ELEOS WORLD LTD' => 'jehoshaphat@pikd.app' }
  s.license = { :type => 'Commercial', :file => 'PikdIOSSDK/LICENSE' }
  s.source = { :http => 'https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PikdIOSSDK-0.8.0-beta.15.zip', :sha256 => '8cd1134220330ff1f62b63888291e1a3272b355036eca42f48e38635b8261767' }
  s.ios.deployment_target = '18.0'
  s.swift_version = '6.0'
  s.default_subspecs = 'PartnerExperience'
  s.subspec 'Core' do |p|
    p.vendored_frameworks = 'PikdIOSSDK/PikdIOSCore.xcframework'
  end
  s.subspec 'AR' do |p|
    p.vendored_frameworks = 'PikdIOSSDK/PikdIOSAR.xcframework'
    p.dependency 'PIKDARKit', '0.8.0-beta.3'
  end
  s.subspec 'UI' do |p|
    p.vendored_frameworks = 'PikdIOSSDK/PikdIOSUI.xcframework'
    p.dependency 'PikdIOSSDK/Core'
    p.vendored_frameworks = 'PikdIOSSDK/PikdIOSUI.xcframework', 'PikdIOSSDK/PIKDImagePalette.xcframework'
    p.dependency 'GoogleMaps', '11.2.0'
    p.dependency 'lottie-ios', '4.6.1'
    p.resources = 'PikdIOSSDK/Resources/PikdIOSUIResources.bundle'
  end
  s.subspec 'Experience' do |p|
    p.vendored_frameworks = 'PikdIOSSDK/PikdIOSExperience.xcframework'
    p.dependency 'PikdIOSSDK/Core'
    p.dependency 'PikdIOSSDK/UI'
    p.dependency 'PikdIOSSDK/AR'
  end
  s.subspec 'PartnerExperience' do |p|
    p.vendored_frameworks = 'PikdIOSSDK/PikdIOSPartnerExperience.xcframework'
    p.dependency 'PikdIOSSDK/Core'
    p.dependency 'PikdIOSSDK/UI'
    p.dependency 'PikdIOSSDK/AR'
    p.dependency 'PikdIOSSDK/Experience'
    p.resources = 'PikdIOSSDK/Resources/PikdIOSPartnerExperienceResources.bundle'
  end
end
