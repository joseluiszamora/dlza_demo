class Agency {
  final int id;
  final String name;
  final String image;
  final String address;
  final String city;
  final String phone;
  final String schedule;
  final double latitude;
  final double longitude;

  const Agency({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.city,
    required this.phone,
    required this.schedule,
    required this.latitude,
    required this.longitude,
  });

  factory Agency.fromJson(Map<String, dynamic> json) => Agency(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        address: json['address'],
        city: json['city'],
        phone: json['phone'],
        schedule: json['schedule'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}
