import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/providers.dart';
import '../../widgets/shared/row_details.dart';
import 'package:url_launcher/url_launcher.dart';

const String urlMap =
    "https://www.google.com.br/maps/place/The+Outsider+Barbershop/@-26.8951972,-49.0999456,17.25z/data=!4m5!3m4!1s0x94df1f8c2d396013:0xf8377137f94421ef!8m2!3d-26.8950615!4d-49.0989121";

const String urlPhone = "tel:+1-555-010-999";

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}

class ContainerDetailsBarberShop extends HookConsumerWidget {
  final String andress;
  final String phone;
  final String hoursOpen;

  const ContainerDetailsBarberShop({
    Key? key,
    required this.andress,
    required this.phone,
    required this.hoursOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: darkMode.darkMode
            ? const Color.fromARGB(255, 24, 24, 24)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          RowDetails(
            firstString: 'Endereço:',
            secondString: andress,
            onTap: () {},
          ),
          RowDetails(
            firstString: 'Fone:',
            secondString: phone,
            onTap: () {
              _launchUrl(urlPhone);
            },
          ),
          RowDetails(
            firstString: 'Aberto:',
            secondString: hoursOpen,
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pin_drop_outlined,
                  color: darkMode.darkMode ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 5),
                MaterialButton(
                  onPressed: () {
                    _launchUrl(urlMap);
                  },
                  child: Text(
                    'Ver no mapa',
                    style: TextStyle(
                      color: darkMode.darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
