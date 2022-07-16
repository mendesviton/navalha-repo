import 'package:flutter/material.dart';
import 'package:projeto_1/presenter/home/widgets/body_home.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    //vitor - screensize var .
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/fundofinal2.jfif"),
          fit: BoxFit.cover,
        ),
      ),
      width: size.width,
      height: size.height,
      // color: Colors.black,
      child: BodyHome(),
    ));
  }
}
