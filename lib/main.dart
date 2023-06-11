import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoCaption extends StatelessWidget {
  final String imageUrl;
  final String caption;

  PhotoCaption({required this.imageUrl, required this.caption});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicked on photo!')),
        );
      },
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(caption),
        ],
      ),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
              ),
            ),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                PhotoCaption(
                    imageUrl:
                        'https://images.pexels.com/photos/97533/pexels-photo-97533.jpeg?auto=compress&cs=tinysrgb&w=600',
                    caption: 'Caption'),
                PhotoCaption(
                    imageUrl:
                        'https://images.pexels.com/photos/792416/pexels-photo-792416.jpeg?cs=srgb&dl=pexels-tina-nord-792416.jpg&fm=jpg',
                    caption: 'Caption'),
                PhotoCaption(
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/02/50/08/05/360_F_250080568_QvCaYVy1NWJAVGeXdwa9YCKRtFLWITnZ.jpg',
                    caption: 'Caption'),
                PhotoCaption(
                    imageUrl:
                        'https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlyZHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                    caption: 'Caption'),
                PhotoCaption(
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/02/43/67/59/240_F_243675911_EsvABLUWeCeY7Xxftnfd9Vcjyz68m3Jq.jpg',
                    caption: 'Caption'),
                PhotoCaption(
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/02/50/08/05/360_F_250080568_QvCaYVy1NWJAVGeXdwa9YCKRtFLWITnZ.jpg',
                    caption: 'Caption'),
              ],
            ),
            ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: Image.network(
                        'https://images.pexels.com/photos/158734/bird-nest-eggs-blue-158734.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        width: 50,
                        height: 50),
                    title: Text('Sample Photo 1'),
                    subtitle: Text('Category 1'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.pexels.com/photos/158734/bird-nest-eggs-blue-158734.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        width: 50,
                        height: 50),
                    title: Text('Sample Photo 2'),
                    subtitle: Text('Category 2'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.pexels.com/photos/158734/bird-nest-eggs-blue-158734.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        width: 50,
                        height: 50),
                    title: Text('Sample Photo 3'),
                    subtitle: Text('Category 3'),
                  ),
                ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Photos Uploaded Successfully!')),
          );
        },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }
}
