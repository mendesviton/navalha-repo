import 'package:flutter/material.dart';


import '../../confirmation_page/confirmation_page.dart';
import 'calendar_widget.dart';
import 'wrap_hour_buttons.dart';

class ScheduleButton extends StatefulWidget {
  const ScheduleButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduleButton> createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<ScheduleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ConfirmationPage(
                  selectDay: daySelected, selectHour: hourSelected!);
            },
          ),
        );
      },
      child: Ink(
        height: 70,
        width: 180,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              padding: const EdgeInsets.only(
                right: 65,
                left: 25,
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 44, 44, 44),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 115,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 99, 99, 99),
                radius: 30,
                child: SizedBox(
                  child:
                      Icon(Icons.check_circle, size: 32, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
