<form method="post" action="<?= url::site('user/register') ?>">
    <?= $email->label() ?>
    <br />
    <?= $email->render() ?>
    <br />
    <?= $email_errors ?>
    <br /><br />
    <?= $username->label() ?>
    <br />
    <?= $username->render() ?>
    <br />
    <?= $username_errors ?>
    <br />
    <?= $password->label() ?>
    <br />
    <?= $password->render() ?>
    <br />
    <?= $password_errors ?>
    <br /><br />
    <?= $password2->label() ?>
    <br />
    <?= $password2->render() ?>
    <br /><br />
    <input type="submit" value="Register" />
</form>