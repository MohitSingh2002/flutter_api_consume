import 'package:blog_app/model/custom_list.dart';
import 'package:blog_app/pages/add_post.dart';
import 'package:blog_app/services/api_helper.dart';
import 'package:flutter/material.dart';

class AllDataPage extends StatefulWidget {
  @override
  _AllDataPageState createState() => _AllDataPageState();
}

class _AllDataPageState extends State<AllDataPage> {

  TextEditingController newTitle = TextEditingController();
  List<CustomList> list;
  getAllData() {
    APIHelper().getAllData().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "REST API Flutter",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add data to API",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: list != null ? SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            APIHelper().getAllData().then((value) {
              setState(() {
                list = value;
              });
            });
          },
          child: ListView.separated(
            separatorBuilder: (_, __) => Divider(color: Colors.black,),
            itemCount: list.length,
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(list[index].title),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  final result = await showDialog(
                      context: context, builder: (_) => AlertDialog(
                    title: Text("Are you sure you want to delete ?"),
                    actions: <Widget>[
                      RaisedButton(
                      onPressed: () {
                        APIHelper().deleteSpecificPost(list[index].title);
                        getAllData();
                        Navigator.pop(context);
                      },
                    child: Text(
                      "OK",
                    ),
                  ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                        ),
                      ),
                    ],
                  ));
                  print(result);
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                child: ListTile(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Change Title",
                        ),
                        content: TextField(
                          controller: newTitle,
                          decoration: InputDecoration(
                            hintText: "Enter New Title",
                          ),
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              APIHelper().updateSpecificPost(list[index].title, newTitle.text);
                              getAllData();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "OK",
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                            ),
                          ),
                        ],
                      )
                    );
                  },
                  title: Text(list[index].title),
                  subtitle: Text(list[index].content),
                ),
              );
            },
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
