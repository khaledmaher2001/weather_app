import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/shared/cubit/states.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);
  CurrentWeatherModel? currentWeatherModel;
  CurrentWeatherModel? currentWeatherModel2;
  List fiveCities = [];

  void getCurrentWeatherData({
    String city = "beni suef",
  }) {
    emit(GetCurrentWeatherLoadingState());

    DioHelper.getData(url: "/weather", query: {
      "q": city,
      "appid": "431e6803438bfa58110d09158e0e6987",
    }).then((value) {
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      print(currentWeatherModel!.name);

      emit(GetCurrentWeatherSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCurrentWeatherErrorState());
    });
  }

  void getCurrentWeatherCitesData({
    List<String> cites = const [
      'Hurghada',
      'cairo',
      'alexandria',
      'zagazig',
      'london',
      'fayoum',
      'giza',
    ],
  }) {
    emit(GetCurrentWeatherCityLoadingState());

    for (String element in cites) {
      DioHelper.getData(url: "/weather", query: {
        "q": element,
        "appid": "431e6803438bfa58110d09158e0e6987",
      }).then((value) {
        currentWeatherModel2 = CurrentWeatherModel.fromJson(value.data);
        fiveCities.add(currentWeatherModel2!);
       emit(GetCurrentWeatherCitySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetCurrentWeatherCityErrorState());
      });
    }
  }
}
