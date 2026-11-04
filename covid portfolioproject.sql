select *
from portfolioProject..coviddeaths 
order by 3,4

select *
from portfolioProject..Covidvaccination
order by 3,4

--select data we are going to be using
select location,date,total_cases,new_cases,total_deaths,population
from portfolioProject..coviddeaths 
order by 1,2

--looking at total cases vs total deaths
select location,date,total_cases,total_deaths,(total_deaths/total_cases)
as death_percentage from portfolioProject..coviddeaths 
order by 1,2

--looking at total cases vs population

select location,date,total_cases,total_deaths,population,(total_cases/population)*100 as death_percentage
from portfolioProject..coviddeaths
where location like '%ind%'
order by 1,2

--showing countries with hoghest death per population
select location,population,max(total_cases) as highestinfectioncount,max((total_cases/population))*100
as percentage_population_infected
from portfolioProject..coviddeaths
group by location ,population
order by percentage_population_infected

select location,max(total_deaths) as TotalDeathCount
from portfolioProject..coviddeaths
group by location 
order by TotalDeathCount desc

--global numbers

select date,sum(new_cases),sum(new_deaths)--total_cases,total_deaths,(total_deaths/total_cases)*100 as death_percentage
from portfolioProject..coviddeaths
--where location like '%ind%'
group by date
order by 1,2


--looking at total population vs vaccinations
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,sum(vac.new_vaccinations) over (partition by dea.location order by dea.location,dea.date)
from portfolioProject..CovidDeaths dea
join portfolioProject..CovidVaccination vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null
order by 2,3


--with cte

with popvsVac (continent,location,date,population,new_vaccinations,RollingPeopleVaccinated)
as
(select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,sum(vac.new_vaccinations) over (partition by dea.location order by dea.location,dea.date)
as rollingpeoplevaccinated
from portfolioProject..CovidDeaths dea
join portfolioProject..CovidVaccination vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3
)
select *,(RollingPeopleVaccinated/population)*100
from popvsVac

--temp table
create table #percentpopulationvaccinated
(
continent nvarchar(255),
location nvarchar(255),
population numeric,
date datetime,
new_vaccinations numeric,
rollingpeoplevaccinated numeric
)

insert into #percentpopulationvaccinated
select dea.continent,dea.location,dea.population,dea.date,vac.new_vaccinations
,sum(vac.new_vaccinations) over (partition by dea.location order by dea.location,dea.date)
as rollingpeoplevaccinated
from portfolioProject..CovidDeaths dea
join portfolioProject..CovidVaccination vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null

select *,(rollingpeoplevaccinated/population)*100
from #percentpopulationvaccinated

-- creating views to store data later for visualisations
create viewpercentpopulationvaccinated as

select dea.continent,dea.location,dea.population,dea.date,vac.new_vaccinations
,sum(vac.new_vaccinations) over (partition by dea.location order by dea.location,dea.date)
as rollingpeoplevaccinated
from portfolioProject..CovidDeaths dea
join portfolioProject..CovidVaccination vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null

select *
from percentpopulationvaccinated