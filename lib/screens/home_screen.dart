
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medb_task/bloc/auth/auth_bloc.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/drawer_session.dart';
import 'package:medb_task/widgets/home_center_session.dart';
import 'package:medb_task/widgets/image_button.dart';
import 'package:medb_task/widgets/loading.dart';
import 'package:medb_task/widgets/show_diolog.dart';
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
        //Greeting
        child: HomeCenterSession(),
      ),
    );
  }
}

