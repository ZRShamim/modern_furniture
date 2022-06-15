import 'package:flutter/material.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({
    Key? key,
  }) : super(key: key);

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  var activePan = 0;
  var isSidePanOpen = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSidePanOpen ? 60 : 0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 56, 56, 56),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSidePanOpen = !isSidePanOpen;
                });
              },
              icon: const Icon(
                Icons.widgets_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activePan = 0;
                });
              },
              child: VerticalText(
                text: 'Recomended',
                id: 0,
                activePan: activePan,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activePan = 1;
                });
              },
              child: VerticalText(
                text: 'Most Viewed',
                id: 1,
                activePan: activePan,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activePan = 2;
                });
              },
              child: VerticalText(
                text: 'Trending',
                id: 2,
                activePan: activePan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({
    Key? key,
    required this.text,
    required this.id,
    required this.activePan,
  }) : super(key: key);

  final String text;
  final int activePan;
  final int id;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        decoration: BoxDecoration(
          border: activePan == id
              ? const Border(
                  bottom: BorderSide(
                    // width: 2,
                    color: Colors.white,
                  ),
                )
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: activePan == id ? FontWeight.w500 : FontWeight.w200,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
