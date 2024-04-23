import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:park_here/common/snackbar.dart';
import 'package:park_here/models/add_vehicle_model.dart';
import 'package:park_here/screens/add_vehicle_screen.dart';

class AddVehicleStore {
  static Future<void> vehicleDetail(context) {
    return FirebaseFirestore.instance
        .collection("vehicles")
        .doc()
        .set(
          AddVehicleModel(
            ownerName: AddVehicleScreen.ownerName.toString(),
            vehicleName: AddVehicleScreen.vehicleName.toString(),
            numberPlate: AddVehicleScreen.numberPlate.toString(),
            time: AddVehicleScreen.time.toString(),
            divition: AddVehicleScreen.divition.toString(),
            price: AddVehicleScreen.price.toString(),
          ).toJson(),
        )
        .then((value) {
      showSnackbarMessage(
        context,
        "vehicle added",
        Colors.green,
      );
    });
  }
}
