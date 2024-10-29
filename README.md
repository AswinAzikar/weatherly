# Weatherly

Weatherly is a Flutter application that fetches the user's current location and retrieves weather information from OpenWeather. The app features both light and dark modes, providing a smooth user experience across different environments. Weatherly is open-sourced and fully compatible with iOS.

## Features

- **Current Location**: Automatically fetches the user's current geographical location.
- **Weather Data**: Retrieves real-time weather information from the OpenWeather API.
- **Light & Dark Mode**: Switches between light and dark themes based on user preference or system settings.
- **Open Source**: Contributions are welcome! Feel free to fork the repository and submit pull requests.

## Screenshots

_(Include screenshots of your app here)_

## Installation

### Prerequisites

Make sure you have Flutter installed on your machine. You can follow the official Flutter installation guide [here](https://flutter.dev/docs/get-started/install).

### Clone the Repository

```bash
git clone https://github.com/yourusername/weatherly.git
cd weatherly
```

### Get Dependencies

Run the following command to get the required dependencies:

```bash
flutter pub get
```

### Set Up OpenWeather API

1. Sign up at [OpenWeather](https://openweathermap.org/) and obtain your API key.
2. Replace `YOUR_API_KEY` in the code with your actual API key.

### Run the Application

You can run the application on an iOS simulator or a physical device using the following command:

```bash
flutter run
```

## Usage

- Upon launching the app, it will request permission to access your location.
- Once granted, it fetches the current weather based on your location.
- You can switch between light and dark modes using the settings in the app.

## Contributions

Contributions are welcome! If you'd like to contribute to Weatherly, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) for the framework.
- [OpenWeather](https://openweathermap.org/) for providing the weather API.
- [Provider](https://pub.dev/packages/provider) for state management.

## Contact

For any questions or feedback, feel free to reach out:

- Your Name: [your.email@example.com](mailto:your.email@example.com)
- GitHub: [yourusername](https://github.com/yourusername)
