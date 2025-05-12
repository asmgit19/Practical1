import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Application',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final TextEditingController _commentController = TextEditingController();

  void _submitComment() {
    String comment = _commentController.text.trim();
    if (comment.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thank You!'),
          content: Text('Your comment has been submitted.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _commentController.clear();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio Application'), backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(radius: 60,
                backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Qualifications'),
              _buildSectionContent('Bachelor of Information Technology\nMaster of Computer Applications'),
              SizedBox(height: 20),
              _buildSectionTitle('School'),
              _buildSectionContent('B.M.T High School'),
              SizedBox(height: 20,),
              _buildSectionTitle('Junior College'),
              _buildSectionContent('T.V.M Junior College'),
              SizedBox(height: 20),
              _buildSectionTitle('Hobbies'),
              _buildSectionContent('Reading, Coding, Traveling'),
              SizedBox(height: 30),
              _buildSectionTitle('Leave a Comment'),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write your comment here...',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _submitComment,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 16),
    );
  }
}
