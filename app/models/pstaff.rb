class Pstaff < ApplicationRecord
	belongs_to :user

	validates :name , :gender, :unique_id,:department ,:address, presence: true
    validates :mobile_no,:presence => true,:numericality => true,
    :length => { :minimum => 10, :maximum => 15 }

    has_attached_file :registration_certificate
    validates_attachment :registration_certificate, :content_type=>{ :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
     
    has_attached_file :aadhaar_card
    validates_attachment :aadhaar_card,:content_type=>{ :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
    
    has_attached_file :document
    validates_attachment :document,:content_type=>{ :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

    TEMP = ['MACS', 'Computer Science', 'Mechanical','Civil','Electronic','Mining','Library','Academic','Account','Hostel','CCC','Audit','Administrator']
    TEMP1 = ['MACS', 'Computer Science', 'Mechanical','Civil','Electronic','Mining']
    TEMP2 = ['HCC', 'Guest House', 'Sports','Post Office','Placement','Garden','Compretive Society']
    VEHICAL =['2 Wheeler','3 Wheeler','4 Wheeler','6 Wheeler']
    GENDER = ['Male','Female','Others']

end
