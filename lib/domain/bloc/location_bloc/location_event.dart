part of 'location_bloc.dart';

class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LocationInit extends LocationEvent {}


class LocationChanged extends LocationEvent {
  final double latitude;
  final double longitude;

  const LocationChanged(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}

class ListenLocation extends LocationEvent {}

class SendLocation extends LocationEvent {
  final double latitude;
  final double longitude;

  const SendLocation(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}

