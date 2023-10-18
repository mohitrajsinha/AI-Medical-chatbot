import 'main.welltested_test.mocks.dart';import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:chat_gpt_02/main.dart';
import 'package:chat_gpt_02/chat_screen.dart';

@GenerateMocks([DotEnv, MyApp])
void main() {
  late MockDotEnv mockDotEnv;
  late MyApp myApp;

  setUp(() {
    mockDotEnv = MockDotEnv();
    myApp = MyApp();
    when(mockDotEnv.load(fileName: "assets/.env")).thenAnswer((_) async => {});
  });

  testWidgets('App should run', (WidgetTester tester) async {
    await tester.pumpWidget(myApp);

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('ChatScreen should be the home screen', (WidgetTester tester) async {
    await tester.pumpWidget(myApp);

    expect(find.byType(ChatScreen), findsOneWidget);
  });

  test('DotEnv should load environment variables', () async {
    main();

    verify(mockDotEnv.load(fileName: "assets/.env")).called(1);
  });
}