import 'package:custom_painter_practice_1/routes/routes.dart';
import 'package:custom_painter_practice_1/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.primaryColorDark,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.primaryColorDark),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return pageRoutes[index].page;
            },
          ));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final secondaryColor = appTheme.currentTheme.primaryColorDark;
    return Drawer(
      child: Container(
          child: Column(
        children: [
          SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: Text(
                    'FH',
                    style: TextStyle(fontSize: 50),
                  ),
                )),
          ),
          Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: secondaryColor,
            ),
            title: Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: secondaryColor,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                }),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: secondaryColor,
              ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  }),
            ),
          )
        ],
      )),
    );
  }
}
