import 'dart:ui' as ui;

import 'package:toast/toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'info_widget.dart';
import 'package:match_maker/common/colors.dart';
import 'package:match_maker/common/images.dart';
import 'package:match_maker/common/strings.dart';
import 'package:match_maker/models/profile_model.dart';

class ProfilesWidget extends StatefulWidget {
  final List<ProfileModel> profiles;

  const ProfilesWidget({
    Key key,
    @required this.profiles,
  }) : super(key: key);

  @override
  _ProfilesWidgetState createState() => _ProfilesWidgetState();
}

class _ProfilesWidgetState extends State<ProfilesWidget> {
  CarouselController carouselController;
  Size screenSize;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    carouselController = CarouselController();
    screenSize = MediaQueryData.fromWindow(ui.window).size;
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  double getFullScreenHeight(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return screenSize.height + statusBarHeight + bottomBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: AppColors.paleBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              offset: Offset(0, 2),
              color: AppColors.grey,
            ),
          ],
        ),
        child: (widget.profiles != null && widget.profiles.isNotEmpty)
            ? CarouselSlider.builder(
                itemCount: widget.profiles.length,
                itemBuilder: (BuildContext context, int index,
                        int pageViewIndex) =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image(
                                  height: getFullScreenHeight(context),
                                  width: screenSize.width,
                                  image: widget.profiles[index].image != null
                                      ? CachedNetworkImageProvider(
                                          widget.profiles[index].image)
                                      : AssetImage(AppImages.PROFILE_PIC),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: InfoWidget(
                                  name: widget.profiles[index].name,
                                  age: widget.profiles[index].age,
                                  place: widget.profiles[index].place,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 80.0,
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.profiles.removeAt(index);
                                    });
                                    Toast.show(
                                        AppStrings.LIKED_THIS_PROFILE, context,
                                        backgroundColor: AppColors.green,
                                        textColor: AppColors.white,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  },
                                  child: ClipOval(
                                    child: Image(
                                      image: AssetImage(AppImages.LIKE),
                                      fit: BoxFit.fill,
                                      height: 48.0,
                                      width: 48.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.profiles.removeAt(index);
                                    });
                                    Toast.show(AppStrings.DISLIKED_THIS_PROFILE,
                                        context,
                                        backgroundColor: AppColors.red,
                                        textColor: AppColors.white,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  },
                                  child: ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                        AppImages.CLOSE,
                                      ),
                                      fit: BoxFit.fill,
                                      height: 48.0,
                                      width: 48.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                carouselController: carouselController,
                options: CarouselOptions(
                  height: getFullScreenHeight(context),
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                ))
            : Center(
                child: Text(AppStrings.NO_PROFILES_FOUND,
                    style: TextStyle(color: AppColors.black, fontSize: 20.0)),
              ),
      ),
    );
  }
}
