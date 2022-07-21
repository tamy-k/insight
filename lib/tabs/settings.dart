import 'package:flutter/material.dart';
import 'package:insight1/logic/settings_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SharedPreferences? settings;

  @override
  Widget build(BuildContext context) {
    Color useColor = Provider.of<SettingsHandler>(context).mode.accentColor;
    String theme = Provider.of<SettingsHandler>(context).theme;
    final provide = Provider.of<SettingsHandler>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            width: double.maxFinite,
            child: Text(
              "Settings",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: provide.mode.fontColor,
                  fontFamily: provide.mode.fontFamilyUse,
                  fontSize: provide.mode.fontFamilyUse == "stalinist" ? 24 : 35,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Appearance",
                    style: TextStyle(
                        color: provide.mode.fontColor,
                        fontFamily: provide.mode.fontFamilyUse,
                        fontSize:
                            provide.mode.fontFamilyUse == "stalinist" ? 20 : 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 15),
                  color: provide.mode.accentColor,
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 27, 27, 27),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Material(
                                      color:
                                          const Color.fromARGB(255, 27, 27, 27),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Default",
                                              style: TextStyle(
                                                  fontFamily: provide
                                                      .mode.fontFamilyUse,
                                                  color: const Color.fromARGB(
                                                      255, 208, 208, 208),
                                                  fontSize: 16)),
                                          Radio(
                                              value: "darkmode",
                                              groupValue: theme,
                                              onChanged: (String? value) {
                                                provide.themeChange(value,settings);
                                                Navigator.pop(context);
                                              },
                                              activeColor: useColor),
                                        ],
                                      ),
                                    ),
                                    Material(
                                      color:
                                          const Color.fromARGB(255, 27, 27, 27),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("White",
                                              style: TextStyle(
                                                  fontFamily: provide
                                                      .mode.fontFamilyUse,
                                                  color: const Color.fromARGB(
                                                      255, 208, 208, 208),
                                                  fontSize: 16)),
                                          Radio(
                                              value: "whitemode",
                                              groupValue: theme,
                                              onChanged: (String? value) {
                                                provide.themeChange(value,settings);
                                                Navigator.pop(context);
                                              },
                                              activeColor: useColor),
                                        ],
                                      ),
                                    ),
                                    Material(
                                      color:
                                          const Color.fromARGB(255, 27, 27, 27),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Retro",
                                              style: TextStyle(
                                                  fontFamily: provide
                                                      .mode.fontFamilyUse,
                                                  color: const Color.fromARGB(
                                                      255, 208, 208, 208),
                                                  fontSize: 16)),
                                          Radio(
                                              value: "retromode",
                                              groupValue: theme,
                                              onChanged: (String? value) {
                                                provide.themeChange(value,settings);
                                                Navigator.pop(context);
                                              },
                                              activeColor: useColor),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: ListTile(
                      leading: Text("Theme",
                          style: TextStyle(
                              color: provide.mode.fontColor,
                              fontFamily: provide.mode.fontFamilyUse,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: provide.mode.fontColor,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
