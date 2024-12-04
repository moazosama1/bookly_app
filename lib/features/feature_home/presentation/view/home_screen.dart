
import 'package:bookly_app/features/presentation/view/widget/item_card.dart';
import 'package:bookly_app/features/presentation/view/widget/item_card_Detailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        title: const Image(
          image: AssetImage("assets/images/logo/logo.png"),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemBuilder: (context, index) => const ItemCard(),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10, // Space between items horizontally
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Best Seller",
              style:
                  TextStyle(color: theme.colorScheme.onPrimary, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: ListView.separated(
                itemBuilder: (context, index) => ItemCardDetails(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20, // Space between items horizontally
                ),
                scrollDirection: Axis.vertical,
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
