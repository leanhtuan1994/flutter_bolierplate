import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../widgets/skeleton/skeleton_widget.dart';

class Tools {
  static Widget image({
    required String url,
    double? height,
    double? width,
    String? tag,
    BoxFit? fit,
    double offset = 0.0,
    bool hidePlaceHolder = false,
    bool cache = true,
  }) {
    if (url.isEmpty) {
      return FutureBuilder<bool>(
        future: Future.delayed(const Duration(seconds: 5), () => false),
        initialData: true,
        builder: (context, snapshot) {
          final showSkeleton = snapshot.data ?? true;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: showSkeleton
                ? Skeleton(
                    width: width,
                    height: width,
                    borderRadius: 0,
                  )
                : SizedBox(
                    width: width,
                    height: height,
                    child: const Icon(Icons.error_outline),
                  ),
          );
        },
      );
    }

    return ExtendedImage.network(
      url,
      height: height,
      width: width,
      fit: fit,
      cache: cache,
      enableMemoryCache: cache,
      enableLoadState: false,
      loadStateChanged: (state) {
        Widget widget;
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            widget = hidePlaceHolder
                ? const SizedBox.shrink()
                : Skeleton(
                    width: width ?? 100,
                    height: height ?? 100,
                    borderRadius: 0,
                  );
            break;
          case LoadState.completed:
            widget = ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: width,
              height: height,
              fit: fit,
            );
            break;
          case LoadState.failed:
            widget = Container(
              width: width,
              height: height,
              color: Colors.grey.shade100,
            );
            break;
        }
        return widget;
      },
    );
  }
}
