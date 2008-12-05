String.prototype.startsWith = function(str) {
  return (this.match("^" + str) == str);
};

$("document").ready(function() {
  $(".ui-tabs-nav:not(:first)").css("display", "none");
  $(".ui-tabs-nav li a").click(function () {
    var href = $(this).attr("href");
    if (href.startswith("#")) {
      return false;
    }
    return true;
  });
});
