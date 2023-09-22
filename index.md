---
title: How to use this website
layout: archive
output:
  md_document:
    variant: gfm
    preserve_yaml: true
---

## Citations

Please use the following citations when using this website:

1.  Mathur MB, Ding P, Riddell CA, VanderWeele TJ (2018). Website and R
    package for computing E-values. Epidemiology, 29(5), e45-e47.
    [Link](https://journals.lww.com/epidem/Citation/publishahead/Website_and_R_Package_for_Computing_E_Values.98679.aspx)
2.  VanderWeele TJ & Ding P (2017). Sensitivity analysis in
    observational research: introducing the E-value. Annals of Internal
    Medicine, 167(4), 268-274.
    [Link](http://annals.org/aim/article-abstract/2643434/sensitivity-analysis-observational-research-introducing-e-value?doi=10.7326%2fM16-2607)

## Computing an E-value

**Default E-values:** The tab [Compute an
E-value](http://www.evalue-calculator.com/evalue/) computes the E-value,
defined as the minimum strength of association on the risk ratio scale
that an unmeasured confounder would need to have with both the exposure
and the outcome, conditional on the measured covariates, to fully
explain away a specific exposure-outcome association. Stated otherwise,
confounding associations that were jointly weaker than the E-value could
not explain away the association. Note that for outcome types other than
relative risks, assumptions are involved with the approximate
conversions used ([VanderWeele & Ding,
2017](https://www.acpjournals.org/doi/full/10.7326/M16-2607?casa_token=Rj6q01v7LIYAAAAA%3ATqWx91IICO3Pk9pnvI0MJxiJvehcXkH36975lqyat-2ftftmqBSgTgRz1-uOvx_VdxSgeMUO_KUkZQ)).

**Non-null E-values:** Alternatively, you can consider the confounding
strength capable of moving the observed association to any other value
(e.g. attenuating the observed association to a true causal effect that
is no longer scientifically important, or alternatively increasing a
near-null observed association to a value that is of scientific
importance). For this purpose, simply type a non-null effect size into
the box “True causal effect to which to shift estimate” when computing
the E-value.

**E-values for effect-measure modification:** Standard E-values apply to
the main effect of one exposure on an outcome. If instead your point
estimate is a statistical interaction term representing effect-measure
modification of one exposure across strata of another exposure, then the
E-values this website calculates for ratio measures can still be used to
assess sensitivity of the effect-measure modification estimate to
uncontrolled confounding ([Mathur, et al.,
2021](https://academic.oup.com/ije/article/51/4/1268/6573242)). The
E-values then represent the minimum severity of confounding (defined as
above) in least one stratum of the second exposure in order to explain
away the effect-measure modification. This assumes that confounding
operates in the same direction in each stratum of the second exposure.
To avoid that assumption, you would take the square-root of your
estimate on the risk ratio scale before using this calculator. For
estimates on the difference scale (i.e., the interaction contrast), use
the function `evalues.IC` in the R package
[`EValue`](https://cran.r-project.org/web/packages/EValue/index.html).

## Computing a bias factor

Additionally, if you have substantive knowledge on the strength of the
relationships between the unmeasured confounder(s) and the exposure and
outcome, you can use these numbers to [calculate the bias
factor](https://qsu-stanford.shinyapps.io/bias_factor/).

## Bug reports

Submit any bug reports by opening an issue on
[GitHub](https://github.com/mayamathur/evalue/issues).
