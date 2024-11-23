# Character class

Most work on character class is associated with pattern matching. With clear specification of the pattern (規律), we can 

  - **detect** the pattern in a string: return TRUE (pattern detected) or FALSE (pattern not detected).  
  - **extract** the pattern from a string: return the pattern detected.  
  - **replace** the pattern in a string: return the string with the pattern replaced.  
  - **split** the string by the pattern.  
  - **count** the number of patterns in a string.  
  - etc. 

## example data frame


<https://github.com/tpemartin/113-1-R/blob/d5a5718876adc9f46cfdfe2d2754407374b7c6d7/R/week11-ee-preparation.r#L2-L21>

### When location is enough

    - `string_df$taiwan_address`: extract "XX市" or "XX縣" (first three characters: location from 1 to 3).  
    - `string_df$school_id`: extract department code. (location from 5 to 6).  

Create new columns `location` and `department` in the dataframe `string_df`, where  
    - `location` is the first three characters of `taiwan_address`.  
    - `department` is the 5th and 6th characters of `school_id`.  

<https://github.com/tpemartin/113-1-R/blob/d5a5718876adc9f46cfdfe2d2754407374b7c6d7/R/week11-ee-preparation.r#L24-L29>

### Pattern

Pattern is the regularity you want to detect.

***

#### Number of characters, starting/ending character

<details>
<summary>Taiwan county or township</summary>
  
  - three to five characters including an ending character.  
  - ending character is one of "鄉", "鎮", "區", "里".

> Extract the string from `string_df$taiwan_address` that fits the following pattern: it has three to five traditional Chinese characters of which the ending character is one of "鄉", "鎮", "區", or "里".

<https://github.com/tpemartin/113-1-R/blob/99e8e7b5b717db711a1f877d868e4f3c5fcf8afd/R/week11-ee-preparation.r#L60-L67>

  - :exclamation: Trim off unwanted characters to shorten the sentence can enhance precision.

> Remove the first three characters of `string_df$taiwan_address` as `trimmed_taiwan_address` then extract the string from `trimmed_taiwan_address` that fits the following pattern: it has three to five traditional Chinese characters of which the ending character is one of "鄉", "鎮", "區", or "里".

<https://github.com/tpemartin/113-1-R/blob/99e8e7b5b717db711a1f877d868e4f3c5fcf8afd/R/week11-ee-preparation.r#L69-L77>

</details>

### Enhanced regular expression