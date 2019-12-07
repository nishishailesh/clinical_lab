<?php
//$GLOBALS['nojunk']='';
require_once 'project_common.php';
require_once 'base/verify_login.php';
	////////User code below/////////////////////
$link=get_link($GLOBALS['main_user'],$GLOBALS['main_pass']);

		main_menu();
if($_POST['action']=='new_general')
{
	get_data($link);
}
elseif($_POST['action']=='insert')
{
	save_insert($link);
}
	//////////////user code ends////////////////
tail();

echo '<pre>';print_r($_POST);echo '</pre>';

//////////////Functions///////////////////////

function get_basic()
{
	$YY=strftime("%y");

echo '<div id=basic class="tab-pane active">';
echo '<div class="basic_form">';
	echo '	<label class="my_label text-danger" for="mrd">MRD</label>
			<input size=13 id=mrd name=mrd class="form-control text-danger" required="required" type=text pattern="SUR/[0-9][0-9]/[0-9]{8}" placeholder="MRD" value="SUR/'.$YY.'/"\>
			<p class="help"><span class=text-danger>Must have</span> 8 digit after SUR/YY/</p>';
			
	echo '	<label  class="my_label text-danger" for="name">Name</label>
			<input class="form-control text-danger" type=text required="required" pattern="[a-zA-Z]{2,}" id=name name=name placeholder=name>
			<p class="help"><span class=text-danger>Must have</span> atleast two characters</p>';

	echo '	<label  class="my_label" for="group_id">Group ID</label>
			<input class="form-control" type=text id=group_id name=group_id placeholder=group_id>
			<p class="help">Give ID to a group of samples from single patient</p>';
echo '</div>';
echo '</div>';	
	
	
}

function get_more_basic()
{

echo '<div id=more_basic class="tab-pane ">'; //donot mix basic_form(grid) with bootsrap class
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

}


function get_data($link)
{
	echo '<form method=post class="bg-light jumbotron">';
	echo '<input type=hidden name=session_name value=\''.session_name().'\'>';

	echo '<ul class="nav nav-pills nav-justified">
			<li class="active" ><button class="btn btn-secondary" type=button data-toggle="tab" href="#basic">Basic</button></li>
			<li><button class="btn btn-secondary" type=button  data-toggle="tab" href="#more_basic">More</button></li>
			<li><button class="btn btn-secondary" type=button  data-toggle="tab" href="#examination">Examinations</button></li>
			<li><button class="btn btn-secondary" type=button  data-toggle="tab" href="#profile">Profiles</button></li>
			<li><button type=submit class="btn btn-primary form-control" name=action value=insert>Save</button></li>
		</ul>';
	echo '<div class="tab-content">';
		get_basic();
		get_more_basic();
		get_examination_data($link);
		get_profile_data($link);
	echo '</div>';
	
	//echo '<div class="basic_form">';
	//	echo '	<p   class="my_label"  >Next Step:</p>
	//		<button type=submit class="btn btn-primary form-control" name=action value=insert>Save</button>
	//		<p  class="help">MRD, Name must. On Saving Sample Id will be provided</p>';	
	//echo '</div>';

	echo '</form>';			
}

function get_examination_data($link)
{
	$sql='select * from examination';
	$result=run_query($link,$GLOBALS['database'],$sql);
	echo '<div id=examination class="tab-pane ">';
	echo '<div class="ex_profile">';
	while($ar=get_single_row($result))
	{
		my_on_off_ex($ar['name'],$ar['sample_requirement'],$ar['examination_id']);
	}
	echo '<input type=hidden name=list_of_selected_examination id=list_of_selected_examination>';
	echo '</div>';
	echo '</div>';
}

function get_profile_data($link)
{
	$sql='select * from profile';
	$result=run_query($link,$GLOBALS['database'],$sql);
	echo '<div id=profile  class="tab-pane ">';
	while($ar=get_single_row($result))
	{
		my_on_off_profile($ar['name'],$ar['profile_id']);
	}
	echo '<input type=hidden name=list_of_selected_profile id=list_of_selected_profile>';
	echo '</div>';
}

function my_on_off_ex($label,$sr,$id)
{
	
	echo '<button 
			class="btn btn-sm btn-outline-primary"
			type=button 
			onclick="select_examination_js(this, \''.$id.'\',\'list_of_selected_examination\')"
			>'.$label.'<br>('.$sr.')</button>';
}


function my_on_off_profile($label,$id)
{
	
	echo '<button 
			class="btn btn-sm btn-outline-primary"
			type=button 
			onclick="select_profile_js(this, \''.$id.'\',\'list_of_selected_profile\')"
			>'.$label.'</button>';
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

function save_insert($link)
{
	//find list of examinations requested
	//determine sample-type required
	//find sample_id to be given
	//insert all examinations in result table
	
	//find list of examinations requested
	$requested=array();
	$ex_requested=explode(',',$_POST['list_of_selected_examination']);
	$requested=array_merge($requested,$ex_requested);
	$profile_requested=explode(',',$_POST['list_of_selected_profile']);

	foreach($profile_requested as $value)
	{
		$psql='select * from profile where profile_id=\''.$value.'\'';
		$result=run_query($link,$GLOBALS['database'],$psql);
		$ar=get_single_row($result);
		$profile_ex_requested=explode(',',$ar['examination_id_list']);
		$requested=array_merge($requested,$profile_ex_requested);
	}

	$requested=array_filter(array_unique($requested));
	echo '<pre>You have requested following:<br>';print_r($requested);echo '</pre>';
	//determine sample-type required
	$sample_required=array();
	foreach($requested as $ex)
	{
		$psql='select sample_requirement from examination where examination_id=\''.$ex.'\'';
		$result=run_query($link,$GLOBALS['database'],$psql);
		$ar=get_single_row($result);
		$sample_required[]=$ar['sample_requirement'];
	}
	
	$sample_required=array_unique($sample_required);
	echo '<pre>following samples are required:<br>';print_r($sample_required);echo '</pre>';
	
	$sample_id_array=set_sample_id($sample_required);
	echo '<pre>following samples ids are alloted:<br>';print_r($sample_id_array);echo '</pre>';
}

function set_sample_id($sample_required)
{
	$sample_id_array=array();
	
	return $sample_id_array;
}

/*Array
(
    [session_name] => sn_1611426731
    [mrd] => SUR/19/12345678
    [name] => shailesh
    [group_id] => 1212
    [department] => 
    [unit] => 
    [ow_no] => 
    [unique_id] => 
    [mobile] => 
    [sex] => 
    [dob] => 
    [age] => 
    [extra] => 
    [list_of_selected_examination] => 
    [list_of_selected_profile] => 3
    [action] => insert
)

give sample_id as autonumber
sample_id have its attached parameters
	*date
	*time
	*patient department unit location
	*serial number catagory
	*serial number
	 
YYMMXXSSNNNNN
2012

XX=01 if OPD
XX=02 if Ward

SS=01 if Bio
SS=02 if HI
SS=03 if CP
SS=04 if MI

YYMMDDHHMMSRR
1912050534001

YY1234567
199999999 , 9 digits

  9999999	available=99 lacs, 7 digit
  
  1000000-1999999 Bio 1000000-1500000 (Ward) 16000001
  2000000-2999999 HI
  3000000-3999999 CP 
   
*/


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
	 
	.ex_profile 
	{
	  display: grid;
	  grid-template-columns: auto auto;
	}		 
}

/* Tablet Styles */
@media only screen and (min-width: 401px) and (max-width: 960px) 
{
  
	.basic_form 
	{
	  display: grid;
	  grid-template-columns: 33% 67%;
	}

	 .help
	 {
		 display:none
	 }

	.ex_profile 
	{
	  display: grid;
	  grid-template-columns: auto auto auto auto;
	}	   
}

@media only screen and (min-width: 961px) 
{
	.basic_form 
	{
	  display: grid;
	  grid-template-columns: 20% 30% 50%;
	}	
	
	.ex_profile 
	{
	  display: grid;
	  grid-template-columns: auto auto auto auto auto auto auto auto;
	}	  
}

</style>

<script>
var selected_ex=[]
var selected_profile=[]

function select_examination_js(me,ex_id,list_id)
{
	if(selected_ex.indexOf(ex_id) !== -1)
	{
		selected_ex.splice(selected_ex.indexOf(ex_id),1)
		document.getElementById(list_id).value=selected_ex
		me.classList.remove('bg-warning')
	}
	else
	{
		selected_ex.push(ex_id);
		document.getElementById(list_id).value=selected_ex
		me.classList.add('bg-warning')
	}
}

function select_profile_js(me,ex_id,list_id)
{
	if(selected_profile.indexOf(ex_id) !== -1)
	{
		selected_profile.splice(selected_profile.indexOf(ex_id),1)
		document.getElementById(list_id).value=selected_profile
		me.classList.remove('bg-warning')
	}
	else
	{
		selected_profile.push(ex_id);
		document.getElementById(list_id).value=selected_profile
		me.classList.add('bg-warning')
	}
}						
</script>
