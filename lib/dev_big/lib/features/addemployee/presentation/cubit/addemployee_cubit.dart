import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addemployee_state.dart';

class AddemployeeCubit extends Cubit<AddemployeeState> {
  AddemployeeCubit() : super(AddemployeeInitial());
}
