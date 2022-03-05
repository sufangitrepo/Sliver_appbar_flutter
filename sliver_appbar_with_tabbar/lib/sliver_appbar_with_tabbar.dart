import 'package:flutter/material.dart';




/* *************************
 * 
 * 
 * 
 * 
 
       Sliver AppBar  with TabBar 
 *
 *  * 
 * 

*******************************/



class SeconPage extends StatefulWidget {
  final List<String> list;
  const SeconPage(this.list,{ Key? key }) : super(key: key);

  @override
  State<SeconPage> createState() => _SeconPageState(list);
}
 
class _SeconPageState extends State<SeconPage> {
  List<String> list;
  _SeconPageState(this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: DefaultTabController(
       length: 2,
       child: NestedScrollView(headerSliverBuilder: (BuildContext context , bool res){
             return [
               SliverAppBar(
                 floating: true,
                 pinned: true,
                 snap: true,
                 title: Text("Fluter App"),
                 leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                 actions: [ 
                   IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                   IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
                   ],
                 backgroundColor: Colors.black,
                 textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
                 bottom: TabBar(tabs: [Tab(text: "Home",),Tab(text: "Reel",),]),
               ),
             ];
       }, body: TabBarView(children: [
             myBuild(Colors.amber),
             yourBuild(list)     
       ])),
     ),
    );
  }
  Widget yourBuild(List<String> list){
     return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder:(BuildContext context,int index){
        return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,
                      image: AssetImage(list[index])),
                );
              },itemCount: list.length,);
     
  }
  
  Widget myBuild(Color color){
    return ListView(
      children:const [Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
       Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
       Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
       Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),
      Text('data'),Text('data'),Text('data'),Text('data'),Text('data'),Text('data'),],
    );
  }
}