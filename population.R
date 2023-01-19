# FIX: 버그 수정
# FEAT: 새로운 기능
# DOCS: 문서 수정
# STYLE: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
# REFACTOR: 코드 리펙토링
# TEST: 테스트 코트, 리펙토링 테스트 코드 추가
# CHORE: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정 같은 경우)
# BUILD: 시스템 또는 외부 종속성에 영향을 미치는 변경사항 (npm, gulp, yarn 레벨)
# REVERT: 작업 되돌리기

# 엑셀 파일 불러오기
library(readxl)

setwd("/Users/seungwoo/Desktop/population_R/")

population1_2540 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/1925,1940population.xlsx")
population2_4470 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/1944~1970population.xlsx")
population3_7510 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/1975~2010population.xlsx")
population4_1521 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/15~21population.xlsx")

#엑셀파일을 모두 dataframe으로 저장합니다.

df_1 = data.frame(population1_2540)
df_2 = data.frame(population2_4470)
df_3 = data.frame(population3_7510)
df_4 = data.frame(population4_1521)

#행정구역별 column에 value를 채워줍니다.

df_1$행정구역별[3:20]<- "경기도"
df_1$행정구역별[22:39] <- "강원도"
df_1$행정구역별[41:58] <- "충청북도"
df_1$행정구역별[60:77] <- "충청남도"
df_1$행정구역별[79:96] <- "전라북도"
df_1$행정구역별[98:115]<- "전라남도"
df_1$행정구역별[117:134] <- "경상북도"
df_1$행정구역별[136:153] <- "경상남도"
df_1$행정구역별[155:172] <- "황해도"
df_1$행정구역별[174:191] <- "평안북도"
df_1$행정구역별[193:210] <- "평안남도"
df_1$행정구역별[212:229] <- "함경북도"
df_1$행정구역별[231:248] <- "함경남도"

df_2$행정구역별[3:20] <- "서울특별시"
df_2$행정구역별[22:39] <- "부산광역시"
df_2$행정구역별[40:58] <- "경기도"
df_2$행정구역별[60:77] <- "강원도"
df_2$행정구역별[79:96] <- "충청북도"
df_2$행정구역별[98:115] <- "충청남도"
df_2$행정구역별[117:134] <- "전라북도"
df_2$행정구역별[136:153] <- "전라남도"
df_2$행정구역별[155:172] <- "경상북도"
df_2$행정구역별[174:191] <- "경상남도"
df_2$행정구역별[193:210] <- "제주도"
df_2$행정구역별[212:228] <- "황해도"
df_2$행정구역별[230:246] <- "평안북도"
df_2$행정구역별[248:264] <- "평안남도"
df_2$행정구역별[266:282] <- "함경북도"
df_2$행정구역별[284:300] <- "함경남도"

df_3$행정구역별[3:20] <- "서울특별시"
df_3$행정구역별[22:39] <- "부산광역시"
df_3$행정구역별[41:58] <- "대구광역시"
df_3$행정구역별[60:77] <- "인천광역시"
df_3$행정구역별[79:96] <- "광주광역시"
df_3$행정구역별[98:115] <- "대전광역시"
df_3$행정구역별[117:134] <- "울산광역시"
df_3$행정구역별[136:153] <- "경기도"
df_3$행정구역별[155:172] <- "강원도"
df_3$행정구역별[174:191] <- "충청북도"
df_3$행정구역별[193:210] <- "충청남도"
df_3$행정구역별[212:229] <- "전라북도"
df_3$행정구역별[231:248] <- "전라남도"
df_3$행정구역별[250:267] <- "경상북도"
df_3$행정구역별[266:286] <- "경상남도"
df_3$행정구역별[287:305] <- "제주도"

colnames(df_4)[1] <- "행정구역별" #df_4의 column 값만 달라서 df_1,df_2,df_3과 동일하게 변경
df_4[1,1] <- "행정구역별" #df_4 data 값 변경(이전 data : 행정구역별(읍면동))

df_4$행정구역별[3:22] <- "서울특별시"
df_4$행정구역별[24:43] <- "부산광역시"
df_4$행정구역별[45:64] <- "대구광역시"
df_4$행정구역별[66:85] <- "인천광역시"
df_4$행정구역별[87:106] <- "광주광역시"
df_4$행정구역별[108:127] <- "대전광역시"
df_4$행정구역별[129:148] <- "울산광역시"
df_4$행정구역별[150:169] <- "세종특별자치시"
df_4$행정구역별[171:190] <- "경기도"
df_4$행정구역별[192:211] <- "강원도"
df_4$행정구역별[213:232] <- "충청북도"
df_4$행정구역별[234:253] <- "충청남도"
df_4$행정구역별[255:274] <- "전라북도"
df_4$행정구역별[276:295] <- "전라남도"
df_4$행정구역별[297:316] <- "경상북도"
df_4$행정구역별[318:337] <- "경상남도"
df_4$행정구역별[339:358] <- "제주도"

# 데이터 결합

library(dplyr)

df_12 <- full_join(df_1, df_2)
df_123 <- full_join(df_12, df_3)

# df_4는 df_123과 다르게 연령이 0 - 4세가 아닌 0 ~ 5세로 됐다.

df_4$연령별 <- gsub("~"," - ", df_4$연령별) 
#gsub를 통해 ~를 -로 변경

df_1234 <- full_join(df_123, df_4) 

#df_1234의 column 값을 명시적으로 바꿔주고, 첫번째 행을 삭제

names(df_1234) <- c('행정구역별', "연령별", "1925년 총인구(명)", "1925년 남자인구(명)", "1925년 여자인구(명)", "1925년 성비", "1940년 총인구(명)", "1940년 남자인구(명)", "1940년 여자인구(명)", "1940년 성비", "1944년 총인구(명)", "1944년 남자인구(명)", "1944년 여자인구(명)", "1944년 성비", "1955년 총인구(명)", "1955년 남자인구(명)", "1955년 여자인구(명)", "1955년 성비", "1960년 총인구(명)", "1960년 남자인구(명)", "1960년 여자인구(명)", "1960년 성비", "1966년 총인구(명)", "1966년 남자인구(명)", "1966년 여자인구(명)", "1966년 성비", "1970년 총인구(명)", "1970년 남자인구(명)", "1970년 여자인구(명)", "1970년 성비", "1975년 총인구(명)", "1975년 남자인구(명)", "1975년 여자인구(명)", "1975년 성비", "1980년 총인구(명)", "1980년 남자인구(명)", "1980년 여자인구(명)", "1980년 성비", "1985년 총인구(명)", "1985년 남자인구(명)", "1985년 여자인구(명)", "1985년 성비", "1990년 총인구(명)", "1990년 남자인구(명)", "1990년 여자인구(명)", "1990년 성비", "1995년 총인구(명)", "1995년 남자인구(명)", "1995년 여자인구(명)", "1995년 성비", "2000년 총인구(명)", "2000년 남자인구(명)", "2000년 여자인구(명)", "2000년 성비", "2005년 총인구(명)", "2005년 남자인구(명)", "2005년 여자인구(명)", "2005년 성비", "2010년 총인구(명)", "2010년 남자인구(명)", "2010년 여자인구(명)", "2010년 성비", "2015년 총인구(명)", "2015년 남자인구(명)", "2015년 여자인구(명)", "2015년 성비",  "2016년 총인구(명)", "2016년 남자인구(명)", "2016년 여자인구(명)", "2016년 성비",  "2017년 총인구(명)", "2017년 남자인구(명)", "2017년 여자인구(명)", "2017년 성비",  "2018년 총인구(명)", "2018년 남자인구(명)", "2018년 여자인구(명)", "2018년 성비",  "2019년 총인구(명)", "2019년 남자인구(명)", "2019년 여자인구(명)", "2019년 성비",  "2020년 총인구(명)", "2020년 남자인구(명)", "2020년 여자인구(명)", "2020년 성비",  "2021년 총인구(명)", "2021년 남자인구(명)", "2021년 여자인구(명)", "2021년 성비") #column 값 변경

df_1234 <- df_1234[-1, ] #첫번째 행을 삭제(column과 설명 동일)

#data type이 character인 문제가 있다. numeric으로 바꿔줘야한다.

for(n_col in 3:90){
  df_1234[, n_col] = as.numeric(df_1234[, n_col])
}

# df_1234를 엑셀파일로 저장
# install.packages('openxlsx')

library(openxlsx)
# 기존 파일 삭제
file.remove('dataset/alltime_population.xlsx')

# 새 파일 생성
write.xlsx(df_1234, file = "dataset/alltime_population.xlsx")

# Data Visualization
# install.packages("tidyverse")
# install.packages("nord")
# install.packages("viridis")
# install.packages("gapminder")
# install.packages('gganimate')
# install.packages('gifski')
# install.packages('png')

# library(ggplot2)
# library(tidyverse)
# library(gganimate)
# library(nord)
# library(viridis)
# library(gapminder)

# install.packages("extrafont")
# library(extrafont)
# font_import()

# Data Visualization Concrete

# 각 연도, 행정구역별 총인구 히스토그램 (ggplot) -> 연도별 행정구역 총인구 히스토그램 애니메이션(gganimate)
# 각 연도, 행정구역, 연령별 인구 히스토그램(ggplot) -> 모든 행정구역별 히스토그램 -> 연도별 행정구역, 연령별 인구 히스토그램 애니메이션(gganimate)

# install.packages("reshape2")
library(reshape2)

total_name <- colnames(df_1234[grep('총인구', colnames(df_1234))])
total_name
<<<<<<< HEAD
#연도별로 행정구역별 인구를 합칩니다. NA값은 제외하여 합계를 구합니다(na.rm=TRUE). 
=======
#연도별로 행정구역별 인구를 합칩니다. NA값은 제외하여 합계를 구합니다. 
>>>>>>> 90fbfd3bf94c602d4148f78de97a8054902e835d
## 비효율적인 코드로 보입니다. ## 리팩토링이 필요합니다.

total_1925 = data.frame(t(tapply(df_1234$`1925년 총인구(명)`, df_1234$행정구역별,sum, na.rm=TRUE)))
total_1925 <- mutate(total_1925, year = 1925)
total_1940 = data.frame(t(tapply(df_1234$`1940년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1940 <- mutate(total_1940, year = 1940)
total_1944 = data.frame(t(tapply(df_1234$`1944년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1944 <- mutate(total_1944, year = 1944)
total_1955 = data.frame(t(tapply(df_1234$`1955년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1955 <- mutate(total_1955, year = 1955)
total_1960 = data.frame(t(tapply(df_1234$`1960년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1960 <- mutate(total_1960, year = 1960)
total_1966 = data.frame(t(tapply(df_1234$`1966년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1966 <- mutate(total_1966, year = 1966)
total_1970 = data.frame(t(tapply(df_1234$`1970년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1970 <- mutate(total_1970, year = 1970)
total_1975 = data.frame(t(tapply(df_1234$`1975년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1975 <- mutate(total_1975, year = 1975)
total_1980 = data.frame(t(tapply(df_1234$`1980년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1980 <- mutate(total_1980, year = 1980)
total_1985 = data.frame(t(tapply(df_1234$`1985년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1985 <- mutate(total_1985, year = 1985)
total_1990 = data.frame(t(tapply(df_1234$`1990년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1990 <- mutate(total_1990, year = 1990)
total_1995 = data.frame(t(tapply(df_1234$`1995년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_1995 <- mutate(total_1995, year = 1995)
total_2000 = data.frame(t(tapply(df_1234$`2000년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2000 <- mutate(total_2000, year = 2000)
total_2005 = data.frame(t(tapply(df_1234$`2005년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2005 <- mutate(total_2005, year = 2005)
total_2010 = data.frame(t(tapply(df_1234$`2010년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2010 <- mutate(total_2010, year = 2010)
total_2015 = data.frame(t(tapply(df_1234$`2015년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2015 <- mutate(total_2015, year = 2015)
total_2016 = data.frame(t(tapply(df_1234$`2016년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2016 <- mutate(total_2016, year = 2016)
total_2017 = data.frame(t(tapply(df_1234$`2017년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2017 <- mutate(total_2017, year = 2017)
total_2018 = data.frame(t(tapply(df_1234$`2018년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2018 <- mutate(total_2018, year = 2018)
total_2019 = data.frame(t(tapply(df_1234$`2019년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2019 <- mutate(total_2019, year = 2019)
total_2020 = data.frame(t(tapply(df_1234$`2020년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2020 <- mutate(total_2020, year = 2020)
total_2021 = data.frame(t(tapply(df_1234$`2021년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE)))
total_2021 <- mutate(total_2021, year = 2021)

#위에서 만든 dataframe을 모두 하나로 합칩니다.
mylist <- mget(paste0('total_', c(1925,1940,1944,1955,1960,1966,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015,2016,2017,2018,2019,2020,2021))) #위에서 만든 데이터 프레임의 이름을 mylist에 저장합니다.
total_all <- Reduce(function(x, y) merge(x, y, all=TRUE), mylist) #위의 모든 dataframe을 total_all로 merge합니다.

ggplot(total_1925, aes(x=Var1, y=value, fill = ..y..),binwidth=1000) + geom_histogram(stat='identity') + scale_fill_gradient(low = "#CCE5FF", high =  "#FABDB3") + theme(text = element_text(size = 5 ,   family = "AppleSDGothicNeo-SemiBold")) +ggtitle("1925 총인구(명)")

library(gganimate)

