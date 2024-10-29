
# Weatherly

Weatherly is a Flutter application that fetches the current weather based on the user's location using the OpenWeather API. The app supports both light and dark modes, providing a seamless user experience.

## Features

- Fetches current weather data using the OpenWeather API.
- Displays weather information such as temperature and conditions.
- Supports both light and dark themes.
- Pull-to-refresh functionality to update weather data.
- Environment variable management with `flutter_dotenv` for secure API key storage.

## Getting Started

### Prerequisites

- Flutter installed on your machine.
- An OpenWeather API key. You can sign up for a free account at [OpenWeather](https://openweathermap.org/).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AswinAzikar/weatherly.git
   cd weatherly
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Create a `.env` file in the root of the project and add your OpenWeather API key:

   ```env
   WEATHER_API_KEY=your_api_key_here
   ```

   > **Note**: The `.env` file has been added to the `.gitignore` to prevent it from being tracked by Git, ensuring your API key remains secure.

### Usage

1. Run the application:

   ```bash
   flutter run
   ```

2. The app will automatically fetch the current weather based on your location.

### Screenshots
![image](https://github.com/user-attachments/assets/1d4d8869-99b4-4d05-9a82-73563dbc0112)


### Contributions

Contributions are welcome! Feel free to create a pull request or open an issue for any enhancements or bugs.

### License

This project is open source and available under the [MIT License](LICENSE).

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
