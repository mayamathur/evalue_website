---
title: Resources
layout: archive
output:
  md_document:
    variant: gfm
    preserve_yaml: true
---

## More resources for E-values for unmeasured confounding

In addition to using this website, you can alternatively compute
E-values (VanderWeele & Ding, 2017) using the R package
[EValue](https://cran.r-project.org/web/packages/EValue/index.html)
(Mathur et al., 2018) or the Stata module
[EVALUE](https://ideas.repec.org/c/boc/bocode/s458592.html) (Linden et
al., 2020).

For more information on the interpretation of the E-value and further
technical details, see Ding & VanderWeele (2016), Haneuse et al. (2019),
VanderWeele et al. (2019a), and VanderWeele et al. (2019b).

## More resources for other biases and study designs

Methods and tools are also available to conduct analogous sensitivity
analyses for other types of biases, including:

  - Selection bias (Smith & VanderWeele, 2019a; website or R package
    [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
  - Measurement error (VanderWeele & Li, 2019; R package
    [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
  - A combination of unmeasured confounding, selection bias, and
    measurement error simultaneously (Smith et al, 2020; R package
    [EValue](https://cran.r-project.org/web/packages/EValue/index.html))
  - An analog of the E-value is also available to address unmeasured
    mediator-outcome confounding when carrying out mediation analysis
    for direct and indirect effects (Smith & VanderWeele, 2019b).

Finally, similar approaches are also available to assess biases in
meta-analyses including:

  - Unmeasured confounding in meta-analyses (Mathur & VanderWeele,
    2020a; website or R package EValue)
  - Publication bias in meta-analyses (Mathur & VanderWeele, 2020b; R
    package PublicationBias)

## Developers

This website was created by [Maya
Mathur](https://profiles.stanford.edu/maya-mathur), [Peng
Ding](https://sites.google.com/site/pengdingpku/), [Corinne
Riddell](https://sph.berkeley.edu/corinne-riddell-phd), [Louisa
Smith](), and [Tyler
VanderWeele](https://www.hsph.harvard.edu/tyler-vanderweele/tools-and-tutorials/).

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
E-values: The evalue package. The Stata Journal (in press).
[Link](https://journals.sagepub.com/doi/abs/10.1177/1536867X20909696)

Mathur MB, Ding P, Riddell CA, & VanderWeele TJ (2018). Website and R
package for computing E-values. Epidemiology 29(5), e45.
[Link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6066405/)

Mathur MB & VanderWeele TJ (2020a). Sensitivity analysis for unmeasured
confounding in meta-analyses. Journal of the American Statistical
Association 115(529), 163-170.
[Link](https://www.tandfonline.com/doi/full/10.1080/01621459.2018.1529598)

Mathur MB & VanderWeele TJ (2020b). Sensitivity analysis for publication
bias in meta-analyses. Journal of the Royal Statistical Society: Series
C. In press. [Link](https://osf.io/s9dp6/)

Smith LH & VanderWeele TJ (2019a). Bounding bias due to selection.
Epidemiology 30(4), 509.
[Link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6553568/)

Smith LH & VanderWeele TJ (2019b). Mediational E-values: Approximate
sensitivity analysis for mediator-outcome confounding. Epidemiology
30(6), 835-837.
[Link](https://journals.lww.com/epidem/Fulltext/2019/11000/Mediational_E_values__Approximate_Sensitivity.9.aspx)

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
