# frozen_string_literal: true

EXERCISE_CONFIG_PATH = Rails.root.join("config", "models", "exercises.yml")

Exercise = Struct.new(:id, :kind, :title, :duration_in_minutes, :icon, keyword_init: true) {
  def self.config
    @config ||= YAML.safe_load(ERB.new(File.read(EXERCISE_CONFIG_PATH)).result)
  end

  def self.find(id)
    new(config[id.to_s].merge(id: id.to_s))
  end

  def self.ids
    all.map(&:id)
  end

  def self.all
    config.map { |id, attributes| new(attributes.merge(id: id)) }
  end
}
