
library(tidyverse) 
 # a data frame with 4 observations 
 string_df <- tibble( 
     # 台灣地址 
     taiwan_address = 
         c( 
             "新竹市東區食品路228號", 
             "臺中市大甲區蔣公路140號", 
             "台南市北區中華北路一段85號", 
             "嘉義縣大林鎮民權路53號", 
             "雲林縣西螺鎮福興里中山路70號", 
             "宜蘭縣礁溪鄉德陽路102號", 
             "南投縣竹山鎮集山路一段2071號", 
             "台中市西區精誠路11-4號" 
         ), 
     high_school = 
         c( 
             "台北市立第一女子高級中學", 
             "北一女", # 台 北 市立第 一 女 子高級中學 
             "北一女中", # 台 北 市立第 一 女 子高級 中 學 
             "北一女高", # 台 北 市立第 一 女 子 高 級 中 學 
             "台北市立松山高級中學", 
             "新北市立一級棒女子高級中學", 
             "新北一女", 
             "一級棒女中" 
         ), 
     school_id = 
         c( 
             "411273008", 
             "411382009", 
             "411274010", 
             "411263011", 
             "411044103", 
             "411055104", 
             "411066105", 
             "411077106" 
         ), 
     skill = 
         c( 
             "C++, R", 
             "R, Python", 
             "R", 
             "Python, Java", 
             "Julia, Python", 
             "Julia", 
             "", "R" 
         ), 
     github = c( 
         "https://github.com/Tang0724/113-1-R-final-project.git", 
         "https://github.com/rhythm-1112/113-1-R-final-project", 
         "https://github.com/shellyhuang507/113-1-R-final-project", 
         "https://github.com/harryyuan123456/113-1-R-final-project", 
         "https://github.com/Xiemuying/113-1-R-final-project.git", 
         "https://github.com/jason941210/113-1-R-final-project", 
         "https://github.com/Allend3wiudi/113-1-R-final-project.git", 
         "https://github.com/Daniellin411373092/113-1-R-final-project.git" 
     ) 
 ) 
  
 glimpse(string_df[1:2,]) 

