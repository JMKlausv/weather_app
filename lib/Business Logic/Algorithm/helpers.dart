// String getInterest(bankName){
//     var bankInterest;
//     banks.forEach((e) => {
//      bankName == e['name'] ? bankInterest = e['interest'] : '0',
//     });
//     return bankInterest.toString();
//   }

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

class Helpers {

  dynamic handleResponse(_response) {
    // Step 1: Access response body
    var responseBody = _response.body;

    // Step 2: Replace any non-UTF-8 characters with safe replacements or remove them
    var cleanedResponse = responseBody.replaceAll(RegExp(r'[^\x00-\x7F]'), '');

    // Step 3: Attempt to decode the cleaned response
    var decodedResponse = jsonDecode(cleanedResponse);

    print(decodedResponse);
    return decodedResponse;
  }
}
