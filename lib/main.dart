import 'package:flutter/material.dart';
import 'theme/terminal_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/Home.dart';
import 'pages/Sponsor.dart';

const supabaseUrl = 'https://zbtphhtuaovleoxkoemt.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpidHBoaHR1YW92bGVveGtvZW10Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU0NjU4MDEsImV4cCI6MjA3MTA0MTgwMX0.qogFGForru9M9rutCcMQSNJuGpP46LpLdWo03lvYqMQ';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boot Web',
      theme: buildTerminalTheme(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
