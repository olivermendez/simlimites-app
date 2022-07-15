import 'package:flutter/material.dart';

class DateRangeWidget extends StatefulWidget {
  DateRangeWidget({Key? key}) : super(key: key);

  @override
  State<DateRangeWidget> createState() => _DateRangeWidgetState();
}

class _DateRangeWidgetState extends State<DateRangeWidget> {
  int totalDays = 0;

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      '${start.year}/${start.month}/${start.day}',
                    ),
                    onTap: pickDateRange,
                    trailing: const Icon(Icons.arrow_drop_down_outlined),
                    subtitle: const Text('desde'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      '${end.year}/${end.month}/${end.day}',
                    ),
                    onTap: pickDateRange,
                    trailing: Icon(Icons.arrow_drop_down_outlined),
                    subtitle: Text('hasta'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Text(totalDays.toString() + " días en total"),
      ],
    );
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
      //print((DateTime.now().difference(newDateRange!.end).inDays).abs());

      if (newDateRange == null) {
        return;
      } else {
        dateRange = newDateRange;
        totalDays = (DateTime.now().difference(newDateRange.end).inDays).abs();
        //print(totalDays);
      }

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
  }
}
