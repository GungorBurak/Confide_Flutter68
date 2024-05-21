import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'sender': 'user', 'text': message});
    });
    _controller.clear();

    // Fake AI response for demonstration purposes
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _messages.add({'sender': 'ai', 'text': 'Merhaba.'});

    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {

      _messages.add({'sender': 'ai', 'text': 'İyiyim, teşekkürler sen nasılsın?'});
    });
    // Uncomment the following code to integrate with a real AI API
    /*
    final response = await http.post(
      Uri.parse('YOUR_AI_API_ENDPOINT'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      setState(() {
        _messages.add({'sender': 'ai', 'text': responseBody['response']});
      });
    } else {
      setState(() {
        _messages.add({'sender': 'ai', 'text': 'Hata: Yanıt alınamadı.'});
      });
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destekçim'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage('assets/support_background.png'), // Arkaplan resmini buraya ekleyin
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message['sender'] == 'user';
                  return ListTile(
                    leading: isUser ? null : Icon(Icons.computer, color: Colors.white),
                    trailing: isUser ? Icon(Icons.person, color: Colors.white) : null,
                    title: Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.purple.shade100 : Colors.deepPurple.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['text']!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Mesajınızı yazın...',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _sendMessage(_controller.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
