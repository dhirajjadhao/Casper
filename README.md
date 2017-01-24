# Casper
![casper](https://cloud.githubusercontent.com/assets/2684979/21516944/c533559c-cd00-11e6-9909-5b8a76c9bd38.png)

<p align="center">
<a href="https://cocoapods.org/pods/Casper"><img src="https://img.shields.io/cocoapods/v/Casper.svg" alt="CocoaPods compatible" /></a>
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://raw.githubusercontent.com/xmartlabs/Eureka/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

Casper is a lightweight and highly customisable framework which extends the usability of UIAlertController to provide you with much more customisable and frequently required UI elements.

## Overview

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/2684979/21589673/545b5964-d11a-11e6-9d64-56c488b6b2bc.gif" width="220"/>
<img src="https://cloud.githubusercontent.com/assets/2684979/21589674/545ccb82-d11a-11e6-94a0-56dc8dff4f59.gif" width="220"/>
<img src="https://cloud.githubusercontent.com/assets/2684979/21589675/5461d604-d11a-11e6-8033-66de77fa794b.gif" width="220"/>
</p>

## Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Example project](#exampleproject)
- [Usage](#usage)


## Requirements

* iOS 9.0+
* Xcode 8+
* Swift 3

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build Casper.

To integrate Casper into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'Casper'
end
```

Then, run the following command:

```bash
$ pod install
```

## Example project

You can clone and run the Example project to see examples of most of Casper's features.

## Usage

### How to create an Alert with UICasperController


```swift
import Casper

class MyViewController: UIViewController {

override func viewDidLoad() {
super.viewDidLoad()

let casperController = UICasperController(title: "Title", message: "Message", preferredStyle: UICasperControllerStyle.alert)

casperController.addAction(title: "Volume", style: UICasperActionStyle.slider, options: nil, value: nil) { (value) in

}

casperController.present(inViewController: self, animated: true, completion: nil)
}
}

```

Here we created an instance of casper controller and added casper controller action to it of style Slider.
You can create controller in this way and add an actions of different styles to it. 

Every action comes with its handler which gets called when there is change in value. 

### UICasperControllerStyle

Casper supports following styles same as UIAlertController

- **Alert** 

```swift
let casperController = UICasperController(title: "Title", message: "Message", preferredStyle: UICasperControllerStyle.alert)
```

- **ActionSheet** 

```swift
let casperController = UICasperController(title: "Title", message: "Message", preferredStyle: UICasperControllerStyle.actionSheet)
```

### UICasperActionStyle

Casper supports following Action Styles

- **SwitchToggle**
- **Label**
- **Segment**
- **Check**
- **Slider**
- **Stepper**
- **TextView**
- **TextField**
- **URLField**
- **IntField**
- **PhoneField**
- **PasswordField**
- **EmailField**
- **ZipcodeField**
- **Date**
- **Time**
- **DateTime**
- **Button**
- **Activity**
- **QRCode**
- **Image**
- **GIFActivity**

### Action Catalog

Here all actions all listed with their description and with type of options they support for customisation and type of value they returns.

#### SwitchToggle

This adds Switch to casper.

```swift
options: nil
value: bool
```

#### Label

This adds Label to casper.

```swift
options: nil
value: String
```

#### Segment

This adds Segment control to casper.

```swift
options: Array of string option
value: String
```
e.g options = ["One", "Two", "Three"]


#### Check

This adds Check mark row to casper.

```swift
options: nil
value: Bool
```

#### Slider

This adds Slider to casper.

```swift
options: [minValue, maxValue]
value: Float
```
e.g options = [0, 5] where 0 is minumum value and 5 is maximum value.


#### Stepper

This adds Stepper to casper.

```swift
options: [minValue, maxValue, stepValue]
value: Double
```
e.g options = [0, 5, 0.5] where 0 is minumum value and 5 is maximum value and 0.5 is the step value.


#### TextView

This adds TextView to casper.

```swift
options: nil
value: String
```


#### TextField

This adds TextField to casper.

```swift
options: nil
value: String
```


#### URLField

This adds URLField to casper.

```swift
options: nil
value: URL
```

#### IntField

This adds IntField to casper.

```swift
options: nil
value: Int
```


#### PhoneField

This adds PhoneField to casper.

```swift
options: nil
value: String
```


#### PasswordField

This adds PasswordField to casper.

```swift
options: nil
value: String
```


#### EmailField

This adds EmailField to casper.

```swift
options: nil
value: String
```


#### ZipcodeField

This adds EmailField to casper.

```swift
options: nil
value: String
```


#### Date

This adds Date to casper.

```swift
options: nil
value: Date
```
