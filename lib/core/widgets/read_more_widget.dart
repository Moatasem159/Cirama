import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
class ReadMoreWidget extends StatefulWidget {
  final String content;
  const ReadMoreWidget({super.key, required this.content});
  @override
  State<ReadMoreWidget> createState() => _ReadMoreWidgetState();
}
class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool _readMore = false;
  void _onTapLink() {
    setState(() {
      _readMore = !_readMore;
    });
  }
  @override
  Widget build(BuildContext context) {
    final TextSpan text = TextSpan(text: widget.content);
    return  LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final TextStyle style = TextStyle(
          fontFamily: "poppins",
          fontFamilyFallback: ["poppins", "cairo"],
          color: context.primaryColor,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          fontSize: 14,
          decorationColor: Colors.white,
          height: 1.5
      );
      TextSpan link = TextSpan(
        text: !_readMore ?context.locale.seeMore: context.locale.seeLess,
        style: style,
        recognizer: TapGestureRecognizer()..onTap = _onTapLink,
      );
      TextPainter textPainter = TextPainter(
        text: link,
        textDirection: Directionality.of(context),
        textScaler:  MediaQuery.textScalerOf(context),
        maxLines: 4,
      );
      textPainter.layout(minWidth: 0, maxWidth: maxWidth);
      final Size linkSize = textPainter.size;
      textPainter.text = text;
      textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
      final Size textSize = textPainter.size;
      int endIndex;
      if (linkSize.width < maxWidth) {
        final double readMoreSize = linkSize.width;
        final TextPosition pos = textPainter.getPositionForOffset(Offset(readMoreSize, textSize.height));
        endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
      }
      else {
        TextPosition pos = textPainter.getPositionForOffset(textSize.bottomLeft(Offset.zero));
        endIndex = pos.offset;
      }
      TextSpan textSpan1;
      if (textPainter.didExceedMaxLines) {
        textSpan1 = TextSpan(
          text: !_readMore
              ? widget.content.substring(0, endIndex) +("... ")
              : "${widget.content} ",
          children:[link],
          recognizer: TapGestureRecognizer()..onTap = _onTapLink,
        );
      }
      else {
        textSpan1 = TextSpan(text: widget.content,  recognizer: TapGestureRecognizer()..onTap = _onTapLink);
      }
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 800),
       sizeCurve:Curves.fastLinearToSlowEaseIn,
        crossFadeState: _readMore
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: Text.rich(
          textSpan1,
          textScaler: MediaQuery.textScalerOf(context),
        ),
        secondChild: Text.rich(
          textSpan1,
          textScaler: MediaQuery.textScalerOf(context),
        ),
      );
    });
  }
}