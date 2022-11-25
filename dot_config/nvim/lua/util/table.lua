local M = {}

local function clone_internal(t, copies)
  if type(t) ~= "table" then
    return t
  end

  copies = copies or {}
  if copies[t] then
    return copies[t]
  end

  local copy = {}
  copies[t] = copy

  for k, v in pairs(t) do
    copy[clone_internal(k, copies)] = clone_internal(v, copies)
  end

  setmetatable(copy, clone_internal(getmetatable(t), copies))

  return copy
end

function M.clone(t)
  -- We need to implement this with a helper function to make sure that
  -- user won't call this function with a second parameter as it can cause
  -- unexpected troubles
  return clone_internal(t)
end

function M.merge(...)
  local tables_to_merge = { ... }
  if #tables_to_merge == 1 then
    return tables_to_merge[1]
  end

  assert(#tables_to_merge > 1, "there should be at least two tables to merge them")

  for k, t in ipairs(tables_to_merge) do
    assert(type(t) == "table", string.format("expected a table as function parameter %d", k))
  end

  local result = M.clone(tables_to_merge[1])

  for i = 2, #tables_to_merge do
    local from = tables_to_merge[i]
    for k, v in pairs(from) do
      if type(v) == "table" then
        result[k] = result[k] or {}
        assert(type(result[k]) == "table", string.format("expected a table: '%s'", k))

        if v.__overwrite then
          local vv = M.clone(v)
          vv.__overwrite = nil
          result[k] = vv
        else
          result[k] = M.merge(result[k], v)
        end
      else
        result[k] = v
      end
    end
  end

  return result
end

return M
