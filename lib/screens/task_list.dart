import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../provider/visits_provider.dart';
import '../widgets/visit_item.dart';
import 'login.dart';



class ListScreen extends StatefulWidget {
  static const routeName = '/listScreen';

  @override
  _ListScreenState createState() => _ListScreenState();
}



class _ListScreenState extends State<ListScreen> {


  @override




  Widget build(BuildContext context) {



    return Scaffold(
 appBar:  AppBar(
   title: Padding(
     padding: const EdgeInsets.only(left: 70),
     child: Text('Tasks List'),
   ),
 ),
      body:  Consumer<VisitsProvider>(
        builder: (ctx,visitslist,_){
   return ListView.builder(

   itemCount: visitslist.tasks.length,
   itemBuilder: (ctx,index){
     return VisitItem(index+1,visitslist.tasks
     );
    },

    );

    }
      )
     );
  }
}
