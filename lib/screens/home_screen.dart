import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medb_task/bloc/auth/auth_bloc.dart';
import 'package:medb_task/bloc/hive_bloc/hive_bloc.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/utils/app_sizes.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/drawer_session.dart';
import 'package:medb_task/widgets/image_button.dart';
import 'package:medb_task/widgets/loading.dart';
import 'package:medb_task/widgets/show_diolog.dart';
import 'package:medb_task/widgets/text_feild.dart';
import 'package:medb_task/widgets/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          AppSizedBox.w8,
        ],
        backgroundColor: kWhite,
        iconTheme: IconThemeData(color: kBlack),
      ),
      //Drawer session-------
      drawer: DrawerSession(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            loadingWidget(context);
          } else if (state is AuthLoadedState) {
            context.pop();
            flutterToast(msg: state.message);
            context.go("/login");
          } else if (state is AuthErrorState) {
            context.pop();
            flutterToast(msg: state.errorMessage);
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("asset/medb-logo-png-BRGSYv_I.png", width: 100),
                AppSizedBox.h24,
                TextWidget(
                  text: "Welcome to MedB!",
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
                AppSizedBox.h16,
                TextWidget(
                  maxLine: 10,
                  text:
                      "We're glad to have you here. MedB is your trusted platform for healthcare needs — all in one place.",
                  color: kBlack,
                  size: 20,
                ),
                AppSizedBox.h16,
                TextWidget(
                  maxLine: 10,
                  text:"Use the menu on the left to get started.",
                  color: kGrey,
                  size: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
