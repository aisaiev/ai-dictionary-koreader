local TranslationPrompt = {}

function TranslationPrompt.for_book_selection(target_language)
  local target = tostring(target_language or "")
  if target:match("^%s*$") then
    target = "Ukrainian"
  end
  return "I'm reading '{title}' by '{author}'{chapter}. This is my selected text: \n'{selection}'\n" ..
      "This is the context where it appears: '...{context}...'\n" ..
      "Translate only the exact selected text into " .. target .. ". " ..
      "Use the context only to choose its meaning and grammatical form. " ..
      "Do not translate surrounding text or add words that are only implied by the context. " ..
      "Keep the answer within the scope of the selection; do not expand a word into a phrase or sentence. " ..
      "Give only the translation and add nothing more. Ask no questions at the end."
end

return TranslationPrompt
