<?php defined('SYSPATH') or die('No direct script access.');
class Comment_Core {
  static function Reset() {
    $db = Database::instance('default');
    $db->query('DROP TABLE IF EXISTS `comments`;');
    $db->query('CREATE TABLE  `comments` (
                  `id` int(9) NOT NULL auto_increment,
                  `author` char(255) default NULL,
                  `email` char(255) default NULL,
                  `text` text,
                  `datetime` int(9) default 0,
                  `item_id` int(9) default NULL,
                  PRIMARY KEY  (`id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;');
  }

  static function Populate() {
    $comment = ORM::factory('comment');
    $comment->author = "Andy";
    $comment->email = "andy@foo.com";
    $comment->text = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.';
    $comment->item_id = 2;
    $comment->datetime = time();
    $comment->save();

    $comment = ORM::factory('comment');
    $comment->author = "Tim";
    $comment->email = "tim@foo.com";
    $comment->text = "Woot!";
    $comment->datetime = time();
    $comment->item_id = 2;
    $comment->save();
    print html::anchor("data/reset", "reset");
  }

  static function ShowComments($item_id) {
    $v = new View('show_comment.html');

    $v->comment_list = Comment::ShowCommentList($item_id);
    $v->comment_form = Comment::ShowCommentForm($item_id);
    $v->render(true);
  }

  static function ShowCommentList($item_id) {
    $v = new View('comment_list.html');
    $v->item_id = $item_id;
    $v->comments = ORM::factory('Comment')->where('item_id', $item_id)
      ->orderby('datetime', 'desc')
      ->limit(3)->find_all()->as_array();
    return $v;
  }

  static function ShowCommentForm($item_id) {
    $v = new View('comment_form.html');
    $v->item_id = $item_id;
    return $v;
  }
}
?>