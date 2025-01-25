import 'package:checkingapi/screens/mandir_faqs.dart';
import 'package:checkingapi/utils/routes/routes.dart';
import 'package:checkingapi/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../response/network/status.dart';
import '../services/home_view_modal.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}
class HomePageState extends State<Homepage>{
  HomeViewModal homeViewModal = HomeViewModal();
  @override
  void initState() {
    homeViewModal.fetchMandirOfferListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text("Offerings"),
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
               switch (value.mandirofferList.status){
                 case Status.LOADING:
                   return CircularProgressIndicator();
                 case Status.ERROR:
                   return Center(
                       child: Text(value.mandirofferList.message.toString()));
                 case Status.COMPLETE:
                   return  ListView.builder(
                       itemCount: value.mandirofferList.data?.data!.length,
                       itemBuilder: (context,index ){

                         return Card(
                           child:Column(
                             children: [
                               ListTile(
                                 leading:   Image.network(
                                     height: 50,
                                     width: 50,
                                     errorBuilder: (context,error,stack){
                                       return Icon(Icons.error,color: Colors.red);
                                     },
                                     value.mandirofferList.data?.data![index].image.toString() ??""),
                                 title: Text(
                                     value.mandirofferList.data?.data![index].title.toString() ?? ""),
                                 subtitle: Text(value.mandirofferList.data?.data![index].details.toString() ?? ""),
                                 trailing: Text(value.mandirofferList.data?.data![index].pricing.toString()??""),
                               ),
                               ElevatedButton(onPressed: (){
                                 Navigator.push(context,MaterialPageRoute(builder: (context) => MandirFaqs()));
                               },
                                   child:Text(" Faqs"))
                             ],
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