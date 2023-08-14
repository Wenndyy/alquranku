// To parse this JSON data, do
//
//     final detailSurahResponse = detailSurahResponseFromJson(jsonString);

import 'dart:convert';

DetailSurahResponse detailSurahResponseFromJson(String str) =>
    DetailSurahResponse.fromJson(json.decode(str));

String detailSurahResponseToJson(DetailSurahResponse data) =>
    json.encode(data.toJson());

class DetailSurahResponse {
  final int? code;
  final String? message;
  final Data? data;

  DetailSurahResponse({
    this.code,
    this.message,
    this.data,
  });

  factory DetailSurahResponse.fromJson(Map<String, dynamic> json) =>
      DetailSurahResponse(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final Map<String, String>? audioFull;
  final List<Ayat>? ayat;
  final SuratSenya? suratSelanjutnya;
  final SuratSenya? suratSebelumnya;

  Data({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: json["suratSelanjutnya"] == null
            ? null
            : SuratSenya.fromJson(json["suratSelanjutnya"]),
        /* suratSebelumnya: json["suratSebelumnya"] == null
            ? null
            : SuratSenya.fromJson(json["suratSebelumnya"]), */
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": ayat == null
            ? []
            : List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya?.toJson(),
        "suratSebelumnya": suratSebelumnya?.toJson(),
      };
}

class Ayat {
  final int? nomorAyat;
  final String? teksArab;
  final String? teksLatin;
  final String? teksIndonesia;
  final Map<String, String>? audio;

  Ayat({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio":
            Map.from(audio!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class SuratSenya {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;

  SuratSenya({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
  });

  factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
