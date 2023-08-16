part of 'location_bloc.dart';

class LocationState extends Equatable {
  const LocationState({
    this.status = LocationStatus.initial,
    this.currPosition,
    this.posititon,
    String? errorMessage,
  })  : errorMessage = errorMessage ?? '';

  final LocationStatus status;
  final Stream<LatLng>? currPosition;
  final String errorMessage;
  final LatLng? posititon;

  @override
  List<Object?> get props =>
      [status, currPosition, errorMessage, posititon];

  LocationState copyWith(
      {LocationStatus? status,
        Stream<LatLng>? currPosition,
        String? errorMessage,
        LatLng? posititon,
       }) {
    return LocationState(
      status: status ?? this.status,
      posititon: posititon ?? this.posititon,
      currPosition: currPosition ?? this.currPosition,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
