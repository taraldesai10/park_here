import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_here/common/text_form_field.dart';
import 'package:park_here/database/add_vehicle_store.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
  static String? ownerName;
  static String? vehicleName;
  static String? numberPlate;
  static String? time;
  static String? divition;
  static String? price;
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtVNameController = TextEditingController();
  TextEditingController txtVNumberController = TextEditingController();
  TextEditingController txtPriceController = TextEditingController();
  TextEditingController txtTimeController = TextEditingController();
  TextEditingController txtDivicionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: Text(
          "Add Vehicle",
          style: GoogleFonts.lato(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _key,
            child: Column(
              children: [
                textField(
                    multiValidator: MultiValidator(
                        [RequiredValidator(errorText: "enter name")]),
                    icon: const Icon(CupertinoIcons.person),
                    label: "owner name",
                    textEditingController: txtNameController,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    multiValidator: MultiValidator(
                        [RequiredValidator(errorText: "enter vehicle name")]),
                    icon: const Icon(CupertinoIcons.car_detailed),
                    label: "vehicle name",
                    textEditingController: txtVNameController,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                textField(
                  multiValidator: MultiValidator(
                      [RequiredValidator(errorText: "enter number plate")]),
                  icon: const Icon(CupertinoIcons.number),
                  label: "number plate",
                  textEditingController: txtVNumberController,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    multiValidator: MultiValidator(
                        [RequiredValidator(errorText: "enter time")]),
                    icon: const Icon(CupertinoIcons.time),
                    label: 'time',
                    textEditingController: txtTimeController,
                    textInputType: TextInputType.datetime),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    multiValidator: MultiValidator(
                        [RequiredValidator(errorText: "enter devition")]),
                    icon: const Icon(CupertinoIcons.chart_pie),
                    label: 'devition',
                    textEditingController: txtDivicionController,
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    multiValidator: MultiValidator([
                      RequiredValidator(
                        errorText: "enter price",
                      )
                    ]),
                    icon: const Icon(CupertinoIcons.chart_pie),
                    label: 'price',
                    textEditingController: txtPriceController,
                    textInputType: TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      giveValue();
                      AddVehicleStore.vehicleDetail(context);
                      clearValue();
                    }
                  },
                  child: Text(
                    "Add",
                    style: GoogleFonts.lato(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void giveValue() {
    AddVehicleScreen.divition = txtDivicionController.text;
    AddVehicleScreen.numberPlate = txtVNumberController.text;
    AddVehicleScreen.ownerName = txtNameController.text;
    AddVehicleScreen.price = txtPriceController.text;
    AddVehicleScreen.time = txtTimeController.text;
    AddVehicleScreen.vehicleName = txtVNameController.text;
  }

  void clearValue() {
    txtDivicionController.clear();
    txtNameController.clear();
    txtPriceController.clear();
    txtTimeController.clear();
    txtVNameController.clear();
    txtVNumberController.clear();
  }
}
