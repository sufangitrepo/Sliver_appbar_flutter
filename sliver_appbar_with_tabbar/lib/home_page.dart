import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  final List<String> list;
  const HomePage(this.list, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(list);
}

class _HomePageState extends State<HomePage> {
  List<String> list;

  _HomePageState(this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics:const  BouncingScrollPhysics(parent: ScrollPhysics()),
        slivers: [
          SliverAppBar(
            // title: Text('Flutter App',style: TextStyle(fontFamily: 'SmoochSans'),),
            floating: true,
            pinned: true,
            backgroundColor: Colors.red,
            expandedHeight: 200,

            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              SizedBox(
                width: 5,
              )
            ],

            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(30),
              bottomEnd: Radius.circular(30),
            )),
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                title: const Text("Flutter App"),
                stretchModes: const [StretchMode.zoomBackground],
                background: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/one.png'),
                        fit: BoxFit.cover,
                      )),
                )),
          ),
          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                      image: AssetImage(list[index])),
                );
              }, childCount: list.length)),
         
        ],
      ),
    );
  }

  Widget myGrid() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(width: 300, height: 300, image: AssetImage(list[index])),
      );
    }, childCount: list.length));
  }
}
