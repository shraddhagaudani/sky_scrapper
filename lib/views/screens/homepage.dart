import 'package:demo/controllers/providers/connectivity_provider.dart';
import 'package:demo/controllers/providers/themeprovider.dart';
import 'package:demo/utills/helpers/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/weathermodel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<Weather_Model?> getAllWeather;

  @override
  void initState() {
    super.initState();
    getAllWeather = APIHelper.apiHelper.fetchallweather(
      search: "Surat",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectivityModel
                  .connectivityStatus !=
              "Waiting")
          ? Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/bg.jpg"),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Provider.of<ThemeAccessProvider>(context,
                        listen: false)
                        .ChangeTheme();
                  },
                  icon: (Provider.of<ThemeAccessProvider>(context)
                      .themeModelAccess
                      .isdark ==
                      false)
                      ? const Icon(
                    Icons.nightlight,
                  )
                      : const Icon(
                    Icons.sunny,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Search Weather here...",
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                  onSubmitted: (val) {
                    setState(
                          () {
                        getAllWeather =
                            APIHelper.apiHelper.fetchallweather(
                              search: val,
                            );
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: FutureBuilder(
                future: getAllWeather,
                builder: (context, snapshot) {
                  print(snapshot.hasError);
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text("ERROR:${snapshot.data}"),
                    );
                  } else if (snapshot.hasData) {
                    Weather_Model? data = snapshot.data;
                    return (data == null)
                        ? const Center(
                      child: Text("No Data Available..."),
                    )
                        : Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
//
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${data.currentcelcius}",
                                      style: const TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 42),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${data.locationname}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                          FontWeight.w400,
                                          color: Colors.black54),
                                    ),
                                    const Icon(
                                      Icons.location_on_outlined,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Current Information",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 23),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed('Detailspage',
                                          arguments: data);
                                    });
                                  },
                                  child: Container(
                                    height: 155,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent
                                          .withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(
                                        20,
                                      ),
                                      // boxShadow: [BoxShadow(
                                      //   offset:Offset(0, 5),
                                      //   color: Colors.black,
                                      //   blurRadius: 8
                                      // ),],
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Celsius : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight
                                                        .w800),
                                              ),
                                              Text(
                                                "${data.currentcelcius}",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .black54),
                                              ),
                                              const SizedBox(
                                                width: 80,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Feranhit : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight
                                                        .w800),
                                              ),
                                              Text(
                                                "${data.currentferanhit}",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .black54),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Last Updated : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight
                                                        .w800),
                                              ),
                                              Text(
                                                "${data.lastupdated}",
                                                style:
                                                const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color: Colors
                                                      .black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Cloud : ",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight
                                                      .w800,
                                                ),
                                              ),
                                              Text(
                                                "${data.cloud}",
                                                style:
                                                const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color: Colors
                                                      .black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Location Infornation",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black54,
                                  thickness: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "City : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "${data.locationname}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "State : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "${data.region}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Country : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "${data.country}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Continents : ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "${data.tzid}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      )
          :
      Center(
              child: Text(
                "Offline",
                style: TextStyle(fontSize: 24),
              ),
            )
    );
  }
}
