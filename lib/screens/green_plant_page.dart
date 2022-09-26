import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_application/core/widgets/add_plant.dart';
import 'package:plant_application/core/widgets/plant_image.dart';
import 'package:plant_application/core/spacing_widgets.dart';
import 'package:plant_application/plant.dart';
import 'package:plant_application/screens/plant_details_page.dart';

class GreenPlantPage extends StatefulWidget {
  const GreenPlantPage({Key? key}) : super(key: key);

  @override
  State<GreenPlantPage> createState() => _GreenPlantPageState();
}

class _GreenPlantPageState extends State<GreenPlantPage> {
  late final ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Scrollbar(
        showTrackOnHover: true,
        thickness: 6.0,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.h35,
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/search.png")),
              const Text(
                'Green',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "Poppins-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "Plants",
                style: TextStyle(
                  color: Color(0xff3E3E3E),
                  fontSize: 36,
                  fontFamily: "Poppins-Bold",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacing.h10,
              ...List.generate(
                plants.length,
                (index) {
                  return buildPlants(context, index);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlants(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlantDetailsPage(
              plant: plants[index],
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: plants[index].title!,
            child: PlantImage(plants[index].images!.first),
          ),
          Spacing.h10,
          buildPlantTitle(index),
          Spacing.h10,
          buildPlantPrice(index),
          Spacing.h30,
          const Divider(),
        ],
      ),
    );
  }

  Widget buildPlantPrice(int index) {
    return Row(
      children: [
        Text(
          "\$${plants[index].price}",
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xff3E3E3E),
            fontFamily: "Poppins-Bold",
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacing.w26,
        AddPlantButton(onTap: () {}),
      ],
    );
  }

  Widget buildPlantTitle(int index) {
    return RichText(
      text: TextSpan(
        text: "${plants[index].title}\n",
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Poppins-Bold",
          color: Color(0xff3E3E3E),
          fontWeight: FontWeight.w800,
        ),
        children: [
          TextSpan(
              text: plants[index].description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff3E3E3E),
                fontFamily: "Poppins-Regular",
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}
