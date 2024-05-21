import 'package:flutter/material.dart';

class EmergencySupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acil Destek'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/emergency.png',
              height: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Acil Durumda Aranabilecek Numaralar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SearchBar(),
            Expanded(
              child: EmergencyContactList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Arama...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (value) {

      },
    );
  }
}

class EmergencyContactList extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'İtfaiye', 'number': '110'},
    {'name': 'Polis', 'number': '155'},
    {'name': 'Ambulans', 'number': '112'},
    {'name': 'Orman Yangını', 'number': '177'},
    {'name': 'AFAD', 'number': '122'},

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.phone, color: Colors.red),
            title: Text(contacts[index]['name']!),
            subtitle: Text(contacts[index]['number']!),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () {

              },
            ),
          ),
        );
      },
    );
  }
}
