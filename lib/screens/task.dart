import 'package:flutter/cupertino.dart4';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}



class _TaskScreenState extends State<TaskScreen> {
   bool checkOutdone = false;
  void checkIn() async{
    final ImagePickerx = ImagePicker();
    final imageFile = await ImagePickerx.getImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) {  return;}
setState(() {
  checkOutdone = true;
});


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Number : 223'),


      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(



                 elevation: 10,
                  child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                             Text('Visit Contact Name',style: TextStyle(fontWeight: FontWeight.bold),),
                             Text('Dr Ahmed Magdy'),
                             SizedBox(height: 3,),
                             Text('Address',style: TextStyle(fontWeight: FontWeight.bold),),
                             Text('10 louran Third Floor'),
                             SizedBox(height: 3,),
                             Text('Note',style: TextStyle(fontWeight: FontWeight.bold),),
                             Text('working hours : 10 am - 10 pm'),
                         ],
                       ),
                     ),

         Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done_all_rounded),
                    Text('Completed')
                  ],
         ) ],
                  ),
                        ),


                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Container(



                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('CheckIn',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                        , SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.check_rounded,color: Colors.white,)
                      ],
                    ),
                  color: Theme.of(context).primaryColor,
                    height: 80,
                  ),

                ),
                Expanded(
                  child: InkWell(
                    onTap: checkIn,
                    child: Container(

                      margin: EdgeInsets.all(6),



                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text('CheckOut',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                         , SizedBox(
                            height: 10,
                          ),
                           Icon(checkOutdone ?  Icons.check_rounded : Icons.fingerprint,color:checkOutdone ?    Colors.white : Colors.black,)
                        ],
                      ),
                      color: Theme.of(context).primaryColor,
                      height: 80,
                    ),
                  ),

                ),Expanded(
                  child: Container(



                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('Complete',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),

                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.fingerprint,color: Colors.black,)
                      ],
                    ),
                    color: Theme.of(context).primaryColor,
                    height: 80,
                  ),

                ),

                // Container(
                //   color: Colors.orange,
                //   height: 200,
                //   width: 100,
                //   child: Text('asdasd'),
                // ),
                //  Container(
                //    color: Colors.orange,
                //    height: 200,
                //    width: 100,
                //    child: Text('asdasd'),
                //  ),    Container(
                //    color: Colors.orange,
                //    height: 200,
                //    width: 100,
                //    child: Text('asdasd'),
                //  )
              ],
            ),
          )

        ],
      ),
    );
  }
}
