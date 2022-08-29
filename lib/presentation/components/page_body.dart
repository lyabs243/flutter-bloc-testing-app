import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {

  final String title;
  final List<Widget> actions;
  final Widget child;

  const PageBody({Key? key, required this.title, required this.child, this.actions = const []}):
    super(key: key);

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text(title),
      centerTitle: true,
      actions: actions,
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).scaffoldBackgroundColor,
          height: MediaQuery.of(context).size.height - appBar.preferredSize.height - 24,
          width: MediaQuery.of(context).size.width,
          child: child,
        ),
      ),
    );
  }

}