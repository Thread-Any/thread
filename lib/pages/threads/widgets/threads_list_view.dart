import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../widgets/empty_trhead.dart';

class TreadsListView extends StatelessWidget {
  const TreadsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: ColorStyles.bg03,
      ),
      child: const ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: EmptyThread(),
        // child: Container(
        //   decoration: const BoxDecoration(
        //     color: ColorStyles.bg01,
        //   ),
        //   child: ListView.builder(
        //     itemBuilder: (context, index) => MultiThreadCard(
        //       threads: [
        //         ThreadModel(
        //           id: 0,
        //           icon: '🍚',
        //           createdAt: DateTime(2022, 1, 22),
        //           content:
        //               '좀 살아보니 알겠는 건 그냥 하루 세 끼를 함께 챙겨 먹는 주말이 있고 함께 잠들 수 있는 집이 있다는 게 그렇게 평범하게 사는 것도 쉬운 게 아니라는 것시간이 지나면서 더 견고해지는 건 그것을 지키기 위한 마음',
        //         ),
        //         ThreadModel(
        //           id: 1,
        //           createdAt: DateTime(2022, 1, 22),
        //           content:
        //               '사람과 어울려 지내는 것을 지나치게 좋아하면 자칫 뜻을 잃기 쉽다. 세상의 찬사와 비난에 지나치게 귀를 기울이면 마음만 혼란해진다. 혼자 지내는 시간을 늘려보라. 내 안에 있는 좋은',
        //         ),
        //         ThreadModel(
        //           id: 2,
        //           createdAt: DateTime(2022, 1, 22),
        //           content:
        //               '사람과 어울려 지내는 것을 지나치게 좋아하면 자칫 뜻을 잃기 쉽다. 세상의 찬사와 비난에 지나치게 귀를 기울이면 마음만 혼란해진다. 혼자 지내는 시간을 늘려보라. 내 안에 있는 좋은',
        //         )
        //       ],
        //     ),
        //     // SingleThreadCard(
        //     //   id: 3,
        //     //   icon: '💵',
        //     //   createdAt: DateTime.now(),
        //     //   content:
        //     //       '우리는 화폐경제에서 살아가기 때문에 교환이 불가능한 것들은 무가치하다고 생각하는 버릇이 있다.',
        //     // ),
        //     itemCount: 1,
        //   ),
        // ),
      ),
    );
  }
}
