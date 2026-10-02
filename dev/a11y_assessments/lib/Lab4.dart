import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Card Lab'),
          centerTitle: true,
        ),
        body: const Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State createState() => _ProfileCardState();
}

class _ProfileCardState extends State {
  final int defaultLikes = 150;

  bool isFollowing = false;
  bool isLiked = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = defaultLikes;
  }

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
        isLiked = false;
      } else {
        likeCount++;
        isLiked = true;
      }
    });
  }

  void resetProfile() {
    setState(() {
      isFollowing = false;
      isLiked = false;
      likeCount = defaultLikes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            const SizedBox(height: 15),

            const Text(
              'Muktarkanuly Olzhas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: toggleFollow,
              style: ElevatedButton.styleFrom(
                backgroundColor: isFollowing ? Colors.grey[300] : Colors.blue,
                foregroundColor: isFollowing ? Colors.black : Colors.white,
                minimumSize: const Size(double.infinity, 45), // Кнопка на всю ширину
              ),
              child: Text(isFollowing ? 'Following' : 'Follow'),
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: toggleLike,
                      iconSize: 30,
                    ),
                    Text(
                      '$likeCount',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                OutlinedButton.icon(
                  onPressed: resetProfile,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}