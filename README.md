# PIKD iOS SDK

Add location-based campaigns, AR collection, leaderboards and collections to an existing iOS app. Use the complete partner experience or embed individual SDK screens and services in your own navigation.

**Current release: 0.8.0-beta.15.** The SDK is distributed as compiled libraries through Swift Package Manager and CocoaPods.

- [Integrate into an existing app](docs/INTEGRATING_INTO_EXISTING_APP.md)
- [Run the iOS demo](https://github.com/eleostechorg/pikd-demo-ios-sdk)
- [Demo local setup](https://github.com/eleostechorg/pikd-demo-ios-sdk/blob/main/docs/LOCAL_SETUP.md)

## Requirements

- Target iOS 18 or later. Use Xcode 27.1 / Swift 6.4 for the current compiled release.
- Use an ARKit-capable physical iPhone for camera placement and collection.
- Obtain your SDK v1 base URL, tenant SDK key and campaign setup from PIKD. The CDA partner launch needs exactly one active, named challenge.
- For map screens, enable Maps SDK for iOS and supply a key restricted to your app's bundle identifier. Add camera/location permission descriptions in your app.

The Core library and platform-neutral UI APIs also provide macOS 14+ variants. Map and AR flows described here are for iOS.

## Choose the products

| Product | Use it for |
|---|---|
| `PikdIOSCore` | Typed SDK API and session calls with your own UI |
| `PikdIOSAR` | Native AR view and session integration |
| `PikdIOSUI` | Individual prebuilt map, challenge, leaderboard, feed, profile and collection screens |
| `PikdIOSExperience` | A complete generic five-tab experience |
| `PikdIOSPartnerExperience` | The CDA partner experience used by the demo |

Use the same SDK version for all selected products. Dependencies resolve automatically. For the complete CDA journey start with `PikdIOSPartnerExperience`; add `PikdIOSUI` when your host configures Maps or customizes SDK theme/types directly, as shown in the integration guide.

## Swift Package Manager

1. In Xcode choose **File → Add Package Dependencies**.
2. Enter the repository URL:

   ```text
   https://github.com/eleostechorg/pikd-ios-sdk-distribution.git
   ```

3. Select **Exact Version → 0.8.0-beta.15**.
4. Add your chosen products to the app target, then follow the [host integration guide](docs/INTEGRATING_INTO_EXISTING_APP.md) for Maps, permissions and presentation.

For a Swift package target, declare the dependency and selected products:

```swift
.package(url: "https://github.com/eleostechorg/pikd-ios-sdk-distribution.git", exact: "0.8.0-beta.15")

// In your target's dependencies:
.product(name: "PikdIOSPartnerExperience", package: "pikd-ios-sdk-distribution"),
.product(name: "PikdIOSUI", package: "pikd-ios-sdk-distribution")
```

## CocoaPods

Add the PIKD specs source **before** the CocoaPods CDN source, select a subspec and run `pod install`:

```ruby
source 'https://github.com/eleostechorg/pikd-ios-sdk-distribution.git'
source 'https://cdn.cocoapods.org/'
platform :ios, '18.0'

target 'YourApp' do
  use_frameworks!
  pod 'PikdIOSSDK/PartnerExperience', '= 0.8.0-beta.15'
end
```

```sh
pod install
```

Open your app's generated `.xcworkspace`. Available subspecs are `Core`, `AR`, `UI`, `Experience` and `PartnerExperience`; their Swift import names are the products listed above.

The PIKD specs source supplies the compatible Maps/Lottie versions used by this release. Keep it first and avoid overriding those dependencies with another version. A duplicate Lottie-spec warning can appear during installation; its selected source in `Podfile.lock` should be the PIKD specs repository. If your app already uses Maps or Lottie, resolve version requirements before combining the integrations.

## Open PIKD from your app

Your app supplies the current signed-in user and tenant configuration. Call `PIKDCdaExperience.prepare`, present `PIKDCdaExperienceView`, then dismiss it through its callback to return to your host screen. The [integration guide](docs/INTEGRATING_INTO_EXISTING_APP.md) includes complete SwiftUI and UIKit examples, account cleanup and branding.

English, Russian and Kazakh are built in. SDK UI language and campaign content language can be selected independently. Your host owns its entry-point copy and app permission descriptions.

## Beta compatibility

This beta has a known AR dependency load issue on **iOS 18.5 Simulator**. Use **iOS 27 Simulator** for screen development and an AR-capable physical iPhone for camera flows. Simulator results do not establish physical camera or live collection behavior. Test your app on the iOS versions and devices you intend to support.

## License and support

Use requires a written PIKD SDK agreement with ELEOS WORLD LTD. See [LICENSE](LICENSE) and preserve the [third-party notices](Notices).

For tenant access or integration questions, contact your PIKD representative. Report reproducible SDK issues through [GitHub Issues](https://github.com/eleostechorg/pikd-ios-sdk-distribution/issues), with tool versions and steps; remove credentials and personal data from attachments.
