<?php

echo 'Zadatak 1.<br>';
$imena=['Ivan','Adam','Ferdinand','Bruno','Gertruda'];
foreach ($imena as $value) {
    echo $value.'<br>';
}
echo '<pre>';
print_r ($imena);
echo '</pre>';
echo '<hr><br>';
echo 'Zadatak 2.<br>';
$imena=['ime5'=>'Ivan','ime4'=>'Adam','ime3'=>'Ferdinand','ime2'=>'Bruno','ime1'=>'Gertruda',];
echo '<pre>';
print_r ($imena);
echo '</pre>';

echo '<hr><br>';
echo 'Zadatak 3.<br>';
//$imena=['Ivan','Adam','Ferdinand','Bruno','Gertruda'];
sort($imena);
echo '<pre>';
print_r ($imena);
echo '</pre>';
 

for ($i = 0; $i < count($imena); $i++ ){
    //sort($imena);
    echo $imena[$i].'<br>';
}

echo '<hr><br>';
echo 'Zadatak 4.<br>';


echo '<hr><br>';
echo 'Zadatak 5.<br>';


echo '<hr><br>';