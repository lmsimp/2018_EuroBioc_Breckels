# European Bioconductor Developers' [Meeting 2018](https://bioconductor.github.io/EuroBioc2018/), Munich, Germany

Slides under CC-BY license.

Cite as: Breckels, Lisa; Gatto, Laurent (2018): Interactive visualisation of spatial proteomics data
fig**share**.
[http://](http://).


## Learning from heterogeneous data sources

### Slide 1 -Spatial proteomics
*	Spatial proteomics is the systematic large-scale analysis of a cell’s proteins and their assignment to distinct sub-cellular compartments  
*	It is vital for deciphering a proteins function and possible interaction partners
*	It is important in identifying therapeutic targets and the design of drugs as it there is a significant correlation between protein mis-localisation and disease

### Slide 2 - Localisation maps
*	There are a number of ways we can go about studying protein localisation and one approach is to use quantitative proteomics methods
*	Very generally, this involves taking cells, gently breaking them to extract their cellular content (but without disrupting the organelles inside), separating on a density gradient, taking discrete fractions across the gradient, and then using MS to identify the content. 
*	The result of these types of experiments is a matrix of quantitation values, where we have proteins along the rows and their respective relative intensity in each fraction along the columns
*	We find proteins belonging to the same organelle share similar density gradient patterns
*	To assign proteins to a sub-cellular localisation we can use supervised machine learning. This requires a set of known residents to use as training examples.

### Slide 
*	All this implemented in pRoloc software, including vignette on how to apply the algorithms

