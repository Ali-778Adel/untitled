import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/bloc/google-maps-cubit/google-maps-states.dart';
import 'package:untitled/components/neu-tadbar-container.dart';
import '../bloc/google-maps-cubit/google-maps-cubit.dart';
class GoogleMapsScreen extends StatelessWidget {
  final GlobalKey testScreeenGlobal = GlobalKey();
  GoogleMapsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapsCubit, GoogleMapsCubitStates>(
        builder: (context, snapshot) {
          GoogleMapsCubit cubit = GoogleMapsCubit.get(context);
          return Stack(
            children: [
              if (cubit.initialCameraPositionn == null)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                GoogleMap(
                  mapType: MapType.normal,
                  trafficEnabled: true,
                  indoorViewEnabled: true,
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(cubit.deviceCurrentLocation!.latitude!,
                        cubit.deviceCurrentLocation!.longitude!),
                    zoom: 14,
                  ),
                  onMapCreated: cubit.onMapCreated,
                  markers: cubit.markerss,
                  // markers: googleMapsCubit.markers,
                ),
              Positioned(
                top: 10,
                right: 60,
                child: CustomSearchContainer(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextFormField(
                      controller: cubit.searchController,
                      focusNode: cubit.focusNode,
                      decoration: const InputDecoration(
                        hintText: '  Search ...',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        cubit.searchPlaces(value);
                      },
                      onTap: () {
                        cubit.clearSelectedLocation();
                        cubit.focusNode.addListener(() {
                          if(cubit.focusNode.hasFocus) {
                            cubit.searchController.selection = TextSelection(baseOffset: 0, extentOffset: cubit.searchController.text.length);
                          }
                        });
                        // cubit.onSearchbarSuffixIconTapped();
                      }

                  ),
                ),
              ),
              if (cubit.searchResults != null&&
                  cubit.searchResults!.isNotEmpty)
                CustomSearchContainer(
                  margin: const EdgeInsets.only(top: 55),
                  height: MediaQuery.of(context).size.width * .75,
                  width: MediaQuery.of(context).size.width * .99,
                  child: Material(
                    child: ListView.builder(
                        itemCount: cubit.searchResults!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              cubit.searchResults![index].description!,
                              style: const TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              cubit.setSelectedLocation(
                                  cubit.searchResults![index].placeId!);
                              cubit.listenForSelectedPlaces();
                              cubit.clearSelectedLocation();
                            },
                          );
                        }),
                  ),
                ),
            ],
          );
        });
  }

}
