---
title: Welcome!
layout: archive
output:
  md_document:
    variant: gfm
    preserve_yaml: true
---

## Computing an E-value

The tab “Compute an E-value” computes the E-value, defined as the
minimum strength of association on the risk ratio scale that an
unmeasured confounder would need to have with both the exposure and the
outcome, conditional on the measured covariates, to fully explain away a
specific exposure-outcome association. Note that for outcome types other
than relative risks, assumptions are involved with the approximate
conversions used (see reference 2).

Alternatively, you can consider the confounding strength capable of
moving the observed association to any other value (e.g. attenuating the
observed association to a true causal effect that is no longer
scientifically important, or alternatively increasing a near-null
observed association to a value that is of scientific importance). For
this purpose, simply type a non-null effect size into the box “True
causal effect to which to shift estimate” when computing the E-value.

## Computing a bias factor

Additionally, if you have substantive knowledge on the strength of the
relationships between the unmeasured confounder(s) and the exposure and
outcome, you can use these numbers to [calculate the bias
factor](https://bias-factor.hmdc.harvard.edu/).

Please use the following citations:

1.  Mathur MB, Ding P, Riddell CA, VanderWeele TJ. (2018). Website and R
    package for computing E-values. Epidemiology, 29(5), e45-e47.
    [Link](https://journals.lww.com/epidem/Citation/publishahead/Website_and_R_Package_for_Computing_E_Values.98679.aspx)
2.  VanderWeele TJ, & Ding P. (2017). Sensitivity analysis in
    observational research: introducing the E-value. Annals of Internal
    Medicine, 167(4), 268-274.
    [Link](http://annals.org/aim/article-abstract/2643434/sensitivity-analysis-observational-research-introducing-e-value?doi=10.7326%2fM16-2607)

## Bug reports

Submit any bug reports to: `mmathur [AT] stanford [DOT] edu` or open an
issue on [GitHub](https://github.com/mayamathur/evalue/issues).
