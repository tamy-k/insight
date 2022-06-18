import 'package:flutter/material.dart';
import 'package:insight1/logic/connectivity.dart';
import 'package:insight1/logic/settings_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:insight1/logic/state.dart';
import 'package:insight1/tabs/games.dart';
import 'package:insight1/tabs/home.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
    debug:true
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'whitney',
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<StateManager>(
            create: (_) => StateManager(),
            child: const MyHomePage(),
          ),
          ChangeNotifierProvider<ConnectivityA>(
            create: (_) => ConnectivityA(),
            child: const MyHomePage(),
          )
        ],
        child: const MyHomePage(),
      )
      // home: Download(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icons = [
      Icons.home_rounded,
      Icons.gamepad_outlined,
      Icons.settings
    ];

    var tab = [
      const HomeScreen(),
      const Game(),
      const Center(
        child: Text(
          "4",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ];
    var settings = SettingsHandler();
    return Scaffold(
      backgroundColor: const Color(0xff303030),
      body: IndexedStack(
        index: Provider.of<StateManager>(context).selectedindex,
        children: tab,
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              icons.length,
              (index) => GestureDetector(
                    onTap: () {
                      Provider.of<StateManager>(context, listen: false)
                          .changeIndex(index);
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Transform.translate(
                          offset: Provider.of<StateManager>(context)
                                      .selectedindex ==
                                  index
                              ? const Offset(0, -10)
                              : const Offset(0, 0),
                          child: Icon(
                            icons[index],
                            color: Colors.white,
                            size: Provider.of<StateManager>(context)
                                        .selectedindex ==
                                    index
                                ? 30
                                : 25,
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 3,
                          decoration: Provider.of<StateManager>(context)
                                      .selectedindex ==
                                  index
                              ? BoxDecoration(
                                  color: Provider.of<StateManager>(context)
                                              .selectedindex ==
                                          index
                                      ? settings.accentColor
                                      : null,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                      BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          blurStyle: BlurStyle.outer)
                                    ])
                              : const BoxDecoration(color: null),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
