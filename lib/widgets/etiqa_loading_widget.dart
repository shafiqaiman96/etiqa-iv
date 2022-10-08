import 'package:flutter/material.dart';

import '../global/dimens.dart';

class EtiqaLoadingWidget extends StatelessWidget {
  const EtiqaLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/etiqa_loading.gif',
        width: Dimens.space180,
      ),
    );
  }
}
