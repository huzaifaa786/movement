import 'dart:convert';
import 'dart:io';
import 'package:academy_app/constants.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/section_db_model.dart';
import 'package:academy_app/models/video_db_model.dart';
import 'package:academy_app/providers/database_helper.dart';
import 'package:academy_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pod_player/pod_player.dart';
import 'downloaded_course_list.dart';

class DownloadListScreen extends StatefulWidget {
  final int courseId;
  final String title;
  const DownloadListScreen(
      {Key? key, required this.courseId, required this.title})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DownloadListScreenState createState() => _DownloadListScreenState();
}

class _DownloadListScreenState extends State<DownloadListScreen> {
  dynamic path;
  int? selected;

  List<VideoModel> listVideos = [];
  List<SectionDbModel> listSections = [];

  Future<List<Map<String, dynamic>>?> getVideos() async {
    List<Map<String, dynamic>> listMap =
        await DatabaseHelper.instance.queryAllRows('video_list');
    setState(() {
      for (var map in listMap) {
        listVideos.add(VideoModel.fromMap(map));
        // File checkPath = File("${map['path']}/${map['title']}");
        // if(checkPath.existsSync()) {
        //   listVideos.add(VideoModel.fromMap(map));
        // } else {

        // }
      }
    });
    return null;
  }

  Future<List<Map<String, dynamic>>?> getLessons() async {
    List<Map<String, dynamic>> listMap =
        await DatabaseHelper.instance.queryAllSections(widget.courseId);
    setState(() {
      for (var map in listMap) {
        listSections.add(SectionDbModel.fromMap(map));
      }
    });
    return null;
  }

  void sectionCheck(sectionId) async {
    var sec = await DatabaseHelper.instance.sectionExist(sectionId);
    if (sec != true) {
      DatabaseHelper.instance.removeSection(sectionId);
      setState(() {
        listSections.removeWhere((item) => item.sectionId == sectionId);
      });
    }
  }

  void courseCheck(courseId) async {
    var sec = await DatabaseHelper.instance.courseExist(courseId);
    if (sec != true) {
      DatabaseHelper.instance.removeCourse(courseId);
    }
  }

  // void readDataFromPath(String path) {
  //   try {
  //     File file = File(path);

  //     if (file.existsSync()) {
  //       // Read the contents of the file
  //       String contents = file.readAsStringSync();

  //       // Do something with the file contents
  //       print("File contents: $contents");
  //     } else {
  //       print("File does not exist at the specified path.");
  //     }
  //   } catch (e) {
  //     print("Error reading file: $e");
  //   }
  // }

  // void requestStoragePermission(path) async {
  //   Map<Permission, PermissionStatus> result = await [
  //     Permission.manageExternalStorage,
  //   ].request();
  //   var status = await Permission.storage.request();
  //   if (status == PermissionStatus.granted) {
  //     // Permissions granted, proceed with your logic
  //   } else {
  //     // Permissions denied, handle accordingly
  //   }
  //   print('${result[Permission.storage]} storage permission');
  //   print(
  //       '${result[Permission.manageExternalStorage]} manageExternalStorage permission');

  //   //if permission is granted only then show home screen else permission error screen is already shown
  //   if (result[Permission.storage] == PermissionStatus.granted ||
  //       result[Permission.manageExternalStorage] == PermissionStatus.granted) {
  //     setState(() {});
  //     print('Permission not denied');
  //     readDataFromPath(path);
  //   } else {
  //     print('error');
  //   }
  // }

  @override
  void initState() {
    getVideos();
    getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        Navigator.pop(context, false);
        Navigator.pop(context, false);
        Navigator.of(context).pushNamed(DownloadedCourseList.routeName);

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.title, maxLines: 2),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context, true);
              Navigator.pop(context, true);
              Navigator.of(context).pushNamed(DownloadedCourseList.routeName);
            },
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: listSections.isEmpty
            ? Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .15),
                    Image.asset(
                      "assets/images/no_connection.png",
                      height: MediaQuery.of(context).size.height * .35,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'No lessons downloaded yet',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: ListView.builder(
                    key: Key('builder ${selected.toString()}'), //attention
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listSections.length,
                    itemBuilder: (ctx, index) {
                      final section = listSections[index];
                      return Card(
                        elevation: 0.3,
                        child: ExpansionTile(
                          key: Key(index.toString()), //attention
                          initiallyExpanded: index == selected,
                          onExpansionChanged: ((newState) {
                            if (newState) {
                              setState(() {
                                selected = index;
                              });
                            } else {
                              setState(() {
                                selected = -1;
                              });
                            }
                          }), //attention
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: HtmlUnescape()
                                    .convert(section.sectionTitle.toString()),
                                colors: kDarkGreyColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listVideos.length,
                              itemBuilder: (context, index) {
                                VideoModel getVideo = listVideos[index];
                                return widget.courseId == getVideo.courseId &&
                                        section.sectionId == getVideo.sectionId
                                    ? Column(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              String filePath = '${getVideo.path}/system/${getVideo.title}';

                                              File file = File(filePath);

                                              file.exists().then((bool exists) {
                                                if (exists) {
                                                  print(
                                                      'File exists and is accessible.');
                                                } else {
                                                  print(
                                                      'File does not exist or is not accessible.');
                                                }
                                              }).catchError((e) {
                                                print(
                                                    'Error checking file accessibility: $e');
                                              });
                                              setState(() {
                                                path =
                                                    '${getVideo.path}/system/${getVideo.title}';
                                                // path = '/storage/emulated/0/Download/Youtube Downloadermp4';
                                                if (path == null) return;
                                                print(path);
                                                // requestStoragePermission(path);
                                                Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                    builder: (context) {
                                                      return VideoApp(
                                                        file: File(
                                                          // "/data/user/0/se.movementapp.movementapp/app_flutter/system/test"

                                                          // '/var/mobile/Containers/Data/Application/1279F2B4-CEAA-407E-BEF1-16B64F3FB743/Documents/system/test'
                                                            path.toString()
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                );
                                                // var val = await DatabaseHelper.instance
                                                //     .courseExists(video.courseId);
                                                // print(val);
                                              });
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              width: double.infinity,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 1,
                                                      child: CustomText(
                                                        text: '${index + 1}',
                                                        fontSize: 14,
                                                      )),
                                                  Expanded(
                                                    flex: 8,
                                                    child: CustomText(
                                                      text: getVideo.title,
                                                      fontSize: 14,
                                                      colors: kTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: IconButton(
                                                      icon: const Icon(Icons
                                                          .delete_outline_rounded),
                                                      iconSize: 22,
                                                      color: Colors.black45,
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                            title: const Text(
                                                                'Notifying'),
                                                            content:
                                                                const Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <Widget>[
                                                                Text(
                                                                    'Do you wish to remove this lesson?'),
                                                              ],
                                                            ),
                                                            actions: <Widget>[
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                textColor: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                child:
                                                                    const Text(
                                                                  'No',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ),
                                                              MaterialButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  await DatabaseHelper
                                                                      .instance
                                                                      .removeVideo(
                                                                          getVideo
                                                                              .id!);
                                                                  // await FlutterDownloader
                                                                  //     .remove(
                                                                  //         taskId:
                                                                  //             getVideo.downloadId);
                                                                  setState(() {
                                                                    listVideos.removeWhere((item) =>
                                                                        item.id ==
                                                                        getVideo
                                                                            .id);
                                                                    sectionCheck(
                                                                        section
                                                                            .sectionId);
                                                                    courseCheck(
                                                                        widget
                                                                            .courseId);
                                                                  });
                                                                  CommonFunctions
                                                                      .showSuccessToast(
                                                                          'Removed from download list.');
                                                                },
                                                                textColor: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                child:
                                                                    const Text(
                                                                  'Yes',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      )
                                    : Container();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  final File? file;

  const VideoApp({Key? key, this.file}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late final PodPlayerController controller;
  @override
  void initState() {
    print('Idr agya hu file dekho a gai ha idr yah nhi ?');
    print(widget.file!);
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.file(widget.file!),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: PodVideoPlayer(
          controller: controller,
          podPlayerLabels: const PodPlayerLabels(
            play: "PLAY",
            pause: "PAUSE",
            error: "ERROR WHILE TRYING TO PLAY VIDEO",
            exitFullScreen: "EXIT FULL SCREEN",
            fullscreen: "FULL SCREEN",
            loopVideo: "LOOP VIDEO",
            mute: "MUTE",
            playbackSpeed: "PLAYBACK SPEED",
            settings: "SETTINGS",
            unmute: "UNMUTE",
            optionEnabled: "YES",
            optionDisabled: "NO",
            quality: "QUALITY",
          ),
        ),
      ),
    );
  }
}
