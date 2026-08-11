{%  macro get_season(x) %}
case when month(to_timestamp({{x}})) in (12,1,2) then 'WINTER'
     when month(to_timestamp({{x}})) in (3,4,5) then 'SPRING'
     when month(to_timestamp({{x}})) in (6,7,8) then 'SUMMER'
     else 'AUTUMN'
     end
{% endmacro %}

{%  macro get_day(x) %}
case 
    when dayname(try_to_timestamp({{x}})) in ('Sat','Sun')
    then 'WEEKEND'
    else 'BUSINESSDAY'
    end
{% endmacro %}