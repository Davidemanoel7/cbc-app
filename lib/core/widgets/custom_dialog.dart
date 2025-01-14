import 'package:cbc/core/constants/global_widgets.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      this.title,
      this.secondaryTitle,
      this.subtitle,
      this.imagePath,
      this.widgetSubtitle,
      this.buttons,
      this.showCloseButton = true});

  final String? title;
  final String? secondaryTitle;
  final String? subtitle;
  final Widget? widgetSubtitle;
  final String? imagePath;
  final List<Widget>? buttons;
  final bool? showCloseButton;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          decoration: radiusDecoration(border: const Border(
            top: BorderSide(color: Colors.amber, width: 4),),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: showCloseButton ?? true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: title != null,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              child: Text(
                                title ?? "",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: imagePath != null,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Image.asset(imagePath ?? ''),
                          ),
                        ),
                        Visibility(
                          visible: secondaryTitle != null,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              child: Text(
                                secondaryTitle ?? "",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: subtitle != null,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              child: Text(
                                subtitle ?? '',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: widgetSubtitle != null,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: widgetSubtitle ?? const SizedBox(),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: buttons ?? [],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
