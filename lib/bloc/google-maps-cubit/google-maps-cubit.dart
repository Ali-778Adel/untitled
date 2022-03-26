import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:untitled/components/neu-tadbar-container.dart';
import 'package:untitled/models/place.dart';
import 'package:untitled/models/place_search.dart';
import 'package:untitled/services/marker_service.dart';
import 'package:untitled/services/places_service.dart';
import '../../services/location-services.dart';
import 'google-maps-states.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsCubitStates> {
  GoogleMapsCubit() : super(GMInitState());
  final placesService = PlacesService();
  final markerService = MarkerService();
  StreamSubscription? locationSubscription;
  StreamSubscription? boundsSubscription;
  //for getUserLocation
  LocationData? deviceCurrentLocation;
  List<Marker> loactionMarkers = [];
  var initCameraPosition = LatLng(30.42796133580664, 31.085749655962);
  CameraPosition? initialCameraPositionn;
  Completer<GoogleMapController> completer = Completer();
  //for onMapCreated
  Set<Marker> markerss = {};
  //for searchmethod
  var searchController = TextEditingController();
  var focusNode = FocusNode();
  //places
  Position? currentLocation;
  List<PlaceSearch>? searchResults;
  StreamController<Place>? selectedLocation = StreamController<Place>();
  StreamController<LatLngBounds>? bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String? placeType;
  String?placeName;
  List<Place>? placeResults;
  List<Marker>? markers;
  Set<String>?placeNamee;
  Completer<GoogleMapController> mapController = Completer();

  //init GoolgleMapCubit
  static GoogleMapsCubit get(context) => BlocProvider.of(context);

  // onSearchbarSuffixIconTapped
  onSearchbarSuffixIconTapped() {
    searchController.clear();
    emit(OnSearchbarSuffixIconTapped());
  }

  Future getLocation() async {
    emit(GetCurrentLocationLoadingState());
    await LocationService.getUserLocation().then((value) {
      deviceCurrentLocation = LocationService.deviceCurrentLocation;
      initialCameraPositionn = LocationService.initialCameraPositionn;
      print(
          'location service is 121211212211212   ${LocationService.deviceCurrentLocation!.longitude}');
      print(value.toString());
      emit(GetCurrentLocationSuccessState());
    });
  }

  void onMapCreated(GoogleMapController googleMapController) {
    completer.complete(googleMapController);

    emit(SetMarkerState());
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    emit(SearchPlacesStaeState());
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    markerss.add(Marker(
        markerId:  MarkerId(sLocation.geometry!.location!.lat!.toString()+sLocation.geometry!.location!.lng!.toString()),
        position:LatLng(sLocation.geometry!.location!.lat!,sLocation.geometry!.location!.lng!),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
            title: sLocation.name,
            snippet:
            ' ${LatLng(sLocation.geometry!.location!.lat!,sLocation.geometry!.location!.lng!)}')));
              placeName=sLocation.name;
              selectedLocation!.add(sLocation);
              selectedLocationStatic = sLocation;
              searchResults = null;
              emit(SetSelectedLocationState());
  }

  clearSelectedLocation() {
    // selectedLocation!.add('d');
    selectedLocationStatic = null;
    searchResults = null;
    placeType = null;
    emit(ClearSelectedLocationState());
  }

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      placeType = null;
    }

    if (placeType != null) {
      var places = await placesService.getPlaces(
          selectedLocationStatic!.geometry!.location!.lat!,
          selectedLocationStatic!.geometry!.location!.lng!,
          placeType!);
      markers = [];
      if (places.length > 0) {
        var newMarker = markerService.createMarkerFromPlace(places[0], false);
        markers!.add(newMarker);
      }

      var locationMarker =
          markerService.createMarkerFromPlace(selectedLocationStatic!, true);
      markers!.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers!));
      bounds!.add(_bounds);

      emit(TogglePlaceTypeState());
    }
  }

  Future<void> goToPlace(Place place) async {
    final GoogleMapController controller = await completer.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry!.location!.lat!, place.geometry!.location!.lng!),
            zoom: 14.0),
      ),
    );
    emit(GoToPlacesState());
  }

  listenForSelectedPlaces() {
    locationSubscription = selectedLocation!.stream.listen((place) {
      if (place != null) {
        searchController.text = place.name!;
        goToPlace(place);
      } else
        searchController.text = "";
    });
    bounds!.stream.listen((bounds) async {
      final GoogleMapController controller = await completer.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });
    emit(ListenForSelectedPlaceState());


  }

  // @override
  void dispose() {
    selectedLocation!.close();
    bounds!.close();
    searchController.dispose();
    locationSubscription!.cancel();
    boundsSubscription!.cancel();
    super.close();
  }
}
