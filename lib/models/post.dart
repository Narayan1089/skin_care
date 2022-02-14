import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uid;
  final String postId;
  final String diseaseName;
  final String result;
  final DateTime datePublished;

  const Post({
    required this.uid,
    required this.postId,
    required this.datePublished,
    required this.diseaseName,
    required this.result,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        uid: snapshot["uid"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        diseaseName: snapshot["diseaseName"],
        result: snapshot["result"]);
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "postId": postId,
        "datePublished": datePublished,
        "diseaseName": diseaseName,
        "result": result
      };
}
