import 'package:flutter/material.dart';
import 'package:starter/features/video_post/domain/data.dart';

///
class BuildScrollBar extends StatelessWidget {
  ///
  const BuildScrollBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 214, 209, 209),
            blurRadius: 10,
            offset: Offset(
              2,
              10,
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 9.6,
        right: 9.6,
      ),
      height: 46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: scrollListData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  scrollListData[index],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 3,
                  width: 60,
                  color: index == 0
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
