import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/components/components.dart';
import 'package:weather_app/shared/cubit/cubit.dart';
import 'package:weather_app/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getCurrentWeatherData()
        ..getCurrentWeatherCitesData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var height = MediaQuery.of(context).size.height;
          AppCubit cubit = AppCubit.get(context);
          TextEditingController cityController = TextEditingController();
          return Scaffold(
            body: cubit.currentWeatherModel != null &&
                    cubit.currentWeatherModel2 != null
                ? SingleChildScrollView(
                  child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: height * 0.35,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/sky.jpg"),
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.1,
                              ),
                              TextFormField(
                                controller: cityController,
                                onFieldSubmitted: (value) {
                                  cubit.getCurrentWeatherData(city: value);
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Search",
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.getCurrentWeatherData(
                                          city: cityController.text);
                                    },
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  iconColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              buildItem(
                                  context: context,
                                  height: height,
                                  model: cubit.currentWeatherModel),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                "Other City",
                                style:
                                    Theme.of(context).textTheme.caption!.copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              SizedBox(
                                height: height * 0.3,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => buildItem(
                                    context: context,
                                    height: height,
                                    model: cubit.fiveCities[index],
                                    isCurrent: false,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const VerticalDivider(width: 5,),
                                  itemCount: cubit.fiveCities.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
