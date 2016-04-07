#!/usr/bin/php
<?php
echo "-----------------------------------------\n";
echo " Converting STEREO-WAV to MONO-WAV files \n";
echo " Filepath: ".__DIR__."\n";
echo "-----------------------------------------\n";
echo "\n\n\n";

$monodir = __DIR__."/mono-files";
mkdir($monodir);

$wavarray = getDirectoryTree(__DIR__,'wav'); 
//print_r($wavarray);
if(!empty($wavarray)){
	foreach ($wavarray as $wavfile) {
		$wavname = substr($wavfile, 0, -4);
		$wavfilepath = __DIR__."/".$wavfile;
		$leftpath = $monodir."/".$wavname."-mono-left.wav";
		$rightpath = $monodir."/".$wavname."-mono-right.wav";

		echo $wavfile.":\n";
		echo("Erstelle Linke Spur:\n$leftpath\n");
		passthru ("sox '$wavfilepath' '$leftpath' remix 1");
		echo("Erstelle Rechte Spur:\n$rightpath\n\n");
		passthru ("sox '$wavfilepath' '$rightpath' remix 2");
	}
}else{
	echo "Directory is empty :/ \n\n\n";
}

function getDirectoryTree( $outerDir , $x){ 
    $dirs = array_diff( scandir( $outerDir ), Array( ".", ".." ) ); 
    $dir_array = Array(); 
    foreach( $dirs as $d ){ 
        if( is_dir($outerDir."/".$d)  ){ 
            //$dir_array[ $d ] = getDirectoryTree( $outerDir."/".$d , $x);  //rekursion --> fügt array von untercverzeichnis ein
        }else{ 
         if (($x)?ereg($x.'$',$d):1) 
            $dir_array[ $d ] = $d; 
            } 
    } 
    return $dir_array; 
} 
?>
