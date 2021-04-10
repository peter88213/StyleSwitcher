![Screenshot: toolbar](Screenshots/Toolbar00-en.png)

This extension provides a toolbar with buttons to quickly switch between the style sheets of different document templates. 
However, unlike the [_Template Changer_](https://extensions.openoffice.org/en/project/template-changer) extension,  _StyleSwitcher_  does not associate the template with the document. The point of quickly switching styles is to get a view optimized for the screen or for printing or for other purposes, such as standard manuscript page counting.

### Please note:

If this extension is to be of any use to you, you must understand the concept of document templates and styles. If this seems new to you, you might want to take a look at this [introduction on the OpenOffice wiki](https://wiki.openoffice.org/wiki/Documentation/OOoAuthors_User_Manual/Writer_Guide/Introduction_to_Styles). 


This extension requires three document templates to be located in the __template__ folder of the user profile: 

*  __Default.ott__  (optimized for screen display)
*  __StandardPages.ott__  ([standard manuscript format](https://en.wikipedia.org/wiki/Standard_manuscript_format))
*  __Printout.ott__  (optimized for print output)


You must provide these templates yourself. Sample template documents for customization can be downloaded [here](samples).

## System requirements

* __OpenOffice.org 3.x or Apache OpenOffice 4.x or LibreOffice 6.x__
* __Java__ (OpenOffice needs it for macro execution)

## Download and install

First, make sure there are document templates named __Default.ott__ , __StandardPages.ott__ , and  __Printout.ott__ in the  __templates__  directory of your OpenOffice/LibreOffice user profile.

Then download the extension variant that matches your Office installation:

[LibreOffice 6.x variant (StyleSwitcher-L-0.99.0.oxt)](https://raw.githubusercontent.com/peter88213/StyleSwitcher/master/StyleSwitcher-L-0.99.0.oxt)

[Apache OpenOffice 4.x variant (StyleSwitcher-A-0.99.0.oxt)](https://raw.githubusercontent.com/peter88213/StyleSwitcher/master/StyleSwitcher-A-0.99.0.oxt)

[OpenOffice.org 3.x variant (StyleSwitcher-0.99.0.oxt)](https://raw.githubusercontent.com/peter88213/StyleSwitcher/master/StyleSwitcher-0.99.0.oxt)

* Installation right at download, by double-clicking on the downloaded file, or via the OpenOffice/LibreOffice Extension Manager.

* After installation (and Office restart) you find a toolbar.

[Changelog](changelog)


## Usage

See the [instructions for use](help-en)

## CREDITS
Icons made by [Freepik](https://www.freepik.com) from [Flaticon](https://www.flaticon.com) are licensed by [Creative Commons BY 3.0](http://creativecommons.org/licenses/by/3.0/).

[OpenOffice Extension Compiler](https://wiki.openoffice.org/wiki/Extensions_Packager#Extension_Compiler) by Bernard Marcelly.


## License

This extension is distributed under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
