part of 'app_pages.dart';

abstract class Routes {
  static const threads = _Paths.threads;
  static const thread = _Paths.threads + _Paths.id;
  static const compose = _Paths.compose;
  static const search = _Paths.search;
  static const setting = _Paths.setting;

  static String THREAD({required int id}) => '$threads/$id';
  static String COMPOSE_SUB_THREAD({required int id}) => '$threads/$id$compose';
}

abstract class _Paths {
  static const threads = '/threads';
  static const id = '/:id';
  static const compose = '/compose';
  static const search = '/search';
  static const setting = '/setting';
}
