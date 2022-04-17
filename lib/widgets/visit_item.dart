import 'package:flutter/material.dart';
import 'package:onsite_tracking/models/visit.dart';
import '../provider/visits_provider.dart';
import 'package:provider/provider.dart';
import '../screens/task.dart';


class VisitItem extends StatefulWidget {

  int Listnumber;
  var visit;

  VisitItem(this.Listnumber,this.visit);
  @override
  _VisitItemState createState() => _VisitItemState();
}

class _VisitItemState extends State<VisitItem> {
  @override
  Widget build(BuildContext context) {
    final ssd= Provider.of<VisitsProvider>(context).tasks;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return TaskScreen();
                }));
              },
              leading: CircleAvatar(
                child: Text(widget.Listnumber.toString()),
              ),
              title: Text(widget.visit[widget.Listnumber -1 ].contactName.toString()),
              subtitle: Text('Assigned to Dr Zaki'),
              trailing: Icon(Icons.done,color:Colors.blue,),
            )
          ],
        ),
      ),
    );
  }
}
