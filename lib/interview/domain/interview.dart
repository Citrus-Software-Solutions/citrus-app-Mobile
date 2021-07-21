import 'package:citrus_app_mobile/interview/domain/values/values.dart';

class Interview {
  InterviewId _id;
  StartDate _startDate;
  AccessURL _accessURL;
  InterviewStatus _status;
  Duration _duration;

  Interview(
      this._id, this._startDate, this._accessURL, this._status, this._duration);

  InterviewId get id => _id;

  String get idToString => _id.idToString;

  StartDate get startDate => _startDate;

  DateTime get startDateAsDate => _startDate.date;

  AccessURL get accessURL => _accessURL;

  String get accessURLToString => _accessURL.url;

  InterviewStatus get status => _status;

  String get statusToString => _status.status;

  Duration get duration => _duration;

  String get durationToString => _duration.durationToString;
}
