import 'package:florest/component/my_colors.dart';
import 'package:florest/component/my_string.dart';
import 'package:florest/gen/assets.gen.dart';
import 'package:florest/model/fake_data.dart';
import 'package:florest/view/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          TopPage(),
          Categories(),
          FlorestList(),
        ],
      )),
    );
  }
}

class FlorestList extends StatelessWidget {
  const FlorestList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
        child: ListView.builder(
      itemCount: florestList.length,
      itemBuilder: (context, index) {
        final florest = florestList[index];
        return Stack(
          children: [
            //background color
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: size.width / 1.25,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: SolidColor.backGroundColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                ),
              ),
            ),

            //add icon

            Positioned(
                top: size.height / 17,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: SolidColor.whiteColor),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Product()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: SolidColor.blackColor,
                      size: 50,
                    ),
                    // iconSize: 50,
                  ),
                )),

            //center item

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      florest.name,
                      style: const TextStyle(
                        color: SolidColor.titleTextColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: const Icon(
                            Icons.wb_sunny_outlined,
                            color: SolidColor.whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            //image shadow

            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: SolidColor.blackColor.withOpacity(0.35),
                      blurRadius: 20,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.normal,
                      offset: const Offset(24, 50))
                ],
              ),
            ),

            //image

            Positioned(
              top: 35,
              left: 25,
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  florest.image,
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //number
        Container(
          margin: const EdgeInsets.only(left: 26),
          child: Row(
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: SolidColor.blackColor),
                child: const Center(
                  child: Text(
                    "23",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 55),
              Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: SolidColor.categoriesColor),
                child: const Center(
                  child: Text(
                    "8",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 130),
              Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: SolidColor.categoriesColor),
                child: const Center(
                  child: Text(
                    "15",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        //String
        Container(
          margin: const EdgeInsets.fromLTRB(0, 6, 0, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categories
                .map((category) => TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        foregroundColor: SolidColor.blackColor,
                        disabledForegroundColor:
                            SolidColor.categoriesColor, // Disable color
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100),
        ),
        color: SolidColor.backGroundColor,
      ),
      child: Stack(
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Florets",
                  style: TextStyle(fontSize: 30, color: SolidColor.whiteColor),
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
          ),
          Positioned(
            right: 15,
            bottom: size.height / 10,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: SolidColor.blackColor.withOpacity(0.3),
                      blurStyle: BlurStyle.normal,
                      offset: const Offset(-15, -15),
                      blurRadius: 50,
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage(Assets.image.plant2.path),
                      fit: BoxFit.fill)),
            ),
          ),
          const Positioned(
              bottom: 20,
              left: 25,
              child: Text(
                maxLines: 2,
                MyString.posterTitle,
                style: TextStyle(
                    color: SolidColor.titleTextColor,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
