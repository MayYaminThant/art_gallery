class Customer {
  final String customerId;
  final String customerName;
  final String? customerStatus;
  final String? createdDate;
  final String? modifiedDate;

  Customer({
    required this.customerId,
    required this.customerName,
    this.customerStatus,
    this.createdDate,
    this.modifiedDate,
  });
}
