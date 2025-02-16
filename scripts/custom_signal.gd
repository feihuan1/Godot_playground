extends Node2D

#region signal without param

#signal health_depleted
#var health = 60
#
#func take_dmage(amount)->void:
	#health -= abs(amount)
	#if health <= 0:
		#health_depleted.emit()
#endregion

#region signal with params
signal health_changed(old_value, new_value)

var health = 10

func take_damage(amount):
	var old_health = health
	health -= amount
	health_changed.emit(old_health, health)
	
# connected with Node tab
func _on_health_changed(old_value: Variant, new_value: Variant) -> void:
	if new_value > old_value:
		print("health potion")
	else :
		print('Ooooouch')
	if(new_value <= 0):
		print("dead")
#endregion
