/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckfinder.com/license
*/

CKFinder.customConfig = function( config )
{
	// Define changes to default configuration here.
	// For the list of available options, check:
	// http://docs.cksource.com/ckfinder_2.x_api/symbols/CKFinder.config.html

	// Sample configuration options:
	// config.uiColor = '#BDE31E';
	// config.language = 'ko';
	// config.removePlugins = 'basket';
	 //CKFINDER
	 config.filebrowserBrowseUrl = '/spring_test2/ckfinder/ckfinder.html';
	 config.filebrowserImageBrowseUrl = '/spring_test2/ckfinder/ckfinder.html?type=Images';
	 config.filebrowserFlashBrowseUrl = '/spring_test2/ckfinder/ckfinder.html?type=Flash';
	 config.filebrowserUploadUrl = '/spring_test2/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	 config.filebrowserImageUploadUrl ='/spring_test2/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	 config.filebrowserFlashUploadUrl ='/spring_test2/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
	 
};
