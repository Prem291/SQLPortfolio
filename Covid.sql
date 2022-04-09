Select *
from [Portfolioproject].[dbo].['owid-covid-data$']
where continent is not null
order by 3,4

-- looking at total cases vs total deaths 
-- shows likelihood of dying if you contract covid in your countrry
Select [location], [date], [total_cases], [total_deaths],([total_deaths]/[total_cases])*100 as DeathPercentage
from [Portfolioproject].[dbo].['owid-covid-data$']
where [location] like '%India%'
order by 1,2

-- looking at total cases vs population
-- Shows what percentage  of population got covid
Select [location], [date], [total_cases], [population],([total_deaths]/[total_cases])*100 as DeathPercentage
from [Portfolioproject].[dbo].['owid-covid-data$']
where [location] like '%India%'
order by 1,2

--looking at countries with highest infection rate compared to population
Select [location],[population],MAX([total_cases]) as HighestInfectionCount,MAX([total_deaths]/[total_cases])*100 as PercentagepopulationInfected
from [Portfolioproject].[dbo].['owid-covid-data$']
--where [location] like '%India%'
group by [location],[population]
order by PercentagepopulationInfected desc

--showing countries with highest deathcount per population
Select [location],MAX(cast([total_deaths] as int)) as TotalDeathCount
from [Portfolioproject].[dbo].['owid-covid-data$']
--where [location] like '%India%'
where continent is not null 
group by [location]
order by TotalDeathCount desc

--Showing the continents which highest death rates 

Select [continent],MAX(cast([total_deaths] as int)) as TotalDeathCount
from [Portfolioproject].[dbo].['owid-covid-data$']
--where [location] like '%India%'
where [continent] is not null 
group by [continent]
order by TotalDeathCount desc

--Global numbers

Select SUM([new_cases]) as [total_cases]  ,SUM(cast([new_deaths] as int)) as [total_deaths], Sum(cast([new_deaths] as int))/SUM([new_cases])*100 as DeathPercentage
from [Portfolioproject].[dbo].['owid-covid-data$']
--where [location] like '%India%'
where [continent] is not null 
--Group by [date]
order by 1,2


 
