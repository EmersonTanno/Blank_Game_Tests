//colisão
motion_add(point_direction(other.x, other.y, x, y), 0.1);

if(x == other.x && y== other.y){
	if(id>other.id){
		x += 1;
	}else{
		x -= 1;
	}
}




