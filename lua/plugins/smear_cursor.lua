if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    cursor_color = "#f5457c",
    -- stiffness = 0.8, -- 0.6      [0, 1]
    -- trailing_stiffness = 0.5, -- 0.4      [0, 1]
    -- stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    -- trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    -- damping = 0.8, -- 0.65     [0, 1]
    -- damping_insert_mode = 0.8, -- 0.7      [0, 1]
    -- distance_stop_animating = 0.5,
    smear_between_buffers = true, -- optional: disables smear when switching buffers
  },
}
