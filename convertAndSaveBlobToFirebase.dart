// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart'; // Seu caminho para o Firebase Storage

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:record/record.dart';
import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';

Future<String?> convertAndSaveBlobToFirebase(String blobUrl) async {
  try {
    // Faz o download do arquivo Blob
    final response = await http.get(Uri.parse(blobUrl));
    if (response.statusCode != 200) {
      throw Exception('Falha ao baixar o arquivo: ${response.statusCode}');
    }
    Uint8List fileBytes = response.bodyBytes;

    // Obtém o caminho para salvar no Firebase
    String directoryPath = '/users/' + currentUserUid + '/audio-recordings';
    String fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.opus';
    String storagePath = '$directoryPath/$fileName';

    // Faz o upload para o Firebase Storage e retorna a URL
    String? downloadUrl = await uploadData(storagePath, fileBytes);
    return downloadUrl;
  } catch (e) {
    print('Erro na conversão ou upload do arquivo: $e');
    throw e;
  }
}
