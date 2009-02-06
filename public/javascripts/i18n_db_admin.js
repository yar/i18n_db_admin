Object.extend(Ajax.InPlaceEditor.prototype, {
    onLoadedExternalText: function(transport) {
        Element.removeClassName(this.form, this.options.loadingClassName);
        this.editField.disabled = false;
        this.editField.value = transport.responseText;
        Field.scrollFreeActivate(this.editField);
    }
});

Object.extend(Ajax.InPlaceEditor.prototype, {
    getText: function() {
        return this.element.childNodes[0] ? this.element.childNodes[0].nodeValue : '';
    }
});

/*
 * InPlaceEditor extension that adds a 'click to edit' text when the field is 
 * empty.
 */
 Ajax.InPlaceEditorWithEmptyText = Class.create(Ajax.InPlaceEditor, {
   initialize : function($super, element, url, options) {
     if (!options.emptyText)        options.emptyText      = "click to edit…";
     if (!options.emptyClassName)   options.emptyClassName = "inplaceeditor-empty";
     $super(element, url, options);
     this.checkEmpty();
   },

   checkEmpty : function() {
     if (this.element.innerHTML.length == 0 && this.options.emptyText) {
       this.element.appendChild(
           new Element("span", { className : this.options.emptyClassName }).update(this.options.emptyText)
         );
     }
   },

   getText : function($super) {
     if (empty_span = this.element.select("." + this.options.emptyClassName).first()) {
       empty_span.remove();
     }
     return $super();
   },

   onComplete : function($super, transport) {
     this.checkEmpty();
     return $super(transport);
   }
 });
