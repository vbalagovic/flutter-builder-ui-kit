// lib/src/inputs/date_input.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'text_input.dart';

enum DatePickerType {
  calendar,
  dropdown,
  inputOnly,
}

class DateRange {
  final DateTime start;
  final DateTime end;

  const DateRange({
    required this.start,
    required this.end,
  });

  bool contains(DateTime date) {
    return date.isAfter(start.subtract(const Duration(days: 1))) &&
        date.isBefore(end.add(const Duration(days: 1)));
  }
}

class DateInputStyle extends TextInputStyle {
  final DatePickerType pickerType;
  final String dateFormat;
  final Locale? locale;
  final Widget? calendarIcon;
  final Color? iconColor;
  final double? iconSize;
  final DateRange? allowedRange;
  final List<DateTime>? selectableDates;
  final List<DateTime>? disabledDates;
  final List<int>? selectableWeekDays;
  final bool showWeekdays;
  final bool showWeekNumbers;
  final EdgeInsets? pickerPadding;
  final BoxDecoration? pickerDecoration;
  final TextStyle? pickerHeaderStyle;
  final TextStyle? pickerDayStyle;
  final TextStyle? pickerWeekdayStyle;
  final TextStyle? pickerSelectedDayStyle;
  final Color? pickerSelectedDayColor;
  final Color? pickerTodayColor;
  final Color? pickerDisabledDayColor;
  final bool confirmOnDateSelected;
  final String? confirmText;
  final String? cancelText;
  final bool showToday;
  final bool showClear;
  final bool weekStartsOnSunday;
  final Duration pickerTransitionDuration;
  final bool useRootNavigator;

  const DateInputStyle({
    super.decoration,
    super.textStyle,
    super.contentPadding,
    super.borderRadius,
    super.fillColor,
    super.focusColor,
    super.errorColor,
    super.labelStyle,
    super.hintStyle,
    super.errorStyle,
    super.animationDuration,
    super.border,
    super.focusedBorder,
    super.errorBorder,
    super.shadow,
    this.pickerType = DatePickerType.calendar,
    this.dateFormat = 'yyyy-MM-dd',
    this.locale,
    this.calendarIcon,
    this.iconColor,
    this.iconSize = 24,
    this.allowedRange,
    this.selectableDates,
    this.disabledDates,
    this.selectableWeekDays,
    this.showWeekdays = true,
    this.showWeekNumbers = false,
    this.pickerPadding,
    this.pickerDecoration,
    this.pickerHeaderStyle,
    this.pickerDayStyle,
    this.pickerWeekdayStyle,
    this.pickerSelectedDayStyle,
    this.pickerSelectedDayColor,
    this.pickerTodayColor,
    this.pickerDisabledDayColor,
    this.confirmOnDateSelected = false,
    this.confirmText,
    this.cancelText,
    this.showToday = true,
    this.showClear = true,
    this.weekStartsOnSunday = false,
    this.pickerTransitionDuration = const Duration(milliseconds: 300),
    this.useRootNavigator = true,
  });

  @override
  DateInputStyle copyWith({
    InputDecoration? decoration,
    TextStyle? textStyle,
    EdgeInsets? contentPadding,
    double? borderRadius,
    Color? fillColor,
    Color? focusColor,
    Color? errorColor,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    Duration? animationDuration,
    BorderSide? border,
    BorderSide? focusedBorder,
    BorderSide? errorBorder,
    BoxShadow? shadow,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    bool? showCursor,
    DatePickerType? pickerType,
    String? dateFormat,
    Locale? locale,
    Widget? calendarIcon,
    Color? iconColor,
    double? iconSize,
    DateRange? allowedRange,
    List<DateTime>? selectableDates,
    List<DateTime>? disabledDates,
    List<int>? selectableWeekDays,
    bool? showWeekdays,
    bool? showWeekNumbers,
    EdgeInsets? pickerPadding,
    BoxDecoration? pickerDecoration,
    TextStyle? pickerHeaderStyle,
    TextStyle? pickerDayStyle,
    TextStyle? pickerWeekdayStyle,
    TextStyle? pickerSelectedDayStyle,
    Color? pickerSelectedDayColor,
    Color? pickerTodayColor,
    Color? pickerDisabledDayColor,
    bool? confirmOnDateSelected,
    String? confirmText,
    String? cancelText,
    bool? showToday,
    bool? showClear,
    bool? weekStartsOnSunday,
    Duration? pickerTransitionDuration,
    bool? useRootNavigator,
  }) {
    return DateInputStyle(
      decoration: decoration ?? this.decoration,
      textStyle: textStyle ?? this.textStyle,
      contentPadding: contentPadding ?? this.contentPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      fillColor: fillColor ?? this.fillColor,
      focusColor: focusColor ?? this.focusColor,
      errorColor: errorColor ?? this.errorColor,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      animationDuration: animationDuration ?? this.animationDuration,
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      shadow: shadow ?? this.shadow,
      pickerType: pickerType ?? this.pickerType,
      dateFormat: dateFormat ?? this.dateFormat,
      locale: locale ?? this.locale,
      calendarIcon: calendarIcon ?? this.calendarIcon,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      allowedRange: allowedRange ?? this.allowedRange,
      selectableDates: selectableDates ?? this.selectableDates,
      disabledDates: disabledDates ?? this.disabledDates,
      selectableWeekDays: selectableWeekDays ?? this.selectableWeekDays,
      showWeekdays: showWeekdays ?? this.showWeekdays,
      showWeekNumbers: showWeekNumbers ?? this.showWeekNumbers,
      pickerPadding: pickerPadding ?? this.pickerPadding,
      pickerDecoration: pickerDecoration ?? this.pickerDecoration,
      pickerHeaderStyle: pickerHeaderStyle ?? this.pickerHeaderStyle,
      pickerDayStyle: pickerDayStyle ?? this.pickerDayStyle,
      pickerWeekdayStyle: pickerWeekdayStyle ?? this.pickerWeekdayStyle,
      pickerSelectedDayStyle:
          pickerSelectedDayStyle ?? this.pickerSelectedDayStyle,
      pickerSelectedDayColor:
          pickerSelectedDayColor ?? this.pickerSelectedDayColor,
      pickerTodayColor: pickerTodayColor ?? this.pickerTodayColor,
      pickerDisabledDayColor:
          pickerDisabledDayColor ?? this.pickerDisabledDayColor,
      confirmOnDateSelected:
          confirmOnDateSelected ?? this.confirmOnDateSelected,
      confirmText: confirmText ?? this.confirmText,
      cancelText: cancelText ?? this.cancelText,
      showToday: showToday ?? this.showToday,
      showClear: showClear ?? this.showClear,
      weekStartsOnSunday: weekStartsOnSunday ?? this.weekStartsOnSunday,
      pickerTransitionDuration:
          pickerTransitionDuration ?? this.pickerTransitionDuration,
      useRootNavigator: useRootNavigator ?? this.useRootNavigator,
    );
  }
}

class DateInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final DateTime? initialValue;
  final ValueChanged<DateTime?>? onChanged;
  final FormFieldValidator<DateTime>? validator;
  final DateInputStyle? style;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool required;
  final bool enabled;
  final VoidCallback? onEditingComplete;
  final bool autofocus;

  const DateInput({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.style,
    this.controller,
    this.focusNode,
    this.required = false,
    this.enabled = true,
    this.onEditingComplete,
    this.autofocus = false,
  });

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  DateTime? _selectedDate;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue;
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _initializeDateFormat();
    _updateTextValue();
  }

  void _initializeDateFormat() {
    final style = widget.style ?? const DateInputStyle();
    _dateFormat =
        DateFormat.yMd(style.locale?.toString()).addPattern(style.dateFormat);
  }

  void _updateTextValue() {
    if (_selectedDate != null) {
      _controller.text = _dateFormat.format(_selectedDate!);
    } else {
      _controller.clear();
    }
  }

  Future<void> _showDatePicker() async {
    final style = widget.style ?? const DateInputStyle();
    final theme = Theme.of(context);

    switch (style.pickerType) {
      case DatePickerType.calendar:
        final date = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: style.allowedRange?.start ?? DateTime(1900),
          lastDate: style.allowedRange?.end ?? DateTime(2100),
          locale: style.locale,
          builder: (context, child) {
            return Theme(
              data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                  primary:
                      style.pickerSelectedDayColor ?? theme.colorScheme.primary,
                ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          _updateDate(date);
        }
        break;

      case DatePickerType.dropdown:
        await _showDropdownPicker();
        break;

      case DatePickerType.inputOnly:
        // Do nothing, only allow manual input
        break;
    }
  }

  Future<void> _showDropdownPicker() async {
    final style = widget.style ?? const DateInputStyle();
    final date = await showDialog<DateTime>(
      context: context,
      useRootNavigator: style.useRootNavigator,
      builder: (context) => _DatePickerDialog(
        initialDate: _selectedDate ?? DateTime.now(),
        style: style,
      ),
    );
    if (date != null) {
      _updateDate(date);
    }
  }

  void _updateDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _updateTextValue();
    });
    widget.onChanged?.call(date);
  }

  bool _isValidDate(String value) {
    try {
      _dateFormat.parseStrict(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return widget.required ? '${widget.label ?? "Date"} is required' : null;
    }

    if (!_isValidDate(value)) {
      return 'Please enter a valid date';
    }

    final date = _dateFormat.parse(value);
    final style = widget.style ?? const DateInputStyle();

    if (style.allowedRange != null && !style.allowedRange!.contains(date)) {
      return 'Date must be between ${_dateFormat.format(style.allowedRange!.start)} and ${_dateFormat.format(style.allowedRange!.end)}';
    }

    if (style.selectableDates != null &&
        !style.selectableDates!.any((d) =>
            d.year == date.year &&
            d.month == date.month &&
            d.day == date.day)) {
      return 'This date is not available for selection';
    }

    if (style.disabledDates != null &&
        style.disabledDates!.any((d) =>
            d.year == date.year &&
            d.month == date.month &&
            d.day == date.day)) {
      return 'This date is not available for selection';
    }

    if (style.selectableWeekDays != null &&
        !style.selectableWeekDays!.contains(date.weekday)) {
      return 'This day of the week is not available for selection';
    }

    return widget.validator?.call(date);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = widget.style ?? const DateInputStyle();

    return StyledTextInput(
      controller: _controller,
      focusNode: _focusNode,
      label: widget.label ?? 'Date',
      hint: widget.hint ?? style.dateFormat,
      enabled: widget.enabled,
      required: widget.required,
      validator: _validateDate,
      style: style,
      onEditingComplete: widget.onEditingComplete,
      autofocus: widget.autofocus,
      suffix: IconButton(
        icon: style.calendarIcon ??
            Icon(
              Icons.calendar_today,
              size: style.iconSize,
              color: style.iconColor ?? theme.colorScheme.primary,
            ),
        onPressed: widget.enabled ? _showDatePicker : null,
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          _selectedDate = null;
          widget.onChanged?.call(null);
        } else if (_isValidDate(value)) {
          final date = _dateFormat.parse(value);
          _selectedDate = date;
          widget.onChanged?.call(date);
        }
      },
    );
  }
}

class _DatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateInputStyle style;

  const _DatePickerDialog({
    required this.initialDate,
    required this.style,
  });

  @override
  State<_DatePickerDialog> createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<_DatePickerDialog> {
  late DateTime _selectedDate;
  late int _selectedYear;
  late int _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _selectedYear = widget.initialDate.year;
    _selectedMonth = widget.initialDate.month;
  }

  List<Widget> _buildYearDropdown() {
    final start = widget.style.allowedRange?.start ?? DateTime(1900);
    final end = widget.style.allowedRange?.end ?? DateTime(2100);

    return [
      DropdownButton<int>(
        value: _selectedYear,
        items: List.generate(
          end.year - start.year + 1,
          (index) => DropdownMenuItem(
            value: start.year + index,
            child: Text('${start.year + index}'),
          ),
        ),
        onChanged: (year) {
          if (year != null) {
            setState(() => _selectedYear = year);
            _updateSelectedDate();
          }
        },
      ),
    ];
  }

  List<Widget> _buildMonthDropdown() {
    return [
      DropdownButton<int>(
        value: _selectedMonth,
        items: List.generate(
          12,
          (index) => DropdownMenuItem(
            value: index + 1,
            child: Text(
              DateFormat.MMMM(widget.style.locale?.toString())
                  .format(DateTime(2000, index + 1)),
            ),
          ),
        ),
        onChanged: (month) {
          if (month != null) {
            setState(() => _selectedMonth = month);
            _updateSelectedDate();
          }
        },
      ),
    ];
  }

  List<Widget> _buildDayGrid() {
    final daysInMonth = DateTime(_selectedYear, _selectedMonth + 1, 0).day;
    final firstDayOfMonth = DateTime(_selectedYear, _selectedMonth, 1);
    final firstWeekday = widget.style.weekStartsOnSunday
        ? firstDayOfMonth.weekday % 7
        : (firstDayOfMonth.weekday - 1) % 7;

    return [
      if (widget.style.showWeekdays)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            final weekdayIndex =
                widget.style.weekStartsOnSunday ? (index) % 7 : (index + 1) % 7;
            return Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Text(
                DateFormat.E(widget.style.locale?.toString())
                    .format(DateTime(2000, 1, weekdayIndex + 3)),
                style: widget.style.pickerWeekdayStyle,
              ),
            );
          }),
        ),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 42,
        itemBuilder: (context, index) {
          final dayNumber = index - firstWeekday + 1;
          if (dayNumber < 1 || dayNumber > daysInMonth) {
            return const SizedBox();
          }

          final date = DateTime(_selectedYear, _selectedMonth, dayNumber);
          final isSelected = _selectedDate.year == date.year &&
              _selectedDate.month == date.month &&
              _selectedDate.day == date.day;
          final isToday = DateTime.now().year == date.year &&
              DateTime.now().month == date.month &&
              DateTime.now().day == date.day;
          final isDisabled = _isDateDisabled(date);

          return _DayButton(
            date: date,
            isSelected: isSelected,
            isToday: isToday,
            isDisabled: isDisabled,
            style: widget.style,
            onTap: isDisabled ? null : () => _selectDate(date),
          );
        },
      ),
    ];
  }

  bool _isDateDisabled(DateTime date) {
    final style = widget.style;

    if (style.allowedRange != null && !style.allowedRange!.contains(date)) {
      return true;
    }

    if (style.selectableDates != null &&
        !style.selectableDates!.any((d) =>
            d.year == date.year &&
            d.month == date.month &&
            d.day == date.day)) {
      return true;
    }

    if (style.disabledDates != null &&
        style.disabledDates!.any((d) =>
            d.year == date.year &&
            d.month == date.month &&
            d.day == date.day)) {
      return true;
    }

    if (style.selectableWeekDays != null &&
        !style.selectableWeekDays!.contains(date.weekday)) {
      return true;
    }

    return false;
  }

  void _updateSelectedDate() {
    final daysInMonth = DateTime(_selectedYear, _selectedMonth + 1, 0).day;
    final day = min(_selectedDate.day, daysInMonth);
    setState(() {
      _selectedDate = DateTime(_selectedYear, _selectedMonth, day);
    });
  }

  void _selectDate(DateTime date) {
    setState(() => _selectedDate = date);
    if (widget.style.confirmOnDateSelected) {
      Navigator.of(context).pop(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Container(
        padding: widget.style.pickerPadding ?? const EdgeInsets.all(16),
        decoration: widget.style.pickerDecoration ??
            BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    setState(() {
                      if (_selectedMonth > 1) {
                        _selectedMonth--;
                      } else {
                        _selectedMonth = 12;
                        _selectedYear--;
                      }
                      _updateSelectedDate();
                    });
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ..._buildMonthDropdown(),
                    const SizedBox(width: 8),
                    ..._buildYearDropdown(),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    setState(() {
                      if (_selectedMonth < 12) {
                        _selectedMonth++;
                      } else {
                        _selectedMonth = 1;
                        _selectedYear++;
                      }
                      _updateSelectedDate();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ..._buildDayGrid(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.style.showToday)
                  TextButton(
                    onPressed: () {
                      final now = DateTime.now();
                      setState(() {
                        _selectedDate = now;
                        _selectedYear = now.year;
                        _selectedMonth = now.month;
                      });
                    },
                    child: const Text('Today'),
                  ),
                if (widget.style.showClear)
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    child: Text(widget.style.cancelText ?? 'Clear'),
                  ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(_selectedDate),
                  child: Text(widget.style.confirmText ?? 'OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DayButton extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final bool isDisabled;
  final DateInputStyle style;
  final VoidCallback? onTap;

  const _DayButton({
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.isDisabled,
    required this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? style.pickerSelectedDayColor ?? theme.colorScheme.primary
                : isToday
                    ? style.pickerTodayColor ??
                        theme.colorScheme.primary.withOpacity(0.1)
                    : null,
          ),
          alignment: Alignment.center,
          child: Text(
            date.day.toString(),
            style: isSelected
                ? style.pickerSelectedDayStyle ??
                    TextStyle(color: theme.colorScheme.onPrimary)
                : isDisabled
                    ? TextStyle(
                        color:
                            style.pickerDisabledDayColor ?? theme.disabledColor)
                    : style.pickerDayStyle,
          ),
        ),
      ),
    );
  }
}
