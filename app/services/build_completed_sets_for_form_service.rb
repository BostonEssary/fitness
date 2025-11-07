class BuildCompletedSetsForFormService
  def initialize(workout, entries)
    @workout = workout
    @entries = entries
  end

  def call
    @entries.each do |entry|
        set_count = @workout.set_count_for_entry(entry)
        
        set_count.times do |i|
          order = i + 1
          
          unless @workout.completed_sets.any? { |cs| 
            cs.entry_id == entry.id && cs.order == order 
          }
            @workout.completed_sets.build(
              entry_id: entry.id,
              order: 
            )
        end
      end
    end
  end

  private
end