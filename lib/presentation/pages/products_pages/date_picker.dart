import 'package:flutter/material.dart';

class DateRangeWidget extends StatefulWidget {
  DateRangeWidget({Key? key}) : super(key: key);

  @override
  State<DateRangeWidget> createState() => _DateRangeWidgetState();
}

class _DateRangeWidgetState extends State<DateRangeWidget> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    return Column(children: [
      const Text(
        'Elige la fecha de tu viaje',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
              child: Text(
                '${start.year}/${start.month}/${start.day}',
              ),
              onPressed: pickDateRange,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ElevatedButton(
              child: Text(
                '${end.year}/${end.month}/${end.day}',
              ),
              onPressed: pickDateRange,
            ),
          ),
        ],
      )
    ]);
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      helpText: 'FECHA DE VIAJE',
      fieldStartLabelText: 'DESDE',
      fieldEndLabelText: 'HASTA',
      confirmText: 'CONFIRMAR',
      cancelText: 'CANCELAR',
      saveText: 'GUARDAR',
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2023),
    );
    setState(() {
      dateRange = newDateRange ?? dateRange;

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
  }
}
