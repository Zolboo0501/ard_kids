import 'package:ard_light/features/auth/presentation/widget/place.dart';
import 'package:flutter/material.dart';

class LocationTab extends StatefulWidget {
  LocationTab({Key? key}) : super(key: key);

  @override
  _LocationTabState createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  List<dynamic> locations = [
    {
      "name": "Централ Тауэр",
      "address":
          "Улаанбаатар хот, Сүхбаатар дүүрэг, 8-р хороо, Сүхбаатарын талбай 2, Сэнтрал Тауэр, 17 давхар.",
    },
    {
      "name": "Централ Тауэр",
      "address":
          "Улаанбаатар хот, Сүхбаатар дүүрэг, 8-р хороо, Сүхбаатарын талбай 2, Сэнтрал Тауэр, 17 давхар.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Place();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      itemCount: locations.length,
    );
  }
}
