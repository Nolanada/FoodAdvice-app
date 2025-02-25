import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/services/Advices.dart';

class InfoPost extends StatefulWidget {
  @override
  _InfoPostState createState() => _InfoPostState();
}

class _InfoPostState extends State<InfoPost> {
  final TextEditingController userNameController = TextEditingController();
  String selectedCategory = 'Protein'; // Set an initial selected category
  final TextEditingController contentController = TextEditingController();

  final AdviceServices adviceService = AdviceServices();

  List<String> categories = ['Protein', 'Carbohydrates', 'Lipids', 'Vitamins','Ruffage', 'Water', 'Diabetes','Celiac', 'Iron', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Advice Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(labelText: 'Post Category'),
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedCategory = value ?? 'Breakfast'; // Update the selected category
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String userName = userNameController.text;
                String content = contentController.text;

                adviceService.addFoodPost(userName, selectedCategory, content);

                userNameController.clear();
                contentController.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}