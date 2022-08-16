<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>Word 작성</title>
  <!-- EJ2 Document Editor dependent theme -->
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-base/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-buttons/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-inputs/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-popups/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-lists/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-navigations/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-splitbuttons/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />
  <link href="https://cdn.syncfusion.com/ej2/17.3.14/ej2-dropdowns/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />

  <!-- EJ2 Document Editor theme -->
  <link href="http://cdn.syncfusion.com/ej2/17.3.14/ej2-documenteditor/styles/material.css" rel="stylesheet" type="text/css" rel='nofollow' />

  <!-- EJ2 Document Editor dependent scripts -->
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-base/dist/global/ej2-base.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-data/dist/global/ej2-data.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-svg-base/dist/global/ej2-svg-base.min.js"type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-file-utils/dist/global/ej2-file-utils.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-compression/dist/global/ej2-compression.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-pdf-export/dist/global/ej2-pdf-export.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-buttons/dist/global/ej2-buttons.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-popups/dist/global/ej2-popups.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-splitbuttons/dist/global/ej2-splitbuttons.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-inputs/dist/global/ej2-inputs.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-lists/dist/global/ej2-lists.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-navigations/dist/global/ej2-navigations.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-dropdowns/dist/global/ej2-dropdowns.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-calendars/dist/global/ej2-calendars.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-charts/dist/global/ej2-charts.min.js" type="text/javascript"></script>
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-office-chart/dist/global/ej2-office-chart.min.js" type="text/javascript"></script>
  <!-- EJ2 Document Editor script -->
  <script src="https://cdn.syncfusion.com/ej2/17.3.14/ej2-documenteditor/dist/global/ej2-documenteditor.min.js" type="text/javascript"></script>
  <style>

    #documenteditor_titlebar {
        height: 36px;
        line-height: 26px;
        width: 100%;
        font-size: 12px;
        padding-left: 15px;
        padding-right: 10px;
        font-family: inherit;
    }

    #documenteditor_title_contentEditor {
        height: 26px;
        max-width: 85%;
        width: auto;
        overflow: hidden;
        display: inline-block;
        padding-left: 4px;
        padding-right: 4px;
        margin: 5px;
    }

    .single-line {
        cursor: text !important;
        outline: none;
    }

    .single-line:hover {
        border-color: #e4e4e4 !important;
    }

    [contenteditable="true"].single-line {
        white-space: nowrap;
        border-color: #e4e4e4 !important;
    }

    [contenteditable="true"].single-line * {
        white-space: nowrap;
    }
      [class^="e-de-icon-"],
    [class*=" e-de-icon-"] {
        font-family: 'Sample brower icons' !important;
    }

    .e-de-icon-Print:before {
        content: "\e723";
    }

    .e-de-icon-Download:before {
        content: "\e728";
    }
  </style>

  </head>
  <body>
  <div class="wrapper">
  	  <div class="control-section">
    <div id="panel">
        <div id='documenteditor_titlebar' class="e-de-ctn-title"></div>
        <div id="documenteditor_container_body" style="display: flex;position:relative;height:750px;width: 100%">
            <div id="container" style="width: 100%;height: 100%;"></div>
        </div>
    </div>
</div>
  </div>
  <!--Element which is going to render as Document Editor-->
  <script>


  //Documenteditor control rendering starts
  var hostUrl = 'https://ej2services.syncfusion.com/production/web-services/';
  var container = new ej.documenteditor.DocumentEditorContainer();
  ej.documenteditor.DocumentEditorContainer.Inject(ej.documenteditor.Toolbar);
  container.serviceUrl = hostUrl + 'api/documenteditor/';
  container.appendTo('#container');
  container.height = '590px';

  var waitingPopUp = document.getElementById('waiting-popup');

  container.documentEditor.documentName = '문서 제목을 입력하세요.';
  // TitleBar sample starts
  titleBarDiv = document.getElementById('documenteditor_titlebar');
  initializeTitleBar(true);
  updateDocumentTitle();
  wireEventsInTitleBar();
  container.documentChange = function () {
      updateDocumentTitle();
  };
   var documentTitle;
   var documentTitleContentEditor;
   var titleBarDiv;
   var print;
   var openBtn;
   var download;
   var isPropertiesPaneEnabled;
   function initializeTitleBar(isShareNeeded) {
       documentTitle = ej.base.createElement('label', { id: 'documenteditor_title_name', styles: 'text-transform:capitalize;font-weight:400;text-overflow:ellipsis;white-space:pre;overflow:hidden;user-select:none;cursor:text' });
       documentTitleContentEditor = ej.base.createElement('div', { id: 'documenteditor_title_contentEditor', className: 'single-line' ,contenteditable:'true'});
       documentTitleContentEditor.append(documentTitle);
       titleBarDiv.appendChild(documentTitleContentEditor);
       documentTitleContentEditor.setAttribute('title', 'Document Name. Click or tap to rename this document.');
       var btnStyles = 'float:right;background: transparent;box-shadow:none; font-family: inherit;border-color: transparent;' +
           'border-radius: 2px;color:inherit;font-size:12px;text-transform:capitalize;margin-top:4px;height:28px;font-weight:400';
       print = addButton('fas fa-print', '인쇄', btnStyles, 'de-print', 'Print this document (Ctrl+P).', false);
       openBtn = addButton('e-de-icon-Open e-de-padding-right', 'open', btnStyles, 'de-open', 'Open', false);
       var items = [
           { text: 'Microsoft Word (.docx)', id: 'word' },
           { text: 'Syncfusion Document Text (.sfdt)', id: 'sfdt' },
       ];
       download = addButton('fas fa-download', '저장하기', btnStyles, 'documenteditor-share', 'Download this document.', true, items);
       if (!isShareNeeded) {
           download.element.style.display = 'none';
       }
       else {
           openBtn.element.style.display = 'none';
       }
   }
   function wireEventsInTitleBar() {
       print.element.addEventListener('click', onPrint);
       openBtn.element.addEventListener('click', function (e) {
           if (e.target.id === 'de-open') {
               var fileUpload = document.getElementById('uploadfileButton');
               fileUpload.value = '';
               fileUpload.click();
           }
       });
       documentTitleContentEditor.addEventListener('keydown', function (e) {
           if (e.keyCode === 13) {
               e.preventDefault();
               documentTitleContentEditor.contentEditable = 'false';
               if (documentTitleContentEditor.textContent === '') {
                   documentTitleContentEditor.textContent = 'Document1';
               }
           }
       });
       documentTitleContentEditor.addEventListener('blur', function () {
           if (documentTitleContentEditor.textContent === '') {
               documentTitleContentEditor.textContent = 'Document1';
           }
           documentTitleContentEditor.contentEditable = 'false';
           container.documentEditor.documentName = documentTitle.textContent;
       });
       documentTitleContentEditor.addEventListener('click', function () {
           updateDocumentEditorTitle();
       });
   }
   function updateDocumentEditorTitle() {
       documentTitleContentEditor.contentEditable = 'true';
       documentTitleContentEditor.focus();
       window.getSelection().selectAllChildren(documentTitleContentEditor);
   }
   function updateDocumentTitle() {
       if (container.documentEditor.documentName === '') {
           container.documentEditor.documentName = 'Untitled';
       }
       documentTitle.textContent = container.documentEditor.documentName;
   }
   function onPrint() {
       container.documentEditor.print();
   }
   function onExportClick(args) {
       var value = args.item.id;
       switch (value) {
           case 'word':
               save('Docx');
               break;
           case 'sfdt':
               save('Sfdt');
               break;
       }
   }
   function save(format) {
	   container.documentEditor.save(container.documentEditor.documentName === '' ? 'sample' : container.documentEditor.documentName, format);
   }
   function setTooltipForPopup() {
       document.getElementById('documenteditor-share-popup').querySelectorAll('li')[0].setAttribute('title', 'Download a copy of this document to your computer as a DOCX file.');
       document.getElementById('documenteditor-share-popup').querySelectorAll('li')[1].setAttribute('title', 'Download a copy of this document to your computer as an SFDT file.');
   }
   function addButton(iconClass, btnText, styles, id, tooltipText, isDropDown, items) {
       var button = ej.base.createElement('button', { id: id, styles: styles });
       titleBarDiv.appendChild(button);
       button.setAttribute('title', tooltipText);
       if (isDropDown) {
           var dropButton = new ej.splitbuttons.DropDownButton({ select: onExportClick, items: items, iconCss: iconClass, cssClass: 'e-caret-hide', content: btnText, open: function () { setTooltipForPopup(); } }, button);
           return dropButton;
       }
       else {
           var ejButton = new ej.buttons.Button({ iconCss: iconClass, content: btnText }, button);
           return ejButton;
       }
   }

  </script>
  </body>

  </html>