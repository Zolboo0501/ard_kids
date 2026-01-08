import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountriesView extends StatelessWidget {
  final Map<String, dynamic> country;
  void Function(Map<String, dynamic> value) onChanged;
  CountriesView({Key? key, required this.country, required this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: country['code'] == Countries.countries[index]['code']
                ? Theme.of(context).colorScheme.onSurface
                : Colors.transparent,
            onTap: () {
              onChanged(Countries.countries[index]);
              Navigator.pop(context);
            },
            leading: SvgPicture.asset(
              Countries.countries[index]['flag']!,
              width: 32,
              height: 32,
            ),
            title: TextView(
              text: Countries.countries[index]['name']!,
              fontWeight: country['code'] == Countries.countries[index]['code']
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: Countries.countries.length,
      ),
    );
  }
}
