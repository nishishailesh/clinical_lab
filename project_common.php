<?php

function main_menu()
{
	echo '
	
	<div class="dropdown btn-group m-0 p-0">
		<form method=post class="form-group m-0 p-0">
			<input type=hidden name=session_name value=\''.session_name().'\'>
			<button class="btn btn-primary m-0 p-0" formaction=new_general.php type=submit name=action value=new_general>New</button>
			<!--
			<button class="btn btn-primary dropdown-toggle m-0 p-0" type="button" data-toggle="dropdown">New</button>
			<div class="dropdown-menu m-0 p-0">		
					<button class="btn btn-secondary btn-block m-0 p-0" formaction=new_general.php type=submit name=action value=new_general>New (General)</button>
					<button class="btn btn-secondary btn-block m-0 p-0" formaction=new_opd.php type=submit name=action value=new_opd>New (OPD)</button>
			</div>
			-->
		</form>
	</div>
	';		
}


function mk_select_from_array($name, $select_array,$disabled='',$default='')
{	
	echo '<select  '.$disabled.' name=\''.$name.'\'>';
	foreach($select_array as $key=>$value)
	{
				//echo $default.'?'.$value;
		if($value==$default)
		{
			echo '<option  selected > '.$value.' </option>';
		}
		else
		{
			echo '<option > '.$value.' </option>';
		}
	}
	echo '</select>';	
	return TRUE;
}


?>
