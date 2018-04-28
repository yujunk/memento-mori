class VitalDocument < ApplicationRecord
  belongs_to :user
  enum document_type: { "Identity Card" => 0, "Driver's License" => 1, "Passport" => 2, "Birth Certificate" => 3, "Work Permit or Visa" => 4, "Military Identity Card" => 5, "Police Identity Card" => 6, "Tax Identity" => 7, "Other" => 8 }

  mount_uploaders :doc_uploads, DocumentUploader

end
