local Util = {}


function Util.FindInTable(table, target)
    for i, v in ipairs(table) do
        if v == target then
            return i
        end
    end
    return nil
end

function Util.Contains(t, value)
    return Util.FindInTable(t, value) ~= nil
end

return Util