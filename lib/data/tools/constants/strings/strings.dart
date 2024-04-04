RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');

RegExp passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

/*
r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length
$
*/

/// this regex with special character
// RegExp passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
