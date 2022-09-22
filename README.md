# Smitch-Task

Lib to publish and find services using mDNS

Requirements
Installation
Usage
License
Requirements

iOS 8.0+ / Mac OS X 10.10+ / tvOS 9.0+
Xcode 9.0+

# Installation

CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

$ gem install cocoapods
To integrate Smitch-Task into your Xcode project using CocoaPods, specify it in your Podfile:

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Smitch-Task', '~> 2.1.1'
Then, run the following command:

$ pod install

# USAGE

 var netService : NetService?
 
 self.netService = NetService(domain: "local", type: "_http._tcp.", name: "smitch network", port: Int32(80))
 self.netService!.delegate = self
 self.netService!.publish()

# License

Smitch-Task is released under the SMITCH license. See LICENSE for details.
