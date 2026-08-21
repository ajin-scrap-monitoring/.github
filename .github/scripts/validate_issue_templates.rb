# frozen_string_literal: true

require "yaml"

template_directory = File.join(".github", "ISSUE_TEMPLATE")
required_keys = %w[name about title labels assignees].freeze
errors = []

template_paths = Dir.glob(File.join(template_directory, "*.md")).sort
template_paths.each do |path|
  content = File.read(path, encoding: "UTF-8")
  match = content.match(/\A---\r?\n(?<yaml>.*?)\r?\n---\r?\n/m)

  unless match
    errors << "#{path}: YAML front matter is missing"
    next
  end

  begin
    front_matter = YAML.safe_load(match[:yaml], aliases: false)
  rescue Psych::SyntaxError => error
    errors << "#{path}: #{error.message}"
    next
  end

  unless front_matter.is_a?(Hash)
    errors << "#{path}: YAML front matter must be a mapping"
    next
  end

  missing_keys = required_keys - front_matter.keys
  unless missing_keys.empty?
    errors << "#{path}: missing keys: #{missing_keys.join(', ')}"
  end
end

config_paths = Dir.glob(File.join(template_directory, "*.{yml,yaml}")).sort
config_paths.each do |path|
  begin
    config = YAML.safe_load(File.read(path, encoding: "UTF-8"), aliases: false)
    errors << "#{path}: YAML document must be a mapping" unless config.is_a?(Hash)
  rescue Psych::SyntaxError => error
    errors << "#{path}: #{error.message}"
  end
end

abort errors.join("\n") unless errors.empty?

puts "Validated #{template_paths.length} Issue templates and #{config_paths.length} YAML files."
