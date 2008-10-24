//var oElement = document.getElementById("gCommentAdd");
function addComment(e) {
  var author, email, text, comment, li, i; 

  // Prevent form submission
  e.preventDefault(); 
  
  // Write comment to the database...
  
  // Get form input values
  author = document.getElementById('gCommentAuthor').value;
  email = document.getElementById('gCommentEmail').value;
  text = document.getElementById('gCommentText').value;
  
  // How many comments exist?
  i = YAHOO.util.Dom.getElementsByClassName('gComment').length + 1;
  
  // Put the comment in a new list element
  var li = document.createElement('li');
  li.id = 'gComment-' + i;
  li.innerHTML = '<p><a href="' + email + '" class="gAuthor">' + author + '</a> ' + 
  	' said 30 minutes ago <span class="gDate understate">(October 23, 2008 4:00pm)</span></p>' + 
  	'<div class="gText">' + text + '</div>';
  
  // Append new list item to the comment thread          
  var elCommentThread = new YAHOO.util.Element('gCommentThread');
	elCommentThread.appendChild(li);
               
  // Highlight the new comment
  var alertColor = new YAHOO.util.ColorAnim("gComment-3", {
  	backgroundColor: { to: '#FCF1D2' }
  }, 1);
  
  var origColor = new YAHOO.util.ColorAnim("gComment-3", {
	backgroundColor: { to: '#fff' }
  }, 1);
  
  // Chain the alert animation to reset to the original bg color
  alertColor.onComplete.subscribe(function() {
    origColor.animate();
  });
  
  alertColor.animate();
}

YAHOO.util.Event.addListener('gCommentAdd', 'submit', addComment); 
