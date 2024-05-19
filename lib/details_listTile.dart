import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_api_integration/api_services.dart';

class DetailsListTile extends StatelessWidget {
  final String userId;
  final String name;
  const DetailsListTile({super.key, required this.userId, required this.name,});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(userId),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiSearvices.fetchSingleData(userId), 
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Text(userId),
                        ),
                        SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                         Text(snapshot.data!.email,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black)),
                        Text(snapshot.data!.address.city),
                        Text(snapshot.data!.address.zipcode),
                         Text(snapshot.data!.address.geo.lat),
                          Text(snapshot.data!.address.geo.lng),
                          ],
                        ),
                       
                      ],
                    ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })
    );
  }
}