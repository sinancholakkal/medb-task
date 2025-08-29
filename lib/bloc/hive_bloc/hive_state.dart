part of 'hive_bloc.dart';

@immutable
sealed class HiveState {}

final class HiveInitial extends HiveState {}

class LoadingState extends HiveState{}
class LoadedState extends HiveState{
  final UserModel userModel;
  final List<ModuleModel> moduleModel;

  LoadedState({required this.userModel, required this.moduleModel});
}