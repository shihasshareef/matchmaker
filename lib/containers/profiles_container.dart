import 'package:flutter/material.dart';

import 'package:match_maker/models/profile_model.dart';
import 'package:match_maker/services/profiles_service.dart';
import 'package:match_maker/widgets/profiles_widget.dart';

class ProfilesContainer extends StatefulWidget {
  @override
  _ProfilesContainerState createState() => _ProfilesContainerState();
}

class _ProfilesContainerState extends State<ProfilesContainer> {
  Future<List<ProfileModel>> profileModel;
  List<ProfileModel> profiles;
  @override
  void initState() {
    super.initState();
    profileModel = ProfilesService().getProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: profileModel,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          profiles = snapshot.data;
          return ProfilesWidget(
            profiles: profiles,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
