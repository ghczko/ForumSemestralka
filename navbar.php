
<nav class="navbar navbar-default">
    <div class="container">
        <ul class="nav navbar-nav" id="horizontal">
            <li class="navbar-brand active" >PHP Forum</li>
            <li><a href="index.php">Domů</a></li>
            <li><a href="new_topic.php">Nové téma</a></li>


                <li class="dropdown">
                    <a data-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">Přihlášen jako <?= $current_user['username'] ?>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="signout.php">Odhlásit</a></li>
                    </ul>
                </li>

        </ul>

    </div>


</nav>
