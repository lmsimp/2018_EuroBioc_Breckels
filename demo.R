## packages
suppressPackageStartupMessages(library("pRoloc"))
suppressPackageStartupMessages(library("pRolocdata"))
suppressPackageStartupMessages(library("pRolocGUI"))

## data for main, aggregate and classify
data("hyperLOPIT2015")
data("hyperLOPIT2015ms3r1psm")
load("data/foicol.rda")
sapply(foicol@foic, function(z) z@description)

## data for compare app (Claire's data, not to be shared as unpublished)
load("../2017-THP1-LOPIT-Claire/data4/lps.rda")
load("../2017-THP1-LOPIT-Claire/data4/unst.rda")
xx <- MSnSetList(list(unst, lps))

## ==================================================================
## THE MAIN APP
## ==================================================================
## ==================================================================
## Example 1 - TRAPP complex (trafficking protein particle complex)
## ==================================================================


## MULTI-LOCALISATION ---> ER/GA    to    PM / Cytosol
## ------------------------------------------------------------------
## All protein involved in trafficking between ER/GA and PM/Cytoplasm. 


## DEMO:
## ------------------------------------------------------------------
## 1.  Search for TRAPPC in the data table of the main application
##     7 proteins will be found all part of the TRAPP complex.
## 2.  Localised in "no mans land" as it is has multiple localisation
## 3.  Note: one protein sits away, investigation shows it has a separate 
##     role as an activator of NF-kappa-B through increased phosphorlyation 
##     of IKK complex.
## 4.  Zoom in on cluster
## 5.  Go to profiles, keep only ER/GA, PM and Cytosol --> see it is 
##     a composite of these

pRolocVis(hyperLOPIT2015, fcol = "final.assignment")

# trapp <- foicol[[13]]



## ==================================================================
## Example 2 - EIF3 complex
## ==================================================================

## LOCALISATION ---> Edge of the NUCLEUS
## ------------------------------------------------------------------
## Eukaryotic initiation factor 3 (eIF3) is a multiprotein complex 
## that functions during the initiation phase of translation
## 
## --- eIF3 stimulates nearly all steps of translation initiation

## DEMO:
## ------------------------------------------------------------------
## 1.   Search fro EIF3
## 2.   Look at location and profiles are very high correlated, a good 
##      examples of a well characterised complex

pRolocVis(hyperLOPIT2015, fcol = "final.assignment")




## ==================================================================
## Example 3 - Show that the main app can load many organelles/complexes
## ==================================================================

## Might be worth showing we can load the main application with different
## fcol/marker definitions, in fact we can load tens of complexes and
## visualise them together or independently by cliking on/off, much
## easier than using static plot that needs to be regenerated every time

## DEMO:
## ------------------------------------------------------------------
pRolocVis(hyperLOPIT2015, fcol = "protein.complexes")





## ==================================================================
## THE AGGREGATION APP
## ==================================================================
## ==================================================================
## Example 4 - Q8BGY7  -->   Protein FAM210A, family with sequence 
##                           similarity 210
## ==================================================================

## LOCALISATION ---> Unknown thought to be expressed in MT and CYTOPLASM 
##                                    (we see peptides in both locations)
## ------------------------------------------------------------------
## This is an interesting protein found from looking at the outliers 
## on the aggvar plot on the LHS. This protein has 3 PSMs available for
## quantitation all with very different localisations on the plot.

## Not much was known about this proteins function until this year 
## (see http://www.pnas.org/content/115/16/E3759)
## Is is expressed in muscle mitochondria and cytoplasm but not in bone
## and thought to strongly influence the structure and strength of 
## both muscle and bone and a new target for osteoporosis.


## The 3 PSMs are located in very different places one in MT and other close to CYTOSOL
## agree with known literature.

## Notes: - Red points shows aggregated protein localisation from PSMs
##        - LHS: The aggvar protein plot - PSMs with very different locations
##          are those with high aggvar distances (top of the plot)
##        - RHS: PSM/peptide level PCA plot


## DEMO: 
## ------------------------------------------------------------------

hl <- combineFeatures(hyperLOPIT2015ms3r1psm,
                      groupBy = fData(hyperLOPIT2015ms3r1psm)$Sequence,
                      fun = median)
pRolocVis(hl, app = "aggregate", fcol = "markers",
          groupBy = "Protein.Group.Accessions")





## ==================================================================
## THE CLASSIFY APP
## ==================================================================
## ==================================================================
## Example 5 - thresholding
## ==================================================================

## Load the classification results from the mouse stem cell dataset
## Explain how users set thresholds 
## See the effects on classifictaion of setting thresholds

## DEMO:
myThreshold <- pRolocVis(hyperLOPIT2015, app = "classify",
                                         fcol = "svm.classification",
                                         scol = "svm.score")






## ==================================================================
## THE COMPARE APP
## ==================================================================
## ==================================================================
## Example 6 - Claire's THP data (a monocytic cancer cell line)
## ==================================================================

## USE CASE: - hyperLOPIT experiment on a THP1 cells 
##           - 3 x 20 fractions (two 10 plex TMT each replicate) 
##                       (1) unstimulated and also 
##                       (2) cells treated with Lipopolysaccharide (LPS) (12 hrs stimulation)
##           - see many proteins re-localise after 12 hours LPS stimulations


## THE APP:  - side by side comparsion - 2 PCA plots
##           - option to remap to same PCA space

##           - LHS: UNSTIMULATED
##           - RHS: LPS induced response



## DEMO:  CDC42. In active state binds to a variety of effector proteins 
##              to regulate cellular responses at the plasma membrane (PM)
## ------------------------------------------------------------------
## 1.   Search for the small GTPase Cdc42
## 2.   See in unstimulated LHS sits in the middle and upon LPS stimulation
##      moves to the plasma membrane --->   Unknown to PM
## 3.   Make columns of table more informative, remove redundant ones,
##      add SVM prediction ones so you can see what's changes




## DEMO:  RABs. Another GTPase regulates membrane trafficking 
##              to regulate cellular responses at the plasma membrane (PM)
## ------------------------------------------------------------------

##       Rab GTPases regulate many steps of membrane trafficking, including 
##       vesicle formation and movement. These processes make up the route through which 
##       cell surface proteins are trafficked from the GA to the PM 
## ------------------------------------------------------------------
## 1.   Search for the RAB32 --->           GA to ER      (see SVM loc in table)
##      Then search for RAB12 --->          PM to GA
##      Then search for RAB6B --->          GA to PM
## (make sure columns of table display SVM location)

pRolocVis(xx, app = "compare", remap = FALSE)


