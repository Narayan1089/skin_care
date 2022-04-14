import 'package:flutter/material.dart';
import 'package:skin_care/screens/navigate_screen.dart';

import '../utils/colors.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: Colors.black,
        title: const Text(
          "About Us",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: white, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NavigateScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: const <Widget>[
            Card(
                child: ListTile(
                    title: Text("Tushar Gharge"),
                    subtitle: Text("Team Leader"),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://media-exp1.licdn.com/dms/image/C4E03AQG3kndXYZ60rQ/profile-displayphoto-shrink_400_400/0/1608647045965?e=1652918400&v=beta&t=t4jXwVJnxCrmhdeYNPYa3cAXh3dy-Y6ihNoEWMOkPHg")),
                    trailing: Icon(Icons.star))),
            Card(
                child: ListTile(
                    title: Text("Krutik Raut"),
                    subtitle: Text("Project Co-ordinator"),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cityandtalent.com/cat-med/2021/09/T-Krutik-Raut.png")),
                    trailing: Icon(Icons.star))),
            Card(
                child: ListTile(
                    title: Text("Narayan"),
                    subtitle: Text("Part Timer"),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://m.gettywallpapers.com/wp-content/uploads/2020/04/Anonymous-Wallpaper-For-iPhone.jpg")),
                    trailing: Icon(Icons.star))),
            // Card(
            //   child: ListTile(
            //     title: Text("Ballot"),
            //     subtitle: Text("Cast your vote."),
            //     leading: CircleAvatar(
            //         backgroundImage: NetworkImage(
            //             "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
            //     trailing: Icon(Icons.star),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
