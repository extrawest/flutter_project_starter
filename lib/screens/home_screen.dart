import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:provider_starter_app/common/app_bar_config.dart';
import 'package:provider_starter_app/localization/keys.dart';
import 'package:provider_starter_app/network/response.dart';
import 'package:provider_starter_app/providers/posts_provider.dart';
import 'package:provider_starter_app/providers/theme_provider.dart';
import 'package:provider_starter_app/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBarConfig.defaultAppBar(context, translate(Keys.App_Bar_Title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _buildChangeLangButton(translate(Keys.Language_English), 'en'),
            _buildChangeLangButton(translate(Keys.Language_Ukrainian), 'uk'),
          ]),
          _buildChangeThemeTile(),
          RaisedButton(
            onPressed: () {
              postsProvider.fetchPosts();
            },
            child: Text(translate(Keys.Fetch_Posts)),
          ),
          Text(
            translatePlural(Keys.Plural_Demo, _counter),
            textAlign: TextAlign.center,
            style: TextStyles.notifierTextLabel.copyWith(color: Theme.of(context).accentColor),
          ),
          Text(
            _getText(postsProvider),
            textAlign: TextAlign.center,
            style: TextStyles.notifierTextLabel.copyWith(color: Theme.of(context).accentColor),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }

  ListTile _buildChangeThemeTile() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListTile(
      leading: Text(
        translate(Keys.Theme_Change_Theme),
        style: Theme.of(context).textTheme.headline,
      ),
      trailing: Switch(
        value: themeProvider.isLightTheme,
        onChanged: (val) {
          themeProvider.setThemeData = val;
        },
      ),
    );
  }

  RaisedButton _buildChangeLangButton(String languageName, String languageCode) {
    return RaisedButton(
      onPressed: () {
        changeLocale(context, languageCode);
      },
      child: Text(languageName),
    );
  }

  String _getText(PostsProvider postsProvider) {
    final postsListResponse = postsProvider.postsListResponse;
    switch (postsListResponse.status) {
      case Status.loading:
        return postsListResponse.message;
      case Status.completed:
        return "${postsListResponse.data.length}";
      case Status.error:
        return postsListResponse.message;
      case Status.none:
      default:
        return "";
    }
  }
}
