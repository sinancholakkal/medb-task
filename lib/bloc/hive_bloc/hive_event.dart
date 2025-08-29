part of 'hive_bloc.dart';

@immutable
sealed class HiveEvent {}
class GetMenuAndUserEvent extends HiveEvent{}