part of 'app_pages.dart';

abstract class Routes {
  static const threads = _Paths.threads;
  static const threadDetails = _Paths.threadDetails;
  static const calendar = _Paths.calendar;
  static const search = _Paths.search;
  static const settings = _Paths.settings;
}

abstract class _Paths {
  static const threads = '/threads';
  static const threadDetails = '/:threadId';
  static const calendar = '/calendar';
  static const search = '/search';
  static const settings = '/settings';
}
