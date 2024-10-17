import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Testata
            Container(
              //color: ThemeData().primaryColor,
              padding: EdgeInsets.only(
                  top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person_outline),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text(
                    'Marco',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text(
                    'mail',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),

            //Pagine
            Wrap(
              runSpacing: 16,
              children: [
                ListTile(
                    leading: Icon(Icons.bar_chart),
                    title: Text('Budget'),
                    onTap: () {}),
                ListTile(
                  leading: Icon(Icons.landscape_outlined),
                  title: Text('Ferie'),
                  onTap: () {},
                  // onTap: () {
                  //   master.selectionView = SelectionView.Contract;
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //       builder: (context) => ContractView()));
                  //}
                ),
                ListTile(
                    leading: Icon(Icons.monitor_outlined),
                    title: Text('Abbonamenti'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.connected_tv_outlined),
                    title: Text('Iscrizioni'),
                    onTap: () {}),
                ListTile(
                  leading: Icon(Icons.person_2),
                  title: Text('Utenti'),
                  onTap: () {},
                  // onTap: () {
                  //   master.selectionView = SelectionView.Contract;
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //       builder: (context) => ContractView()));
                  //}
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
