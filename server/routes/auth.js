const express = require("express");
const router = express.Router();
// const jwtAuthz = require("express-jwt-authz");
const passport = require("../auth/passport-google");

// const checkScopes = jwtAuthz(["read:messages"]);

// ////////////////////////
// Auth0 Auth Handlers ///
// //////////////////////
router.get("/test", async (req, res) => {
  await console.log(req.params);
  res.send("Got it");
});

// /////////////////////////
// Google Auth Handlers ///
// ///////////////////////
router.get("/google", passport.authenticate("google", { scope: ["profile"] }));

router.get(
  "/google-callback",
  passport.authenticate("google", { failureRedirect: "/" }),
  (req, res) => {
    // TODO Authentication stuffs
    res.redirect("/home");
  }
);
