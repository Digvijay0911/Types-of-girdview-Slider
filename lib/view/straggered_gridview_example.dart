import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StraggeredGridview extends StatefulWidget {
  const StraggeredGridview({super.key});

  @override
  State<StraggeredGridview> createState() => _StraggeredGridviewState();
}

class _StraggeredGridviewState extends State<StraggeredGridview> {
  // -------------------------------

  List<Widget> staggeredContainer = [
    Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child: const Center(
        child: Text("One"),
      ),
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.green,
      child: const Center(
        child: Text("Two"),
      ),
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.brown,
      child: const Center(
        child: Text("Three"),
      ),
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: const Center(
        child: Text("Four"),
      ),
    ),
  ];

  // ==============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Types of gridview (Swipe left)",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: PageView(
        children: [
          AlignedGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: 4,
            itemBuilder: (context, index) {
              return staggeredContainer[index];
            },
          ),
//  ----------------------------
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: staggeredContainer[0],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: staggeredContainer[1],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: staggeredContainer[2],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: staggeredContainer[3],
              ),
            ],
          ),
          //  ----------------------------
         GridView.custom(
  gridDelegate: SliverStairedGridDelegate(
    crossAxisSpacing: 48,
    mainAxisSpacing: 24,
    startCrossAxisDirectionReversed: true,
    
    pattern: [
      const StairedGridTile(0.5, 1),
      const StairedGridTile(0.5, 3 / 4),
      const StairedGridTile(1.0, 10 / 4),
    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    childCount: 4,
    (context, index) {return staggeredContainer[index];}
   
    
  ),
),
//  ----------------------------
MasonryGridView.count(
  crossAxisCount: 7,
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
  itemCount: 4,
  itemBuilder: (context, index) {
    return staggeredContainer[index];
  },
),
        ],
      ),
    );
  }
}
