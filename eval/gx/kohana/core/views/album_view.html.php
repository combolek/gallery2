<? $currentRow = 0; ?>
<? $currentColumn = 0; ?>

<div id="gContent" class="clearfix">

  <div class="gMetadata">
    <a href="#" id="gSlideshowLink" class="buttonlink">view slideshow</a>
    <h1><?= $item->title; ?></h1>
    <div class="understate">(interesting information about the Album)</div>
  </div>
  
  <ul class="gAlbumGrid">
  
  <? foreach ($children as $child): ?>
    <? $firstcol = '' ?>
    <? if ($currentColumn >= $maxColumns): ?>
      <? $currentRow++; $currentColumn = 0; ?>
    <? endif; ?>
    <? if ($currentColumn == 0): ?>
      <?  $firstcol = ' gFirst'; ?>
    <? endif; ?>
    
    <li id="gItem-<?=$child->id?>" class="gItem<?=$firstcol?> gAlbum">
      <? $path = 'var/thumbnails/' . $child->id . '.jpg'; ?>
      <?= html::anchor(
        "$child->type/$child->id",
              html::image(array(
                'src' => $path, 
                'id' => 'gThumb-' . $child->id, 
                'class' => 'gThumbnail', 
                'alt' => $child->title
              )));
        ?>
      <h2><?=$child->title ?></h2>
      <ul class="gMetadata">
        <li>Views: 321</li>
        <li>By: <a href="#">username</a></li>
      </ul>
    </li>
    <? $currentColumn++; ?>
  <? endforeach; ?>

  <!-- Fill the rest of the page with empty image holders -->
  <? for (; $currentRow < $maxRows; $currentRow++ ): ?>
  <? for (; $currentColumn < $maxColumns; $currentColumn++ ): ?>
    <? $firstcol = '' ?>
    <? if ($currentColumn == 0): ?>
      <?  $firstcol = ' gFirst'; ?>
    <? endif; ?>
    <li id="gItem-10" class="gItem<?=$firstcol ?>">
      <img src="" id="gItemId-10" class="gThumbnail gPlaceholder" alt="Photo" />
      <h2>Item title</h2>
      <ul class="gMetadata">
        <li>Views: 321</li>
        <li>By: <a href="#">username</a></li>
      </ul>
    </li>
  <? endfor; ?>
  <? $currentColumn =  0 ?>
  <? endfor; ?>
  </ul><!-- end gAlbumGrid -->
      
  <div id="gPagination" class="clearfix">
  	Items 1-10 of 34
  	<span class="first_inactive">first</span>
  	<span class="previous_inactive">previous</span>
  	<a href="#" class="next">next</a>
  	<a href="#" class="last">last</a>
  </div>

</div><!-- end gContent -->
