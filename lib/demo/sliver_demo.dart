import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('FLUTTER_APP'),
            // pinned: true,
            floating: true,
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'NINGHAO_JUNRONG'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.net/images/overkill.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            )
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(

            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom:32.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(12.0),
                    elevation: 14.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Stack(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 16/9.0,
                          child: Image.network(
                            posts[index].imageUrl,
                            fit:BoxFit.cover
                          ),
                       ),
                       Positioned(
                         top: 32.0,
                         left: 32.0,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(
                               posts[index].title,
                               style: TextStyle(
                                 fontSize: 20.0,
                                 color: Colors.white
                               ),
                             ),
                             Text(
                               posts[index].author,
                               style: TextStyle(
                                 fontSize: 13.0,
                                 color: Colors.white
                               ),
                             )
                           ],
                         )
                       )
                      ],
                    ),
                  ),
                );
              },
              childCount: posts.length
            )
          );
  }
}

class SliverGridDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5
            ), 
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
                );
              },
              childCount: posts.length
            )
          );
  }
}