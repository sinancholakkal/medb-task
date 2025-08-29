import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:medb_task/models/module_model.dart';
import 'package:medb_task/models/user_model.dart';
import 'package:medb_task/services/hive_service.dart';
import 'package:meta/meta.dart';

part 'hive_event.dart';
part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  final hiveService = HiveService();
  HiveBloc() : super(HiveInitial()) {
    on<GetMenuAndUserEvent>((event, emit)async {
      emit(LoadingState());
      try{
        final userModel = hiveService.getLoginResponseUser();
        final moduleModel = hiveService.getLoginResponseMenuData();
        log("In hive bloc ${userModel!.firstName}");
        emit(LoadedState(userModel: userModel, moduleModel: moduleModel!));
      }catch(e){
        log("Something issue while fetching hive data");
      }
    });
  }
}
