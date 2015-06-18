/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights
 *          reserved. For licensing, see LICENSE.md or
 *          http://ckeditor.com/license
 */

// CKEDITOR.editorConfig = function( config ) {
//	
// config.docType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0
// Transitional//EN"
// "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
// config.font_defaultLabel = '����';
// config.font_names =
// '����/Gulim;����/Dotum;����/Batang;�ü�/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';
// config.fontSize_defaultLabel = '12px';
// config.fontSize_sizes =
// '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
// config.language = "ko";
// config.resize_enabled = true; // ������ ����
// config.enterMode = CKEDITOR.ENTER_BR; // �����ͻ󿡼� �����Է½� <br />�� ����
// config.shiftEnterMode = CKEDITOR.ENTER_P; // shift + enter �� <p> �� ����
// config.startupFocus = true; // ���۽� ��Ŀ�� ����
// config.uiColor = '#EEEEEE';
// config.toolbarCanCollapse = false; // ���� Ŭ���� ������ ����
// config.menu_subMenuDelay = 0; // �޴� Ŭ���� �����̰�
// config.toolbar = 'Basic';
//    
// };
CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language = 'kr';

	// Remove some buttons, provided by the standard plugins, which we don't
	// need to have in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';
	config.filebrowserBrowseUrl = '/ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = '/ckfinder/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = '/ckfinder/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
};