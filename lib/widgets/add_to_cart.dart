// import 'package:flutter/material.dart';
// import 'package:food_delivery/providers/cart.dart';
// import 'package:provider/provider.dart';

// import 'gradient_button.dart';

// class AddToCart extends StatelessWidget {
//   final String mealId;
//   final double price;
//   final String title;
//   final String imageUrl;

//   AddToCart({
//     @required this.mealId,
//     @required this.price,
//     @required this.title,
//     @required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context, listen: false);

//     return Builder((builder, context)=>GradientButton(
//         isCurved: false,
//         context: context,
//         label: 'ADD TO CART',
//         onTap: () {
//           cart.addItem(
//             mealId,
//             price,
//             title,
//             imageUrl,
//           );
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Added item to cart!'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
