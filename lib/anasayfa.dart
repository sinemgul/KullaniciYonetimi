import 'package:flutter/material.dart';
import 'kullaniciekle.dart';
import 'kullaniciliste.dart';
import 'notlar.dart';
import 'caritanitim.dart';


class HomePage extends StatefulWidget {
  final String email;
  final String company;
  final String password;

  HomePage({
    required this.email,
    required this.company,
    required this.password, required bool isAdmin,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> _notes = [];

  void _addNoteToList(String title, String content, String priority) {
    setState(() {
      _notes.add({'title': title, 'content': content, 'priority': priority});
    });
  }

  void _navigateToAddNotePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNotePage(onNoteAdded: _addNoteToList),
      ),
    );
  }

  void _navigateToAddUserPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserPage(),
      ),
    );
  }

  void _navigateToUserListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserListPage(),
      ),
    );
  }

  void _navigateCariTanitimPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CariTanitimPage(),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Çok Önemli':
        return Colors.red[200]!;
      case 'Önemli':
        return Colors.orange[200]!;
      case 'Normal':
      default:
        return Colors.green[200]!;
    }
  }

  void _showNoteDetails(Map<String, String> note) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(note['title']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(note['content']!),
              SizedBox(height: 10),
              Text(
                'Önem Derecesi: ${note['priority']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isAdmin = widget.email == 'admin' && widget.password == '12345';

    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.email),
              accountEmail: Text(widget.company),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  widget.email[0].toUpperCase(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Notlar'),
              onTap: () {
                if (MediaQuery.of(context).size.width >= 600) {
                  _navigateToAddNotePage(context);
                } else {
                  _navigateToAddNotePage(context);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Servis Kaydı'),
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Destek Kaydı'),
            ),
            ListTile(
              leading: Icon(Icons.article_sharp),
              title: Text('Cari Tanıtımı'),
              onTap: () {
                _navigateCariTanitimPage(context);
              },
            ),
            if (isAdmin)
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Kullanıcı Ekle'),
                onTap: () {
                  _navigateToAddUserPage(context);
                },
              ),
            if (isAdmin)
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Kullanıcıları Görüntüle'),
                onTap: () {
                  _navigateToUserListPage(context);
                },
              ),
          ],
        ),
      )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout();
          } else {
            return _buildWebLayout();
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Hoş Geldiniz, ${widget.email}!\nFirma: ${widget.company}',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Notlar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _notes.isEmpty
                ? Center(
              child: Text(
                'Henüz not eklenmemiş.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showNoteDetails(_notes[index]),
                  child: Card(
                    color: _getPriorityColor(_notes[index]['priority']!),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _notes[index]['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _notes[index]['content']!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWebLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Hoş Geldiniz, ${widget.email}!\nFirma: ${widget.company}',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.person),
                label: Text('Profil'),
              ),
              TextButton.icon(
                onPressed: () => _navigateToAddNotePage(context),
                icon: Icon(Icons.note),
                label: Text('Notlar'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.build),
                label: Text('Servis Kaydı'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.support),
                label: Text('Destek Kaydı'),
              ),
              TextButton.icon(
                onPressed: () => _navigateCariTanitimPage(context),
                icon: Icon(Icons.article_sharp),
                label: Text('Cari Tanıtımı'),
              ),
              if (widget.email == 'admin' && widget.password == '12345')
                TextButton.icon(
                  onPressed: () => _navigateToAddUserPage(context),
                  icon: Icon(Icons.person_add),
                  label: Text('Kullanıcı Ekle'),
                ),
              if (widget.email == 'admin' && widget.password == '12345')
                TextButton.icon(
                  onPressed: () => _navigateToUserListPage(context),
                  icon: Icon(Icons.list),
                  label: Text('Kullanıcıları Görüntüle'),
                ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _notes.isEmpty
                ? Center(
              child: Text(
                'Henüz not eklenmemiş.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showNoteDetails(_notes[index]),
                  child: Card(
                    color: _getPriorityColor(_notes[index]['priority']!),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _notes[index]['title']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _notes[index]['content']!,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
