import 'package:flutter/material.dart';

import '../services/local/preference.dart';
import '../services/remote/home_service.dart';

class HomeProvider extends ChangeNotifier {
  final HomeService _homeService;
  final PreferenceService _preferenceService;
  HomeProvider(
    this._homeService,
    this._preferenceService,
  );
}
