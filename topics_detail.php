<?php
require 'db.php';
require 'user_required.php';

$stmt_cat = $db->prepare("SELECT topics.topic_name as title, posts.post_date, topics.topic_date as topic_date, post_by, post_text as text, users.username as users FROM posts join topics on topics.topic_id = posts.post_topic join users on users.id_user = posts.post_by WHERE topic_id=? ORDER by post_date DESC");
$stmt_cat->execute(array($_GET['topic_id']));
$topic = $stmt_cat->fetchAll();

$stmt_top = $db->prepare("SELECT * from topics WHERE topic_id=?");
$stmt_top->execute(array($_GET['topic_id']));
$topic_name = $stmt_top->fetch();
if (!$topic_name){
    echo $topic_name;
    echo "id je " . $_GET['topic_id'];
    die("Unable to find category!");
}

if (!empty($_POST)) {
    $stmt = $db->prepare("INSERT INTO posts(post_text, post_date, post_topic, post_by) VALUES (?, ?, ?, ?)");
    $stmt->execute(array($_POST['post_text'], (new DateTime)->format('Y-m-d H:i:s'), $topic_name['topic_id'], $current_user['id_user'] ));
//    header('Location: topics_detail.php?topic_id=');
    header('Refresh: 0');
}


?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>PHP Forum</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <?php include 'head_bootstrap.php' ?>
</head>
<body>
<?php include 'navbar.php' ?>
<div class="setup">
<h1>Téma: <?= $topic_name['topic_name'] ?></h1>
<?php if($topic){ ?>
<?php foreach($topic as $row) { ?>
    <div class="post">
        <p><b><?= $row['users'] ?></b>  <?= $row['post_date'] ?></p>
        <p><?= $row['text'] ?></p>
    </div>
    <?php } ?>

<?php }
else{
    echo 'Na toto téma ještě nikdo neodpověděl.';
}
?>
<!--<h1>Odpovědět</h1>-->
<!--<form method="post" action="">-->
<!--    Vaše odpověď:<br/> <textarea name="post_text" /></textarea>-->
<!--    <br/>-->
<!--    <input type="submit" value="Přidat" />-->
<!--</form>-->

    <div class="loginmodal-container">
        <h1>Odpovědět</h1>

        <form action="" method="POST">
            <div class="form-group">
                <label for="comment">Vaše odpověď:</label>
                <textarea class="form-control" rows="5" id="comment" name="post_text"></textarea>
            </div>

            <input type="submit" class="login loginmodal-submit" value="Save"> or <a href="index.php">Cancel</a>

        </form>
    </div>

</div>
<?php include 'footer.php' ?>

</body>

</html>