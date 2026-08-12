local TranslationPrompt = {}

function TranslationPrompt.for_book_selection(target_language)
  local target = tostring(target_language or "")
  if target:match("^%s*$") then
    target = "Ukrainian"
  end
  return "I'm reading '{title}' by '{author}'{chapter}. This is my selected text: \n'{selection}'\n" ..
      "This is the context where it appears: '...{context}...'\n" ..
      "Translate the selected text into " .. target .. ". " ..
      "Give only the translation and add nothing more. Ask no questions at the end."
end

return TranslationPrompt
