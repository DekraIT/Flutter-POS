import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:src/main.dart';

class Item {
  String name;
  double price;

  Item(this.name, this.price);
}

final List<Item> items = [
  Item("Essen", 10.5),
  Item("Trinken", 3.5),
  Item("Pfand", 3.5),
  Item("Wein", 13.5)
];

class ItemsContainer extends StatefulWidget {
  const ItemsContainer({super.key});

  @override
  State<ItemsContainer> createState() => _ItemsContainerState();
}

class _ItemsContainerState extends State<ItemsContainer> {
  final _future = supabaseClient.from('product_categories').select();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("Items", style: ShadTheme.of(context).textTheme.h3)),
      FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            final categories = snapshot.data;

            if (categories == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: categories
                    .map((i) => Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Column(children: [
                          Text(i.name),
                          Text(i.price.toString()),
                        ])))
                    .toList());
          }),
    ]);
  }
}
