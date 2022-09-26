import 'package:flutter/material.dart';

class AddPlantButton extends StatelessWidget {
  final GestureTapCallback onTap;
  const AddPlantButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 139, 135, 135),
              blurRadius: 9,
              offset: Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/add_plant.png",
          height: 18,
          width: 18,
        ),
      ),
    );
  }
}
