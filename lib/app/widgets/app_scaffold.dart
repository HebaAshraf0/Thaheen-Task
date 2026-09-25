import 'package:flutter/material.dart';
import 'package:thaheen_task/app/widgets/app_settings_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.title,
    required this.body,
    this.showBackButton = false,
    super.key,
  });

  final String title;
  final Widget body;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppSettingsDrawer(),
      appBar: AppBar(
        title: Text(title),
        leading: showBackButton ? const BackButton() : const DrawerButton(),
        actions: showBackButton
            ? [
                Builder(
                  builder: (drawerContext) => IconButton(
                    tooltip: MaterialLocalizations.of(
                      drawerContext,
                    ).openAppDrawerTooltip,
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () => Scaffold.of(drawerContext).openDrawer(),
                  ),
                ),
              ]
            : null,
      ),
      body: body,
    );
  }
}
