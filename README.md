# Flickrrific
Flickriffic is an iOS app build using Swift and SwiftUI using MVVM architecture. It lets users search for images using the Flickr API, and shows information about the image on a detail screen.

## Features
- Search for images using the Flickr API.
- Displays results in a 3 column grid format.
- Allows users to view details about individual images.
- Uses image caching for fast loading of images that have already been viewed.
- Includes Unit Testing
- Includes a share button on the detail view, for sharing images and data.
- Has a pleasing User Interface design utilizing Apples Human Interface Guidelines.
- This app works well on iOS 17 and iOS 18.

## Project Structure
- Utility: Contains helper functions, constants, extensions, image caching, and ViewModifiers
- Model: Contains the data model
- API: Contains the ApiManager and MockApiManager which is used for testing
- ViewModel: Contains the ViewModel for the project
- Views: Contains the main ContentView, along with separate Views for the Title, SearchBar, WebKitView, ImageGrid, and ImageDetail

## Video
![Simulator Screen Recording - iPhone 16 Pro - 2024-09-25 at 15 57 41](https://github.com/user-attachments/assets/388e3f49-48f5-4b23-beea-7685d827c035)


## Screenshots
### The main page, showing the search bar and the grid view
![Simulator Screenshot - iPhone 16 Pro - 2024-09-25 at 13 37 09](https://github.com/user-attachments/assets/d5d2ff9f-395d-4c59-8fcf-86ef40055709)


### The Detail Page, with a larger image, additional information, a web view for the HTML provided by the API, and a share button
![Simulator Screenshot - iPhone 16 Pro - 2024-09-25 at 13 37 52](https://github.com/user-attachments/assets/074a505c-afcf-4282-9627-b4636bec69f8)
