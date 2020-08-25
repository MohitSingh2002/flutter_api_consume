import 'package:blog_app/pages/specific_data_page.dart';
import 'package:blog_app/services/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController title2 = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController title3 = TextEditingController();
  TextEditingController comment2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Post to API",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: content,
                  decoration: InputDecoration(
                    hintText: "Enter Content",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      print(title.text);
                      print(content.text);
                      await APIHelper().addPost(title.text, content.text);
                    },
                    child: Text(
                      "Add Post",
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: title2,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: comment,
                  decoration: InputDecoration(
                    hintText: "Enter Comment",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Add Comment",
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: title3,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificDataPage(
                        data: title3.text,
                      )));
                    },
                    child: Text(
                      "Get Specific Post",
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: comment2,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Get Specific Comment",
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
