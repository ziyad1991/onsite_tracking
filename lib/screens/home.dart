import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../provider/visits_provider.dart';
import '../widgets/visit_item.dart';
import 'login.dart';
import '../screens/task_list.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isinit = true;
  bool _isloading = false;
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isloading = true;
      });
      Provider.of<VisitsProvider>(context).getTasks().then((_) {
        setState(() {
          _isloading = false;
        });
      });
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final AuthData = Provider.of<AuthProvider>(context);
    final VisitData = Provider.of<VisitsProvider>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: 'Attendance',
          ),
        ],
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('Hello ' + AuthData.getusername,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text('How Are you today ?',
                            style: TextStyle(color: Colors.black)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tasks for today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            ' ${(VisitData.getCount(1)).toString()} of ${(VisitData.tasks.length).toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              color: Color.fromRGBO(220, 220, 220, 1),
                            ),
                          ),
                          FractionallySizedBox(
                            heightFactor: 70,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            DateFormat('EEEE').format(now).toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView(
                    padding: const EdgeInsets.all(10.0),
                    children: [
                      HomeButton(
                          icon: Icons.done_all_rounded,
                          iconText: 'Done',
                          iconColor: Colors.blue,
                          count: (VisitData.getCount(1)).toString()),
                      HomeButton(
                          icon: Icons.update_rounded,
                          iconText: 'Pending',
                          iconColor: Colors.purple,
                          count: (VisitData.getCount(2)).toString()),
                      HomeButton(
                          icon: Icons.label_important_rounded,
                          iconColor: Colors.green,
                          iconText: 'New',
                          count: (VisitData.getCount(3)).toString()),
                      HomeButton(
                          icon: Icons.archive,
                          iconColor: Colors.grey,
                          iconText: 'Archive',
                          count: '15'),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 10,
                    )),
              )
            ]),
    );
  }
}

class HomeButton extends StatelessWidget {
  IconData icon;
  String iconText;
  String count;
  Color iconColor;
  HomeButton({this.icon, this.iconText, this.iconColor, this.count});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Theme.of(context).primaryColor,
      focusNode: FocusNode(descendantsAreFocusable: true),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () {
        Navigator.of(context).pushNamed(ListScreen.routeName);
      },
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: iconColor,
            ),
            Text(
              count,
              style: TextStyle(
                  fontSize: 30, color: iconColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              iconText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: iconColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
