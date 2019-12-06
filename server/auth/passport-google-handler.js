const db = require("../db/mysql");
// /////////////////////////////////////
// Passport oAuth2.0 Reply Handler ////
// ///////////////////////////////////
const replyHandler = (accessToken, refreshToken, profile, callback) => {
  if (getLinkedEmpId(profile.id)) {
  } else if (getUnlinkedEmpId(profile.id)) {
  } else {
  }
};

// /////////////////////////////
// Bypass for Linked EmpId ////
// ///////////////////////////
const sqlGetLinkedEmpId = `
  SELECT emp.empmain_id
  FROM (emp_main emp
  JOIN emp_google goo ON emp.empmain_id = goo.empmain_id)
  WHERE emp.is_deleted = false AND goo.google_id = ?
`;
const getLinkedEmpId = async googleId => {
  try {
    const emp = await db.query(sqlGetLinkedEmpId, [googleId]);
    return emp.empmain_id[0];
  } catch (err) {
    console.error(err);
  }
};

// ///////////////////////////////
// Bypass for Unlinked EmpId ////
// /////////////////////////////
const sqlGetUnlinkedEmpId = "SELECT empmain_id FROM emp_google WHERE google_id = ?";
const getUnlinkedEmpId = async googleId => {
  try {
    const emp = await db.query(sqlGetUnlinkedEmpId, [googleId]);
    return emp.empmain_id[0];
  } catch (err) {
    console.error(err);
  }
};

// const sqlStoreGoogleReply = "INSERT INTO emp_google (google_id, img_url) VALUES (?, ?)";

module.exports = replyHandler;
