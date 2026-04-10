#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"
require "time"

POST_GLOB = File.join(__dir__, "..", "_posts", "**", "*.md")
EXPECTED_LANGS = %w[en pt].freeze
STRICT = ENV.fetch("STRICT_I18N", "false").downcase == "true"

pairs = Hash.new { |hash, key| hash[key] = [] }
errors = []

Dir.glob(POST_GLOB).sort.each do |path|
  content = File.read(path)
  unless content.start_with?("---\n")
    errors << "Missing front matter: #{path}"
    next
  end

  _, front_matter, = content.split(/^---\s*$\n?/, 3)
  if front_matter.nil? || front_matter.strip.empty?
    errors << "Empty front matter: #{path}"
    next
  end

  data = YAML.safe_load(front_matter, permitted_classes: [Time], aliases: false) || {}
  lang = data["lang"]&.to_s
  translation_key = data["translation_key"]&.to_s

  if translation_key.nil? || translation_key.empty?
    errors << "Missing translation_key: #{path}"
    next
  end

  if lang.nil? || lang.empty?
    errors << "Missing lang: #{path}"
    next
  end

  pairs[translation_key] << { "lang" => lang, "path" => path }
end

pairs.each do |key, items|
  langs = items.map { |item| item["lang"] }.uniq.sort
  missing = EXPECTED_LANGS - langs
  next if missing.empty?

  listed_paths = items.map { |item| item["path"] }.join(", ")
  errors << "translation_key '#{key}' is missing #{missing.join(", ")} (present in: #{listed_paths})"
end

if errors.empty?
  puts "i18n pairs check: OK"
  exit 0
end

puts "i18n pairs check: found issues"
errors.each { |err| puts "- #{err}" }

if STRICT
  exit 1
end

puts "STRICT_I18N is false; continuing without failing."
exit 0
