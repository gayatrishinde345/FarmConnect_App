import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../l10n/app_localizations.dart';
import '../business_logic/bloc/language_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.profile)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
          const SizedBox(height: 16),
          Text(l.profileComingSoon, textAlign: TextAlign.center),
          const SizedBox(height: 28),
          Text(l.language, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: [
              ButtonSegment(value: 'en', label: Text(l.english)),
              ButtonSegment(value: 'mr', label: Text(l.marathi)),
              ButtonSegment(value: 'hi', label: Text(l.hindi)),
            ],
            selected: {context.watch<LanguageBloc>().state.code},
            onSelectionChanged: (values) =>
                context.read<LanguageBloc>().add(ChangeLanguage(values.first)),
          ),
        ],
      ),
    );
  }
}
