import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../response/network/status.dart';
import '../services/home_view_modal.dart';
import '../services/user_view_modal.dart';

class ReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReviewScreenState();
  }
}

class ReviewScreenState extends State<ReviewScreen> {
  HomeViewModal homeViewModal = HomeViewModal();

  @override
  void initState() {
    homeViewModal.fetchReviewListApi();
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
                switch (value.reviewList.status){
                  case Status.LOADING:
                    return CircularProgressIndicator();
                  case Status.ERROR:
                    return Center(
                        child: Text(value.reviewList.message.toString()));
                  case Status.COMPLETE:
                    return  ListView.builder(
                        itemCount: value.reviewList.data?.data!.length,
                        itemBuilder: (context,index ){

                          return Card(
                            child:ListTile(

                              title: Text(
                                  value.reviewList.data?.data![index].reviewText.toString()??""),
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