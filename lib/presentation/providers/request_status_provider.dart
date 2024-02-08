import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RequestStatus { failed, success, inProgress, noConnection }

final requestStatusProvider =
    StateProvider<RequestStatus>((ref) => RequestStatus.inProgress);
