import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String? departStation;
  final String? arrivalStation;

  const SeatPage({
    super.key,
    required this.departStation,
    required this.arrivalStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedRow;
  int? selectedCol;

  void onSelected(String rowAlpha, int colNum) {
    setState(() {
      selectedRow = rowAlpha;
      selectedCol = colNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text('좌석 선택'),
        ),
        body: Column(
          children: [
            PickedStation(
              departStation: widget.departStation,
              arrivalStation: widget.arrivalStation,
            ),
            IsPickedExample(),
            RowTitle(),
            SeatList(
                onSelected: onSelected,
                selectedRow: selectedRow,
                selectedCol: selectedCol),
            ReservationBtn()
          ],
        ));
  }
}

class ReservationBtn extends StatelessWidget {
  const ReservationBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SizedBox(
        width: 380,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {},
          child: Text(
            '예매 하기',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SeatList extends StatelessWidget {
  final void Function(String rowAlpha, int colNum) onSelected;
  final String? selectedRow;
  final int? selectedCol;

  const SeatList({
    super.key,
    required this.onSelected,
    this.selectedRow,
    this.selectedCol,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        children: List.generate(
          20,
          (index) => Column(
            children: [
              RowSeat(
                  index: index + 1,
                  onSelected: onSelected,
                  selectedRow: selectedRow,
                  selectedCol: selectedCol),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PickedStation extends StatelessWidget {
  final String? departStation;
  final String? arrivalStation;

  const PickedStation({
    super.key,
    required this.departStation,
    required this.arrivalStation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          departStation!,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        Text(
          arrivalStation!,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ],
    );
  }
}

class IsPickedExample extends StatelessWidget {
  const IsPickedExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.purple, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('선택됨'),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(8))),
          ),
          SizedBox(
            width: 4,
          ),
          Text('선택안됨'),
        ],
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'A',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'B',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'C',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'D',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class RowSeat extends StatelessWidget {
  final int index;
  final void Function(String rowAlpha, int colNum) onSelected;
  final String? selectedRow;
  final int? selectedCol;

  const RowSeat({
    super.key,
    required this.index,
    required this.onSelected,
    this.selectedRow,
    this.selectedCol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat(
            rowAlpha: 'A',
            colNum: index,
            onSelected: onSelected,
            selectedRow: selectedRow,
            selectedCol: selectedCol),
        SizedBox(
          width: 4,
        ),
        seat(
            rowAlpha: 'B',
            colNum: index,
            onSelected: onSelected,
            selectedRow: selectedRow,
            selectedCol: selectedCol),
        SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              index.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        seat(
            rowAlpha: 'C',
            colNum: index,
            onSelected: onSelected,
            selectedRow: selectedRow,
            selectedCol: selectedCol),
        SizedBox(
          width: 4,
        ),
        seat(
            rowAlpha: 'D',
            colNum: index,
            onSelected: onSelected,
            selectedRow: selectedRow,
            selectedCol: selectedCol),
      ],
    );
  }
}

class seat extends StatelessWidget {
  final String? rowAlpha;
  final int? colNum;
  final String? selectedRow;
  final int? selectedCol;
  final void Function(String rowAlpha, int colNum) onSelected;

  const seat({
    super.key,
    this.rowAlpha,
    this.colNum,
    required this.onSelected,
    this.selectedRow,
    this.selectedCol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onSelected(rowAlpha!, colNum!);
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: rowAlpha == selectedRow && colNum == selectedCol
                      ? Colors.purple
                      : Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                '$rowAlpha-$colNum',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
