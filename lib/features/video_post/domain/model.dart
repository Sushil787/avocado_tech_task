// ignore_for_file: public_member_api_docs

import 'dart:ui';

class SocailPost {
  SocailPost({
    required this.color,
    required this.assetsPath,
    required this.text,
    required this.title,
    required this.postDate,
    required this.platForm,
    required this.detail,
    required this.totalViews,
    required this.tags,
    required this.socialLink,
    required this.time,
  });

  final String title;
  final String postDate;
  final SocialPlatform platForm;
  final String detail;
  final String totalViews;
  final String socialLink;
  final String tags;
  final String time;
  final Color color;
  final String assetsPath;
  final String text;
}

/// Socal medial Platform
enum SocialPlatform { youtube, facebook, abcNews, topNews }
