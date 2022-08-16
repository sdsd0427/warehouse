<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://cdn.jsdelivr.net/gh/gitbrent/pptxgenjs@3.10.0/dist/pptxgen.bundle.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/pptxgenjs@3.10.0/libs/jszip.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/pptxgenjs@3.10.0/dist/pptxgen.min.js"></script> -->
</head>
<body>
<button id="presentBtn" style="display: none;">Present</button>
<script type="text/javascript">
//The Present button is visible if at least one presentation display is available
var presentBtn = document.getElementById("presentBtn");
// It is also possible to use relative presentation URL e.g. "presentation.html"
var presUrls = ["https://example.com/presentation.html",
                "https://example.net/alternate.html"];
// show or hide present button depending on display availability
var handleAvailabilityChange = function(available) {
  presentBtn.style.display = available ? "inline" : "none";
};
// Promise is resolved as soon as the presentation display availability is
// known.
var request = new PresentationRequest(presUrls);
request.getAvailability().then(function(availability) {
  // availability.value may be kept up-to-date by the controlling UA as long
  // as the availability object is alive. It is advised for the Web developers
  // to discard the object as soon as it's not needed.
  handleAvailabilityChange(availability.value);
  availability.onchange = function() { handleAvailabilityChange(this.value); };
}).catch(function() {
  // Availability monitoring is not supported by the platform, so discovery of
  // presentation displays will happen only after request.start() is called.
  // Pretend the devices are available for simplicity; or, one could implement
  // a third state for the button.
  handleAvailabilityChange(true);
});

presentBtn.onclick = function () {
    // Start new presentation.
    request.start()
      // The connection to the presentation will be passed to setConnection on
      // success.
      .then(setConnection);
      // Otherwise, the user canceled the selection dialog or no screens were
      // found.
  };
</script>
</body>
</html>