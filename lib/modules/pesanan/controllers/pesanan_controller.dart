import 'package:get/get.dart';
import '../../../data/models/pesanan_model.dart';

class PesananController extends GetxController {
  var pesananList = <PesananModel>[
    PesananModel(nama: "SMA Negeri 1", status: "sewing", jumlah: 50),
    PesananModel(nama: "PT Maju Jaya", status: "pending", jumlah: 100),
    PesananModel(nama: "Komunitas Sepeda", status: "printing", jumlah: 20),
  ].obs;
}