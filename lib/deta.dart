import 'package:http/http.dart' as http;
import 'dart:convert';
import 'review.dart';
import 'envelope.dart';

class DetaService {
  final key = 'b0nwc6hd_tWSS1TeWchacsya99DTFe8hPPVxNq1HA';
  final id = '';
  

  
  Future<bool> postThing(Review review) async {
    final url = 'https://database.deta.sh/v1/b0nwc6hd/tldr/items';
    final uri = Uri.parse(url);
    final envelope = Envelope(review);
    final string = jsonEncode(envelope);
    await http
        .post(
      uri,
      headers: {
        'X-API-Key': key,
        'content-type': 'application/json',
      },
      body: string,
    )
        .then((response) {
      if (response.statusCode < 300) {
        return true;
      }
    });
    return false;
  }
  Future<http.Response> fetchMessages() async {
  final url = 'https://database.deta.sh/v1/b097bqyc/asdf/query';
  final uri = Uri.parse(url);
  return await http.post(uri,
      headers: {
        'X-API-Key': 'b0nwc6hd_tWSS1TeWchacsya99DTFe8hPPVxNq1HA',
        'content-type': 'application/json',
      },
      body: '{}');
  
  }
  
}

  
