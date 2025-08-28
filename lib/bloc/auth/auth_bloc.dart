import 'package:bloc/bloc.dart';
import 'package:medb_task/models/login_model.dart';
import 'package:medb_task/models/register_model.dart';
import 'package:medb_task/services/auth_services.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authServices = AuthServices();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit)async {
      emit(AuthLoadingState());
      try{
        final message = await authServices.register(registerModel: event.registerModel);
        emit(AuthLoadedState(message: message));
      }catch(e){
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });
    on<LoginEvent>((event, emit)async {
      emit(AuthLoadingState());
      try{
        final message = await authServices.login(loginModel: event.loginModel);
        if(message){
          emit(AuthLoadedState(message: AppStrings.lSuccessMsg));
        }else{
          
        }
      }catch(e){
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });
  }
}
