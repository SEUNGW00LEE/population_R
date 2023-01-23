setwd("/Users/seungwoo/Desktop/population_R/")

#preprocessing.R의 dataframe 불러오기
library(readxl)
df_1234 = read_excel("/Users/seungwoo/Desktop/population_R/dataset/alltime_population.xlsx")
population <- data.frame(df_1234)
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
head(population)
#위에서 만든 dataframe을 모두 하나로 합칩니다.
mylist <- mget(paste0('total_', c(1925,1940,1944,1955,1960,1966,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015,2016,2017,2018,2019,2020,2021))) #위에서 만든 데이터 프레임의 이름을 mylist에 저장합니다.

total_all <- Reduce(function(x, y) merge(x, y, all=TRUE), mylist) #위의 모든 dataframe을 total_all로 merge합니다.

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

# anim_save(filename = "/Users/seungwoo/Desktop/population_R/visualization/total_population.gif",
#           animation = total_population,
#           nframes = 200, end_pause = 20,
#           width = 1080, height = 720, 
#           renderer = gifski_renderer(loop = FALSE))







