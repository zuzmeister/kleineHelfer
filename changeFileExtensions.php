#!/usr/bin/php
<?php
//What?        Quick CLI-tool to rename the file extensions of multiple files (in working directory) matching the pattern.
//Author?      ZuZi
//Date?        2013/02/14
if($argv[1] && $argv[2]){
    foreach (glob("*.$argv[1]") as $filename) {
        echo ("change $filename to ".substr($filename,0,-(strlen($argv[1])))."$argv[2]\n");
        rename("$filename", substr($filename,0,-(strlen($argv[1])))."$argv[2]");
    }
}else
exit("\nERROR: ARGUMENTS MISSING!\n\nChanges the extension of all files matching <source> to <target>, in working directory.\n
usage:    changeFileType source target \n\n");
?>