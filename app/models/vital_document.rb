class VitalDocument < ApplicationRecord
  belongs_to :user
  enum document_type: { identity_card: 0, driver_license: 1, passport: 2,birth_certificate: 3, work_permit_or_visa: 4, military_identity_card: 5, police_identity_card: 6 }

  mount_uploader :document, DocumentUploader

end
