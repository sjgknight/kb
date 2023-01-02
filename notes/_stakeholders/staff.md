---
title: "staff"
---


one 

{{ site.data.foo.values[1][0]}}

onea
{% if site.data.foo.values[1][0] == "demo_002" %} 
  "conditional is working"
{% endif %}

oneb
{% if site.data.foo.values[1][0] contains "demo_002" %} 
  "conditional is working"
{% endif %}

two
{% for objects in site.data.foo.values %}
  {% if objects[0] contains "demo_002" %}
  {{ objects[0] }}
  {% endif %}
{% endfor %}

twoa
{% for objects in site.data.foo.values %}
  {% if objects[0] == "demo_002" %}
  {{ objects[0] }}
  {% endif %}
{% endfor %}


three
{% for objects in site.data.foo.values %}
  {{ objects[0] | where:objects[0], "demo_002" }}
{% endfor %}

four

% for objects in site.data.foo.values %
  % objects[0] | where:objects[0], "demo_002" %
% endfor %

site.data.foo.values[1] | where:[0], "demo_0002" 
site.data.foo.values | where:"text","demo_00002" 

testing testing

[[scenario1]] seems interesting and also [[scenario2]]

And the real question is, can I link to 

So we can set up external links like so:
[some link](http://localhost:4000/DSI_collection_sheets/item.html?id=demo_00006)


## This could be fixed
Create a partial to look for internal links to items/ or browse/ and replace with correct. Turn these into internal links. And ensure they're indexed in the backlinks.

{% capture link_with_anchor %}{% link pages/browse.md %}#demo_00051{% endcapture %}
[this works but is treated as an external link]({{ link_with_anchor }})

 [link to an item]({{ '/item.html?id=demo_00051' | relative_url }})
 
  [items about rpackages]({{ '/browse.html#Analysis examples (e.g. R packages https%3A%2F%2Fwww.r-pkg.org%2Fctv ) (For AT2a)' | relative_url }})

### Note from github
The content pages of the site (About pages, etc) are rendered by Jekyll, so can use Liquid and Markdown. You can create links to things that don't exist yet!

If you mean you want to link to an individual item page, e.g. https://collectionbuilder.github.io/collectionbuilder-gh/item.html?id=demo_001
from any Markdown page in your site, you can use Liquid like this:
[link to an item]({{ '/item.html?id=demo_001' | relative_url }})

The Liquid relative_url figures out the link for you based on the "baseurl" and "url" values in your "_config.yml" which is helpful for development and if your site might move hosting locations. You can also just manually create the relative link, just keep in mind the baseurl where your site is hosted, e.g. a link from the About page of the demo CB-GH site above would be:
[example](/collectionbuilder-gh/item.html?id=demo_001)

If you want to link to a subset on the Browse page, you can add a hash # at the end, like
[items about farms]({{ '/browse.html#farms' | relative_url }})

https://github.com/CollectionBuilder/collectionbuilder-sheets/issues/17


### Nope

But none of these work:

* [[The resource references are authoritative works that provide reliable evidence to support the related ideas. To cite reference properly can make the argument more objective and convincing. It is important to synthesise different resources to support claims.]]
* [[site.data.demo_00006]]
* [[demo_00006]]
* [[items/demo_00006]]
* [[item.html#demo_00006]] 
* [[data/demo_00006]]
* [[objects/demo_00006]]
* %%[[item.html?id=demo_00095]]%%
* [[pages/browse.html#demo_00051]]
* {{ '/item.html?id=demo_00006' | relative_url }}
* {{ '/item.html?id=demo_00006' | absolute_url }} 
* { {{ '/item.html?id=demo_00006' | relative_url }} | url_encode }
* {{ '/item.html?id=demo_00006' | url_encode }}
* {{ '/item.html?id=demo_00006' | url_encode }}
* {{ site.item.objectid[00006].properties }}
* {{ site.obj.objectid[00006].properties  }}
* {{ item.objectid[00006].properties }}
* {{ obj.objectid[00006].properties }}

