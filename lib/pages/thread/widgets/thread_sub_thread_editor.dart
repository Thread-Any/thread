import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/thread_controller.dart';
import '../../compose/controllers/compose_controller.dart';
import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';
import '../../../routes/app_pages.dart';

class ThreadSubThreadEditor extends GetView<ThreadController> {
  ThreadSubThreadEditor({super.key});

  final TextEditingController _subThreadContentController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _subThreadContentController.text = controller.subThreadContent.value;

    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: () => controller.changeMode(),
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: controller.isComposeMode.value ? 12 : 16),
              padding: EdgeInsets.symmetric(
                vertical: controller.isComposeMode.value ? 12 : 8,
                horizontal: 12,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorStyles.bg03,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: controller.isComposeMode.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('M월 d일에 엮인 글 쓰기', 'ko')
                              .format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorStyles.sunset02,
                          ),
                        ),
                        const SizedBox(height: 8, width: double.infinity),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: (MediaQuery.of(context).size.height / 3),
                          ),
                          child: TextField(
                            controller: _subThreadContentController,
                            onChanged: onSubThreadContentChanged,
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(300)
                            ],
                            autofocus: true,
                            cursorHeight: 17,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: ColorStyles.sunset01,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              isDense: true,
                              hintText: '엮인 글 쓰기',
                              hintStyle: TextStyle(
                                fontSize: 17,
                                color: ColorStyles.sunset02,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      controller.subThreadContent.value.isNotEmpty
                          ? controller.subThreadContent.value
                          : '엮인 글 쓰기',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 17,
                        color: controller.subThreadContent.value.isNotEmpty
                            ? ColorStyles.sunset01
                            : ColorStyles.sunset02,
                      ),
                    ),
            ),
          ),
          Offstage(
            offstage: !controller.isComposeMode.value,
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: onIconButtonPressed,
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
                            MinIcons.face_add,
                            color: ColorStyles.sunset02,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: onIconButtonPressed,
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
                            MinIcons.open_in_full,
                            color: ColorStyles.sunset02,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => controller.createSubThread(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      backgroundColor:
                          controller.subThreadContent.value.isNotEmpty
                              ? ColorStyles.sunset01
                              : ColorStyles.sunset03,
                      shadowColor: ColorStyles.transparent,
                      surfaceTintColor: ColorStyles.sunset03,
                      foregroundColor: ColorStyles.white,
                    ),
                    child: const Text(
                      '작성하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSubThreadContentChanged(String text) {
    controller.subThreadContent.value = text;
  }

  void onIconButtonPressed() {
    _subThreadContentController.text = '';
    Get.put(ComposeController()).content.value =
        controller.subThreadContent.value;
    controller.expendedSubThreadEditor();
    Get.toNamed(Routes.COMPOSE_SUB_THREAD(id: controller.id));
  }
}
