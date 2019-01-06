class Docket < ApplicationRecord
  enum states: [ :iniciado, :aprobado, :rechazado ]

  belongs_to :person
end
