module MyAssignmentsHelper
  def hash_options_assignments
    {
      urgent: { text: 'Todays assignments', operation: '==' },
      upcoming: { text: 'Upcoming assignments', operation: '>' },
      past: { text: 'Past assignments', operation: '<' }
    }
  end
end
