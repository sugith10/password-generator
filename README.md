# Password Generator

A modern, feature-rich password generator application built with Flutter that helps users create strong, secure passwords with a beautiful user interface.

## Features

- 🎯 Interactive circular slider for password length selection
- 🔐 Customizable password generation options:
  - Uppercase letters (A-Z)
  - Lowercase letters (a-z)
  - Numbers (0-9)
  - Special characters (!@#$%^&*)
- 🎨 Sleek and modern dark theme design
- 📱 Cross-platform support (iOS & Android)
- 💾 Save favorite passwords locally
- 📊 Password strength indicator
- 📋 One-tap copy to clipboard

## Technical Details

- Built with Flutter 3.27
- Uses BLoC pattern for state management
- Local storage with Hive
- Custom animations and UI components
- Clean Architecture principles
- Material 3 design system

## Screenshots

[Add your app screenshots here]

## Getting Started

1. Clone the repository

```bash
git clone https://github.com/yourusername/password_generator.git
```

2. Install dependencies

```bash
flutter pub get
```

3. Run the app

```bash
flutter run
```

## Architecture

The project follows Clean Architecture principles with the following layers:

- **Presentation**: Widgets, BLoC
- **Domain**: Use Cases, Entities, Repository Interfaces
- **Data**: Repository Implementations, Data Sources

## Dependencies

- flutter_bloc: State management
- hive_ce: Local storage
- sleek_circular_slider: Custom slider widget
- animate_do: Animations
- flutter_svg: SVG support

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
