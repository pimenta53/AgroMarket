(function() {
  $(function() {
    return $('div.load-more-ads').on('inview', function(e, visible) {
      if (!(visible && $(this).attr('href') !== '#')) {
        return;
      }
      return $.getScript($(this).attr('href'));
    });
  });

}).call(this);
