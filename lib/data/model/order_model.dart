class OrderModel {
  final String orderId;
  final String productId;
  final int count;
  final num totalPrice;
  final String createdAt;
  final String userId;
  final String orderStatus;

  OrderModel(
      {required this.orderId,
      required this.productId,
      required this.count,
      required this.totalPrice,
      required this.createdAt,
      required this.userId,
      required this.orderStatus});

  OrderModel copWith({
    int? count,
    num? totalPrice,
    String? orderId,
    String? productId,
    String? userId,
    String? orderStatus,
    String? createdAt,
  }) =>
      OrderModel(
        count: count ?? this.count,
        totalPrice: totalPrice ?? this.totalPrice,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
        userId: userId ?? this.userId,
        orderStatus: orderStatus ?? this.orderStatus,
        createdAt: createdAt ?? this.createdAt,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as String? ?? "",
      productId: json['product_id'] as String? ?? "",
      count: json['count'] as int? ?? 0,
      totalPrice: json['total_price'] as num? ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      orderStatus: json['order_status'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'product_id': productId,
      'count': count,
      'total_price': totalPrice,
      'created_at': createdAt,
      'user_id': userId,
      'order_status': orderId,
    };
  }
}
