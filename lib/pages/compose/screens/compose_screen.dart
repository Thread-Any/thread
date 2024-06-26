import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/compose_controller.dart';
import '../widgets/compose_buttons.dart';
import '../../thread/controllers/thread_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_emoji_picker.dart';
import '../../../common/min_icons_icons.dart';
import '../../../const/colors.dart';

class ComposeScreen extends GetView<ComposeController> {
  final GlobalKey<FormState> formKey = GlobalKey();

  ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorStyles.black,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 14,
                child: Container(
                  margin: const EdgeInsets.only(top: 4, left: 16, right: 16),
                  decoration: const BoxDecoration(
                    color: ColorStyles.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                    ),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorStyles.bg01,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 56,
                            child: Stack(
                              children: [
                                const Center(
                                  child: Text(
                                    '글 쓰기',
                                    style: TextStyle(
                                      color: ColorStyles.sunset01,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: IconButton(
                                    onPressed: onClosePressed,
                                    icon: const Icon(MinIcons.close),
                                    iconSize: 24,
                                    color: ColorStyles.sunset01,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.bottomSheet(
                                      CustomEmojiPicker(
                                        onEmojiSelected: (Category? category,
                                            Emoji newEmoji) {
                                          controller.changeEmoji(
                                              newEmoji: newEmoji);
                                          Get.back();
                                        },
                                      ),
                                    ),
                                    child: (controller.emoji.isNotEmpty)
                                        ? SizedBox(
                                            width: 32,
                                            height: 32,
                                            child: Center(
                                              child: Text(
                                                controller.emoji.value,
                                                style: const TextStyle(
                                                  fontSize: 32,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          )
                                        : const Icon(
                                            MinIcons.face_add,
                                            color: ColorStyles.sunset03,
                                            size: 32,
                                          ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    DateFormat('yyyy년 M월 dd일(EEE)', 'ko')
                                        .format(controller.selectedDate.value),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: ColorStyles.sunset02,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Offstage(
                                      offstage: !controller.showTitle.value,
                                      child: AnimatedOpacity(
                                        opacity:
                                            controller.showTitle.value ? 1 : 0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: TextFormField(
                                          validator: titleValidator,
                                          onSaved: (val) {
                                            if (val != null) {
                                              controller.title.value = val;
                                            }
                                          },
                                          autofocus: true,
                                          cursorHeight: 24,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            color: ColorStyles.sunset01,
                                          ),
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            isDense: true,
                                            hintText: '무슨 생각을 하고 계세요?',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: ColorStyles.sunset03,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: TextFormField(
                                      validator: contentValidator,
                                      initialValue: controller.content.value,
                                      onSaved: (String? val) {
                                        if (val != null) {
                                          controller.content.value = val;
                                        }
                                      },
                                      textAlignVertical: TextAlignVertical.top,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(300)
                                      ],
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ComposeButtons(onSavedPressed: onSavedPressed)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: ColorStyles.black,
        ),
      ),
    );
  }

  void onClosePressed() {
    String? id = Get.parameters['id'];

    // 상세에서 엮인글 작성으로 접근한 뒤 종료시 데이터 클리어
    if (id != null && Get.currentRoute.startsWith(Routes.threads)) {
      Get.put(ThreadController(id: int.parse(id))).subThreadContent.value = '';
    }

    controller.clear();
    Get.back();
  }

  String? titleValidator(String? val) {
    if (controller.showTitle.value && (val == null || val.isEmpty)) {
      return '제목을 입력해주세요';
    }

    return null;
  }

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '내용을 입력해주세요';
    }

    return null;
  }

  void onSavedPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print({
        controller.emoji.value,
        controller.title.value,
        controller.content.value
      });

      // TODO: database 저장
      Get.back();
    }
  }
}
