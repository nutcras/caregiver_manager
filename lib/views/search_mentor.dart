import 'package:caregiver_manager/views/confirm_mentor.dart';
import 'package:caregiver_manager/models/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:caregiver_manager/configs/api.dart';

class InputMentor extends StatefulWidget {
  const InputMentor({Key? key, data}) : super(key: key);
  @override
  State<InputMentor> createState() => _InputMentorState();
}

class _InputMentorState extends State<InputMentor> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await inputmentor();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      appBar: AppBar(
        title: const Text('หาพี่เลี้ยง'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              startApi();
            },
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, i) => InkWell(
                // onTap: () => Navigator.pushNamed(context, "/CDT"),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute<void>(
                  //         builder: (BuildContext context) =>
                  //             Carddetail(data: data[i])));
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => ConfirmMentor()));
                },
                child: Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 150, 217, 234),
                  shadowColor: const Color.fromARGB(255, 10, 91, 111),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 55.0,
                                height: 55.0,
                                // color: Color.fromARGB(255, 150, 217, 234),
                                // ignore: prefer_const_constructors
                                child: CircleAvatar(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data[i]['title']} ${data[i]['fname']} ${data[i]['lname']}',
                                      style: const TextStyle(fontSize: 15),
                                    ),

                                    Text(
                                      '${data[i]['phone']}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),

                                    // Text(
                                    //     'ผู้รีวิว :${data[i]['countScore']}   จำนวนคะแนน :${data[i]['averageRatting']}')
                                  ],
                                ),
                              ),
                            ])
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
