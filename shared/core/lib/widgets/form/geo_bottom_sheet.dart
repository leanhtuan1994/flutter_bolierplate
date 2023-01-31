// ignore_for_file: constant_identifier_names

import 'package:diacritic/diacritic.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/extensions.dart';
import '../separator.dart';

const double ITEM_HEIGHT = 80;
const double MIN_HEADER_HEIGHT = 30;
const double MAX_HEADER_HEIGHT = 80;

class GeoBottomItem<T> {
  final String text;
  final T value;
  const GeoBottomItem({required this.text, required this.value});
}

class GeoBottomSheet<T> extends StatefulWidget {
  static Future<T?> show<T>(
    BuildContext context, {
    required List<GeoBottomItem> items,
    required String title,
    bool showSearchBar = true,
    Widget Function(GeoBottomItem)? builder,
  }) async {
    return showModalBottomSheet(
      elevation: 1.0,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) {
        return GeoBottomSheet<T>(
          title: title,
          items: items,
          showSearchBox: showSearchBar,
          builder: builder,
        );
      },
    );
  }

  final List<GeoBottomItem> items;
  final String title;
  final bool showSearchBox;
  final Widget Function(GeoBottomItem)? builder;
  const GeoBottomSheet(
      {Key? key,
      required this.items,
      required this.title,
      this.showSearchBox = true,
      this.builder})
      : super(key: key);

  @override
  State<GeoBottomSheet> createState() => _GeoBottomSheetState();
}

class _GeoBottomSheetState extends State<GeoBottomSheet> {
  List<GeoBottomItem> _temp = [];

  @override
  void initState() {
    super.initState();
    _temp = widget.items;
  }

  void _onChangedText(String value) {
    setState(() {
      _temp = value.isEmpty
          ? widget.items
          : widget.items
              .where((element) => removeDiacritics(element.text)
                  .toLowerCase()
                  .contains(removeDiacritics(value).toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;

    final totalLength = items.length >= 3 ? items.length : 3;

    final maxHeight = context.height / 2;
    final headerHeight =
        widget.showSearchBox ? MAX_HEADER_HEIGHT : MIN_HEADER_HEIGHT;
    final totalHeight = (totalLength * ITEM_HEIGHT) + headerHeight;

    return Padding(
      padding: EdgeInsets.only(bottom: context.mediaQueryViewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightForFinite(
          height: totalHeight > maxHeight ? maxHeight : totalHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "",
                        ),
                      ),
                    )
                  ]),
            ),
            if (widget.showSearchBox) ...[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: context.colorScheme.outline),
                ),
                height: 54,
                child: FormBuilderTextField(
                  style: const TextStyle(fontSize: 12),
                  name: 'search',
                  onChanged: (value) {
                    EasyDebounce.debounce(
                        "search-geo-bottom", const Duration(milliseconds: 300),
                        () {
                      if (value != null) {
                        _onChangedText(value);
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: SizedBox(
                      width: 30,
                      height: 100,
                      child: Icon(Icons.search, color: Colors.grey, size: 24),
                    ),
                    border: InputBorder.none,
                    hintText: "",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      bottom: 15,
                      right: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0)
            ],
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListView.separated(
                  itemBuilder: (context, index) => _buildItem(_temp[index]),
                  separatorBuilder: (context, index) => const Separator(),
                  itemCount: _temp.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem(GeoBottomItem<dynamic> e) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, e.value);
      },
      child: widget.builder != null
          ? widget.builder!(e)
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }
}
