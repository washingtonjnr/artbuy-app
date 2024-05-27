import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommendeds_event.dart';
part 'recommendeds_state.dart';

class RecommendedsBloc extends Bloc<RecommendedsEvent, RecommendedsState> {
  RecommendedsBloc() : super(RecommendedsInitial()) {
    on<RecommendedsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
