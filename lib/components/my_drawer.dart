import 'package:flutter/material.dart';
import 'package:powerpc/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header:logo
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    "images/dragon.png",
                    width: 137,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // shop tile
              MyListTile(
                text: "Магазин",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // cart tile
              MyListTile(
                text: "Корзина",
                icon: Icons.shopping_cart,
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);

                  //go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              // help tile
          MyListTile(
            text: "Помощь",
            icon: Icons.help_rounded,
            onTap: () {
              // pop drawer first
              Navigator.pop(context);

              // go to help page
              Navigator.pushNamed(context, '/help_page');
            },
          ),

            ],
          ),

          
          // exit
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Выход",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
