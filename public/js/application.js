jQuery(function()
{
		

	$('img#close').click(function()
	{
		$('div#lightbox, img#close, div#shadow').toggle('fade');
		$('div#lightbox').html('');
	});
	
	$('a#button').click(function()
	{
		
	});
	
		
});

(function() {

  $(window).load(function() {
    $('a.delete').click(function() {
      if (!confirm('This cannot be undone! Continue?')) {
        return false;
      }
    });
  });

}).call(this);