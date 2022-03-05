import 'package:flutter/material.dart';

class Customize_Sliver_AppBar extends StatefulWidget {
  final List<String> list;
  const Customize_Sliver_AppBar(this.list, {Key? key}) : super(key: key);

  @override
  State<Customize_Sliver_AppBar> createState() =>
      _Customize_Sliver_AppBarState(list);
}

class _Customize_Sliver_AppBarState extends State<Customize_Sliver_AppBar> {
  List<String> list;

  _Customize_Sliver_AppBarState(this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        reverse: false,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: SliverDelegate(250),
            pinned: true,
            floating: true,
          ),
          buildList(list),
        ],
      ),
    );
  }

  Widget buildList(List<String> list) {
    return SliverGrid(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image(
                fit: BoxFit.cover,
                width: 200,
                height: 200,
                image: AssetImage(list[index])),
          );
        }, childCount: list.length));
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  SliverDelegate(this.expandedHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    int size = 60;
    var top = expandedHeight-shrinkOffset-size/2;
    return Stack(
      children: [
        createImage(shrinkOffset),
        createAppBar(shrinkOffset),
        Positioned(top:top,left: 30,right: 30,child: floatingButton(shrinkOffset),),
        
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  double appear(double shrinkOffSet) {
    return shrinkOffSet / expandedHeight;
  }

  double disAppear(double shrinkOffSet) {
    return 1 - shrinkOffSet / expandedHeight;
  }

  Widget createAppBar(double shrinkOfSet) {
    return Opacity(
      opacity: appear(shrinkOfSet),
      child: AppBar(
        title: Text('Flutter AppBar'),
      ),
    );
  }

  Widget createImage(double shrinkOffset) {
    return Opacity(
      opacity: disAppear(shrinkOffset),
      child: Image(
        image: AssetImage('assets/images/two.png'),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget createText(double shrinkOffset) {
     return Opacity(opacity: disAppear(shrinkOffset),child: Text('data'));
  }

  floatingButton(double shrinkOffset) {
    return Opacity(
      opacity: disAppear(shrinkOffset),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
        child: Row(children: [
          Expanded(child: socialButton("Share",Icon(Icons.share,color: Colors.blueAccent,),(){}),),
          Expanded(child: socialButton("Like",Icon(Icons.thumb_up,color: Colors.blueAccent),(){}),),
          
          ],),
      ),
    );
  }

  Widget socialButton(String s, Icon icon,Function f) {
     return TextButton(onPressed: f(), child: Row(children: [
       SizedBox(width: 10,),
       Text(s,style: TextStyle(color: Colors.black),),
       SizedBox(width: 10,),
       icon
     ],));
  }
}
