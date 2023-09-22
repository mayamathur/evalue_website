---
title: Resources
layout: archive
output:
  md_document:
    variant: gfm
    preserve_yaml: true
---

## More resources for E-values for unmeasured confounding

In addition to using this online tool, you can alternatively compute
E-values (VanderWeele & Ding, 2017) using the R package
[EValue](https://cran.r-project.org/web/packages/EValue/index.html)
(Mathur et al., 2018) or the Stata module
[EVALUE](https://ideas.repec.org/c/boc/bocode/s458592.html) (Linden et
al., 2020).

Further papers provide more information on the use and interpretation of
E-values (Haneuse et al., 2019; VanderWeele et al. 2019b; VanderWeele,
2021), technical details concerning E-values (Ding & VanderWeele, 2016;
VanderWeele et al., 2019a) and reporting guidelines for E-values
(VanderWeele and Mathur, 2020).

## More resources for other biases and study designs

Methods and tools are also available to conduct analogous sensitivity
analyses for other types of biases, including:

- Unmeasured confounding of effect heterogeneity or causal interaction
  estimates (Mathur et al., 2021; R package
  [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
- Selection bias (Smith & VanderWeele, 2019a; [online
  tool](ttps://www.selection-bias.louisahsmith.com/) or R package
  [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
- Missing data or selection bias (Mathur, 2023; or R package
  [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
- Measurement error (VanderWeele & Li, 2019; R package
  [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
- A combination of unmeasured confounding, selection bias, and
  measurement error simultaneously (Smith et al, 2021; R package
  [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
- Unmeasured mediator-outcome confounding in mediation analysis for
  direct and indirect effects (Smith & VanderWeele, 2019b)

Finally, similar approaches are also available to assess biases in
meta-analyses including:

- Unmeasured confounding in meta-analyses (Mathur & VanderWeele, 2020a;
  [online tool](http://www.evalue-calculator.com/meta/) or R package
  [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
- Publication bias in meta-analyses (Mathur & VanderWeele, 2020b; R
  package
  [PublicationBias](https://cran.r-project.org/web/packages/PublicationBias/index.html))

## Developers

This website was created by [Maya Mathur](https://www.mayamathur.com/),
[Peng Ding](https://sites.google.com/site/pengdingpku/), [Corinne
Riddell](https://sph.berkeley.edu/corinne-riddell-phd), [Louisa
Smith](https://www.louisahsmith.com/), [Tyler
VanderWeele](https://www.hsph.harvard.edu/tyler-vanderweele/tools-and-tutorials/),
and [Péter Sólymos](https://peter.solymos.org/).

## References

Ding P & VanderWeele TJ (2016). Sensitivity analysis without
assumptions. Epidemiology, 27(3), 368–377.
[Link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4820664/)

Haneuse S, VanderWeele TJ, & Arterburn D (2019). Using the E-value to
assess the potential effect of unmeasured confounding in observational
studies. Journal of the American Medical Association, 321(6), 602-603.
[Link](https://jamanetwork.com/journals/jama/fullarticle/2723079?casa_token=vP0UXdEX4HAAAAAA:y0GoUYecb4QvGnn23FNxpnOsBu5Z70-DW1apD84XqPWNL0kXYDXlT5hQVweAUZVh6zJe9BU_sA)

Linden A, Mathur MB, & VanderWeele TJ (2020). Conducting sensitivity
analysis for unmeasured confounding in observational studies using
E-values: The evalue package. The Stata Journal, 20(1), 162-175.
[Link](https://journals.sagepub.com/doi/abs/10.1177/1536867X20909696)

Mathur MB, Ding P, Riddell CA, & VanderWeele TJ (2018). Website and R
package for computing E-values. Epidemiology 29(5), e45-e47.
[Link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6066405/)

Mathur MB & VanderWeele TJ (2020a). Sensitivity analysis for unmeasured
confounding in meta-analyses. Journal of the American Statistical
Association 115(529), 163-170.
[Link](https://www.tandfonline.com/doi/full/10.1080/01621459.2018.1529598);
[online tool](http://www.evalue-calculator.com/meta/)

Mathur MB & VanderWeele TJ (2020b). Sensitivity analysis for publication
bias in meta-analyses. Journal of the Royal Statistical Society: Series
C, 69(5), 1091-1119.
[Link](https://rss.onlinelibrary.wiley.com/doi/10.1111/rssc.12440)

Mathur MB, Smith LH, Yoshida K, Ding P, VanderWeele TJ (2021). E-values
for effect heterogeneity and conservative approximations for causal
interaction. Under review. [Link](https://osf.io/h6pru/).

Smith LH & VanderWeele TJ (2019a). Bounding bias due to selection.
Epidemiology 30(4), 509-516.
[Link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6553568/); [online
tool](http://www.selection-bias.com/)

Smith LH & VanderWeele TJ (2019b). Mediational E-values: Approximate
sensitivity analysis for mediator-outcome confounding. Epidemiology
30(6), 835-837.
[Link](https://journals.lww.com/epidem/Fulltext/2019/11000/Mediational_E_values__Approximate_Sensitivity.9.aspx)

Smith LH, Mathur MB, VanderWeele TJ (2021). Multiple-bias sensitivity
analysis using bounds. Epidemiology (in press).
[Link](https://arxiv.org/abs/2005.02908)

VanderWeele TJ & Ding P (2017). Sensitivity analysis in observational
research: Introducing the E-value. Annals of Internal Medicine, 167(4),
268-274.
[Link](https://annals.org/aim/fullarticle/2643434/sensitivity-analysis-observational-research-introducing-e-value)

VanderWeele TJ, Ding P, & Mathur MB (2019a). Technical considerations in
the use of the E-value. Journal of Causal Inference, 7(2).
[Link](https://www.degruyter.com/view/journals/jci/7/2/article-20180007.xml)

VanderWeele TJ, Mathur MB, & Ding P (2019b). Correcting
misinterpretations of the E-value. Annals of Internal Medicine 170(2),
131-132.
[Link](https://annals.org/aim/article-abstract/2719984/correcting-misinterpretations-e-value)

VanderWeele TJ & Li Y (2019). Simple sensitivity analysis for
differential measurement error. American Journal of Epidemiology,
188(10), 1823-1829.
[Link](https://academic.oup.com/aje/article/188/10/1823/5506602?casa_token=5ZyiVJp9_5UAAAAA:40rpOH1mRz0IDeRJ35atRRk9x6MJgIHMNOxLCcsnfouzN3qWXrght0XVWNIHQcRwWP1Bhgl8vY9B)

VanderWeele, TJ & Mathur MB. (2020). Commentary: developing
best-practice guidelines for the reporting of E-values. International
Journal of Epidemiology, 49(5), 1495-1497.
[Link](https://academic.oup.com/ije/article/49/5/1495/5879832)

VanderWeele TJ (2021). Are Greenland, Ioannidis and Poole opposed to the
Cornfield conditions? A defence of the E-value. International Journal of
Epidemiology, dyab218. [Link](https://doi.org/10.1093/ije/dyab218)

Zhang X, Stamey JD, Mathur MB (2020). Assessing the impact of unmeasured
confounders for credible and reliable real-world evidence.
Pharmacoepidemiology and Drug Safety, 29:1219–1227.
[Link](https://osf.io/fe4gs)

Mathur MB (2023). The M-value: A simple sensitivity analysis for bias
due to missing data in treatment effect estimates. American Journal of
Epidemiology, 192(4), 612-620.
[Link](https://academic.oup.com/aje/article/192/4/612/6873724?login=false)
