double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double total = itemPrice;
  var delivery = deliveryFee ?? 500;

  if (delivery < 500) {
    delivery = 500;
  }

  if (promoCode == "SAVE10") {
    total = total * 0.9;
  }
  total += delivery;

  print('OrderID : $orderId');
  print('Item price: $itemPrice ₸');
  print('Promo code: ${promoCode ?? 'None'}');
  print('Delivery fee: $delivery ₸');
  print('Final total: $total ₸');

  return total;
}

void main() {
  final total = processOrder(
    orderId: 'ORD-001',
    itemPrice: 10000.0,
    promoCode: 'SAVE10',
  );

  print('Returned total: $total ₸');
  print("-----------------------");
  processOrder(
    orderId: 'ORD-002',
    itemPrice: 1000.0,
    promoCode: 'SAVE10',
    deliveryFee: 200,
  );

  print("-----------------------");
  processOrder(
    orderId: 'ORD-002',
    itemPrice: 1000.0,
    promoCode: 'SAVE10',
    deliveryFee: 700,
  );
}
