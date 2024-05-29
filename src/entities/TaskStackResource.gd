extends Resource
class_name TaskStackResource


export (Array, Resource) var individual_tasks_data: Array

# Método para añadir un elemento a la pila
func add_task(individual_task):
	individual_tasks_data.append(individual_task)

# Método para retirar y devolver el último elemento de la pila
func get_next_task():
	if not is_empty():
		return individual_tasks_data.pop_front().get_task()
	else:
		print("Error: Intentando hacer pop en una pila vacía")
		return null

# Método para ver el último elemento sin retirarlo
func peek():
	if not is_empty():
		return individual_tasks_data[-1]
	else:
		print("Error: Intentando hacer peek en una pila vacía")
		return null

# Método para verificar si la pila está vacía
func is_empty():
	return individual_tasks_data.size() == 0
	

func tasks_amount() -> int:
	return individual_tasks_data.size()



