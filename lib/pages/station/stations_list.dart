import 'package:flutter/material.dart';

// command + shift + A : 다크모드

class StationListPage extends StatelessWidget {
  final bool isDepart;
  final void Function(String newValue) onChanged;
  final String? departStation;
  final String? arrivalStation;

  StationListPage({
    super.key,
    required this.isDepart,
    required this.onChanged,
    required this.departStation,
    required this.arrivalStation,
  });

  List<String> stationList = [
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산",
  ];

  Widget stationListView(BuildContext context) {
    List<String> departList =
        stationList.where((value) => value != arrivalStation).toList();

    List<String> arrivalList =
        stationList.where((value) => value != departStation).toList();

    return ListView.builder(
        itemCount: isDepart ? departList.length : arrivalList.length,
        itemBuilder: (ctx, idx) {
          return GestureDetector(
            onTap: () {
              onChanged(isDepart ? departList[idx] : arrivalList[idx]);
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
              child: ListTile(
                  title: Text(
                isDepart ? departList[idx] : arrivalList[idx],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text((isDepart ? '출발역' : '도착역')),
        ),
        body: stationListView(context));
  }
}
