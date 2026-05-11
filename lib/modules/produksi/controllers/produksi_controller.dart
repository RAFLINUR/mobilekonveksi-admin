import 'package:get/get.dart';

class ProduksiModel {
  final String nama;
  final int currentStep;

  ProduksiModel({
    required this.nama,
    required this.currentStep,
  });
}

class ProduksiController extends GetxController {
  var produksiList = <ProduksiModel>[
    ProduksiModel(nama: "SMA Negeri 1", currentStep: 1),
    ProduksiModel(nama: "PT Maju Jaya", currentStep: 2),
    ProduksiModel(nama: "Komunitas Sepeda", currentStep: 3),
  ].obs;

  final steps = ["Pending", "Sewing", "Printing", "Selesai"];
}