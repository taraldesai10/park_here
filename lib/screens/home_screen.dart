import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtSearchContyroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: Text(
          "Park Here",
          style: GoogleFonts.lato(
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: SearchBar(
              controller: txtSearchContyroller,
              onChanged: (String changed) {
                txtSearchContyroller.text = changed.toString();
              },
              leading: const Icon(
                CupertinoIcons.search,
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("vehicles").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ...List.generate(
                    snapshot.data!.docs.length,
                    (index) {
                      if (txtSearchContyroller.text.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              FirebaseFirestore.instance
                                  .collection("vehicles")
                                  .doc(snapshot.data!.docs[index].id)
                                  .delete();
                            },
                            child: ListTile(
                              onTap: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              tileColor: Colors.white,
                              title: Text(
                                snapshot.data!.docs[index]["ownerName"],
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                snapshot.data!.docs[index]["vehicleName"],
                                style: GoogleFonts.lato(),
                              ),
                              trailing:
                                  Text(snapshot.data!.docs[index]["time"]),
                            ),
                          ),
                        );
                      } else if (snapshot.data!.docs[index]["ownerName"]
                          .toString()
                          .toLowerCase()
                          .contains(
                            txtSearchContyroller.toString().toLowerCase(),
                          )) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            tileColor: Colors.white,
                            title: Text(
                              snapshot.data!.docs[index]["ownerName"],
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              snapshot.data!.docs[index]["vehicleName"],
                              style: GoogleFonts.lato(),
                            ),
                            trailing: Text(snapshot.data!.docs[index]["time"]),
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text("no data");
          }
        },
      ),
    );
  }
}
