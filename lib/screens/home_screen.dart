import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medb_task/bloc/auth/auth_bloc.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/image_button.dart';
import 'package:medb_task/widgets/show_diolog.dart';
import 'package:medb_task/widgets/text_feild.dart';
import 'package:medb_task/widgets/toast.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ImageButton(image: "asset/notify.png"),
          ImageButton(
            image: "asset/logout.png",
            onTap: () => showDiolog(
              context: context,
              title: AppStrings.logout,
              content: AppStrings.logoutContent,
              cancelTap: () => GoRouter.of(context).pop(),
              confirmTap: () {
                context.read<AuthBloc>().add(LogoutEvent());
                GoRouter.of(context).pop();
              },
            ),
          ),
        ],
        backgroundColor: kWhite,
        iconTheme: IconThemeData(color: kBlack),
      ),
      drawer: Drawer(
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
            ListTile(
              leading: CircleAvatar(),
              title: TextWidget(
                text: "Muhammed Sinan",
                color: kBlack,
                fontWeight: FontWeight.bold,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthLoadedState){
            flutterToast(msg: state.message);
            context.go("/login");
          }else if(state is AuthErrorState){
            flutterToast(msg: state.errorMessage);
          }
        },
        child: Center(child: Text('Hello, this is the body!')),
      ),
    );
  }
}
