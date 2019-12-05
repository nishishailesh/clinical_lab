<?php
//$GLOBALS['nojunk']='';
require_once 'project_common.php';
require_once 'base/verify_login.php';
	////////User code below/////////////////////
		main_menu();
		get_basic_data();
	//////////////user code ends////////////////
tail();

echo '<pre>';print_r($_POST);echo '</pre>';

//////////////Functions///////////////////////

function get_basic_data()
{
	echo '<form method=post class="bg-light jumbotron">';
	echo '<input type=hidden name=session_name value=\''.session_name().'\'>';
	
	$YY=strftime("%y");

echo '<div class="basic_form">';

	echo '	<label class="my_label text-danger" for="mrd">MRD</label>
			<input size=13 id=mrd name=mrd class="form-control text-danger" required="required" type=text pattern="SUR/[0-9][0-9]/[0-9]{8}" placeholder="MRD" value="SUR/'.$YY.'/"\>
			<p class="help"><span class=text-danger>Must have</span> 8 digit after SUR/YY/</p>';
			
	echo '	<label  class="my_label text-danger" for="name">Name</label>
			<input class="form-control text-danger" type=text required="required" pattern="[a-zA-Z]{2,}" id=name name=name placeholder=name>
			<p class="help"><span class=text-danger>Must have</span> atleast two characters</p>';

	echo '	<label  class="my_label" for="group_id">Group ID</label>
			<input class="form-control" type=text id=group_id name=group_id placeholder=group_id>
			<p class="help">Give ID to a group of samples</p>';
			
echo '</div>';

echo '<button class="btn btn-primary m-0 p-0" type=button data-toggle="collapse" data-target="#more">More...</button>';
echo '<div id=more class="collapse">';
echo '<div class="basic_form">';
	echo '	<label  class="my_label"  for="department">Department:</label>';
			mk_select_from_array('department',$GLOBALS['department']);
			echo '<p class="help">Select Department</p>';
			
	echo '	<label  class="my_label"  for="unit">Unit</label>';
			mk_select_from_array('unit',$GLOBALS['unit']);
			echo '<p class="help">Select Unit</p>';
			
	echo '	<label  class="my_label"  for="location3">Ward/OPD</label>
			<div class="form-control">
					<label class="radio-inline"><input type="radio" name="wardopd" value=OPD >OPD</label>
					<label class="radio-inline"><input type="radio" name="wardopd" value=Ward >Ward</label>
			</div>
			<p class="help">Ward/OPD</p>';
			
	echo '	<label  class="my_label"  for="ow_no">OPD/Ward No:</label>';
			mk_select_from_array('ow_no',$GLOBALS['ow_no']);
			echo '<p class="help">OPD/Ward Number</p>';

			
	echo '	<label  class="my_label" for="unique_id">AADHAR:</label>
			<input class="form-control" type=text id=unique_id name=unique_id placeholder=AADHAR>
			<p class="help">Full 12 Digit AADHAR number</p>';

	echo '	<label  class="my_label" for="unique_id">Mobile</label>
			<input class="form-control" type=text id=mobile name=mobile placeholder=Mobile>
			<p class="help">10 digit Mobile number</p>';
						
	echo '	<label  class="my_label" for="sex">Sex:</label>
			<select class="form-control" id=sex name=sex><option></option><option>M</option><option>F</option><option>O</option></select>
			<p class="help"> O for others</p>';
			
	echo '	<label   class="my_label" for="dob">DOB:</label>
			<input type=date id=dob name=dob>
			<p class="help">Approximate DOB</p>';

	echo '	<label  class="my_label" for="age">Age</label>
			<input class="form-control" type=text id=age name=age placeholder=Age>
			<p class="help">Write age in what ever way you like</p>';
			
	echo '	<label  class="my_label"  for="extra">Extra:</label>
			<input class="form-control" type=text id=extra name=extra placeholder=Extra>
			<p class="help">Any other extra details</p>';

echo '</div>';
echo '</div>';

	get_examination_data();

echo '<div class="basic_form">';
	echo '	<p   class="my_label"  >Next Step:</p>
			<button type=submit class="btn btn-primary form-control" name=action value=select_examination>Save</button>
			<p  class="help">Unique Sample Id will be provided when data is saved</p>';	
echo '</div>';


	echo '</form>';			
}

function get_examination_data()
{

	
}
function insert_or_update_result($sample_id,$examination_id,$result,$uniq)
{
	$sql='insert into result (sample_id,examination_id,result,uniq)
				values ("'.$sample_id.'","'.$examination_id.'","'.$result.'","'.$uniq.'")
				on duplicate key update result="'.$result.'"';
	if(!run_query($link,$GLOBALS['database'],$sql))
		{echo 'Data not inserted/updated<br>'; return false;}
	else{return true;}
}

function transmit_post_to_next($var)
{
	if(strlen($_POST[$var]>0))
	{
		echo '<input type=hidden name="'.$var.'" value="'.$_POST[$var].'">';
	}
}
	
function repost_basic_data()
{
	echo '<input type=text name=mrd readonly value="'.$_POST['mrd'].'">';
	echo '<input type=text name=name readonly value="'.$_POST['name'].'">';
	transmit_post_to_next('group_id');
	transmit_post_to_next('department');
	transmit_post_to_next('unit');
	transmit_post_to_next('wardopd');
	transmit_post_to_next('ow_no');
	transmit_post_to_next('unique_id');
	transmit_post_to_next('mobile');
	transmit_post_to_next('sex');
	transmit_post_to_next('dob');
	transmit_post_to_next('age');
	transmit_post_to_next('extra');
}

?>
<style>

@media only screen and (max-width: 400px) 
{ 
	  .basic_form 
	{
	  display: grid;
	  grid-template-columns: auto;
	}
	
	.my_label
	 {
		 display:none
	 }
	 	
	 .help
	 {
		 display:none
	 }
	 
	 
}

/* Tablet Styles */
@media only screen and (min-width: 401px) and (max-width: 960px) 
{
	  body {
		background-color: #F5CF8E; /* Yellow */
	  }
	  
	.basic_form 
	{
	  display: grid;
	  grid-template-columns: 33% 67%;
	}

	 .help
	 {
		 display:none
	 }
	   
}

@media only screen and (min-width: 961px) 
{
	.basic_form 
	{
	  display: grid;
	  grid-template-columns: 20% 30% 50%;
	}	  
}
</style>
