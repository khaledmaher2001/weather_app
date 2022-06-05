import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current_weather_model.dart';

Widget buildItem({
  required CurrentWeatherModel? model,
  required context,
  required height,
  bool isCurrent = true,
}) =>
    Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              (model!.name) != null ? model.name!.toUpperCase() : "",
              style: isCurrent
                  ? Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.bold)
                  : Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
            ),
            Text(
              DateFormat().add_MMMMEEEEd().format(DateTime.now()),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      (model.weather != null)
                          ? "${model.weather![0].description}"
                          : "",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 22,
                          ),
                    ),
                    Text(
                      "${((model.main!.temp)! - 273.15).round()}\u2103",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "min : ${((model.main!.tempMin)! - 273.15).round()}\u2103 / ",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14,
                              ),
                        ),
                        Text(
                          "max : ${((model.main!.tempMax)! - 273.15).round()}\u2103",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                isCurrent
                    ? Column(
                        children: [
                          Image.asset(
                            "assets/images/weather.png",
                            width: 100,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "wind : ${model.wind!.speed} km/h",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
