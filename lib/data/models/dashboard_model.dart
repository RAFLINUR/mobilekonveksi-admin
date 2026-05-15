class DashboardModel {

  final int totalOrder;
  final int pending;
  final int sewing;
  final int printing;
  final int done;

  DashboardModel({

    required this.totalOrder,
    required this.pending,
    required this.sewing,
    required this.printing,
    required this.done,

  });

  factory DashboardModel.fromJson(
    Map<String, dynamic> json,
  ){

    return DashboardModel(

      totalOrder:
          json['total_order'] ?? 0,

      pending:
          json['pending'] ?? 0,

      sewing:
          json['sewing'] ?? 0,

      printing:
          json['printing'] ?? 0,

      done:
          json['done'] ?? 0,

    );

  }

}