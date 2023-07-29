import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../common/min_icons_icons.dart';
import '../const/colors.dart';
import '../pages/compose/controllers/compose_controller.dart';
import '../widgets/calendar.dart';

class ComposeButtons extends GetView<ComposeController> {
  const ComposeButtons({
    super.key,
    required this.onSavedPressed,
  });

  final void Function() onSavedPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(
                () => SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => controller.changeShowTitle(),
                    style: controller.showTitle.value
                        ? ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                            backgroundColor: ColorStyles.point02,
                            shadowColor: ColorStyles.transparent,
                            surfaceTintColor: ColorStyles.point01,
                            foregroundColor: ColorStyles.point02,
                          )
                        : ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                            backgroundColor: ColorStyles.bg01,
                            shadowColor: ColorStyles.transparent,
                            surfaceTintColor: ColorStyles.bg03,
                          ),
                    child: Icon(
                      MinIcons.letter_t_upper,
                      color: controller.showTitle.value
                          ? ColorStyles.point01
                          : ColorStyles.sunset02,
                      size: 24,
                    ),
                  ),
                ),
              ),
              // TODO: 이미지 구현
              // const SizedBox(width: 8),
              // SizedBox(
              //   width: 40,
              //   height: 40,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // TODO:앨범연동
              //     },
              //     style: ElevatedButton.styleFrom(
              //       padding: EdgeInsets.zero,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       elevation: 0,
              //       backgroundColor: ColorStyles.bg01,
              //       shadowColor: ColorStyles.transparent,
              //       surfaceTintColor: ColorStyles.bg03,
              //     ),
              //     child: const Icon(
              //       MinIcons.image,
              //       color: ColorStyles.sunset02,
              //       size: 24,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 8),
              SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      ignoreSafeArea: false,
                      isScrollControlled: true,
                      backgroundColor: ColorStyles.bg01,
                      Container(
                        height: 418,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 18),
                                child: Text(
                                  DateFormat('y년 M월', 'ko')
                                      .format(controller.focusedDate.value),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                              Calendar(
                                focusedDay: controller.focusedDate.value,
                                selectedDay: controller.selectedDate.value,
                                onDaySelected: onDaySelected,
                                calendarFormat: CalendarFormat.month,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    backgroundColor: ColorStyles.bg01,
                    shadowColor: ColorStyles.transparent,
                    surfaceTintColor: ColorStyles.bg03,
                  ),
                  child: const Icon(
                    MinIcons.date_today,
                    color: ColorStyles.sunset02,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onSavedPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              backgroundColor: ColorStyles.sunset03,
              shadowColor: ColorStyles.transparent,
              surfaceTintColor: ColorStyles.sunset03,
              foregroundColor: ColorStyles.white,
            ),
            child: const Text(
              '작성완료',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    controller.changeSelectedDate(day: selectedDay);
    Get.back();
  }
}
