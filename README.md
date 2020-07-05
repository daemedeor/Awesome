# Awesome

[![Font Awesome](https://img.shields.io/badge/Font%20Awesome-5.6.3-brightgreen.svg)](https://fontawesome.com/v5.6.3/icons)
[![Slack](https://img.shields.io/badge/join-slack-745EAF.svg?style=flat)](http://bit.ly/2B0dEyt)
[![Version](https://img.shields.io/cocoapods/v/AwesomeEnum.svg?style=flat)](http://cocoapods.org/pods/AwesomeEnum)
[![License](https://img.shields.io/cocoapods/l/AwesomeEnum.svg?style=flat)](http://cocoapods.org/pods/AwesomeEnum)
[![Platform](https://img.shields.io/cocoapods/p/AwesomeEnum.svg?style=flat)](http://cocoapods.org/pods/AwesomeEnum)

## 

Super easy to use library containing the brand new Font Awesome 5, completely redesigned for Swift 4

## Slack

Get help using and installing this product on our [Slack](http://bit.ly/2B0dEyt), channel <b>#help-awesome</b>

## Installation

Awesome is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AwesomeEnum'
```

for Carthage just add:

```ruby
github "LiveUI/Awesome"
```

## Usage

Import will be slightly different for Cocoapods/Carthage. Sorry for the confusion of names but some unreasonable fellow has already registered an `Awesome` pod before us :).

### Cocoapods
```swift
import AwesomeEnum
```
### Carthage
```swift
import Awesome
```

All icons are available through autogenerated enums like this:

```swift
let image = Awesome.Solid.handScissors.asImage(size: 40.0)
// or
let image = Awesome.Brand.android.asImage(size: CGSize(width: 40, height: 40), color: .red, backgroundColor: .blue) // :trollface:
// or
let attributedText = Awesome.Regular.envelopeOpen.asAttributedText(fontSize: 17, color: .red, backgroundColor: .blue)
```

### Font Awesome Pro

The Font Awesome Free files are included and loaded for you out of the box. Font Awesome Pro licensing terms don't allow to publish the font files however, so we can't add those for you. As such you will need to manually add the fonts to your project and register them before using them:

```swift
// AppDelegate application(_:didFinishLaunchingWithOptions:)

// Load all fonts
AwesomePro.loadFonts(from: Bundle.main)

// Load only some fonts
AwesomePro.loadFonts(from: Bundle.main, only: [.brand, .solid])
```

The filenames have to match Font Awesome's naming scheme (`fa-brands-400.ttf`, `fa-light-300.ttf`, `fa-regular-400.ttf`, `fa-solid-900.ttf`). You only have to include the fonts you are using.

Once the fonts are registered you can use the `AwesomePro` enum just as you'd use the `Awesome` enum, except that you now have access to all Font Awesome Pro icons.

## Contributors

- **Author**: Ondrej Rafaj , development@mangoweb.cz
- Christopher Mühl , christopher@padarom.io
- David Walter, hi@davidwalter.at
- Georg von der Howen, georg@beaconeer.com

## License

Awesome is available under the MIT license. See the [LICENSE](LICENSE) for more info. All fonts are property of Font Awesome!
