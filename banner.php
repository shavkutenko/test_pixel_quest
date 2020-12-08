<?php

$dbh = new PDO('mysql:host=localhost;dbname=quest', 'root', '');

$remoteAddress = function(){
    return $_SERVER['HTTP_CLIENT_IP'] ?? $_SERVER['HTTP_X_FORWARDED_FOR'] ?? $_SERVER['REMOTE_ADDR'];
};

$insertQueryPattern = <<<SQL
INSERT INTO pixel_stat 
        SET 
            ip_address=?, 
            view_date=now(),
            user_agent=?,
            page_url=?
            
    ON DUPLICATE KEY UPDATE views_count = views_count + 1
SQL;

$stmt = $dbh->prepare($insertQueryPattern);

$stmt->execute([
    $remoteAddress(),
    $_SERVER['HTTP_USER_AGENT'],
    $_SERVER['HTTP_REFERER']
]);