var userFeed = new Instafeed({
	get: 'user',
	target: "instafeed",
	resolution: 'standard_resolution',
	accessToken: 'IGQVJWVTNnSzh1VWJqWFpOaGFBSFA4VE1UWk9fbkFTSHRjMEFyeEhXdWZA3eVF3UEtoRkJGN2ptTHY4UkZANSTJhUG4tMEcwR19SZAzVGZAW1nOUkzeHpxZAFBNRUQtX0dlclU5eGZA0VUw4MmZANTk55NTBqbQZDZD',
	limit: 8,

	template: '<div class="col-lg-3 instaimg"><a href="{{link}}" title="{{caption}}" target="_blank"><img src="{{image}}" alt="{{caption}}" class="img-fluid"/></a></div>',
});
userFeed.run();


