# to do



# A test combination of collectionbuilder + digital garden

To run locally use bundle exec jekyll serve (see https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)


What I want to be able to do is: 

1. define a data structure with 'title' 'authors' 'date' 'place' 'abstract' 'image' 'copyright-status' 'type' (note, paper, media, etc.), 
2. import data from multiple APIs and tables, ideally using a GUI like baserow because it'd make things easier later (and could be queried here)...but baserow isn't as simple to use as I'd hoped
3. from that ideally import into Jekyll (per collectionbuilder) AND ALSO make so they can be used as internal-links/backlinks in a digital garden (per jekyll digital-garden/Quartz). 


This branch combines [collectionbuilder](https://github.com/CollectionBuilder/collectionbuilder-sheets/) (details below), and [the digital garden jekyll template](https://github.com/maximevaillancourt/digital-garden-jekyll-template/), both released under MIT license.


# CollectionBuilder-Sheets

A fork of (the unfinished/incompletely documented) collectionbuilder-sheets...as far as I can see it works just fine.

Uses a googlesheet feed to load data into a website template. 

There may be other ways to do this e.g. explore

* https://css-tricks.com/creating-an-editable-site-with-google-sheets-and-eleventy/ (demo https://11tygooglesheet.netlify.app/ ; git https://github.com/Atanda1/11tywithgooglesheet )
* https://dylancastillo.co/build-a-site-quickly-using-google-sheets-python-and-aws/

**Note: this template is not yet fully functional or documented! Check back soon**

CollectionBuilder-Sheets is an experimental project template designed to load collection metadata directly from Google Sheets or other CSV. 
This enables live collaboration to prototype collections with minimal set up.

To learn more check [docs/sheets-metadata.md](docs/sheets-metadata.md).

This template is based on [CollectionBuilder-GH](https://github.com/CollectionBuilder/collectionbuilder-gh).

## License

CollectionBuilder documentation and general web content is licensed [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/). 
This license does *NOT* include any objects or images used in digital collections, which may have individually applied licenses described by a "rights" field.
CollectionBuilder code is licensed [MIT](https://github.com/CollectionBuilder/collectionbuilder-gh/blob/main/LICENSE). 
This license does not include external dependencies included in the `assets/lib` directory, which are covered by their individual licenses.
