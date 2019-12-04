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
	echo '<form method=post class="bg-light jumbotron basic_form">';
	echo '<input type=hidden name=session_name value=\''.session_name().'\'>';
	
	$YY=strftime("%y");
	echo '	<label class="my_label" for="mrd">MRD:</label>
			<input size=13 id=mrd name=mrd class="form-control" type=text pattern="SUR/[0-9][0-9]/[0-9]{8}" placeholder="MRD" value="SUR/'.$YY.'/"\>
			<p class="help">Must Have 8 digit after SUR/YY/</p>';
			
	echo '	<label  class="my_label" for="name">Name:</label>
			<input class="form-control" type=text id=name name=name placeholder=name>
			<p class="help">Full Name</p>';
			
	echo '	<label  class="my_label" for="unique_id">AADHAR:</label>
			<input class="form-control" type=text id=unique_id name=unique_id placeholder=AADHAR>
			<p class="help">Full 12 Digit AADHAR number</p>';
			
	echo '	<label  class="my_label" for="sex">Sex:</label>
			<select class="form-control" id=sex name=sex><option>M</option><option>F</option><option>O</option></select>
			<p class="help"> O for others</p>';
			
	echo '	<label   class="my_label" for="dob">DOB:</label>
			<input type=date id=dob name=dob>
			<p class="help">Approximate DOB</p>';
			
	echo '	<label  class="my_label"  for="department">Department:</label>';
			mk_select_from_array('department',$GLOBALS['department']);
			echo '<p class="help">Select Department</p>';
			
	echo '	<label  class="my_label"  for="unit">Unit</label>';
			mk_select_from_array('unit',$GLOBALS['unit']);
			echo '<p class="help">Select Unit</p>';
			
	echo '	<label  class="my_label"  for="location3">Ward/OPD</label>
			<input type=text class="form-control" id=location3 name=location3 placeholder=location>
			<p class="help">Ward/OPD</p>';
			
	echo '	<label  class="my_label"  for="ow_no">OPD/Ward No:</label>';
			mk_select_from_array('ow_no',$GLOBALS['ow_no']);
			echo '<p class="help">OPD/Ward Number</p>';
			
	echo '	<label  class="my_label"  for="extra">Extra:</label>
			<input class="form-control" type=text id=extra name=extra placeholder=Extra>
			<p class="help">Any other extra details</p>';

	echo '	<p   class="my_label"  >Next Step:</p>
			<button type=submit class="btn btn-primary form-control" name=action value=select_examination>Select Examinations</button>
			<p  class="help">Next step is to select examinations</p>';	
	echo '</form>';			
}

?>
<style>

@media only screen and (max-width: 400px) 
{
	  body {
		background-color: #F09A9D; /* Red */
	  }
  
	  .basic_form 
	{
	  display: grid;
	  grid-template-columns: auto;
	  background-color: #2196F3;
	  padding: 10px;
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
	  background-color: #2196F3;
	  padding: 10px;
	}

	 .help
	 {
		 display:none
	 }
	   
}

/* Desktop Styles */
@media only screen and (min-width: 961px) {
	  body {
		background-color: #B2D6FF; /* Blue */
	  }
	.basic_form 
	{
	  display: grid;
	  grid-template-columns: 20% 30% 50%;
	  background-color: #2196F3;
	  padding: 10px;
	}	  
}
</style>
