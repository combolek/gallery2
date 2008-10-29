<? $currentRow = 0; ?>
<? $currentColumn = 0; ?>

<div id="gAlbumGrid">
  <div id="gAlbumGridHeader">
    <h1><?= $item->title; ?></h1>
    <span class="understate">(interesting information about the Album)</span>
    <a href="#" id="gSlideshowLink" class="buttonlink">view slideshow</a>
  </div>
  
  <? foreach ($children as $child): ?>
    <? $firstcol = '' ?>
    <? if ($currentColumn >= $maxColumns): ?>
      <? $currentRow++; $currentColumn = 0; ?>
    <? endif; ?>
    <? if ($currentColumn == 0): ?>
      <?  $firstcol = 'first'; ?>
    <? endif; ?>
    
  <div class="gAlbumContainer <?=$firstcol ?> gAlbum">
    <? $path = 'var/thumbnails/' . $child->id . '.jpg'; ?>
    <?= html::anchor(
      "$child->type/$child->id",
            html::image(array(
              'src' => $path, 
              'id' => 'photo-id-' . $child->id, 
              'class' => 'photo', 
              'alt' => $child->title
            )));
      ?>
      <h2>Album title</h2>
      <ul class="gMetadata">
        <li>Views: 321</li>
        <li>By: <a href="#">username</a></li>
      </ul>
    </div><!-- end gAlbumContainer -->
    <? $currentColumn++; ?>
  <? endforeach; ?>

  <!-- Fill the rest of the page with empty image holders -->
  <? for (; $currentRow < $maxRows; $currentRow++ ): ?>
  <? for (; $currentColumn < $maxColumns; $currentColumn++ ): ?>
    <? $firstcol = '' ?>
    <? if ($currentColumn == 0): ?>
      <?  $firstcol = 'first'; ?>
    <? endif; ?>
  <div class="gItemContainer <?=$firstcol ?> gItem">
    <img class="photo" id="photo-id-1" class="photo" alt="photo" />
    <h2>Item title</h2>
    <ul class="gMetadata">
      <li>Views: 321</li>
      <li>By: <a href="#">username</a></li>
    </ul>
  </div>
  <? endfor; ?>
  <? $currentColumn =  0 ?>
  <? endfor; ?>
      
  <div id="gPagination">
  	Items 1-10 of 34
  	<span class="first_inactive">first</span>
  	<span class="previous_inactive">previous</span>
  	<a href="#" class="next">next</a>
  	<a href="#" class="last">last</a>
  </div>

</div><!-- end gAlbumGrid -->

