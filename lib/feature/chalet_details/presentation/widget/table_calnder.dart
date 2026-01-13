import 'package:flutter/material.dart';
import 'package:seave/core/utils/app_color.dart'; // لون AppColors.primary
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({
    super.key,
    this.pricePerNight = 800,
    this.onBookingChanged, // هي
  });
  final int pricePerNight;

  // Callback بيرجع عدد الليالي والتوتال
  final void Function(int nights, int totalPrice)? onBookingChanged;

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime _focusedDay = DateTime.now();
  int _numberOfNights = 0;

  // الأيام المحجوزة للتجربة
  final List<DateTime> _bookedDays = [
    DateTime(2026, 1, 10),
    DateTime(2026, 1, 11),
    DateTime(2026, 1, 12),
  ];

  bool _isBooked(DateTime day) {
    return _bookedDays.any((bookedDay) => isSameDay(bookedDay, day));
  }

  bool _isInRange(DateTime day) {
    if (_startDate == null || _endDate == null) return false;
    return day.isAfter(_startDate!) && day.isBefore(_endDate!);
  }

  bool _rangeHasBookedDays(DateTime start, DateTime end) {
    DateTime temp = start;
    while (!temp.isAfter(end)) {
      if (_isBooked(temp)) return true;
      temp = temp.add(const Duration(days: 1));
    }
    return false;
  }

  String _arabicNumber(int number) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.toString().replaceAllMapped(
      RegExp(r'\d'),
      (match) => arabicDigits[int.parse(match.group(0)!)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ar_EG',
      firstDay: DateTime.now(),
      lastDay: DateTime(2100),
      focusedDay: _focusedDay,

      enabledDayPredicate: (day) {
        // الأيام متاحة لو مش محجوزة ولها تاريخ بعد اليوم الحالي
        if (_isBooked(day)) return false;
        if (day.isBefore(DateTime.now()) && !isSameDay(day, DateTime.now()))
          return false;
        return true; // اليوم الحالي + الأيام المستقبلية المتاحة
      },

      selectedDayPredicate: (day) =>
          isSameDay(_startDate, day) || isSameDay(_endDate, day),

      calendarBuilders: CalendarBuilders(
        // اليوم الحالي
        todayBuilder: (context, day, focusedDay) {
          String arabicNumber = _arabicNumber(day.day);
          return Container(
            margin: const EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.3), // لون خفيف
              shape: BoxShape.circle,
            ),
            child: Text(
              arabicNumber,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },

        // الأيام المحجوزة
        disabledBuilder: (context, day, focusedDay) {
          String arabicNumber = _arabicNumber(day.day);

          if (_isBooked(day)) {
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Text(
                arabicNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          // الأيام الماضية بدون لون أحمر
          return Center(
            child: Text(
              arabicNumber,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },

        // الأيام العادية و الفترات المختارة
        defaultBuilder: (context, day, focusedDay) {
          String arabicNumber = _arabicNumber(day.day);

          if (_isInRange(day)) {
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Text(
                arabicNumber,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }

          return Center(
            child: Text(
              arabicNumber,
              style: const TextStyle(color: Colors.black),
            ),
          );
        },

        // اليوم الأول و اليوم الثاني
        selectedBuilder: (context, day, focusedDay) {
          String arabicNumber = _arabicNumber(day.day);

          if (isSameDay(day, _startDate)) {
            // اليوم الأول
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primary, // اليوم الأول بلون رئيسي
                shape: BoxShape.circle,
              ),
              child: Text(
                arabicNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (isSameDay(day, _endDate)) {
            // اليوم الثاني
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primary, // اليوم الثاني
                shape: BoxShape.circle,
              ),
              child: Text(
                arabicNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          // الأيام بينهما
          if (_isInRange(day)) {
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primary400,
                shape: BoxShape.circle,
              ),
              child: Text(
                arabicNumber,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }

          return Center(
            child: Text(
              arabicNumber,
              style: const TextStyle(color: Colors.black),
            ),
          );
        },
      ),

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (_startDate == null || (_startDate != null && _endDate != null)) {
            _startDate = selectedDay;
            _endDate = null;
          } else if (_startDate != null && _endDate == null) {
            if (selectedDay.isBefore(_startDate!)) {
              _startDate = selectedDay;
            } else {
              // منع الحجز لو أي يوم في الرينج محجوز
              if (_rangeHasBookedDays(_startDate!, selectedDay)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'لا يمكن الحجز، يوجد أيام محجوزة في هذه الفترة',
                    ),
                  ),
                );
                _startDate = selectedDay;
                _endDate = null;
              } else {
                _endDate = selectedDay;
              }
            }
          }

          _focusedDay = focusedDay;
          // حساب عدد الليالي
          if (_startDate != null && _endDate != null) {
            _numberOfNights = _endDate!.difference(_startDate!).inDays;
            int totalPrice = _numberOfNights * widget.pricePerNight;

            // ✅ طلع عدد الليالي + التوتال بره
            if (widget.onBookingChanged != null) {
              widget.onBookingChanged!(_numberOfNights, totalPrice);
            }
          } else {
            _numberOfNights = 0;
            if (widget.onBookingChanged != null) {
              widget.onBookingChanged!(0, 0);
            }
          }
        });
      },
    );
  }
}
