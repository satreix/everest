<?php

array_shift($argv);
$name = "World";
if (count($argv) > 1 && $argv[0] == "--name") {
    $name = $argv[1];
}
echo "Hello, " . $name . "!";
