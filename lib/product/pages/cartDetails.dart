import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/providers/cart_provider.dart';
import 'package:flutter_application_1/product/utility/constants/color_constants.dart';
import 'package:flutter_application_1/product/utility/constants/string_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.carts;

    _buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.shade100,
          ),
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.cartAppbarTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: finalList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Slidable(
                  endActionPane: ActionPane(motion: ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) {
                        finalList.removeAt(index);
                        setState(() {});
                      },
                      backgroundColor: ColorConstant.colorRed,
                      foregroundColor: ColorConstant.colorWhite,
                      icon: Icons.delete,
                      label: StringConstants.deleteLabel,
                    )
                  ]),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (contex) {
                          finalList[index].quantity = 1;
                          finalList.removeAt(index);
                          setState(() {});
                        },
                        backgroundColor: ColorConstant.colorRed,
                        foregroundColor: ColorConstant.colorWhite,
                        icon: Icons.delete,
                        label: StringConstants.deleteLabel,
                      )
                    ]),
                    child: Expanded(
                      child: ListTile(
                        title: Text(
                          finalList[index].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${finalList[index].price} ₺',
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: ColorConstant.colorRedLight300,
                          backgroundImage: AssetImage(finalList[index].image),
                        ),
                        trailing: Column(
                          children: [
                            _buildProductQuantity(Icons.add, index),
                            Text(
                              finalList[index].quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            _buildProductQuantity(Icons.remove, index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
                color: ColorConstant.colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${provider.getTotalPrice()} ₺',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                      label: const Text(StringConstants.checkOutLabel))
                ]),
          )
        ],
      ),
    );
  }
}
