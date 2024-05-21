# Password Generator

## Overview

Welcome to the Password Generator Flutter project! This application allows users to generate strong and secure passwords based on their specified constraints. The project is built using Flutter and follows the clean architecture with a feature-first approach. The password generation is a one-time process, and users are encouraged to save the generated passwords for future use.

### Platforms

- Android: 
    [Google Play Store](https://play.google.com/store/apps/details?id=in.dayproduction.password_generator&hl=en)
    [Amazon App Store](https://www.amazon.com/gp/product/B0CVF1K2RR)
- Web: [Web Application](https://password-generator-e00b6.web.app/)

![password-generator-cover](https://raw.githubusercontent.com/sugith10/images/main/projects/password-generator-cover.png)

## Folder Structure

The project adheres to a clean architecture, organizing the codebase into distinct layers:

- **lib/main.dart**: Entry point of the application.
- **lib/core**: Holds core components shared across features.
- **lib/feature**: Contains the feature modules, such as `generate_password`.
- **lib/feature/generate_password**:
  - **data**: Data layer, responsible for handling data from external sources.
  - **domain**: Domain layer, containing business logic and domain entities.
  - **presentation**: Presentation layer, handling UI and user interactions.

## Features

- Password generation with specified constraints.
- Clean architecture for maintainability and scalability.
- One-time password generation to enhance security.

## How to Use

1. Open the application on your preferred platform.
2. Navigate to the "Generate Password" feature.
3. Specify your password constraints (e.g., length, uppercase, lowercase).
4. Hit the "Generate Password" button.
5. Save the generated password for future use.

## Contributions

Contributions are welcome! Feel free to open issues, submit pull requests, or provide feedback.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

If you have any questions or issues, please reach out through the app's respective platform.

Happy password generating!
