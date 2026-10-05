package.path = "./AI_Dictionary.koplugin/?.lua;" .. package.path

package.loaded["answer_formatter"] = {
  trim_to_dictionary_limit = function(text) return text end,
}
package.loaded.device = { screen = {} }
package.loaded["string_cleanup"] = function(text) return text end

local Context = require("context")
local last_window
local plugin = {
  ui = {
    document = {
      getProps = function() return { title = "Book", authors = "Author" } end,
      getToc = function() return {} end,
    },
  },
}
local highlight = {
  selected_text = { text = "looked" },
  getSelectedWordContext = function(_, window)
    last_window = window
    if window == 3 then return "at me. Amelia", "at me. Doug" end
    return "Caleb looked at me. Amelia", "at me. Doug"
  end,
}

local translation = Context.build_query_context(plugin, highlight, "AI Translate")
assert(last_window == 3, "translation should use a narrow context window")
assert(translation.selection_context == "at me. Amelia {{{ looked }}} at me. Doug")

Context.build_query_context(plugin, highlight, "AI Explain")
assert(last_window == 15, "other actions should keep the wider context window")

print("context_spec: passed")
