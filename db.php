<?php

$db = new PDO('mysql:host=127.0.0.1:8889;dbname=forum;charset=utf8', 'root', 'root');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);