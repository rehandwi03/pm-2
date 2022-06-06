import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pm_2/bloc/map_bloc.dart';
import 'package:pm_2/camera_page.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => MapBloc()),
    ], child: MyApp()),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class _HomeState extends State<Home> {
  late GoogleMapController googleMapController;

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {});
        },
        label: Text("Current Location"),
        icon: Icon(Icons.location_history),
      ),
      appBar: AppBar(
        title: Text("Maps Sample"),
      ),
      body: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        if (state is MapLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MapLoadedState) {
          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(state.latitude, state.longitude)));
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GoogleMap(
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(state.latitude, state.longitude),
                        zoom: 14),
                    markers: markers,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await availableCameras().then((value) {
                      print(value);
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraPage(cameras: value)));
                    });
                  },
                  child: Text("Checkin")),
              Column(
                children: [
                  Text("Coordinate"),
                  Text("Latitude: ${state.latitude}"),
                  Text("Longitude: ${state.longitude}"),
                  Text(
                      "Address: ${state.locality}, ${state.postalCode}, ${state.country}"),
                ],
              )
            ],
          );
        }

        if (state is MapErrorState) {
          return Center(
            child: Container(
              child: Text(state.message),
            ),
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<MapBloc>(context).add(GetCurrentLocation());
    super.initState();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
