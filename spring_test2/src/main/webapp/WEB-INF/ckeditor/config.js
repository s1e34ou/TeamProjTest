﻿/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	
	// %REMOVE_START%
	// The configuration options below are needed when running CKEditor from source files.
	config.plugins = 'dialogui,dialog,about,a11yhelp,dialogadvtab,basicstyles,bidi,blockquote,clipboard,button,panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,div,resize,toolbar,elementspath,enterkey,entities,popup,filebrowser,find,fakeobjects,flash,floatingspace,listblock,richcombo,font,forms,format,horizontalrule,htmlwriter,iframe,wysiwygarea,image,indent,indentblock,indentlist,smiley,justify,menubutton,language,link,list,liststyle,magicline,maximize,newpage,pagebreak,pastetext,pastefromword,preview,print,removeformat,save,selectall,showblocks,showborders,sourcearea,specialchar,scayt,stylescombo,tab,table,tabletools,undo,wsc';
	config.skin = 'moono';
	// %REMOVE_END%
	config.language = 'ko';
	config.uiColor = "#F0F0F0";
	
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.startupFocus = true;
	config.font_defaultLabel = '굴림';
	/*config.font_names = 'Gulim/Gulim;Dotum/Dotum;Batang/Batang;Gungsuh/Gungsuh;';*/
	config.font_names ='맑은 고딕; 돋움; 굴림; 궁서; 바탕;';
	config.fontSize_defaultLabel = '12px';
	
	//CKFINDER
	 config.filebrowserBrowseUrl = '/spring_test2/ckfinder/ckfinder.html';
	 config.filebrowserImageBrowseUrl = '/spring_test2/ckfinder/ckfinder.html?type=Images';
	 config.filebrowserFlashBrowseUrl = '/spring_test2/ckfinder/ckfinder.html?type=Flash';
	 config.filebrowserUploadUrl = '/spring_test2/ckfinder/core/connector/jsva/connector.java?command=QuickUpload&type=Files';
	 config.filebrowserImageUploadUrl ='/spring_test2/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	 config.filebrowserFlashUploadUrl ='/spring_test2/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
	 config.toolbar ='User';


	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};

