import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/Languagecubit/languagecubit.dart';
import 'package:notes_add/cubit/Themecubit/ThemeCubit.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/cubit/lovecubit/lovecubut.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/views/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await NotificationServices.init();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<Note_Model>(Knotesbox);

  runApp(const notesapp());
}

class notesapp extends StatelessWidget {
  const notesapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => NoteCubit()),
        RepositoryProvider(create: (context) => lovecubit()),
        RepositoryProvider(create: (context) => Themecubit()),
        RepositoryProvider(create: (context) => Langcubit()),
      ],
      child: BlocBuilder<Langcubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<Themecubit, ThemeData>(
            builder: (context, theme) {
              return MaterialApp(
                locale: locale,
                theme: theme,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const NoteVewBody(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
