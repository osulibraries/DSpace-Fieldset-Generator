XMLUI Metadata-Theme Generator for DSpace
=========================================

Many of our collections like to have their own custom metadata, some display special lsch subject headings, others want to put the thesis advisor, after the student/author name.

To accomplish this, we have a metadata theme simple-item-view theme generator that you can specify a list of metadata fields, and it will give you a theme that has those fields, in that order for your theme.

Documentation for this is sparse, but I believe the trick is:

    xsltproc fieldset.xsl fieldset.xml > template.xsl

And then you pop that into your xmlui theme. (Requires Ohio-State-Knowledge-Bank custom xmlui theme overwrites). 
