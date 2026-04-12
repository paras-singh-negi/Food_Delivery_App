# Zomato Clone

A clean Flutter replica of a food delivery app screen, built to showcase home browsing, search, recommendations, and item details.


## 🚀 Overview

This project is a Flutter implementation of a Swiggy-style food delivery UI. It includes a landing screen with a hero banner, search bar, visual food categories, recommended restaurants/dishes, and a detailed item page with add/remove controls.

The app is built with:
- Flutter and Dart
- Provider for state management
- Network image previews for menu items
- Simple sample data defined in code

---

##  Key Features

- **Home landing screen** with a large cover image, location display, and profile/accessory buttons
- **Search bar** to filter recommended dishes by name
- **Veg mode toggle** with animated pill-style switch
- **Category row** of quick food types (All item, Veg-thali, Chicken fry, Fish curry, Snack, Cake, Thali)
- **Recommended items list** with offer tags, ratings, delivery time, and images
- **Item details view** with full dish information, offers, metadata chips, and cart quantity controls
- **Clean card-based UI** with rounded corners, gradient buttons, and modern spacing

---

##  App Flow

1. **Home Screen** (`HomeView`)
   - App entry point.
   - Displays hero image and location.
   - Contains search input and Veg mode toggle.
   - Shows a horizontal food category row.
   - Loads recommended dishes from sample data.

2. **Recommended List** (`RecommendedForYouSection`)
   - Horizontal scroll of recommended dishes.
   - Filter pills for quick actions like "Filters", "Near & Fast", and "Schedule".
   - Tap any recommendation to open the item details screen.

3. **Item Details Screen** (`ItemDetailsView`)
   - Displays selected item name, image, rating, delivery time, and location.
   - Shows offer banners, food type chips, and recommended variants.
   - Includes add/remove quantity controls for cart interaction.

4. **Data Flow**
   - Sample menu items are provided by `lib/models/data.dart`.
   - Selection state and cart quantity are managed by `lib/providers/menu_provider.dart`.
   - Navigation is handled via `Navigator.push` when an item is tapped.

---

##  Screen Order

- **Home View**
- **Recommended Section**
- **Item Details View**

This is a single-flow demonstration app, so the main interaction path is:
1. Open the app
2. Search or browse recommended items
3. Tap a dish card
4. View details and adjust quantity

---

## 📂 Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/                            # Sample menu data
│   └── data.dart                      # Dish list for recommendations
├── providers/                         # State management logic
│   └── menu_provider.dart             # Selected item and quantity state
├── views/                             # Screen widgets
│   ├── home_view.dart                 # Main home screen
│   └── item_details_view.dart         # Dish detail screen
└── widgets/                           # Reusable UI components
    └── recommended_for_you_section.dart
```

---

## 🖼 Screenshots

<div align="center">
  <img src="screen1 (1).jpg" alt=" Home Screen" width="480" />
  <img src="screen 2.jpg" alt=" Search and Categories" width="480" />
  <img src="screen 3.jpg" alt=" Recommended Items" width="480" />
</div>

> Replace the screenshot assets in `assets/screenshots/` with real app capture images for the best README preview.

---

## 🛠 Run Locally  

flutter pub get
flutter run


---

## 📌 Notes

- This project is focused on UI and sample state management.
- No backend or real ordering API is included.
- All data is loaded from local sample items in `lib/models/data.dart`.
