import 'package:florest/component/my_colors.dart';
import 'package:florest/component/my_string.dart';
import 'package:florest/model/fake_data.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColor.backGroundColor,
        body: Stack(
          children: [
            const AppBarProduct(),
            //list product
            Positioned(
              left: 0,
              top: 180,
              child: Container(
                width: 134,
                height: 400,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: SolidColor.whiteColor),
                child: ListView.builder(
                    itemCount: florestList.length,
                    itemBuilder: (context, index) {
                      var florest = florestList[index];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                color: selectedIndex == index
                                    ? SolidColor.backGroundColor
                                    : SolidColor.whiteColor),
                            duration: const Duration(milliseconds: 500),
                            child: Image.asset(
                              florest.image,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            ImageProduct(selectedIndex: selectedIndex),
            AboutProduct(selectedIndex: selectedIndex),
          ],
        ),
      ),
    );
  }
}

class ImageProduct extends StatelessWidget {
  const ImageProduct({
    super.key,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      right: -110,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: SolidColor.blackColor.withOpacity(.3),
              blurRadius: 100,
              spreadRadius: 1)
        ]),
        child: Image.asset(
          florestList[_selectedIndex].image,
        ),
      ),
    );
  }
}

class AboutProduct extends StatelessWidget {
  const AboutProduct({
    super.key,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //name
          Text(
            florestList[_selectedIndex].name,
            style: const TextStyle(
                fontSize: 30,
                color: SolidColor.titleTextColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          //price
          Text(
            "\$${florestList[_selectedIndex].price}",
            style: const TextStyle(
                fontSize: 20,
                color: SolidColor.titleTextColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          //card
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 2,
                color: SolidColor.backGroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: const Icon(
                      Icons.water_drop_outlined,
                      color: SolidColor.whiteColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: SolidColor.backGroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: const Icon(
                      Icons.cloud_outlined,
                      color: SolidColor.whiteColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: SolidColor.backGroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: const Icon(
                      Icons.wb_sunny_outlined,
                      color: SolidColor.whiteColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          //about
          SizedBox(
            width: 188,
            child: Text(
              florestList[_selectedIndex].about,
              style: const TextStyle(color: SolidColor.aboutColor),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarProduct extends StatelessWidget {
  const AppBarProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 24,
      right: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: SolidColor.whiteColor,
                ),
                SizedBox(width: 8),
                Text(
                  MyString.backPage,
                  style: TextStyle(color: SolidColor.whiteColor),
                )
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.search,
                color: SolidColor.whiteColor,
              ),
              const SizedBox(width: 8),
              IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: SolidColor.backgroundIconColor),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: SolidColor.whiteColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
