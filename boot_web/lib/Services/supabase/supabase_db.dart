import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDB {
  static final supabase = Supabase.instance.client;

  //Select/Get
  static Future<List<Map<String, dynamic>>> SelectData({
    List<String>? columns,
    required String table,
  }) async {
    try {
      if (columns == null || columns.isEmpty) {
        return await supabase.from(table).select();
      }
      return await supabase.from(table).select(columns.join(', '));
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  static Future<Map<String, dynamic>> GetDataValue({
    required String table,
    required String column,
    required dynamic value,
  }) async {
    try {
      return await supabase.from(table).select().eq(column, value).single();
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  static Future<Map<String, dynamic>> GetRowData({
    required String table,
    required dynamic rowID,
  }) async {
    try {
      return await supabase.from(table).select().eq('id', rowID).single();
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  //Insert
  static Future<void> InsertData({
    required String table,
    Map<String, dynamic>? data,
    List<Map<String, dynamic>>? bulkData,
  }) async {
    // Ensure exactly one parameter is provided
    if ((data == null && bulkData == null) ||
        (data != null && bulkData != null)) {
      throw ArgumentError(
        'Provide either data or bulkData, but not both or neither',
      );
    }

    try {
      if (data != null) {
        await supabase.from(table).insert(data);
      } else {
        await supabase.from(table).insert(bulkData!);
      }
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  //Update
  static Future<void> UpdateData({
    required String table,
    required Map<String, dynamic> data,
    required String column,
    required dynamic value,
  }) async {
    try {
      await supabase.from(table).update(data).eq(column, value);
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  static Future<List<Map<String, dynamic>>> UpdateAndReturnData({
    required String table,
    required Map<String, dynamic> data,
    required String column,
    required dynamic value,
  }) async {
    try {
      final response = await supabase
          .from(table)
          .update(data)
          .eq(column, value)
          .select();
      return response;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  //Upsert
  static Future<List<Map<String, dynamic>>> UpsertData({
    required String table,
    required String onConflict,
    required bool defaultToNull,
    required bool ignoreDuplicates,
    Map<String, dynamic>? data,
    List<Map<String, dynamic>>? bulkData,
  }) async {
    // Ensure exactly one parameter is provided
    if ((data == null && bulkData == null) ||
        (data != null && bulkData != null)) {
      throw ArgumentError(
        'Provide either data or bulkData, but not both or neither',
      );
    }

    try {
      if (data != null) {
        return await supabase
            .from(table)
            .upsert(
              data,
              onConflict: onConflict,
              defaultToNull: defaultToNull,
              ignoreDuplicates: ignoreDuplicates,
            )
            .select();
      } else {
        return await supabase
            .from(table)
            .upsert(
              bulkData!,
              onConflict: onConflict,
              defaultToNull: defaultToNull,
              ignoreDuplicates: ignoreDuplicates,
            )
            .select();
      }
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  //Delete
  static Future<void> DeleteData({
    required String table,
    required String column,
    dynamic value,
    List<dynamic>? values,
  }) async {
    // Ensure exactly one parameter is provided
    if ((value == null && values == null) ||
        (value != null && values != null)) {
      throw ArgumentError(
        'Provide either value or values, but not both or neither',
      );
    }

    try {
      if (value != null) {
        await supabase.from(table).delete().eq(column, value);
      } else {
        await supabase.from(table).delete().inFilter(column, values!);
      }
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
