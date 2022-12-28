import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: GFAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      "https://scontent.fsrz1-2.fna.fbcdn.net/v/t39.30808-6/245418499_4690283027703564_7627589068188176869_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=u_-EJbkL3rUAX9fz4GC&_nc_ht=scontent.fsrz1-2.fna&oh=00_AfB2gRPsN79ooS_IMpW31LrkbH3bPoNe3QFvJo5G4dLArw&oe=63AEA762"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const GFListTile(
                  titleText: 'Nombre',
                  subTitleText: 'Sebastian',
                  icon: Icon(Icons.arrow_forward_ios_rounded)),
              const Divider(),
              const GFListTile(
                  titleText: 'Apellido',
                  subTitleText: 'Padilla',
                  icon: Icon(Icons.arrow_forward_ios_rounded)),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: GFButton(
                  color: Colors.red,
                  onPressed: () => print("hula"),
                  text: "Cerrar sesion",
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  shape: GFButtonShape.pills,
                ),
              ),
            ],
          )),
    );
  }
}