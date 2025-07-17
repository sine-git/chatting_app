/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
exports.sendNotification = functions.firestore
    .document('messages/{messageId}')
    .onCreate((snapshot, context) => {
      const message = snapshot.data();
      const payload = {
        notification: {
          title: 'New Message',
          body: message.text,
        }
      };
      return admin.messaging().sendToTopic('messages', payload);
    });

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
