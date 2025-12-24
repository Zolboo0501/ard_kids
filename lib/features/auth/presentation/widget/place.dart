import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Place extends StatelessWidget {
  const Place({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/images/loc.jpg', fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Централ тауэр салбар",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 5),
                TextView(
                  text:
                      "Улаанбаатар хот, Сүхбаатар дүүрэг, 8-р хороо, Сүхбаатарын талбай 2, Сэнтрал Тауэр, 17 давхар.",
                  fontSize: 14,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/clock.svg",
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(text: "Цагийн хуваарь", fontSize: 14),
                          const SizedBox(height: 2),
                          TextView(
                            text: "Даваа - Баасан 10:00 - 20:00",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/phone.svg",
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(text: "Утасны дугаар", fontSize: 14),
                          const SizedBox(height: 2),
                          TextView(
                            text: "+976 11223344",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Button(
                  onTap: () {},
                  height: 40,
                  text: AppLocalizations.of(context)!.seeLocation,
                  icon: SvgPicture.asset("assets/icons/mapPin.svg"),
                  color: Theme.of(context).colorScheme.onSurface,
                  titleColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
