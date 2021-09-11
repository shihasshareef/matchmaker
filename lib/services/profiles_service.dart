import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:match_maker/models/profile_model.dart';

class ProfilesService {
  List<ProfileModel> profiles = [];

  Future<List<ProfileModel>> getProfiles() async {
    String data = await rootBundle.loadString('assets/data/profiles.json');
    final jsonResult = jsonDecode(data);
    if (jsonResult.isNotEmpty) {
      for (var user in jsonResult['profiles']) {
        profiles.add(
          ProfileModel.fromJson(user),
        );
      }
    }
    return profiles;
  }
}
