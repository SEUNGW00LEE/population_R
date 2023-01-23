setwd("/Users/seungwoo/Desktop/population_R/")

#preprocessing.R의 dataframe 불러오기
library(readxl)
df_1234 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/alltime_population.xlsx")

# Data Visualization
# install.packages("tidyverse")
# install.packages("nord")
# install.packages("viridis")
# install.packages("gapminder")
# install.packages('gganimate')
# install.packages('gifski')
# install.packages('png')

library(ggplot2)
library(tidyverse)
library(gganimate)
library(nord)
library(viridis)
library(gapminder)

# install.packages("extrafont")
library(extrafont)
font_import() #저장된 폰트 불러오기 (y 입력)

# Data Visualization Concrete

# 각 연도, 행정구역별 총인구 히스토그램 (ggplot) -> 연도별 행정구역 총인구 히스토그램 애니메이션(gganimate)
# 각 연도, 행정구역, 연령별 인구 히스토그램(ggplot) -> 모든 행정구역별 히스토그램 -> 연도별 행정구역, 연령별 인구 히스토그램 애니메이션(gganimate)

# install.packages("reshape2")
library(reshape2)
library(gganimate)
total_name <- colnames(df_1234[grep('총인구', colnames(df_1234))])
total_name

#연도별로 행정구역별 인구를 합칩니다. NA값은 제외하여 합계를 구합니다(na.rm=TRUE). 
## 비효율적인 코드로 보입니다. ## 리팩토링이 필요합니다.
total_1925 = data.frame(population = tapply(df_1234$`1925년 총인구(명)`, df_1234$행정구역별,sum, na.rm=TRUE))
total_1925 <- mutate(total_1925, year = 1925) %>% 
  mutate(total_1925, area = rownames(total_1925))
total_1940 = data.frame(population =tapply(df_1234$`1940년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1940 <- mutate(total_1940, year = 1940)  %>% 
  mutate(total_1940, area = rownames(total_1940))
total_1944 = data.frame(population =tapply(df_1234$`1944년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1944 <- mutate(total_1944, year = 1944) %>% 
  mutate(total_1944, area = rownames(total_1944))
total_1955 = data.frame(population =tapply(df_1234$`1955년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1955 <- mutate(total_1955, year = 1955) %>% 
  mutate(total_1955, area = rownames(total_1955))
total_1960 = data.frame(population =tapply(df_1234$`1960년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1960 <- mutate(total_1960, year = 1960) %>% 
  mutate(total_1960, area = rownames(total_1960))
total_1966 = data.frame(population =tapply(df_1234$`1966년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1966 <- mutate(total_1966, year = 1966) %>% 
  mutate(total_1966, area = rownames(total_1966))
total_1970 = data.frame(population =tapply(df_1234$`1970년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1970 <- mutate(total_1970, year = 1970) %>% 
  mutate(total_1970, area = rownames(total_1970))
total_1975 = data.frame(population =tapply(df_1234$`1975년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1975 <- mutate(total_1975, year = 1975) %>% 
  mutate(total_1975, area = rownames(total_1975))
total_1980 = data.frame(population =tapply(df_1234$`1980년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1980 <- mutate(total_1980, year = 1980) %>% 
  mutate(total_1980, area = rownames(total_1980))
total_1985 = data.frame(population =tapply(df_1234$`1985년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1985 <- mutate(total_1985, year = 1985) %>% 
  mutate(total_1985, area = rownames(total_1985))
total_1990 = data.frame(population =tapply(df_1234$`1990년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1990 <- mutate(total_1990, year = 1990) %>% 
  mutate(total_1990, area = rownames(total_1990))
total_1995 = data.frame(population =tapply(df_1234$`1995년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_1995 <- mutate(total_1995, year = 1995) %>% 
  mutate(total_1995, area = rownames(total_1995))
total_2000 = data.frame(population =tapply(df_1234$`2000년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2000 <- mutate(total_2000, year = 2000) %>% 
  mutate(total_2000, area = rownames(total_2000))
total_2005 = data.frame(population =tapply(df_1234$`2005년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2005 <- mutate(total_2005, year = 2005) %>% 
  mutate(total_2005, area = rownames(total_2005))
total_2010 = data.frame(population =tapply(df_1234$`2010년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2010 <- mutate(total_2010, year = 2010) %>% 
  mutate(total_2010, area = rownames(total_2010))
total_2015 = data.frame(population =tapply(df_1234$`2015년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2015 <- mutate(total_2015, year = 2015) %>% 
  mutate(total_2015, area = rownames(total_2015))
total_2016 = data.frame(population =tapply(df_1234$`2016년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2016 <- mutate(total_2016, year = 2016) %>% 
  mutate(total_2016, area = rownames(total_2016))
total_2017 = data.frame(population =tapply(df_1234$`2017년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2017 <- mutate(total_2017, year = 2017) %>% 
  mutate(total_2017, area = rownames(total_2017))
total_2018 = data.frame(population =tapply(df_1234$`2018년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2018 <- mutate(total_2018, year = 2018) %>% 
  mutate(total_2018, area = rownames(total_2018))
total_2019 = data.frame(population =tapply(df_1234$`2019년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2019 <- mutate(total_2019, year = 2019) %>% 
  mutate(total_2019, area = rownames(total_2019))
total_2020 = data.frame(population =tapply(df_1234$`2020년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2020 <- mutate(total_2020, year = 2020) %>%
  mutate(total_2020, area = rownames(total_2020))
total_2021 = data.frame(population =tapply(df_1234$`2021년 총인구(명)`, df_1234$행정구역별, sum, na.rm=TRUE))
total_2021 <- mutate(total_2021, year = 2021) %>%
  mutate(total_2021, area = rownames(total_2021))

#위에서 만든 dataframe을 모두 하나로 합칩니다.
mylist <- mget(paste0('total_', c(1925,1940,1944,1955,1960,1966,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015,2016,2017,2018,2019,2020,2021))) #위에서 만든 데이터 프레임의 이름을 mylist에 저장합니다.

total_all <- Reduce(function(x, y) merge(x, y, all=TRUE), mylist) #위의 모든 dataframe을 total_all로 merge합니다.
View(total_all)
#ggplot, gganimate를 통한 데이터시각화
#년도에 따라, 지역별 인구수를 시각화합니다.

total_population <-
  ggplot(total_all, aes(x=area, y=population, fill = area)) +
  geom_col(show.legend=FALSE)+
  geom_text(aes(x=area, y=population, label=population), vjust = -0.7, family = "AppleSDGothicNeo-SemiBold")+ #hist bar위의 숫자를 표시합니다.
  scale_color_brewer(palette = "Set3")+ #상대적으로 여러색이 내장된 Set3를 이용합니다.
  theme_minimal()+
  theme(text = element_text(size = 11 ,   family = "AppleSDGothicNeo-SemiBold", face = "bold"), #font를 설정합니다. 
        plot.title = element_text(hjust = 0.5,size=20, family = "AppleSDGothicNeo-SemiBold", face='bold', color = "darkblue"))+ #title font를 설정합니다.
  transition_states(year,
                    transition_length=10, #총 시간
                    state_length=2)+ #각 년도별 시간
  scale_y_continuous(labels = scales::comma)+ #축 눈금이 지수형이 아닌 1,000,000식으로 표시합니다.
  ggtitle('{closest_state}년 대한민국 지역별 인구수',
          subtitle = '{frame} / {nframes}')+
  xlab("지역") + ylab("지역별 총인구") #x축 이름과 y축 이름


#원하는 크기와 frame으로 total_population을 설정합니다.
#시각화가 끝난후 20frame 기다렸다가 다시 재생합니다.

total_population <-animate(plot=total_population, nframes=200, end_pause = 20, width=1080, height=720)
total_population
# 영상 저장
#install.packages('av')

# anim_save(filename = "/Users/seungwoo/Desktop/population_R/visualization/total_population.gif",
#           animation = total_population,
#           nframes = 200, end_pause = 20,
#           width = 1080, height = 720, 
#           renderer = gifski_renderer(loop = FALSE))







