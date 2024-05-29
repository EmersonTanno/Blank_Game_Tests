// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações


/// @param px
/// @param py
/// @param rx
/// @param ry
function scr_toggle_select(px, py, rx, ry){

	var tlbr = (x>=px && x<=rx && y>=py && y<=ry);
	var bltr = (x>=px && x<=rx && y<=py && y>=ry);
	var brtl = (x<=px && x>=rx && y<=py && y>=ry);
	var trbl = (x<=px && x>=rx && y>=py && y<=ry);
	
	if(tlbr || bltr || brtl || trbl){
		selected = true;
	}else{
		selected = false
	}
	

}