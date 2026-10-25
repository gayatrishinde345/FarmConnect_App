import 'package:flutter_test/flutter_test.dart';
import 'package:farmconnect_app/main.dart';

void main() {
  testWidgets('FarmConnect renders the marketplace shell', (tester) async {
    await tester.pumpWidget(const FarmConnectApp());
    await tester.pumpAndSettle();
    expect(find.text('FarmConnect'), findsOneWidget);
    expect(find.text('Fresh from farms, closer to you'), findsOneWidget);
  });
}
