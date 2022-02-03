## ShortlyApp

### To build and run the project
Install cocoapods running:
```
gem install cocoapods
```
If installation fails due to filesystem permissions, try:
```
sudo gem install cocoapods
```
Enter to the project directory - ShortlyApp - and run:
```
pod install
```
Open the ShortlyApp.xcworkspace file

## Description

The architecture of this project is MVVM using rxSwift for reactive programing. I have used UIKit with no storyboards or nibs, just programatically made widgets and constraints.

## Design patterns
This project uses the following design patterns:

- Coordinator
- Dependency Injection
- Factory
- DataSource (For network calls)
- Repository

## Unit testing
This project includes test for datasource classes programed with XCTest Apple native framework. The dependencies are been mocked using the **Cuckoo** library.

## Libraries used
- Alamofire, for network calls.
- Swinject, to inject dependencies.
- SwiftGen, to handle assets easier.
- SwiftLint, to check code quality.
- Cuckoo, to mock classes in unit tests.


Claudio Villanueva - 2021
claudioff@gmail.com
