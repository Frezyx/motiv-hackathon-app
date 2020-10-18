import 'package:motiv_hackathon_app/data/api/real/config.dart';
import 'handlers/auth.dart';

import 'handlers/history.dart';
import 'handlers/resume.dart';

class Server {
  static final AuthHandlers regHandlers = AuthHandlers(
    apiPath: ServerConfig.path,
  );
  static final resumeHeaders = ResumeHeaders(
    apiPath: ServerConfig.path,
  );
  static final historyHeaders = HistoryHeaders(
    apiPath: ServerConfig.path,
  );
}
