# Re-fit the Bond-Lamberty et al. (2004) Rh~Rs curve


# We collected studies in the scientific literature that estimated
# autotrophic and heterotrophic sources of RS. We used only studies that
# (i) partitioned RS into its heterotrophic and autotrophic component
# fluxes, or otherwise calculated RC, and (ii) reported annual (not simply
# growing season) RS flux for one or more field study sites. If a study
# did not report annual RS but was performed at an intensively studied
# site for which these data were available (e.g., the BOREAS NSA tower
# site in Manitoba, Canada), the study was included. Data from a study of
# RS and RC for a boreal black spruce (Picea mariana (Mill.) BSP)
# chronosequence (Bond- Lamberty, 2004 (in press)) were included; annual
# RS has been published for these sites (Wang et al., 2002). We focused on
# undisturbed forests or tree plantations and thus excluded several
# studies (Edwards & Ross- Todd, 1983; Gordon, 1987; Toland & Zak, 1994)
# comparing recent clearcuts to intact forests, all of which reported
# essentially no root contribution to RS (i.e., RC 5 0% for intact
# forest). This is improbable, and we believe that the high disturbance
# associated with such clearcuts justified excluding these studies. In
# addition, the RA values reported by Ryan et al. (1997) for the BOREAS
# NSA research site exceeded reported RS at this site, and were
# significantly different from a number of other studies using similar
# techniques at the same site (Steele et al., 1997; Dioumaeva et al.,
# 2002). These data were thus excluded; we did not exclude data from other
# sites reported by Ryan et al. (1997) using the same techniques (but
# doing so would not have significantly changed our results). Finally, one
# study (Thierron & Laudelout, 1996) with extremely high reported values
# for RS and RC was excluded after model fitting, as an outlier test
# (Chatterjee & Price, 1991) using it and the reduced data set was highly
# significant (Y* 5 817, YPRED 5 191, SE(YPRED) 5 105, T53 5 5.96,
# Bonferroni- adjusted Po0.001). We did not exclude studies based on
# measurement method (e.g., low readings possibly associated with alkali
# absorbents) (Raich & Nadelhoffer, 1989).

library(ggplot2)
theme_set(theme_bw())
library(dplyr)
import::from(readr, read_csv)

bl2004 <- read_csv("2004_paper_data.csv")
read_csv("srdb-data.csv", guess_max = 1e6) %>% 
  filter(Rs_annual > 0, Rh_annual > 0,
         !is.na(Rs_annual), !is.na(Rh_annual),
         Manipulation == "None") %>% 
  select(Record_number, Quality_flag, Age_disturbance,
         Biome, Ecosystem_type, Annual_coverage, Partition_method,
         Rs_annual, Rh_annual) ->
  srdb

# For the 53 sites examined, ln(RH) = 1.22 + 0.73 ln(RS), R2 = 0.81, P < 0.001
