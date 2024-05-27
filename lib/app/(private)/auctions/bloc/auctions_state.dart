part of 'auctions_bloc.dart';

sealed class AuctionsState extends Equatable {
  const AuctionsState();
  
  @override
  List<Object> get props => [];
}

final class AuctionsInitial extends AuctionsState {}
