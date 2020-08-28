import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Movie"),),
    );
  }

 /* Widget _buildBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: ListView.builder(itemBuilder: (context , int index){
          return _buildListItemWidget(_movieList[index]);
        },itemCount: _movieList.length,),
      ),
    );
  }*/

  Widget _buildListItemWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/detail");
        },
        child: Card(
          margin: const EdgeInsets.only(bottom: 5.0,top: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top:10.0,bottom: 10.0,right: 10.0,left: 10.0),
                child: Image.network(''),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30,bottom: 30,right: 10.0,left: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                           "",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      child: Container(
                          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black12,),
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black12,),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}