import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auctions_event.dart';
part 'auctions_state.dart';

class AuctionsBloc extends Bloc<AuctionsEvent, AuctionsState> {
  AuctionsBloc() : super(AuctionsInitial()) {
    on<AuctionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
