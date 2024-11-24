import 'package:flutter/cupertino.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        "assets/images/image/harry-potter-and-the-chamber-of-secrets-2.png",
        width: 150,
        height: 224,
        fit: BoxFit.cover,
      ),
    );
  }
}
