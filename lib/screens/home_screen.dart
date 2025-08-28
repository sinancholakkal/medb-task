import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/image_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          ImageButton(image: "asset/notify.png",),
          ImageButton(image: "asset/logout.png",)
        ],
        backgroundColor: kWhite,
        iconTheme: IconThemeData(
          color: kBlack, 
        ),
      ),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            AppSizedBox.h60,
            SizedBox(
              width: 45,
              height: 45,
              child: Image.asset("asset/medb-logo-png-BRGSYv_I.png",))
            
          ],
        ),
      ),
      body: Center(
        child: Text('Hello, this is the body!'),
      ),
    );
  }
}

