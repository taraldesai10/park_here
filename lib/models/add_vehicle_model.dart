class AddVehicleModel {
  String? ownerName;
  String? vehicleName;
  String? numberPlate;
  String? time;
  String? divition;
  String? price;

  AddVehicleModel({
    required this.ownerName,
    required this.vehicleName,
    required this.numberPlate,
    required this.time,
    required this.divition,
    required this.price,
  });

  factory AddVehicleModel.fromJson(Map<String, dynamic> json) =>
      AddVehicleModel(
        ownerName: json["ownerName"],
        vehicleName: json["vehicleName"],
        numberPlate: json["numberPlate"],
        time: json["time"],
        divition: json["divition"],
        price: json["price"],
      );
  Map<String, dynamic> toJson() => {
        "ownerName": ownerName,
        "vehicleName": vehicleName,
        "numberPlate": numberPlate,
        "time": time,
        "divition": divition,
        "price": price
      };
}
