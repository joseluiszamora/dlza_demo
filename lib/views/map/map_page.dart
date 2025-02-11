import 'dart:convert';

import 'package:delizia/core/data/models/agency.dart';
import 'package:delizia/views/map/screens/agency_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = MapController();
  final Location location = Location();
  final TextEditingController locationController = TextEditingController();
  bool isLoading = true;
  LatLng? currentLocation;
  LatLng? destination;
  List<LatLng> route = [];
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _initializeLocation();
    _readLocationsFromJson();
  }

  void _readLocationsFromJson() async {
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/agencias.json');
    final locations = json.decode(data);
    for (var item in locations) {
      Agency agency = Agency.fromJson(item);
      markers.add(Marker(
        width: 50.0,
        height: 50.0,
        point: LatLng(agency.latitude, agency.longitude),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AgencyInfo(agency: agency);
                });
          },
          child: const Icon(
            Icons.location_pin,
            color: Colors.purple,
            size: 40,
          ),
        ),
      ));
      // print('Title: ${item["title"]}, Lat: ${item["lat"]}, Long: ${item["lon"]}');
    }
    // print(locations);
  }

  Future<void> _initializeLocation() async {
    if (!await _checkLocationPermission()) return;

    location.onLocationChanged.listen((LocationData ld) {
      if (ld.latitude != null && ld.longitude != null) {
        setState(() {
          currentLocation = LatLng(ld.latitude!, ld.longitude!);
          isLoading = false;
        });
      }
    });
  }

  Future<void> _fetchCoordinates(String address) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$address&format=json&addressdetails=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lng = double.parse(data[0]['lon']);

        setState(() {
          destination = LatLng(lat, lng);
        });

        await _fetchRoute();
      } else {
        errorMessage('Location not found');
      }
    } else {
      errorMessage('Failed to fetch coordinates');
    }
  }

  Future<void> _fetchRoute() async {
    if (currentLocation == null || destination == null) return;
    final url = Uri.parse(
        "http://router.project-osrm.org/route/v1/driving/${currentLocation!.longitude},${currentLocation!.latitude};${destination!.longitude},${destination!.latitude}?overview=full&geometries=polyline");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        final geometry = data['routes'][0]['geometry'];
        _decodePolyline(geometry);
      } else {
        errorMessage('Route not found');
      }
    } else {
      errorMessage('Failed to fetch route');
    }
  }

  void _decodePolyline(String encoded) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPoints = polylinePoints.decodePolyline(encoded);

    setState(() {
      route = decodedPoints
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    });
  }

  void errorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<bool> _checkLocationPermission() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<void> _userCurrentLocation() async {
    if (currentLocation != null) {
      mapController.move(currentLocation!, 15);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location not found'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                  mapController: mapController,
                  options: const MapOptions(
                    initialCenter: LatLng(51.5, -0.09),
                    initialZoom: 2,
                    minZoom: 0,
                    maxZoom: 18,
                  ),
                  children: [
                    //* Map Layer
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    CurrentLocationLayer(
                      style: const LocationMarkerStyle(
                          marker: DefaultLocationMarker(
                            child: Icon(Icons.location_on, color: Colors.white),
                          ),
                          markerSize: Size(35, 35),
                          markerDirection: MarkerDirection.north),
                    ),
                    MarkerLayer(
                      markers: markers,
                    ),
                    // if (destination != null)
                    //   MarkerLayer(
                    //     markers: [
                    //       Marker(
                    //         width: 50.0,
                    //         height: 50.0,
                    //         point: destination!,
                    //         child: const Icon(
                    //           Icons.location_pin,
                    //           color: Colors.red,
                    //           size: 40,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    if (currentLocation != null &&
                        destination != null &&
                        route.isNotEmpty)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: route,
                            strokeWidth: 5,
                            color: Colors.green,
                          ),
                        ],
                      ),
                  ],
                ),
          // _searchBar(),
          _searchOptions(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _userCurrentLocation,
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  Positioned _searchOptions() => Positioned(
      bottom: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Agencias')),
            const SizedBox(width: 10),
            ElevatedButton(onPressed: () {}, child: const Text('La Paz')),
          ],
        ),
      ));

  Positioned _searchBar() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: locationController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  final location = locationController.text.trim();
                  if (location.isNotEmpty) {
                    _fetchCoordinates(location);
                  }
                },
                icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
