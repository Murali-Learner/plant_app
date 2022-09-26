import 'package:flutter/material.dart';
import 'package:plant_application/core/spacing_widgets.dart';
import 'package:plant_application/core/widgets/plant_image.dart';
import 'package:plant_application/screens/green_plant_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> widgets = [
    const GreenPlantPage(),
    const PlantImage("https://purepng.com/public/uploads/large/plant-1hn.png"),
    const PlantImage(
        "https://purepng.com/public/uploads/large/purepng.com-bushbushplantshrubtrees-141152681415364ytq.png"),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            padding: const EdgeInsets.symmetric(vertical: 35),
            color: Theme.of(context).primaryColor,
            child: RotatedBox(
              quarterTurns: 1,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Image.asset(
                      "assets/3dot.png",
                      height: 15,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  buildMenuItem("Green Plant", 0),
                  buildMenuItem("Indoor Plant", 1),
                  buildMenuItem("Shape Plant", 2),
                  const Spacer(),
                  RotatedBox(
                      quarterTurns: -1,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                            size: 30,
                          ))),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              children: [
                widgets[currentIndex],
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildMenuItem(String title, int index) {
    bool isSelected = currentIndex == index;
    return TextButton(
      onPressed: () => setState(() => currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSelected)
            Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
          Spacing.h10,
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white60,
              fontSize: isSelected ? 18 : 16,
              fontFamily: "Poppins-Bold",
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
