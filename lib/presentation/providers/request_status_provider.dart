import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RequestStatus { failed, success, inProgress }

final requestStatusProvider =
    StateProvider<RequestStatus>((ref) => RequestStatus.inProgress);
