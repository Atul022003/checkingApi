import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../response/network/status.dart';
import '../services/home_view_modal.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OffersState();
  }
}

class OffersState extends State<Offers> {
  HomeViewModal homeViewModal = HomeViewModal();

  @override
  void initState() {
    homeViewModal.fetchAllOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Reviews"),
          centerTitle: true,
          leading: IconButton(
            icon:  Icon(
              Icons.arrow_back,color: Colors.black,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider<HomeViewModal>(create:(BuildContext context) => homeViewModal,
            child: Consumer<HomeViewModal>(
              builder: (context,value,_){
                switch (value.offerList.status){
                  case Status.LOADING:
                    return CircularProgressIndicator();
                  case Status.ERROR:
                    return Center(
                        child: Text(value.offerList.message.toString()));
                  case Status.COMPLETE:
                    return  ListView.builder(
                        itemCount: value.offerList.data?.data!.length,
                        itemBuilder: (context,index ){

                          return Card(
                            child:ListTile(

                              title: Text(
                                  value.offerList.data?.data![index].reviewText.toString()??""),
                              subtitle: Text(value.reviewList.data?.data![index].reviewerName.toString() ?? ""),
                              //   trailing: Text(value.reviewList.data?.data![index].reviewText.toString()??""),
                            ),

                          );
                        });
                  default:
                    return Center(child: Text('Unknown state'));
                }
              },
            ))


    );
  }
}