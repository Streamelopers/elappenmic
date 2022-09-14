import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import 'models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<YoutubeVideo>> getYoutubeVideos() async {
    var ref = _db.collection('youtube_videos');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => YoutubeVideo.fromJson(d));
    return topics.toList();
  }
}
