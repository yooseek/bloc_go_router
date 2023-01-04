import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'injection_container.dart';

void main() async {
  await initializeDependencies();
  await ScreenUtil.ensureScreenSize();

  runApp(
    const App(),
  );
}