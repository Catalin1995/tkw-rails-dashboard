class Project < ActiveRecord::Base
  after_create :set_status

  def set_status
    begin
      json_string = self.description.split("----")[1]
      json = JSON.parse(json_string)
      if json.has_key? "status"
        self.status = json["status"].downcase
      end
    rescue
    end
  end
end
