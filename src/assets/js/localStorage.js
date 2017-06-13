var storage = window.localStorage

export default {
	get: function(key){
		return storage[key]
	},
	set: function(key, value){
		return storage[key] = value
	}
}