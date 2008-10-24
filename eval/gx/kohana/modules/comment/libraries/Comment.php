<?php defined('SYSPATH') or die('No direct script access.');
class Comment_Core {
  static function Reset() {
    $forge = new Dbforge();
    $forge->drop_table('comments');
    $forge->add_field('id');
    $forge->add_field(array('author' => array('type' => 'CHAR', 'constraint' => 255)));
    $forge->add_field(array('email' => array('type' => 'CHAR', 'constraint' => 255)));
    $forge->add_field(array('text' => array('type' => 'TEXT')));
    $forge->add_field(array('item_id' => array('type' => 'INT', 'constraint' => 9)));
    $forge->create_table('comments');
  }

  static function Populate() {
    $comment = ORM::factory('comment');
    $comment->author = "Andy";
    $comment->email = "andy@foo.com";
    $comment->text = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.';
    $comment->item_id = 2;
    $comment->save();

    $comment = ORM::factory('comment');
    $comment->author = "Tim";
    $comment->email = "tim@foo.com";
    $comment->text = "Woot!";
    $comment->item_id = 2;
    $comment->save();
    print html::anchor("data/reset", "reset");
  }

  static function ShowComments($item_id) {
    $v = new View('show_comment');
    $v->set('comments', ORM::factory('Comment')->where('item_id', $item_id)->find_all());
    $v->render(true);
  }
}
?>