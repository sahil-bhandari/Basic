import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Test/add_user_dialog.dart';
import 'package:Test/model/user.dart';
import 'package:Test/presenter/home_presenter.dart';

class UserList extends StatelessWidget {
  List<User> employeeList;
  HomePresenter homePresenter;

  UserList(
    this.employeeList,
    this.homePresenter, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: employeeList == null ? 0 : employeeList.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 30.0,
                        child: new Text(getShortName(employeeList[index])),
                        backgroundColor: const Color(0xFF20283e),
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(" "+
                                employeeList[index].firstName +
                                    " " +
                                    employeeList[index].lastName,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.green),
                              ),
                              new Text(
                                "(" + employeeList[index].profession +")",
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         new IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: const Color(0xFFBDBDBD),
                              ),
                              onPressed: () => edit(employeeList[index], context),
                            ),

                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: const Color(0xFFC62828)),
                            onPressed: () =>
                                homePresenter.delete(employeeList[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayRecord() {
    homePresenter.updateScreen();
  }
  edit(User user, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, true, user),
    );
    homePresenter.updateScreen();
  }

  String getShortName(User user) {
    String shortName = "";
    if (user.firstName.isNotEmpty) {
      shortName = user.firstName.substring(0, 1) + " ";
    }

    if (user.lastName.isNotEmpty) {
      shortName = shortName + user.lastName.substring(0, 1);
    }
    return shortName;
  }
}