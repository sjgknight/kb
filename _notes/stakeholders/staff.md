---
title: "staff"
---

testing testing

[[scenario1]] seems interesting and also [[scenario2]]

And the real question is, can I link to 

So we can set up external links like so:
[some link](http://localhost:4000/DSI_collection_sheets/item.html?id=demo_00006)


## This could be fixed
Create a partial to look for internal links to items/ or browse/ and replace with correct. Turn these into internal links. And ensure they're indexed in the backlinks.

{% capture link_with_anchor %}{% link pages/browse.md %}#demo_00051{% endcapture %}
[this works but is treated as an external link]({{ link_with_anchor }})


### Nope

But none of these work:

* [[The resource references are authoritative works that provide reliable evidence to support the related ideas. To cite reference properly can make the argument more objective and convincing. It is important to synthesise different resources to support claims.]]
* [[site.data.demo_00006]]
* [[demo_00006]]
* [[items/demo_00006]]
* [[item.html#demo_00006]] 
* [[data/demo_00006]]
* [[objects/demo_00006]]
* [[item.html?id=demo_00095]]

* [[pages/browse.html#demo_00051]]
* {{ '/item.html?id=demo_00006' | relative_url }}
* {{ item.html?id=demo_00006 | relative_url }}
* {{ '/item.html?id=demo_00006' | absolute_url }} 
* { {{ '/item.html?id=demo_00006' | relative_url }} | url_encode }
* {{ '/item.html?id=demo_00006' | url_encode }}
* {{ '/item.html?id=demo_00006' | url_encode }}
* {{ site.item.objectid[00006].properties }}
* {{ site.obj.objectid[00006].properties  }}
* {{ item.objectid[00006].properties }}
* {{ obj.objectid[00006].properties }}

