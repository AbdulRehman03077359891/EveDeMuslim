// // Optimized function for generating a response from the bot based on user input
// void _botBrain(String userMessage) {
//   // Correct spelling errors in the user message
//   userMessage = correctSpelling(userMessage);

//   // Default response if no match is found
//   String defaultResponse =
//       "I'm not sure how to respond to that. Could you rephrase your question?";
//   String response = defaultResponse;

//   // Attempt to match keywords and generate a response
//   response = _findResponse(userMessage) ??
//       _tryAlternateForms(userMessage) ??
//       _checkForExactPhraseMatch(userMessage) ??
//       defaultResponse;

//   // Send the bot's response
//   _botReply(response, false);
// }

// String? _findResponse(String userMessage) {
//   // Normalize the user message
//   userMessage = userMessage.toLowerCase();

//   for (var keyword in botKnowledgeBase.keys) {
//     if (containsForms(userMessage, keyword)) {
//       var interrogators = botKnowledgeBase[keyword];

//       for (var interrogator in interrogators.keys) {
//         if (containsSynonym(userMessage, interrogator)) {
//           var contexts = interrogators[interrogator];

//           for (var context in contexts.keys) {
//             if (context.isEmpty || containsSynonym(userMessage, context)) {
//               return _selectRandomResponse(contexts[context]["responses"]);
//             }
//           }
//         }
//       }
//     }
//   }

//   return null;
// }

// // Function to handle plural and singular forms of the user message
// String? _tryAlternateForms(String userMessage) {
//   String pluralMessage = convertSentenceToPlural(userMessage);
//   String singularMessage = convertSentenceToSingular(userMessage);

//   return _findResponse(pluralMessage) ?? _findResponse(singularMessage);
// }

// // Function to get a default response from the context
// String? _getDefaultResponse(Map<String, dynamic> interrogatorContext) {
//   final defaultContext = interrogatorContext["contexts"].firstWhere(
//     (context) => (context["word"] as String).isEmpty,
//     orElse: () => null,
//   );
//   return defaultContext != null
//       ? _selectRandomResponse(defaultContext["responses"])
//       : null;
// }

// // Function to check for exact phrase matches
// String? _checkForExactPhraseMatch(String userMessage) {
//   for (var entry in botKnowledgeBase) {
//     if (entry.containsKey("exactPhrases")) {
//       for (String phrase in entry["exactPhrases"]) {
//         if (userMessage.toLowerCase().contains(phrase.toLowerCase())) {
//           return _selectRandomResponse(entry["responses"]);
//         }
//       }
//     }
//   }
//   return null;
// }

// // Utility function to select a random response from a list
// String _selectRandomResponse(List<dynamic> responses) {
//   return responses[_random.nextInt(responses.length)] as String;
// }

// // Helper function for bot's reply logic
// void _botReply(String response, bool isTyping) {
//   // Logic to display or send the bot's response
// }
