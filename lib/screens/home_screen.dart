import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/mandirlist_modal.dart';
import '../modal/mandirlist_modal.dart';
import '../response/network/status.dart';
import '../services/home_view_modal.dart';
import '../services/user_view_modal.dart';
import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeViewModal homeViewModal = HomeViewModal();

  @override
  void initState() {
    homeViewModal.fetchOfferListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModal>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              userPrefrence.remove().then((value) {
               // Navigator.pushNamed(context, RoutesName.login);
                Navigator.pushReplacementNamed(context, RoutesName.login);
              });
            },
            child: Text("Logout"),
          ),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<HomeViewModal>(
        create: (BuildContext context) => homeViewModal,
        child: Consumer<HomeViewModal>(
          builder: (context, value, _) {
            switch (value.mandirList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.mandirList.message.toString()));
              case Status.COMPLETE:
                return ListView.builder(
                  itemCount: value.mandirList.data?.data!.length ,
                  itemBuilder: (context, index) {
                    print("image---${value.mandirList.data?.data![index].image.toString() ?? ""}");
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.mandirList.data?.data![index].image.toString() ?? "",
                         height: 80,
                         width: 80,
                          errorBuilder: (context,error,stack){
                            return Icon(Icons.error,color: Colors.red,);
                          },
                          fit: BoxFit.cover, // Ensure proper aspect ratio
                        ),
                        title: Text(
                          value.mandirList.data?.data![index].name.toString() ?? "",
                        ),
                        subtitle: Text(
                          value.mandirList.data?.data![index].details.toString() ?? "",
                        ),
                    trailing: Column(
                      children: [
                        Flexible(child:Text(value.mandirList.data?.data![index].id.toString() ?? ""),),
                        SizedBox(height: 8,),
                        ElevatedButton(
                          onPressed: (){
                          Navigator.pushNamed(context,RoutesName.Home);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen


                          ),
                            child: Text("Mandir Offer"),)
                      ],
                    )
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