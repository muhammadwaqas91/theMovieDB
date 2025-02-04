# TheMovieDB

## Overview
The **TheMovieDB** app is a Swift-based project following the **VIPER architecture**, designed to fetch and display TV shows, seasons, and episodes using TheMovieDB API. The app includes smooth navigation, dynamic UI components, and optimized performance for fetching and displaying paginated content. The repo uses [RestAPIFramework](https://github.com/muhammadwaqas91/RestAPIFramework) for APIs.

## Features
- Fetch and display popular TV shows.
- View detailed TV show information, including seasons and episodes.
- Play video previews using `AVPlayerViewController`.
- Smooth scrolling and dynamic table view height handling.
- Dependency injection for better modularity.
- Optimized image loading and caching with `Kingfisher`.

## Tools and Technologies
TheMovieDB is built using the following technologies:

### **Languages & Frameworks**
- **Swift** – Primary programming language.
- **UIKit** – UI components and layout handling.
- **Foundation** – Core utilities and networking.
- **Combine / Async-Await** – Used for handling API responses.
- **Kingfisher** – Efficient image caching and loading.

### **Architecture**
- **VIPER** – Implements separation of concerns:
  - **View** (UI Layer)
  - **Interactor** (Business Logic)
  - **Presenter** (View Logic)
  - **Entity** (Data Models)
  - **Router** (Navigation)

### **Networking**
- **RestAPIFramework** – Handles API requests.
- **Services** – Create requests, and Communicate with RestAPIFramework.
- **Requests** – Provides templates for request.

### **Dependency Management**
- **Swift Package Manager (SPM)** – Manages dependencies.

## Architecture - VIPER
This project follows the **VIPER** (View, Interactor, Presenter, Entity, Router) architecture:

### **Modules & Components**
#### **View**
- `TVShowsViewController`: Displays a list of TV shows.
- `TVShowViewController`: Displays details of a selected show.
- `TVShowHeaderView`: Displays a show's poster and video preview.

#### **Interactor**
- `TVShowsInteractor`: Fetches popular TV shows with pagination.
- `TVShowInteractor`: Fetches detailed show information.
- `TVSeasonEpisodesInteractor`: Fetches episodes of a selected season.

#### **Presenter**
- `TVShowsPresenter`: Manages the list of TV shows.
- `TVShowPresenter`: Manages show details and navigation.
- `TVSeasonEpisodesPresenter`: Handles season and episode data presentation.

#### **Router**
- `TVShowsRouter`: Handles navigation to show details.
- `TVShowRouter`: Manages navigation within a show's details.
- `VideoPlayerRouter`: Opens `AVPlayerViewController` for video playback.

#### **Services & Networking**
- `TVShowService`: Fetches show details from TheMovieDB API.
- `TVShowsService`: Fetches a paginated list of TV shows.
- `TVSeasonService`: Fetches season details.
- `TVEpisodeService`: Fetches episode details.
- `NetworkClient`: Handles API requests using `URLSession` and `async/await`.

## Setup & Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/themoviedb.git
   ```
2. Install dependencies using CocoaPods or Swift Package Manager (if applicable).
3. Open `TheMovieDB.xcodeproj` in Xcode.
4. Run the app on a simulator or real device.

## Contributing
1. Fork the repository.
2. Create a new branch.
3. Make your changes and commit them.
4. Push to your fork and submit a pull request.

## License
This project is licensed under the **MIT License**.


