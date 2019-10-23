class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)

    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(name)
    recommended_exhibits = []
    recommended_exhibits << name.interests
    recommended_exhibits.flatten
  end

  def admit(name)
    @patrons << name
  end

  def patrons_by_exhibit_interest
    @exhibit_interests_patrons = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit)
          @exhibit_interests_patrons[exhibit] = patron
        end
      end
    end
    @exhibit_interests_patrons
  end


end
