import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/providers/favorite_provider.dart';
import 'package:flutter_application_1/product/utility/constants/color_constants.dart';
import 'package:flutter_application_1/product/utility/constants/string_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class favoritePage extends StatefulWidget {
  const favoritePage({super.key});

  @override
  State<favoritePage> createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  StringConstants.favoritesText,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
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
                  child: ListTile(
                    title: Text(
                      finalList[index].name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      finalList[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorConstant.colorRedLight300,
                      backgroundImage: AssetImage(finalList[index].image),
                    ),
                    trailing: Text(
                      '${finalList[index].price} ₺',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
