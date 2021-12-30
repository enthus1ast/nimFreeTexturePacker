import jsony, tables

type
  Meta = object
    app: string
    version: string
    image: string
    format: string
    size: Size
    scale: int
  Size = object
    w, h: int
  Rect = object
    x, y, w, h: int
  Point = object
    x, y: int
  Frame = object
    frame: Rect
    rotated: bool
    trimmed: bool
    spriteSourceSize: Rect
    sourceSize: Size
    pivot: Point
  Frames = OrderedTable[string, Frame]
  Texture = object
    meta: Meta
    frames: Frames

proc loadPackedTexture*(path: string): Texture =
  ## Loads a packed texture json (only hash export)
  return path.readFile.fromJson(Texture)

when isMainModule:
  import os
  let tex = loadPackedTexture(getAppDir() / ".." / "tests" / "demo.json")
  echo tex