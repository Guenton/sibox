const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth20").Strategy;
const googleCredentials = require("./passport-google-cred");
// const handler = require("./passport-google-handler");

passport.use(
  new GoogleStrategy(googleCredentials, (accessToken, refreshToken, profile, callback) => {
    // User.findOrCreate({ googleId: profile.id, googleImg: profile.image.url }, (err, user) => {
    //   return callback(err, user);
    // });
  })
);

module.exports = passport;
