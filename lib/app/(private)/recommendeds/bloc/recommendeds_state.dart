part of 'recommendeds_bloc.dart';

sealed class RecommendedsState extends Equatable {
  const RecommendedsState();
  
  @override
  List<Object> get props => [];
}

final class RecommendedsInitial extends RecommendedsState {}
