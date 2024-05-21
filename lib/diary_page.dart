import 'package:flutter/material.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final _formKey = GlobalKey<FormState>();
  final _entryController = TextEditingController();
  final List<String> _entries = [];

  void _addEntry() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _entries.add(_entryController.text);
        _entryController.clear();
      });
    }
  }

  void _editEntry(int index, String newEntry) {
    setState(() {
      _entries[index] = newEntry;
    });
  }

  void _deleteEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }

  void _showEditEntryDialog(int index) {
    _entryController.text = _entries[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Günlüğü Düzenle'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _entryController,
              decoration: InputDecoration(
                labelText: 'Günlük Yazısı',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir şeyler yazın';
                }
                return null;
              },
              maxLines: 3,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _editEntry(index, _entryController.text);
                  _entryController.clear();
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Text('Kaydet'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Günlüğü Sil'),
          content: Text('Bu yazıyı silmek istediğinizden emin misiniz?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Hayır'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteEntry(index);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Text('Evet'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlüğüm'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          image: DecorationImage(
            image: AssetImage('assets/diary_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Günlük Yazınız',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _entryController,
                      decoration: InputDecoration(
                        labelText: 'Günlük Yazısı',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen bir şeyler yazın';
                        }
                        return null;
                      },
                      maxLines: 3,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _addEntry,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                      child: Text('Ekle'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: _entries.isEmpty
                    ? Center(
                  child: Text(
                    'Henüz bir giriş yok',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                    : ListView.builder(
                  itemCount: _entries.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.purple.shade100,
                      child: ListTile(
                        title: Text(
                          _entries[index],
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _showEditEntryDialog(index),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _showDeleteConfirmationDialog(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
