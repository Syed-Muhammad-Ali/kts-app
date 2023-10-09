import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kts_booking_api/kts_booking_api.dart';
import 'package:kts_mobile/common/routing/kts_routing_links.dart';
import 'package:kts_mobile/common/theme/theme_colors.dart';
import 'package:kts_mobile/common/theme/theme_styles.dart';
import 'package:kts_mobile/main.dart';
import 'package:kts_mobile/modules/global/connectivity/no_internet_connection-warning.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  List<AppointmentDto> searchList = [];

  //   @override
  // void initState() {
  //  for (var element in totalAppointment) {
  //    searchList.add(element);
  //  }
  //   super.initState();
  // }

  
    @override
  void initState() {
   for (var element in totalAppointment) {
     searchList.clear();
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalAppointment.length;
    print("${totalAppointment.length}");
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
            padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
            child:
                Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                       NoInternetConnectionWarning(),
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 30,
                                height: 28,
                                child: IconButton(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(0),
                                    splashColor: ThemeColors.lightPink,
                                    splashRadius: 5,
                                    icon: Icon(Icons.arrow_back, size: 28),
                                    color: ThemeColors.darkPink,
                                  onPressed: () => context.pop(),
                                            )),
                            Text(
                              "Search",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: ThemeColors.lightPink,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: ThemeColors.darkGrey),
                        child: TextFormField(
                          autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            if(value == ''){
                              searchList.clear();
                              setState(() {});
                            }else{
                              searchList = totalAppointment
                                .where((element) => element.customer!.name!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                                setState(() {});
                            }
                          },
                          style: KtsAppWidgetStyles.fieldTextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            hintText: "Search Appointment",
                            hintStyle: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Montserrat",
                                color: ThemeColors.grey10,
                                fontWeight: FontWeight.w400),
                            contentPadding: EdgeInsets.only(bottom: 6),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: ThemeColors.lightPink,
                            ),
                          ),
                          autofillHints: const ["Search"],
                          controller: searchController,
                          focusNode: searchFocusNode,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context.goNamed(KtsRoutingLinks.edit_appointment,
                            params: {'id': searchList[index].id.toString()});
                      },
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: ThemeColors.darkGrey),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 16, right: 20, bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  searchList[index].customer!.name.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: ThemeColors.light,
                                      fontFamily: KtsAppWidgetStyles.fontFamily,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${DateFormat('EEEE, MMM d yyy').format(searchList[index].startDateTime.toLocal())}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    overflow: TextOverflow.clip,
                                    color: ThemeColors.light,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                 SizedBox(height: 5),
                                Text(
                                  "${DateFormat('hh:mm a').format(searchList[index].startDateTime.toLocal())} - ${DateFormat('hh:mm a').format(searchList[index].endDateTime.toLocal())}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    overflow: TextOverflow.clip,
                                    color: ThemeColors.light,
                                    fontFamily: KtsAppWidgetStyles.fontFamily,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  searchList[index].services!.name.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: ThemeColors.light,
                                      overflow: TextOverflow.clip,
                                      fontFamily: KtsAppWidgetStyles.fontFamily,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
