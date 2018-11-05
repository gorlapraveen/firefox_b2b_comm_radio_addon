/*
Connect to the "gnu_radio" device.
*/
var port = browser.runtime.connectNative("gnu_radio");

/*
Listen responses from the radio.
*/
port.onMessage.addListener((response) => {
  console.log("Received: " + response);
});

/*
On a click on the browser action, send the singnal to radio.
*/
browser.browserAction.onClicked.addListener(() => {
  console.log("Sending:  Connected");
  port.postMessage("Connected");
});
