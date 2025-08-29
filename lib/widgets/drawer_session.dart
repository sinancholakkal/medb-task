import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb_task/bloc/hive_bloc/hive_bloc.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/utils/app_sizes.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/text_feild.dart';

class DrawerSession extends StatefulWidget {
  const DrawerSession({super.key});

  @override
  State<DrawerSession> createState() => _DrawerSessionState();
}

class _DrawerSessionState extends State<DrawerSession> {
  bool isExpanded = true;
  @override
  void initState() {
    context.read<HiveBloc>().add(GetMenuAndUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          AppSizedBox.h70,
          SizedBox(
            width: 45,
            height: 45,
            child: Image.asset("asset/medb-logo-png-BRGSYv_I.png"),
          ),
          AppSizedBox.h24,
          BlocBuilder<HiveBloc, HiveState>(
            builder: (context, state) {
              if (state is LoadedState) {
                log("loaded state bloc");
                
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, pIndex) {
                    final module = state.moduleModel[pIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: ListTile(
                            leading: CircleAvatar(radius: kmenuRadius,child: Image.network(module.moduleIcon),),
                            title: TextWidget(
                              text: module.moduleName,
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                            onTap: (){
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            trailing: SizedBox(width: 120,),
                          ),
                        ),
                        isExpanded?SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  radius: kmenuRadius,
                                  child: Image.network(module.menus[index].menuIcon,errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.broken_image);
                                  },),
                                ),
                                title: TextWidget(text: module.menus[index].menuName,color: kGrey,size: 16,),
                                trailing: SizedBox(width: 60,),
                              );
                            },itemCount: module.menus.length,),
                          ),
                        ):SizedBox()
                      ],
                    );
                  },
                  itemCount: state.moduleModel.length,
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
