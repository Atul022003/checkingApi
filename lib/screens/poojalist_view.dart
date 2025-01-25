import 'package:checkingapi/response/network/status.dart';
import 'package:checkingapi/services/home_view_modal.dart';
import 'package:checkingapi/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoojalistView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return PoojalistViewState();
  }

}
class PoojalistViewState extends State<PoojalistView>{
  HomeViewModal homeViewModal = HomeViewModal();
  @override
  void initState() {
    homeViewModal.fetchPujaList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Puja List"),
       centerTitle: true,
       leading: IconButton(
         icon: Icon( Icons.arrow_back),
         onPressed: (){
           Navigator.pop(context);
         },
       ),
     ),
     body: ChangeNotifierProvider<HomeViewModal>(
       create: (BuildContext context) => homeViewModal,
       child: Consumer<HomeViewModal>(
         builder: (context, value, _) {
           switch (value.pujaList.status) {
             case Status.LOADING:
               return Center(child: CircularProgressIndicator());
             case Status.ERROR:
               return Center(child: Text(value.pujaList.message.toString()));
             case Status.COMPLETE:
               return ListView.builder(
                 itemCount: value.pujaList.data?.data!.length ,
                 itemBuilder: (context, index) {
                   print("image---${value.pujaList.data?.data![index].mandir.toString() ?? ""}");
                   return Container(
                     height: 150,
                     width: 150,
                     child: Card(

                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             ListTile(
                               leading: Image.network(
                                 value.pujaList.data?.data![index].image.toString() ?? "",
                                 height: 80,
                                 width: 80,
                                 errorBuilder: (context,error,stack){
                                   return Icon(Icons.error,color: Colors.red,);
                                 },
                                 fit: BoxFit.cover, // Ensure proper aspect ratio
                               ),
                               title: Text(
                                 value.pujaList.data?.data![index].title.toString() ?? "",
                               ),
                               subtitle: Text(
                                 value.pujaList.data?.data![index].subTitle.toString() ?? "",
                               ),
                                 trailing: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                      Flexible(child:Text(value.pujaList.data?.data![index].id.toString() ?? "")),
                                         Flexible(child:Text(value.pujaList.data?.data![index].about.toString() ?? "")),
                                         Flexible(child:Text(value.pujaList.data?.data![index].mandir.toString() ?? ""),),
                                         Flexible(child:Text(value.pujaList.data?.data![index].pujaDate.toString() ?? ""),),

                                       ],
                                 ),
                             ),
                             ElevatedButton(onPressed: (){
                               Navigator.pushNamed(context,RoutesName.login);
                             }, child:Text("Puja Deatils"))
                           ],
                         ),
                       ),
                     ),
                   );
                 },
               );
             default:
               return Center(child: Text('Unknown state'));
           }
         },
       ),
     ),
   );
  }

}