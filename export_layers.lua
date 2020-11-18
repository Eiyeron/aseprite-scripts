function basedir(path)
  for i = path:len(), 1, -1 do
    if path:sub(i, i) == "/" then
      return path:sub(1, i)
    end
  end
  return ""
end


function find_cel(cels, frame)
  for i, cel in ipairs(cels) do
    if cel.frame.frameNumber == frame then
      return cel
    end
  end
  return nil
end

-- Concatenatig all logging into a single print window.
local diagnostic = ""
function log(...)
  local str = string.format(...)
  diagnostic = diagnostic .. str
  if str:sub(#str, #str) ~= "\n"then
    diagnostic = diagnostic .. "\n"
  end
end

local sprite = app.activeSprite
local current_frame = app.activeFrame.frameNumber
local current_folder = basedir(sprite.filename)
local must_show = false

for i, layer in ipairs(sprite.layers) do
  if layer.isImage then
    local name = layer.name

    log("Processing " .. name)
    local cel = find_cel(layer.cels, current_frame)
    if cel ~= nil then
      local sprite_to_export = Sprite(sprite.width, sprite.height)
      local path_to_save = current_folder .. name .. ".png"
      sprite_to_export:newCel(sprite_to_export.layers[1], 1, cel.image)
      sprite_to_export:saveAs(path_to_save)
      sprite_to_export:close()
      log (("- Saved to %s"):format(path_to_save))
    else
      log(("- Didn't find a cell at frame %d"):format(current_frame))
      must_show = true
    end
  end
end
log("Done")

if must_show then
    print(diagnostic)
end

