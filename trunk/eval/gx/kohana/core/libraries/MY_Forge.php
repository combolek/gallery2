<?php
class Forge extends Forge_Core {
  public function render($template='form_template.html', $custom=false) {
    return parent::render($template, $custom);
  }
}