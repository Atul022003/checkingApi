import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../response/network/status.dart';
import '../services/home_view_modal.dart';

class MandirFaqs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MandirFaqsState();
  }

}
class MandirFaqsState extends State<MandirFaqs>{
  HomeViewModal homeViewModal = HomeViewModal();
  @override
  void initState() {
    homeViewModal.fetchMandirfaqs();
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
            switch (value.mandirfaqs.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.mandirfaqs.message.toString()));
              case Status.COMPLETE:
                return ListView.builder(
                  itemCount: value.mandirfaqs.data?.data!.length ,
                  itemBuilder: (context, index) {
                    print("image---${value.mandirfaqs.data?.data![index].id.toString() ?? ""}");
                    return Container(
                      height: 150,
                      width: 150,
                      child: Card(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Text(value.mandirfaqs.data?.data![index].mandirId.toString() ??""),
                                title: Text(
                                  value.mandirfaqs.data?.data![index].question.toString() ?? "",
                                ),
                                subtitle: Text(
                                  value.mandirfaqs.data?.data![index].answer.toString() ?? "",

                                ),
                                trailing: Text(value.mandirfaqs.data?.data[index].id.toString()?? ""),

                              ),

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