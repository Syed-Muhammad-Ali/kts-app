// ignore_for_file: unused_element

import 'dart:async';

import 'package:dart_date/dart_date.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/main.dart';
import 'package:kts_mobile/modules/calendar/search.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CalendarView extends StatefulWidget {
  final KtsBookingApi apiClient;
  final Stream<void> fabStream;
  final StreamController<void> showAdd;
  final DateTime? initalDateTime;

  CalendarView(this.apiClient, this.fabStream, this.showAdd,
      {Key? key, this.initalDateTime})
      : super(key: key) {
    this.showAdd.add(true);
  }

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _launchDate = new DateTime(2023, 04, 06);

  int selectedYear = 2023;
  int selectedMonth = 1;
  late DateTime today;
  List<int> years = List<int>.empty(growable: true);
  List<DateTime> dates = List<DateTime>.empty(growable: true);
  DateTime? _selectedDate;

  DateTime? get selectedDate {
    return _selectedDate;
  }

  void set selectedDate(DateTime? date) {
    _selectedDate = date;
    if (date!.hour == 0) {
      _calendarController.displayDate =
          date.add(Duration(hours: 8, minutes: 30));
    } else {
      _calendarController.displayDate = date;
    }
  }

  List<AppointmentDto> monthAppointments =
      List<AppointmentDto>.empty(growable: true);
  List<AppointmentDto> dayAppointments =
      List<AppointmentDto>.empty(growable: true);

  final CalendarController _calendarController = CalendarController();
  ScrollController _monthScrollController = ScrollController();
  ScrollController _dayScrollController = ScrollController();
  StreamSubscription<void>? fabSubscription = null;
  CancelToken? cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();

    fabSubscription = widget.fabStream.listen((value) {
      context.goNamed(KtsRoutingLinks.create_appointment);
    });
    setState(() {
      if (widget.initalDateTime == null) {
        today = DateTime.now() < _launchDate
            ? _launchDate
            : new DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day);
      } else {
        today = widget.initalDateTime!;
      }

      selectedYear = today.year;

      for (var i = 2023; i <= (selectedYear + 5); i++) {
        years.add(i);
      }

      _monthSelected(today.month);
    });
  }

  @override
  Future dispose() async {
    super.dispose();
    if (fabSubscription != null) {
      await fabSubscription!.cancel();
    }
    if (cancelToken != null) {
      cancelToken!.cancel();
    }
  }

  _yearSelected(int year) {
    selectedYear = year;
    if (year != DateTime.now().year) {
      _monthSelected(1);
    } else {
      _monthSelected(DateTime.now().month);
    }
  }

  _monthSelected(int month) {
    setState(() {
      selectedMonth = month;
      _setDates();
      if (selectedYear == today.year && selectedMonth == today.month) {
        selectedDate = DateTime(selectedYear, selectedMonth, today.day);
      } else {
        selectedDate = DateTime(selectedYear, selectedMonth, 1);
      }
      _scrollToMonth();
      _scrollToDay();
      _loadAppointments();
    });
  }

  _scrollToMonth() {
    var monthPost = _getMonthScrollPosForMonth();
    if (_monthScrollController.hasClients) {
      _monthScrollController.animateTo(
        monthPost,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      _monthScrollController = ScrollController(initialScrollOffset: monthPost);
    }
  }

  int dayWidth = 55;

  _scrollToDay() {
    double dayPos = (selectedDate!.day - 1) * 55;
    if (_dayScrollController.hasClients) {
      _dayScrollController.animateTo(
        dayPos,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      _dayScrollController = ScrollController(initialScrollOffset: dayPos);
    }
  }

  _getMonthScrollPosForMonth() {
    double value = 0;
    if (selectedMonth == 1) {
      value = 0;
    } else if (selectedMonth == 2) {
      value = 80;
    } else if (selectedMonth == 3) {
      value = 165;
    } else if (selectedMonth == 4) {
      value = 245;
    } else if (selectedMonth == 5) {
      value = 310;
    } else if (selectedMonth == 6) {
      value = 360;
    } else if (selectedMonth == 7) {
      value = 430;
    } else if (selectedMonth == 8) {
      value = 500;
    } else if (selectedMonth == 9) {
      value = 570;
    } else if (selectedMonth == 10) {
      value = 650;
    } else if (selectedMonth == 11) {
      value = 730;
    } else if (selectedMonth == 12) {
      value = 800;
    }
    return value;
  }

  _setDates() {
    dates.clear();
    var day = new DateTime(selectedYear, selectedMonth, 1);
    while (day.month < selectedMonth + 1 && selectedYear == day.year) {
      dates.add(day);
      day = day.add(Duration(days: 1));
    }
    // if the selected month is the current month set to todays date
    // other wise set to first day of the month
  }

  _daySelected(DateTime date) {
    setState(() {
      selectedDate = date;
      _setSelectedDayAppointments();
      _scrollToDay();
    });
  }

  _loadAppointments() {
    EasyLoading.show(
      status: 'Loading appointments...',
      maskType: EasyLoadingMaskType.black,
    );

    var startDate = DateTime(selectedYear, selectedMonth, 1);
    var endDate = DateTime(selectedYear, selectedMonth, dates.length + 1);

    widget.apiClient
        .getAccountReadApi()
        .accountReadGetAppointments(
            start: startDate.toUtc(),
            end: endDate.toUtc(),
            cancelToken: cancelToken)
        .then((value) {
      if (value.data != null && value.data!.appointments != null) {
        monthAppointments = value.data!.appointments!.toList(growable: true);
        totalAppointment = value.data!.appointments!.toList(growable: true);
        setState(() {
          _setSelectedDayAppointments();
        });
      }
      EasyLoading.dismiss();
    }, onError: (err) {
      EasyLoading.dismiss();
    });
  }

  _setSelectedDayAppointments() {
    dayAppointments = monthAppointments
        .where((ma) =>
            ma.startDateTime.toLocal().toDate() == selectedDate!.toDate())
        .toList();
  }

  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }

  List<TimeRegion> _getTimeRegions() {
    List<TimeRegion> regions = <TimeRegion>[];
    if (selectedDate == null) {
      return regions;
    }
    regions = <TimeRegion>[
      TimeRegion(
          startTime: selectedDate!,
          endTime: selectedDate!.add(Duration(hours: 1)),
          enablePointerInteraction: true,
          color: Colors.white.withOpacity(0.8),
          text: 'Break')
    ];

    return regions;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/kts-background.png"),
                  fit: BoxFit.cover,
                )))),
        SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Calendar",
                                style: TextStyle(
                                    color: ThemeColors.lightPink,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 75,
                                  height: 50,
                                  child: DropdownButtonFormField<int?>(
                                    value: selectedYear,
                                    icon: const Padding(
                                        padding: EdgeInsets.only(right: 0),
                                        child: const Icon(Icons
                                            .arrow_drop_down_circle_outlined)),
                                    isExpanded: true,
                                    isDense: true,
                                    iconEnabledColor: ThemeColors.darkPink,
                                    dropdownColor: ThemeColors.darkGrey,
                                    style: KtsAppWidgetStyles.fieldTextStyle(),
                                    decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: const TextStyle(
                                            color: ThemeColors.light,
                                            fontFamily:
                                                KtsAppWidgetStyles.fontFamily,
                                            fontSize: 15),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0.0,
                                            color: Colors.transparent,
                                          ),
                                        )),
                                    onChanged: (value) =>
                                        {_yearSelected(value!)},
                                    items: years.map<DropdownMenuItem<int>>(
                                        (int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                  )),
                            ])),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const searchScreen()));
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              color: ThemeColors.darkGrey),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 5),
                                child: Icon(
                                  Icons.search,
                                  color: ThemeColors.darkPink,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Search Appoinment",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Montserrat",
                                    color: ThemeColors.grey10,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          controller: _monthScrollController,
                          itemBuilder: ((context, index) {
                            var date = new DateTime(selectedYear, index + 1, 1);
                            return TextButton(
                                onPressed: () {
                                  _monthSelected(date.month);
                                },
                                child: Text("${DateFormat.MMMM().format(date)}",
                                    style: selectedMonth == date.month
                                        ? TextStyle(
                                            color: ThemeColors.light,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                KtsAppWidgetStyles.fontFamily)
                                        : TextStyle(
                                            color: ThemeColors.light50,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: KtsAppWidgetStyles
                                                .fontFamily)));
                          }),
                          separatorBuilder: ((context, index) => const SizedBox(
                                width: 0,
                              )),
                          itemCount: 12),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                          controller: _dayScrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            var date = dates[index];
                            return SizedBox(
                                width: 55,
                                child: TextButton(
                                    onPressed: () {
                                      _daySelected(date);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: selectedDate == date
                                                    ? ThemeColors.darkPink
                                                    : today == date
                                                        ? ThemeColors.darkPink50
                                                        : null),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(date.day.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            KtsAppWidgetStyles
                                                                .fontFamily,
                                                        fontWeight:
                                                            selectedDate == date
                                                                ? FontWeight
                                                                    .w700
                                                                : FontWeight
                                                                    .w300,
                                                        color: selectedDate ==
                                                                date
                                                            ? Color(0xFF505050)
                                                            : ThemeColors
                                                                .light)))),
                                        SizedBox(height: 12),
                                        Text(DateFormat('EEE').format(date),
                                            style: selectedDate == date
                                                ? KtsAppWidgetStyles
                                                    .calendarCurrentDayTextStyle()
                                                : KtsAppWidgetStyles
                                                    .calendarDayTextStyle())
                                      ],
                                    )));
                          }),
                          separatorBuilder: ((context, index) => const SizedBox(
                                width: 0,
                              )),
                          itemCount: dates.length),
                    ),
                    Expanded(
                      child: SfCalendarTheme(
                          data: SfCalendarThemeData(
                            displayNameTextStyle: TextStyle(color: Colors.blue),
                            brightness: Brightness.dark,
                            allDayPanelColor: Colors.yellow,
                            leadingDatesBackgroundColor: Colors.pink,
                          ),
                          child: SfCalendar(
                            controller: _calendarController,
                            timeRegionBuilder: (context, timeRegionDetails) {
                              return Container(color: Colors.blue);
                            },
                            dataSource: _AppointmentDataSource(dayAppointments),
                            appointmentBuilder:
                                (context, calendarAppointmentDetails) {
                              final AppointmentWrapper appointment =
                                  calendarAppointmentDetails.appointments.first;

                              return GestureDetector(
                                  onTap: () {
                                    context.goNamed(
                                        KtsRoutingLinks.edit_appointment,
                                        params: {
                                          'id': appointment.appointment.id
                                              .toString()
                                        });
                                  },
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 2, right: 12),
                                      child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: appointment.appointment
                                                          .remainingBalance >
                                                      0
                                                  ? ThemeColors.darkGrey
                                                  : ThemeColors.darkPink,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 18, right: 18),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 6),
                                                    Text(
                                                        appointment
                                                                .appointment
                                                                .customer!
                                                                .name ??
                                                            "-",
                                                        style: const TextStyle(
                                                            color: ThemeColors
                                                                .light,
                                                            fontFamily:
                                                                KtsAppWidgetStyles
                                                                    .fontFamily,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        overflow:
                                                            TextOverflow.clip),
                                                    Text(
                                                      "${DateFormat('hh:mm a').format(appointment.appointment.startDateTime.toLocal())} - ${DateFormat('hh:mm a').format(appointment.appointment.endDateTime.toLocal())}",
                                                      style: const TextStyle(
                                                        overflow:
                                                            TextOverflow.clip,
                                                        color:
                                                            ThemeColors.light,
                                                        fontFamily:
                                                            KtsAppWidgetStyles
                                                                .fontFamily,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    Text(
                                                      appointment.appointment
                                                              .services?.name ??
                                                          "-",
                                                      style: const TextStyle(
                                                          color:
                                                              ThemeColors.light,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          fontFamily:
                                                              KtsAppWidgetStyles
                                                                  .fontFamily,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                  ])))));
                            },
                            headerHeight: 0,
                            timeSlotViewSettings: TimeSlotViewSettings(
                                timeTextStyle: TextStyle(
                                    color: Color(0XFF9B9B9B),
                                    fontSize: 10,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontWeight: FontWeight.w300),
                                timeIntervalHeight: 50,
                                timeFormat: 'h:mm a',
                                dateFormat: 'd',
                                dayFormat: 'EEE',
                                timeRulerSize: 70,
                                timeInterval: Duration(minutes: 15)),
                            allowDragAndDrop: false,
                            viewHeaderHeight: 0,
                            allowAppointmentResize: false,
                            onSelectionChanged: (calendarSelectionDetails) {
                              context.goNamed(
                                  KtsRoutingLinks
                                      .create_appointment_with_datetime,
                                  params: {
                                    'proposedDateTime':
                                        calendarSelectionDetails.date.toString()
                                  });
                            },
                            //specialRegions: _getTimeRegions(),
                          )),
                    )
                  ],
                ))),
      ],
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<AppointmentDto> source) {
    appointments = source
        .map((a) => AppointmentWrapper(
            startTime: a.startDateTime.toLocal(),
            endTime: a.endDateTime.toLocal(),
            appointment: a))
        .toList();
  }
}

class AppointmentWrapper extends Appointment {
  AppointmentDto appointment;

  AppointmentWrapper(
      {required super.startTime,
      required super.endTime,
      required this.appointment});
}
