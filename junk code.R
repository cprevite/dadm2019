#remove rows
bands <- bands[-c(486:540),]


#remove certain columns
bands <-
  bands[, which(
    !names(bands) %in% c(
      "date",
      "cylinder_no",
      "customer",
      "job_number",
      "ink_color",
      "blade_mfg",
      "cylinder_division",
      "unit_number",
      "location",
      "plating_tank",
      "solvent_pct",
      "ESA_voltage",
      "ESA_amperage" ,
      "chrome_content"
    )
  )]


#retrieve colnames
a = as.data.frame((colnames(bands)))
a = cbind(a,c(1:40))



```{r}
missing.values <- bands %>%
  gather(key = "key", value = "val") %>%
  mutate(isna = is.na(val)) %>%
  group_by(key) %>%
  mutate(total = n()) %>%
  group_by(key, total, isna) %>%
  summarise(num.isna = n()) %>%
  mutate(pct = num.isna / total * 100)


levels <-
  (missing.values  %>% filter(isna == T) %>% arrange(desc(pct)))$key

percentage.plot <- missing.values %>%
  ggplot() +
  geom_bar(aes(x = reorder(key, desc(pct)), 
               y = pct, fill=isna), 
           stat = 'identity', alpha=0.8) +
  scale_x_discrete(limits = levels) +
  scale_fill_manual(name = "", 
                    values = c('steelblue', 'tomato3'), labels = c("Present", "Missing")) +
  coord_flip() +
  labs(title = "Percentage of missing values", x =
         'Variable', y = "% of missing values")

percentage.plot
```


In this part we use the'aggr' function Calculate or plot the amount of missing/imputed values in each variable and the amount of missing/imputed values in certain combinations of variables.
```{r}

library(VIM)
aggr(bands[, which(sapply(bands, function(x)all(any(is.na(x)))) == TRUE)], sortVar=TRUE, cex.lab=0.8, cex.axis=0.9,  numbers = TRUE, combined = TRUE,  oma = c(8,1,1,1))


```




