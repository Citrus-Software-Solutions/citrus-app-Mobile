// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  final Interview interview;

  const Event(this.title, this.interview);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1,
        (index) => Event(
            'Event $item | ${index + 1}',
            mInterview(
                DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5)))))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1', mInterview(kToday)),
      Event('Today\'s Event 2', mInterview(kToday)),
    ],
  });

Map<DateTime, List<Event>> get keventSource => _kEventSource;

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 1, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year + 1, kToday.month + 2, kToday.day);
Interview mInterview(DateTime date) {
  return Interview(InterviewId(1), StartDate(date), AccessURL('www.google.com'),
      InterviewStatus(0), Duration(7), InterviewTitle('Titulo'));
}
