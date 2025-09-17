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
    String slackId,
    String gtihubURL,
  ) async {
    try {
      final data = {
        'name': name,
        'email': email,
        'like_to_help': like_to_help,
        'anything_else': anything_else,
        'skills': skills,
        'experience': experience,
        'slack_id': slackId,
        'github_url': gtihubURL,
      };

      await SupabaseDB.InsertData(table: 'pending_volunteer_list', data: data);
    } catch (e) {
      throw Exception('Failed to Volunteer: ${e.toString()}');
    }
  }

  static Future<void> Sponsor(
    String company_Name,
    String contact_Name,
    String contact_Email,
    String message,
  ) async {
    try {
      await SupabaseDB.InsertData(
        table: 'sponsors',
        data: {
          'organization': company_Name,
          'name': contact_Name,
          'email': contact_Email,
          'message': message,
        },
      );
    } catch (e) {
      throw Exception('Failed to Upload Sponsor Inquiry: ${e.toString()}');
    }
  }
}
