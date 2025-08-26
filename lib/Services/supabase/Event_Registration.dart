import 'supabase_db.dart';

class Event_Registration {
  static Future<void> RSVP(String name, String email, bool notify) async {
    try {
      await SupabaseDB.InsertData(
        table: 'rsvp_list',
        data: {'name': name, 'email': email, 'notify': notify},
      );
    } catch (e) {
      throw Exception('Failed to RSVP: ${e.toString()}');
    }
  }

  static Future<void> Volunteer(
    String name,
    String email,
    List<String> like_to_help,
    String anything_else,
    List<String> skills,
    String experience,
  ) async {
    try {
      await SupabaseDB.InsertData(
        table: 'pending_volunteer_list',
        data: {
          'name': name,
          'email': email,
          'like_to_help': like_to_help,
          'anything_else': anything_else,
          'skills': skills,
          'experience': experience,
        },
      );
    } catch (e) {
      throw Exception('Failed to Volunteer: ${e.toString()}');
    }
  }
}
