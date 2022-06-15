import 'package:flutter/material.dart';

class NavSlider extends StatefulWidget {
  const NavSlider({Key? key}) : super(key: key);

  @override
  State<NavSlider> createState() => _NavSliderState();
}

class _NavSliderState extends State<NavSlider> {
  int activeBtn = 0;

  List<Map> navList = [
    {
      'text': 'All',
      'id': 0,
    },
    {
      'icon': Icons.light_outlined,
      'id': 1,
    },
    {
      'icon': Icons.chair_outlined,
      'id': 2,
    },
    {
      'icon': Icons.deck_sharp,
      'id': 3,
    },
    {
      'icon': Icons.self_improvement_outlined,
      'id': 4,
    },
    {
      'icon': Icons.view_array_outlined,
      'id': 5,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            ...List.generate(
              navList.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    activeBtn = navList[index]['id'];
                  });
                },
                child: NavBtn(
                  icon: navList[index]['icon'],
                  text: navList[index]['text'],
                  isBtnActive: activeBtn == navList[index]['id'],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavBtn extends StatelessWidget {
  const NavBtn({
    Key? key,
    this.text,
    this.icon,
    required this.isBtnActive,
  }) : super(key: key);
  final String? text;
  final IconData? icon;
  final bool isBtnActive;

  final int activeBtn = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(5.0),
      duration: const Duration(milliseconds: 500),
      width: 60,
      height: isBtnActive ? 75 : 60,
      decoration: BoxDecoration(
        color: isBtnActive ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text != null
              ? Text(
                  text.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: isBtnActive ? Colors.white : Colors.black,
                  ),
                )
              : Icon(
                  icon,
                  color: isBtnActive ? Colors.white : Colors.black,
                )
        ],
      ),
    );
  }
}
