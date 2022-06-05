abstract class AppStates {}

class InitState extends AppStates {}

class GetCurrentWeatherLoadingState extends AppStates {}

class GetCurrentWeatherSuccessState extends AppStates {}

class GetCurrentWeatherErrorState extends AppStates {}

class GetCurrentWeatherCityLoadingState extends AppStates {}

class GetCurrentWeatherCitySuccessState extends AppStates {}

class GetCurrentWeatherCityErrorState extends AppStates {}

class GetFiveDaysWeatherLoadingState extends AppStates {}

class GetFiveDaysWeatherSuccessState extends AppStates {}

class GetFiveDaysWeatherErrorState extends AppStates {}
