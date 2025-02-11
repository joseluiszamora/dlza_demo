import 'package:delizia/core/data/models/agency.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AgencyInfo extends StatelessWidget {
  const AgencyInfo({super.key, required this.agency});
  final Agency agency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Text(
            agency.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.access_time_outlined),
              const Text(
                "Ahora abierto",
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
              const Icon(Icons.phone),
              Text(
                agency.phone,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: Image(
              image: AssetImage(agency.image),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            agency.address,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            agency.schedule,
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () async {
                  openGoogleMaps(
                      latitude: agency.latitude, longitude: agency.longitude);
                },
                child: const Text('Ver en Google Maps')),
          ])
        ],
      ),
    );
  }

  Future<void> openGoogleMaps({
    required double latitude,
    required double longitude,
  }) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrlString(googleMapsUrl)) {
      await launchUrlString(googleMapsUrl);
    } else {
      throw 'No se pudo abrir Google Maps';
    }
  }
}
