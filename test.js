$(document).ready(function(){

	function write(txt) {
		$("#console").append(txt + "<br/>")
	}

	write(_("Humpty Dumpty sat on a wall,"));
	write(_("Humpty Dumpty had a great fall."));
	write(_("All the king's horses, And all the king's men,"));
	write(_("Couldn't put Humpty together again."));

})