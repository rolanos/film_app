import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/presentation/bloc/bloc/movie_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  RangeValues selectedValuesYears = const RangeValues(1900, 2023);
  RangeValues selectedValuesRating = const RangeValues(0.0, 10.0);

  TextEditingController personController = TextEditingController();

  List<String> dropDownValues = [
    "Фильм",
    "Сериал",
    "Мультфильм",
    "Аниме",
    "Выбор жанра"
  ];

  int typeNamber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Параметры подбора",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            return Column(
              children: [
                const Spacer(),
                Text(
                  "Годы выхода",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "1900",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      "2023",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                  ],
                ),
                RangeSlider(
                  min: 1900,
                  max: 2023,
                  divisions: 2023 - 1900 + 1,
                  values: selectedValuesYears,
                  labels: RangeLabels(
                    selectedValuesYears.start.toInt().toString(),
                    selectedValuesYears.end.toInt().toString(),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        selectedValuesYears = value;
                      },
                    );
                  },
                ),
                const Spacer(),
                Text(
                  "Рейтинг",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "0.0",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      "10.0",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                  ],
                ),
                RangeSlider(
                  min: 0.0,
                  max: 10.0,
                  divisions: 1000 ~/ 10,
                  values: selectedValuesRating,
                  labels: RangeLabels(
                    selectedValuesRating.start.toStringAsFixed(1),
                    selectedValuesRating.end.toStringAsFixed(1),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        selectedValuesRating = value;
                      },
                    );
                  },
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Color.fromARGB(255, 8, 29, 53),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Персона",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          controller: personController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8.0),
                            helperText: "Введите персону",
                            helperStyle:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.grey.shade400,
                                    ),
                            hintText: "Пол Уокер",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey.shade700),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 187, 187, 187),
                                width: 2,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 41, 103, 174),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Color.fromARGB(255, 8, 29, 53),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Тип",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      DropdownButton(
                        hint: Text(
                          "Выбор жанра",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        value: dropDownValues[typeNamber],
                        onChanged: (value) => setState(() {
                          if (value == null) {
                            return;
                          }
                          typeNamber = dropDownValues.indexOf(value);
                        }),
                        items: [
                          DropdownMenuItem(
                            value: dropDownValues[0],
                            child: Text(
                              "Фильм",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          DropdownMenuItem(
                            value: dropDownValues[1],
                            child: Text(
                              "Сериал",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          DropdownMenuItem(
                            value: dropDownValues[2],
                            child: Text(
                              "Мультфильм",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          DropdownMenuItem(
                            value: dropDownValues[3],
                            child: Text(
                              "Аниме",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Установить фильтры",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
