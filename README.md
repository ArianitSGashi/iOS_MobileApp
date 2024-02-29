# iOS Clothing Shop App

## Overview

The iOS Clothing Shop App is a comprehensive mobile application developed using SwiftUI, designed to offer a seamless shopping experience for clothing items. It features a modern, user-friendly interface, allowing users to browse products, manage their shopping cart, authenticate, and process payments securely. This application integrates Firebase for authentication and Core Data for local data persistence, ensuring a robust and efficient performance.

## Features
- Product Browsing: Users can explore a wide range of clothing products, view detailed descriptions, and see product images.
- Cart Management: Adds functionality for users to add or remove items from their shopping cart, with real-time updates to their total cost.
- User Authentication: Leverages Firebase Authentication for secure login, registration, and user management.
- Secure Payment Processing: Integrates Apple Pay for a fast and secure checkout experience.
- Local Data Persistence: Utilizes Core Data for storing user and product data locally, enhancing the app's offline capabilities.

## Getting Started
### Prerequisites
macOS Catalina or newer
- Xcode 12.0 or later
- An active Apple Developer account
- Firebase account for setting up Firebase Authentication
- Installation
- Clone the repository
- bash
- Copy code
- git clone https://github.com/your-repository-url.git cd iOS_Clothing_Shop_App
- Setup Firebase
- Create a Firebase project in the Firebase console.
- Add an iOS app to your Firebase project and download the GoogleService-Info.plist file.
- Add the downloaded GoogleService-Info.plist to your Xcode project.
- Install Dependencies
- Open Terminal and navigate to your project directory.
- If you're using CocoaPods, run pod install to install project dependencies.
- Open the project in Xcode
- Open the .xcworkspace file to ensure all CocoaPods dependencies are correctly linked.
- Run the app
- Select a target iOS device or simulator.
- Build and run the application with Xcode.

  
## Architecture
This app is built using the MVVM (Model-View-ViewModel) architecture pattern to promote separation of concerns and enhance maintainability. It extensively utilizes SwiftUI for its declarative UI components and data-driven approach.

## Technologies Used
- SwiftUI for the user interface
- Firebase Authentication for user sign-in and sign-up
- Core Data for local data storage and retrieval
- Apple Pay for secure payment processing


