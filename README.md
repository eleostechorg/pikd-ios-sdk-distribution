# PIKD SDK for native iOS

This repository distributes compiled PIKD libraries. Implementation source is not included. Use requires a written PIKD SDK agreement; see LICENSE. Public Swift interfaces and bundled assets remain inspectable.

## Swift Package Manager

In Xcode, choose **File → Add Package Dependencies**, enter `https://github.com/eleostechorg/pikd-ios-sdk-distribution.git`, select version `0.8.0-beta.15`, and choose the libraries your host needs:

| Product | Purpose |
|---|---|
| PikdIOSCore | Commercial API/session client |
| PikdIOSAR | Hosted native AR engine integration |
| PikdIOSUI | Independently embeddable prebuilt screens |
| PikdIOSExperience | Generic five-tab composition |
| PikdIOSPartnerExperience | CDA partner composition for an existing host app |

Dependencies are wired automatically. The AR engine remains PIKDARKit 0.8.0-beta.3; this SDK has its own coordinated version. The palette helper is an internal dependency, not an additional public product.

## CocoaPods

This Git repository also serves a public specs repository. Add both sources to your Podfile, then select a subspec. The podspec downloads compiled artifacts from their immutable HTTP location; do not install this metadata-only repository using `:git` as though it contained the frameworks.

```ruby
source 'https://github.com/eleostechorg/pikd-ios-sdk-distribution.git'
source 'https://cdn.cocoapods.org/'
platform :ios, '18.0'

target 'YourHost' do
  use_frameworks!
  pod 'PikdIOSSDK/PartnerExperience', '= 0.8.0-beta.15'
end
```

Google stopped official CocoaPods updates before Maps 11.2. This specs repository therefore includes PIKD-maintained compatibility metadata for the unchanged Google-hosted 11.2 binary, plus its resources from the exact upstream Swift package revision. It does not rehost Google's SDK. After CocoaPods verifies the official download checksum, a small offline preparation step adds the standard `lib` filename prefix and updates the XCFramework plist. Vendor binary bytes remain unchanged; only the local container layout is adapted. A companion `lottie-ios` spec uses the same official precompiled Lottie 4.6.1 artifact as SwiftPM, so the SDK does not mix vendor binary/source ABI variants between installation routes. Keep this specs source first and verify the selected sources in Podfile.lock when migrating an existing installation. Do not mix an older GoogleMaps pod with this SDK's required version.

Available subspecs: Core, AR, UI, Experience, PartnerExperience. Public Swift module names are the same as the SwiftPM products above. CocoaPods distribution targets iOS; independent macOS Core/UI consumers use SwiftPM.

## Host setup

The existing host supplies its SDK session/configuration, a Google Maps API key when using Explore, and camera/location usage descriptions for the journeys it enables. Keep tenant credentials and signing/Maps configuration outside public source control. Installation does not grant backend access or create campaigns/content.

Support declarations: iOS 18+; SwiftPM Core/UI also provide macOS 14+ variants. A deployment floor is not a claim of runtime certification on every OS. The retained iOS 18.5 simulator loader failure and incomplete iOS 26.2 interaction results remain compatibility limitations; successful local 27 / owner-device 26.7 checks have their recorded scope. Consult the release notes for the exact version's evidence.

Compiled binaries are versioned and checksummed. Use a new release for fixes; existing archives/tags must not be overwritten. Third-party notices are supplied in Notices/ and applicable framework resources.
