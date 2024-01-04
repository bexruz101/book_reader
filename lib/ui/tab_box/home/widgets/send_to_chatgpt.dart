import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getChatGptResponse(String userInput) async {
  String apiKey = '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';
  String apiUrl = 'https://api.openai.com/v1/chat/completions';

  // Add the "model" parameter to the request payload
  Map<String, dynamic> requestBody = {
    "model": "gpt-3.5-turbo",
    "messages": [
      {"role": "system", "content": "You are a helpful assistant.",},
      {"role": "user", "content": "${"Hello, could you please explain the meaning of the sentence '$userInput'? "}"}
    ]
  };

  try {
    // Make the POST request to ChatGPT API
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode(requestBody),
    );

    // Parse and extract information from the response
    if (response.statusCode == 200) {
      // Parse the response data as a Map
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Extract the desired information
      String generatedText = responseData['choices'][0]['message']['content'];
      return generatedText;
    } else {
      // Handle errors explicitly
      print("Error: ${response.statusCode}");
      print("Response: ${response.body}");
      return "Error occurred";
    }
  } catch (e) {
    // Handle HTTP errors explicitly
    print("HTTP Error: $e");
    return "Error occurred";
  }
}
