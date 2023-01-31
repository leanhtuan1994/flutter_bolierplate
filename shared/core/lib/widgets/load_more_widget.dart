import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../constants/constants.dart';
import '../extensions/extensions.dart';
import '../generated/l10n.dart';

class LoadMoreFooter extends StatelessWidget {
  const LoadMoreFooter({Key? key, this.status}) : super(key: key);

  final LoadStatus? status;

  @override
  Widget build(BuildContext context) {
    if (status == LoadStatus.failed) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          SCore.of(context).loadFail,
          style: context.bodyMedium?.copyWith(
            color: AppColors.neutral60,
          ),
        ),
      );
    }
    if (status == LoadStatus.loading || status == LoadStatus.idle) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                color: context.colorScheme.primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                SCore.of(context).loadMore,
                style: context.bodyMedium?.copyWith(color: AppColors.neutral60),
              ),
            )
          ],
        ),
      );
    }
    if (status == LoadStatus.noMore) {
      return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}
