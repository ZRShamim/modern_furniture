import 'package:flutter/material.dart';

class ItemsSlider extends StatelessWidget {
  ItemsSlider({
    Key? key,
  }) : super(key: key);

  final List<Map> mostViewedItemsList = [
    {
      'title': 'Nixon Armchair',
      'image': 'assets/1.png',
      'description': 'Posh, comfortable and luxurious',
      'price': 1200,
      'rating': 4.5,
    },
    {
      'title': 'Nixon Armchair',
      'image': 'assets/2.png',
      'description': 'Posh, comfortable and luxurious',
      'price': 1200,
      'rating': 4.5,
    },
    {
      'title': 'Nixon Armchair',
      'image': 'assets/3.png',
      'description': 'Posh, comfortable and luxurious',
      'price': 1200,
      'rating': 4.5,
    },
    {
      'title': 'Nixon Armchair',
      'image': 'assets/4.png',
      'description': 'Posh, comfortable and luxurious',
      'price': 1200,
      'rating': 4.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ...List.generate(
                mostViewedItemsList.length,
                (index) => ItemCard(
                      item: mostViewedItemsList[index],
                    ))
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 120,
        width: 220,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: -3,
              blurRadius: 5,
              offset: const Offset(10, 7), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nixon Armchair',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Posh, comfortable and luxurious',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '1200 tk',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow,
                          ),
                          Text('4.5'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
