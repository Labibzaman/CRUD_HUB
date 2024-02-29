import 'package:crudapp/userData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  List<UserData> userDetails = List.empty(growable: true);

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form-fillUp App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    label: const Text('    Name'),
                    hintText: 'Enter Your Name',
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: const Text('    Mobile'),
                    hintText: 'Enter Your Mobile Number',
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                    label: const Text('    Address'),
                    hintText: 'Enter Your Address',
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ))),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          String name = nameController.text.trim();
                          int mobile = int.parse(mobileController.text.trim());
                          String address = addressController.text.trim();

                          userDetails.add(UserData(
                              name: name, mobile: mobile, address: address));
                          setState(() {
                            nameController.clear();
                            mobileController.clear();
                            addressController.clear();
                          });
                        },
                        child: const Text(
                          'Save',
                        )),
                    ElevatedButton(
                        onPressed: () {
                          String name = nameController.text.trim();
                          int mobile = int.parse(mobileController.text.trim());
                          String address = addressController.text.trim();


                          userDetails[selectedIndex].name=name;
                          userDetails[selectedIndex].mobile=mobile;
                          userDetails[selectedIndex].address=address;
                          selectedIndex=0;

                          setState(() {
                            nameController.clear();
                            mobileController.clear();
                            addressController.clear();
                          });
                        },
                        child: const Text(
                          'update',
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  itemCount: userDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return getRow(index);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 10,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget getRow(int index) {
    return ListTile(
      leading:  CircleAvatar(
        child: Text(userDetails[index].name[0]),
      ),
      trailing: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  nameController.text = userDetails[index].name;
                  mobileController.text = userDetails[index].mobile.toString();
                  addressController.text = userDetails[index].address;
                  setState(() {
                    selectedIndex=index;
                  });
                },
                child: const Icon(Icons.edit)),
            GestureDetector(
                onTap: () {
                  setState(() {});
                  userDetails.removeAt(index);
                },
                child: const Icon(Icons.delete)),
          ],
        ),
      ),
      title: Text(userDetails[index].name ?? ''),
    );
  }
}
