# knovator_tech_task


A Flutter mobile application that fetches and displays posts from the (https://jsonplaceholder.typicode.com/posts).

The app demonstrates state management with Provider,

## Features:
- Fetch posts list from `https://jsonplaceholder.typicode.com/posts`
- Each post initially displayed with a light yellow background
- When a post is tapped:
    - Navigates to the Post Detail Screen
    - Displays the post's description (from the `body` field)
    - Marks the post as read background turns white and an icon appears
- State management handled via Provider
- Architecture designed for scalability

  # Project Structure

lib/
│
├── data/
│ ├── api/ # API services
│ │ └── api_service.dart
│ └── model/ # Data models
│ └── post.dart
│
├── presentation/
│ ├── provider/ # State management (Provider)
│ │ └── post_provider.dart
│ ├── screens/ # UI Screens
│ │ ├── post_list_screen.dart
│ │ └── post_detail_screen.dart
│ └── widgets/ # Reusable UI widgets
│ └── post_item.dart
│
└── main.dart # App entry point

## ️ How to Run

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd Knovator_tech_task
   
2. Flutter clean
3. Flutter pub get
4. Flutter run