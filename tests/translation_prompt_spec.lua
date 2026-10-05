package.path = "./AI_Dictionary.koplugin/?.lua;" .. package.path

local TranslationPrompt = require("translation_prompt")

local prompt = TranslationPrompt.for_book_selection("Ukrainian")

assert(prompt:find("Translate only the exact selected text into Ukrainian%.", 1) ~= nil)
assert(prompt:find("Use the context only to choose its meaning and grammatical form%.", 1) ~= nil)
assert(prompt:find("Do not translate surrounding text or add words that are only implied by the context%.", 1) ~= nil)
assert(prompt:find("do not expand a word into a phrase or sentence%.", 1) ~= nil)

print("translation_prompt_spec: passed")
