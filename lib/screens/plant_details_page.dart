import 'package:flutter/material.dart';
import 'package:plant_application/core/spacing_widgets.dart';
import 'package:plant_application/core/widgets/add_plant.dart';
import 'package:plant_application/core/widgets/plant_image.dart';
import 'package:plant_application/plant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlantDetailsPage extends StatefulWidget {
  final Plant plant;
  const PlantDetailsPage({Key? key, required this.plant}) : super(key: key);
  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  late final PageController pageController;
  bool isLiked = false;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                  ),
                ),
                child: buildPlantDetails(),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPlantCard(
                        "Height", "assets/height.png", widget.plant.height!),
                    buildPlantCard("Temperature", "assets/temp.png",
                        widget.plant.temperature!),
                    buildPlantCard("Pot", "assets/pot.png", widget.plant.port!),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlantDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.h35,
        buildNavigationButtons(),
        Stack(
          children: [
            Hero(
              tag: widget.plant.title!,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: pageController,
                    children:
                        List.generate(widget.plant.images!.length, (index) {
                      return PlantImage(widget.plant.images![index]);
                    }),
                  )),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
        Spacing.h10,
        buildPlantDescription(),
        Spacing.h70,
      ],
    );
  }

  Row buildNavigationButtons() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildPlantDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageIndicator(),
          Spacing.w14,
          buildDescription(),
        ],
      ),
    );
  }

  Widget pageIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SmoothPageIndicator(
        axisDirection: Axis.vertical,
        controller: pageController,
        count: widget.plant.images!.length,
        effect: const ExpandingDotsEffect(
          dotWidth: 6.0,
          dotHeight: 5.0,
          spacing: 3.0,
          radius: 10.0,
          activeDotColor: Color(0xFF699A3F),
          dotColor: Color(0xFFE5E5E5),
          strokeWidth: 2.0,
          paintStyle: PaintingStyle.fill,
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.plant.title!,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins-Bold",
              color: Color(0xff3E3E3E),
              fontWeight: FontWeight.w800,
            )),
        Spacing.h10,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(widget.plant.description!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff3E3E3E),
                fontFamily: "Poppins-Regular",
                fontWeight: FontWeight.w400,
              )),
        ),
        Spacing.h10,
        buildPlantPriceTag()
      ],
    );
  }

  Widget buildPlantPriceTag() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$${widget.plant.price}",
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xff3E3E3E),
            fontFamily: "Poppins-Bold",
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacing.w26,
        AddPlantButton(
          onTap: () {},
        )
      ],
    );
  }

  Widget buildPlantCard(String title, String icon, String data) {
    return Column(
      children: [
        Image.asset(
          icon,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
          color: Colors.white,
        ),
        Spacing.h10,
        Text(title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins-Bold",
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w800,
            )),
        Spacing.h10,
        Text(data,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontFamily: "Poppins-Regular",
              fontWeight: FontWeight.w400,
            ))
      ],
    );
  }
}
