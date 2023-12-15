import 'package:flutter/material.dart';
import 'package:powerpc/components/my_drawer.dart';
import 'package:powerpc/pages/balance_page.dart';
import 'package:powerpc/pages/elite_page.dart';
import 'package:powerpc/pages/ultra_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("PowerPc"),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              buildCategoryTile(
                context,
                "images/balans_image.png",
                Colors.grey.shade800,
                "БАЛАНС",
                "AMD Radeon RX 7600/7700 XT\n\nAMD Ryzen 3/5/7 PRO\n\n16-32 GB DDR4",
                0,
              ),
              buildCategoryTile(
                context,
                "images/elite_image.png",
                Colors.grey.shade800,
                "ЭЛИТ",
                "AMD Radeon RX 7900 XT/7900 XTX\n\nAMD Ryzen 7/9 PRO\n\n64-96 GB DDR5",
                1,
              ),
              buildCategoryTile(
                context,
                "images/ultra_image.png",
                Colors.grey.shade800,
                "Ультра",
                "AMD Radeon RX 7900 XTX\n\nAMD Ryzen 9 PRO\n\n96 GB DDR5",
                2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryTile(
    BuildContext context,
    String imagePath,
    Color categoryColor,
    String categoryName,
    String categoryDescription,
    int index,
  ) {
    return Card(
      color: categoryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imagePath,
                    height: 168,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 12),
                  Text(
                    categoryName,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    categoryDescription,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    onLearnMoreButtonPressed(context, index);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(19, 136, 0, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    "ПОДРОБНЕЕ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLearnMoreButtonPressed(BuildContext context, int categoryIndex) {
    switch (categoryIndex) {
      case 0:
        Navigator.pushNamed(
          context,
          '/balance_page'
        );
        break;
      case 1:
        Navigator.pushNamed(
          context,
          '/elite_page'
        );
        break;
      case 2:
        Navigator.pushNamed(
          context,
          '/ultra_page'
        );
        break;
    }
  }
}
