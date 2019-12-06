// //////////////////////////////////////////
// Passport oAuth2.0 Google Credentials ////
// ////////////////////////////////////////
const googleCredentials = {
  clientID: process.env.GOOGLE_CLIENT_ID,
  clientSecret: process.env.GOOGLE_CLIENT_SECRET,
  callbackURL: "/google-callback"
};

module.exports = googleCredentials;
