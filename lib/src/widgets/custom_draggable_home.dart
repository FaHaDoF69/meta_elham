import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

class CustomDraggableHome extends StatelessWidget {
  final String title;
  final Widget headerContent;
  final List<Widget> body;
  final Color backgroundColor;

  const CustomDraggableHome({
    super.key,
    required this.title,
    required this.headerContent,
    required this.body,
    this.backgroundColor = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      // leading: const Icon(Icons.arrow_back_ios),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      // ],
      headerWidget: headerContent,
      body: body,
      backgroundColor: backgroundColor,
      // headerBottomBar: headerBottomBarWidget(),
      fullyStretchable: true,
      // expandedBody: const CameraPreview(),
      appBarColor: Colors.teal,
    );
  }

  Row headerBottomBarWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon(
        //   Icons.settings,
        //   color: Colors.white,
        // ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}

class CameraPreview extends StatelessWidget {
  const CameraPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 20,
                    right: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(.5),
                          child: const Icon(
                            Icons.bolt,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
                Positioned(
                  bottom: 50,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.grey[300],
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
