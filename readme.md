<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/neomanic/save_macos_browser_tabs">
    <!--<img src="images/logo.png" alt="Logo" width="80" height="80">-->
  </a>

  <h3 align="center">Save macOS Browser Tabs</h3>

  <p align="center">
    Applescripts to save all your browser tabs for macOS users. Ideal for the privacy conscious, as all other methods require a web extension install.
    <br />
	<br />
    <a href="https://github.com/neomanic/save_macos_browser_tabs"><strong>Home Page</strong></a>
    <br />
    <br />
    <a href="https://github.com/neomanic/save_macos_browser_tabs/issues">Report Bug</a>
    ·
    <a href="https://github.com/neomanic/save_macos_browser_tabs/issues">Request Feature</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

As an unrepentant tab hoarder, I was looking for the best way to save links to all my open tabs when the time comes to declare tab bankruptcy. Most of the options seem to be web extension-based, and ask for a bunch of permissions I'm not inclined to grant. The best option under those circumstances, at least on macOS, was a pure Applescript-based solution, of which there are a few floating around, but many untouched for a few years and a bit of work to install if you don't know how already. 

I had a look, picked my favourite script, and made some changes to my taste:

- Date and time stamp both in filename and title
- Added the web hostname after the tab title, eg (github.com) in 
  `1. [neomanic/save_macos_browser_tabs: Applescripts to save all tabs from web browsers on macOS (github.com)](https://github.com/neomanic/save_macos_browser_tabs)`

Uploaded to a nice repo with instructions to make it easier for non-geeks to use. I will also add support for browsers other than Safari, since I use it for personal, and Edge for $(dayjob), and pretty sure Firefox and Chrome should be easy enough. And I'll likely have a play with [Javascript for Automation](https://forum.keyboardmaestro.com/t/comparing-javascript-for-automation-jxa-and-applescript/19559) at some stage, because Applescript... ugh.

The original readme:

```
Export All Safari Tabs in All Open Windows to a Markdown File
2018-01-25

// SCRIPT PAGE
	https://gist.github.com/unabridgedxcrpt/3f35aa5aec81289368858e2ba6009451

// ORIGINAL SCRIPT PAGE
	http://hegde.me/urlsafari KSHITEESH ON GIST.GITHUB.COM
   
// ORIGINAL-ORIGINAL SCRIPT ON WHICH THIS SCRIPT IS BUILT
	http://veritrope.com/code/export-all-safari-tabs-to-a-text-file

// CHANGES COMPARED TO THE ORIGINAL SCRIPT
	1. Save URLs to .md instead of .txt
	2. Save URLs from all windows instead of just the first window
	3. Save the file to Downloads/ instead of Desktop/

// CHANGES TO SCRIPT FORKED FROM KSHITEESH https://gist.github.com/kshiteesh/b72e93d31d65008fcd11#file-urlsafari
	1. Removed dialog asking for filename/location just save to downloads folder.
	2. Filename created uses time stamp YYYYMMDD-HHMMSS so we don't have filename clash in downloads folder.
	
// DISCLAIMER
	I have made some minor changes to the orginal script which can be found at veritrope.com (full link given above). I'm not affiliated with veritrope.com.

// TERMS OF USE:
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. 

	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*)
```


## Installation

1. Download this repository via the Github Code > Download ZIP option and expand it, or download just the single script file.

2. The script is accessed via the macOS global **Script** menu, which may not be enabled on your Mac. If you don't have the scroll icon in your icons at the right of the menubar, enable it via following [Apple's instructions](https://support.apple.com/en-au/guide/script-editor/scpedt27975/mac), which in short are:

	a. Open the Script Editor application, on the menu choose Script Editor > Preferences, and open the General tab.
	b. Down the bottom, make sure 'Show Script menu in menu bar' and 'Show Computer Scripts' are checked.
	c. I like to have 'Show application scripts' as 'as top'.
		
3. Go to Safari (or in future; other browser), and in your shiny new Script menu choose Open Scripts Folder > Open Safari Scripts Folder. (fyi it's at /Users/_username_/Library/Scripts/Applications/Safari/)

4. Copy the 'Save Safari Tabs as Markdown.scpt' file into the opened folder.

<!-- USAGE EXAMPLES -->
## Usage

So you have 6,231 tabs open across 15 windows and it's time to wipe the slate clean without the anxiety you'll lose something important? 

No problem. 

Go to the Script Menu and chose 'Save Safari Tabs as Markdown'... a few moments later you will have a file 'Safari Tabs 2022-04-20T23-13.md' (with the current date+time) on your Desktop.


<!-- ROADMAP -->
## Roadmap

- [x] Set up nice repo with all my changes
- [x] Working under Safari
- [ ] Working under Edge (next)
- [ ] Other browsers
- [ ] Installer
- [ ] Save as HTML or CSV or ?? directly instead of Markdown for the non-geeks?

See the [open issues](https://github.com/neomanic/save_macos_browser_tabs/issues) for a full list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you are a developer unfamiliar with Applescript, it's not very hard, just annoying due to the syntax and odd limitations. 

Open the script in Script Editor.app. You will need to allow Script Editor to control Safari in System Preferences > Security & Privacy > Accessibility, but iirc you will be asked to allow this the first time you run the script from within the editor.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported license, as set by the original author. See `license.md` for more information.

<!-- CONTACT -->
## Contact

Josh Marshall - [@josh_m](https://twitter.com/josh_m) - josh dot p dot marshall at gmail dot com

Project Link: [https://github.com/neomanic/save\_macos\_browser\_tabs](https://github.com/neomanic/save_macos_browser_tabs)

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

The original and modified versions:

- Original version by Justin Lancy, plain text export: [http://veritrope.com/code/export-all-safari-tabs-to-a-text-file](http://veritrope.com/code/export-all-safari-tabs-to-a-text-file)
- Exporting Markdown, thx @kshiteesh: [https://gist.github.com/kshiteesh/b72e93d31d65008fcd11](https://gist.github.com/kshiteesh/b72e93d31d65008fcd11), orig from [https://web.archive.org/web/20161017151621/http://hegde.me/urlsafari/](https://web.archive.org/web/20161017151621/http://hegde.me/urlsafari/)
- A few changes, thx @unabridgedxcrpt: [https://gist.github.com/unabridgedxcrpt/3f35aa5aec81289368858e2ba6009451](https://gist.github.com/unabridgedxcrpt/3f35aa5aec81289368858e2ba6009451)
- And fix to save UTF-8 file, thx @Sponge-bink: [https://gist.github.com/kshiteesh/b72e93d31d65008fcd11?permalink_comment_id=3471362#gistcomment-3471362](https://gist.github.com/kshiteesh/b72e93d31d65008fcd11?permalink_comment_id=3471362#gistcomment-3471362)

For prettying up the repo:

* [Creative Commons Markdown Licenses](https://github.com/idleberg/Creative-Commons-Markdown/blob/master/legacy/3.0/by-nc-sa.markdown)
* [Best-README-template](https://github.com/othneildrew/Best-README-Template)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/neomanic/save_macos_browser_tabs.svg?style=for-the-badge
[contributors-url]: https://github.com/neomanic/save_macos_browser_tabs/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/neomanic/save_macos_browser_tabs.svg?style=for-the-badge
[forks-url]: https://github.com/neomanic/save_macos_browser_tabs/network/members
[stars-shield]: https://img.shields.io/github/stars/neomanic/save_macos_browser_tabs.svg?style=for-the-badge
[stars-url]: https://github.com/neomanic/save_macos_browser_tabs/stargazers
[issues-shield]: https://img.shields.io/github/issues/neomanic/save_macos_browser_tabs.svg?style=for-the-badge
[issues-url]: https://github.com/neomanic/save_macos_browser_tabs/issues
[license-shield]: https://img.shields.io/github/license/neomanic/save_macos_browser_tabs.svg?style=for-the-badge
[license-url]: https://github.com/neomanic/save_macos_browser_tabs/blob/master/LICENSE.md
[product-screenshot]: images/screenshot.png