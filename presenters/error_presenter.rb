class ErrorPresenter
  TRANSLATIONS = {
    not_present: "Missing field %{field}."
  }

  def initialize(validation_errors = [])
    @errors = validation_errors.map do |field, errors|
      errors.map do |error|
        TRANSLATIONS.fetch(error) % { field: field }
      end.join(' ')
    end
  end

  def to_s
    @errors.join(' ')
  end

  def show?
    !@errors.empty?
  end
end
