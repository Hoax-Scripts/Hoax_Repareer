function CalculatePrice(health)
    local str = nil

    if health > 800 then 
        str = 'yellow'
    end

    if health < 800 and health > 250 then
        str = "yellow"
    end

    if health < 250 then
        str = "red"
    end

    local list = {
        min = Config.Prices[str].min,
        max = Config.Prices[str].max
    }

    local price = math.floor(math.random(list.min, list.max))

    return price
end