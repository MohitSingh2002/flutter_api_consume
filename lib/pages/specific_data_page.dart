import 'package:blog_app/model/custom_list.dart';
import 'package:blog_app/services/api_helper.dart';
import 'package:flutter/material.dart';

class SpecificDataPage extends StatefulWidget {

  final String data;

  SpecificDataPage({this.data});

  @override
  _SpecificDataPageState createState() => _SpecificDataPageState();
}

class _SpecificDataPageState extends State<SpecificDataPage> {

  List<CustomList> list;
  getData() {
    APIHelper().getSpecificData(widget.data).then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Specific Data Page",
        ),
      ),
      body: SafeArea(
        child: list == null ? Center(
          child: CircularProgressIndicator(),
        ) : ListView.separated(
          separatorBuilder: (_, __) => Divider(color: Colors.black,),
          itemCount: list.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(list[index].title),
              subtitle: Text(list[index].content),
            );
          },
        ),
      ),
    );
  }
}
