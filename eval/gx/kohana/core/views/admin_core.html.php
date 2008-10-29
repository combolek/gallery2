<h1>Admin: Core</h1>

<? foreach($data as $category => $descriptors): ?> </p>
  <h2><?=$category; ?> </h2>
  <ul>
    <? foreach($descriptors as $descriptors): ?>
      <li><?=html::anchor($descriptors['route'], $descriptors['description']); ?></li>
    <? endforeach; ?>
  </ul>
<? endforeach; ?>