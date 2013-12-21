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
      if (!confirm('Delete this workshop only if it has been cancelled. Deleting this workshop will remove it from the total number of workshops given. Select OK to delete.')) {
        return false;
      }
    });
  });

}).call(this);