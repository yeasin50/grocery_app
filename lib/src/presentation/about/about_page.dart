import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/grocery_app.dart';
import 'package:grocery_app/src/app/route_config.dart';
import 'package:grocery_app/src/presentation/_common/widgets/label_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/app_theme.dart';
import '../_common/widgets/background_view.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackgroundView.two(
      child: Scaffold(
        appBar: AppBar(
          title: const LabelView(label: "Contribution"),
          centerTitle: true,
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppTheme.primary,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              Text(
                "UX Designer",
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const _BuildPersonTile(
                name: "Misbah Asghar",
                avatarUrl: "https://mir-s3-cdn-cf.behance.net/user/115/d1aba11785536569.65ecbdf6d072f.jpg",
                profileUrl: 'https://www.behance.net/misbahasghar2',
                email: "",
              ),
              const Divider(height: 64),
              Text(
                "App Developer(Flutter)",
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const _BuildPersonTile(
                name: "Md. Yeasin Sheikh",
                avatarUrl: "https://avatars.githubusercontent.com/u/46500228?v=4",
                profileUrl: 'https://www.behance.net/misbahasghar2',
                email: "",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildPersonTile extends StatelessWidget {
  const _BuildPersonTile({
    required this.name,
    required this.avatarUrl,
    required this.profileUrl,
    required this.email,
  });

  final String name;
  final String avatarUrl;
  final String profileUrl;
  final String email;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(profileUrl);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Image.network(
              avatarUrl,
              height: 64,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const IconButton(
            onPressed: null,
            iconSize: 32,
            icon: Icon(
              Icons.forward,
              color: AppTheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
