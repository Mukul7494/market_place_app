import 'package:appwrite/appwrite.dart';

class ApiClient {
  static Client client = Client();
  static Account account = Account(client);
  static Storage storage = Storage(client);
  static Databases database = Databases(client);
  static Locale local = Locale(client);
  static Functions functions = Functions(client);
  static Avatars avatars = Avatars(client);
  static Teams teams = Teams(client);
  static Realtime realtime = Realtime(client);
}
