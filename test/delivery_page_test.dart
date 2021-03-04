import 'package:flutter_test/flutter_test.dart';
import 'package:irisi/screens/delivery/delivery_detail.dart';

void main() {
  testWidgets('This will test the Home Page', (WidgetTester tester) async {
    await tester.pumpWidget(DeliveryDetail(
        data: 'Dynamic Data', fav: 'This is to confirm favourites object'));

    // Create Finders
    final dataFinder = find.text('Dynamic Data');
    final favFinder = find.text('This is to confirm favourites object');

    expect(dataFinder, findsOneWidget);
    expect(favFinder, findsOneWidget);
  });
}
