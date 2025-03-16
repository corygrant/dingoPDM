document.addEventListener('DOMContentLoaded', function() {
    // Wait a bit for MkDocs to finish rendering
    setTimeout(function() {
      // Force a resize event which often triggers chart rendering
      window.dispatchEvent(new Event('resize'));
    }, 300);
});