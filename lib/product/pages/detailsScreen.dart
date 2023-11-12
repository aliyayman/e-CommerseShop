import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/model/product.dart';
import 'package:flutter_application_1/product/pages/cartDetails.dart';
import 'package:flutter_application_1/product/providers/cart_provider.dart';
import 'package:flutter_application_1/product/utility/constants/color_constants.dart';
import 'package:flutter_application_1/product/utility/constants/string_constants.dart';
import 'package:flutter_application_1/product/widgets/avaible_size.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.detailsTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstant.colorRedLight100,
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${product.price}' '₺',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstants.avaibleSizeText,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    AvaibleSize(size: "US 6"),
                    AvaibleSize(size: "US 7"),
                    AvaibleSize(size: "US 8"),
                    AvaibleSize(size: "US 9"),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstants.avaibleColorsText,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorConstant.colorBlue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorConstant.colorRed,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorConstant.colorYellow,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
              color: ColorConstant.colorRed,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.price}' '₺',
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    provider.toggleProduct(product);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartDetails()));
                  },
                  icon: const Icon(Icons.send),
                  label: const Text(StringConstants.buttonText))
            ],
          ),
        ),
      ),
    );
  }
}
