# TheMovieDB

## Overview
The **TheMovieDB** app is a Swift-based project following the **VIPER architecture**, designed to fetch and display TV shows, seasons, and episodes using TheMovieDB API. The app includes smooth navigation, dynamic UI components, and optimized performance for fetching and displaying paginated content.

## Features
- Fetch and display popular TV shows.
- View detailed TV show information, including seasons and episodes.
- Play video previews, episodes and trailers using `AVPlayerViewController`.
- Smooth scrolling and dynamic table view height handling.
- Dependency injection for better modularity.


## Architecture - VIPER
This project follows the **VIPER** (View, Interactor, Presenter, Entity, Router) architecture:

### **Modules & Components**
#### **View**
- `TVShowsViewController`: Displays a list of TV shows.
- `TVShowViewController`: Displays details of a selected show.
- `TVShowHeaderView`: Displays a show's poster and video preview.

#### **Interactor**
- `TVShowsInteractor`: Fetches popular TV shows with pagination.
- `TVShowInteractor`: Fetches detailed show information, and seleced season episodes


#### **Presenter**
- `TVShowsPresenter`: Manages the list of TV shows.
- `TVShowPresenter`: Manages show details and navigation.

#### **Router**
- `TVShowsRouter`: Handles navigation to show details.
- `TVShowRouter`: Manages navigation within a show's details.
- `VideoPlayerRouter`: Opens `AVPlayerViewController` for video playback.

#### **Services & Networking**
- `TVShowService`: Fetches show details from TheMovieDB API.
- `TVShowsService`: Fetches a paginated list of popular TV shows.
- `TVSeasonService`: Fetches season details.
- `TVEpisodeService`: Fetches episode details.
- `NetworkClient`: Handles API requests using `URLSession` and `async/await`.

## Setup & Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/muhammadwaqas91/themoviedb.git
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

