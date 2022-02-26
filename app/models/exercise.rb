EXERCISE_CONFIG_PATH = Rails.root.join("config", "models", "exercises.yml")

Exercise = Struct.new(:id, :kind, :title, :duration_in_minutes, :icon, keyword_init: true) {
  def self.config
    @config ||= YAML.safe_load(ERB.new(File.read(EXERCISE_CONFIG_PATH)).result).symbolize_keys
  end

  def self.find(id)
    new(config[id.to_sym].merge(id: id.to_sym))
  end

  def self.ids
    all.map(&:id)
  end

  def self.all
    config.map { |id, attributes| new(attributes.merge(id: id)) }
  end
}
