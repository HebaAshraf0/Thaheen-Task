import 'package:flutter/material.dart';
import 'package:thaheen_task/app/theme/app_text_styles.dart';

enum _AppTextVariant { primary, secondary, action }

class AppText extends StatelessWidget {
  const AppText._(
    this.text, {
    required _AppTextVariant variant,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.style,
    super.key,
  }) : _variant = variant;

  factory AppText.primary(
    String text, {
    Key? key,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
    TextStyle? style,
  }) {
    return AppText._(
      text,
      key: key,
      variant: _AppTextVariant.primary,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: style,
    );
  }

  factory AppText.secondary(
    String text, {
    Key? key,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
    TextStyle? style,
  }) {
    return AppText._(
      text,
      key: key,
      variant: _AppTextVariant.secondary,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: style,
    );
  }

  factory AppText.action(
    String text, {
    Key? key,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
    TextStyle? style,
  }) {
    return AppText._(
      text,
      key: key,
      variant: _AppTextVariant.action,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: style,
    );
  }

  final String text;
  final _AppTextVariant _variant;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseStyle = switch (_variant) {
      _AppTextVariant.primary => AppTextStyles.primary.copyWith(
          color: colorScheme.onSurface,
        ),
      _AppTextVariant.secondary => AppTextStyles.secondary.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      _AppTextVariant.action => AppTextStyles.action.copyWith(
          color: colorScheme.onPrimaryContainer,
        ),
    };

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: baseStyle.merge(style),
    );
  }
}
