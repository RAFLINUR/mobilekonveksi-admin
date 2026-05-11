import 'package:get/get.dart';
import '../../../data/models/stok_model.dart';

class StokController extends GetxController {
  var stokList = <StokModel>[
    StokModel(nama: "Kain Katun", jumlah: 50, satuan: "meter", minimalStok: 20),
    StokModel(nama: "Benang Hitam", jumlah: 10, satuan: "roll", minimalStok: 15),
    StokModel(nama: "Kancing", jumlah: 0, satuan: "pcs", minimalStok: 30),
  ].obs;

  void tambahStok(int index, int jumlahTambah) {
    final item = stokList[index];
    stokList[index] = StokModel(
      nama: item.nama,
      jumlah: item.jumlah + jumlahTambah,
      satuan: item.satuan,
      minimalStok: item.minimalStok,
    );
  }
}