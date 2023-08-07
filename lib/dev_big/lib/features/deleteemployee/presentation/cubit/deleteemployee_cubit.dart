import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deleteemployee_state.dart';

class DeleteemployeeCubit extends Cubit<DeleteemployeeState> {
  DeleteemployeeCubit() : super(DeleteemployeeInitial());
}
