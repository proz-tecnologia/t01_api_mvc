import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  IconData iconButton;
  String textButton;
  Widget screen;

  HomeButton({
    Key? key,
    required this.iconButton,
    required this.textButton,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => screen,
        ));
      },
      child: Container(
        width: width * 0.36,
        height: width * 0.36,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 90, 89, 89),
              blurRadius: 5.0,
              blurStyle: BlurStyle.solid,
              offset: Offset.fromDirection(10, -8),
            ),
          ],
          color: const Color(0xffD9D9D9),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconButton,
              size: 80,
            ),
            Text(
              textButton,
            )
          ],
        ),
      ),
    );
  }
}
