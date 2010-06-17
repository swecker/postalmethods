require 'xsd/qname'

# {PostalMethods}ArrayOfFile
class ArrayOfFile < ::Array
end

# {PostalMethods}File
#   fileExtension - SOAP::SOAPString
#   fileBinaryData - SOAP::SOAPBase64
class C_File
  attr_accessor :fileExtension
  attr_accessor :fileBinaryData

  def initialize(fileExtension = nil, fileBinaryData = nil)
    @fileExtension = fileExtension
    @fileBinaryData = fileBinaryData
  end
end

# {PostalMethods}Addresses
#   recipientAddress - Contact
#   replyAddress - ReplyAddress
class Addresses
  attr_accessor :recipientAddress
  attr_accessor :replyAddress

  def initialize(recipientAddress = nil, replyAddress = nil)
    @recipientAddress = recipientAddress
    @replyAddress = replyAddress
  end
end

# {PostalMethods}Contact
#   attentionLine1 - SOAP::SOAPString
#   attentionLine2 - SOAP::SOAPString
#   company - SOAP::SOAPString
#   address1 - SOAP::SOAPString
#   address2 - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   zipcode - SOAP::SOAPString
#   country - SOAP::SOAPString
class Contact
  attr_accessor :attentionLine1
  attr_accessor :attentionLine2
  attr_accessor :company
  attr_accessor :address1
  attr_accessor :address2
  attr_accessor :city
  attr_accessor :state
  attr_accessor :zipcode
  attr_accessor :country

  def initialize(attentionLine1 = nil, attentionLine2 = nil, company = nil, address1 = nil, address2 = nil, city = nil, state = nil, zipcode = nil, country = nil)
    @attentionLine1 = attentionLine1
    @attentionLine2 = attentionLine2
    @company = company
    @address1 = address1
    @address2 = address2
    @city = city
    @state = state
    @zipcode = zipcode
    @country = country
  end
end

# {PostalMethods}ReplyAddress
#   contact - Contact
#   stampingLocation - ReplyAddressLocation
class ReplyAddress
  attr_accessor :contact
  attr_accessor :stampingLocation

  def initialize(contact = nil, stampingLocation = nil)
    @contact = contact
    @stampingLocation = stampingLocation
  end
end

# {PostalMethods}LetterSettings
#   perforation - Perforation
#   replyEnvelope - ReplyEnvelope
#   workMode - WorkMode
#   printColor - PrintColor
class LetterSettings
  attr_accessor :perforation
  attr_accessor :replyEnvelope
  attr_accessor :workMode
  attr_accessor :printColor

  def initialize(perforation = nil, replyEnvelope = nil, workMode = nil, printColor = nil)
    @perforation = perforation
    @replyEnvelope = replyEnvelope
    @workMode = workMode
    @printColor = printColor
  end
end

# {PostalMethods}SendWordMailMergeResult
#   resultCode - SOAP::SOAPInt
#   resultDescription - SOAP::SOAPString
class SendWordMailMergeResult
  attr_accessor :resultCode
  attr_accessor :resultDescription

  def initialize(resultCode = nil, resultDescription = nil)
    @resultCode = resultCode
    @resultDescription = resultDescription
  end
end

# {PostalMethods}GetPDFResult
#   resultCode - SOAP::SOAPInt
#   fileData - SOAP::SOAPBase64
class GetPDFResult
  attr_accessor :resultCode
  attr_accessor :fileData

  def initialize(resultCode = nil, fileData = nil)
    @resultCode = resultCode
    @fileData = fileData
  end
end

# {PostalMethods}GetUploadedFileDetailsResult
#   resultCode - SOAP::SOAPInt
#   uploadedFiles - ArrayOfFileDetails
class GetUploadedFileDetailsResult
  attr_accessor :resultCode
  attr_accessor :uploadedFiles

  def initialize(resultCode = nil, uploadedFiles = nil)
    @resultCode = resultCode
    @uploadedFiles = uploadedFiles
  end
end

# {PostalMethods}ArrayOfFileDetails
class ArrayOfFileDetails < ::Array
end

# {PostalMethods}FileDetails
#   fileName - SOAP::SOAPString
#   submitTime - SOAP::SOAPDateTime
#   lastUsage - SOAP::SOAPDateTime
#   permissions - SOAP::SOAPString
#   description - SOAP::SOAPString
class FileDetails
  attr_accessor :fileName
  attr_accessor :submitTime
  attr_accessor :lastUsage
  attr_accessor :permissions
  attr_accessor :description

  def initialize(fileName = nil, submitTime = nil, lastUsage = nil, permissions = nil, description = nil)
    @fileName = fileName
    @submitTime = submitTime
    @lastUsage = lastUsage
    @permissions = permissions
    @description = description
  end
end

# {PostalMethods}GetGeneralDetailsResult
class GetGeneralDetailsResult
  def initialize
  end
end

# {PostalMethods}GetDetailsResult
#   resultCode - SOAP::SOAPInt
#   details - ArrayOfDetails
class GetDetailsResult < GetGeneralDetailsResult
  attr_accessor :resultCode
  attr_accessor :details

  def initialize(resultCode = nil, details = nil)
    @resultCode = resultCode
    @details = details
  end
end

# {PostalMethods}GetDetailsExtendedResult
#   resultCode - SOAP::SOAPInt
#   details - ArrayOfExtendedDetails
class GetDetailsExtendedResult < GetGeneralDetailsResult
  attr_accessor :resultCode
  attr_accessor :details

  def initialize(resultCode = nil, details = nil)
    @resultCode = resultCode
    @details = details
  end
end

# {PostalMethods}ArrayOfDetails
class ArrayOfDetails < ::Array
end

# {PostalMethods}GeneralDetails
# abstract
class GeneralDetails
  def initialize
  end
end

# {PostalMethods}Details
#   iD - SOAP::SOAPInt
#   price - SOAP::SOAPDecimal
#   numOfSheets - SOAP::SOAPInt
#   submitTime - SOAP::SOAPDateTime
#   completionTime - SOAP::SOAPDateTime
#   status - SOAP::SOAPInt
#   statusDescription - SOAP::SOAPString
#   isBatch - SOAP::SOAPBoolean
#   myDescription - SOAP::SOAPString
#   mailerType - MailerType
#   workMode - DetailsWorkMode
class Details < GeneralDetails
  attr_accessor :iD
  attr_accessor :price
  attr_accessor :numOfSheets
  attr_accessor :submitTime
  attr_accessor :completionTime
  attr_accessor :status
  attr_accessor :statusDescription
  attr_accessor :isBatch
  attr_accessor :myDescription
  attr_accessor :mailerType
  attr_accessor :workMode

  def initialize(iD = nil, price = nil, numOfSheets = nil, submitTime = nil, completionTime = nil, status = nil, statusDescription = nil, isBatch = nil, myDescription = nil, mailerType = nil, workMode = nil)
    @iD = iD
    @price = price
    @numOfSheets = numOfSheets
    @submitTime = submitTime
    @completionTime = completionTime
    @status = status
    @statusDescription = statusDescription
    @isBatch = isBatch
    @myDescription = myDescription
    @mailerType = mailerType
    @workMode = workMode
  end
end

# {PostalMethods}ExtendedDetails
#   iD - SOAP::SOAPInt
#   price - SOAP::SOAPDecimal
#   numOfSheets - SOAP::SOAPInt
#   submitTime - SOAP::SOAPDateTime
#   completionTime - SOAP::SOAPDateTime
#   status - SOAP::SOAPInt
#   statusDescription - SOAP::SOAPString
#   isBatch - SOAP::SOAPBoolean
#   myDescription - SOAP::SOAPString
#   mailerType - MailerType
#   workMode - DetailsWorkMode
#   orientation - SOAP::SOAPString
#   envelope - SOAP::SOAPString
#   paper - SOAP::SOAPString
#   printColor - SOAP::SOAPString
#   printSides - SOAP::SOAPString
#   postcard - SOAP::SOAPString
#   nationalMailing - SOAP::SOAPString
#   internationalMailing - SOAP::SOAPString
class ExtendedDetails < GeneralDetails
  attr_accessor :iD
  attr_accessor :price
  attr_accessor :numOfSheets
  attr_accessor :submitTime
  attr_accessor :completionTime
  attr_accessor :status
  attr_accessor :statusDescription
  attr_accessor :isBatch
  attr_accessor :myDescription
  attr_accessor :mailerType
  attr_accessor :workMode
  attr_accessor :orientation
  attr_accessor :envelope
  attr_accessor :paper
  attr_accessor :printColor
  attr_accessor :printSides
  attr_accessor :postcard
  attr_accessor :nationalMailing
  attr_accessor :internationalMailing

  def initialize(iD = nil, price = nil, numOfSheets = nil, submitTime = nil, completionTime = nil, status = nil, statusDescription = nil, isBatch = nil, myDescription = nil, mailerType = nil, workMode = nil, orientation = nil, envelope = nil, paper = nil, printColor = nil, printSides = nil, postcard = nil, nationalMailing = nil, internationalMailing = nil)
    @iD = iD
    @price = price
    @numOfSheets = numOfSheets
    @submitTime = submitTime
    @completionTime = completionTime
    @status = status
    @statusDescription = statusDescription
    @isBatch = isBatch
    @myDescription = myDescription
    @mailerType = mailerType
    @workMode = workMode
    @orientation = orientation
    @envelope = envelope
    @paper = paper
    @printColor = printColor
    @printSides = printSides
    @postcard = postcard
    @nationalMailing = nationalMailing
    @internationalMailing = internationalMailing
  end
end

# {PostalMethods}ArrayOfExtendedDetails
class ArrayOfExtendedDetails < ::Array
end

# {PostalMethods}GetStatusResult
#   resultCode - SOAP::SOAPInt
#   statuses - ArrayOfLetterStatusAndDesc
class GetStatusResult
  attr_accessor :resultCode
  attr_accessor :statuses

  def initialize(resultCode = nil, statuses = nil)
    @resultCode = resultCode
    @statuses = statuses
  end
end

# {PostalMethods}ArrayOfLetterStatusAndDesc
class ArrayOfLetterStatusAndDesc < ::Array
end

# {PostalMethods}LetterStatusAndDesc
#   iD - SOAP::SOAPInt
#   status - SOAP::SOAPInt
#   description - SOAP::SOAPString
#   lastUpdateTime - SOAP::SOAPDateTime
class LetterStatusAndDesc
  attr_accessor :iD
  attr_accessor :status
  attr_accessor :description
  attr_accessor :lastUpdateTime

  def initialize(iD = nil, status = nil, description = nil, lastUpdateTime = nil)
    @iD = iD
    @status = status
    @description = description
    @lastUpdateTime = lastUpdateTime
  end
end

# {PostalMethods}GetBatchStatusResult
#   resultCode - SOAP::SOAPInt
#   iD - SOAP::SOAPInt
#   statuses - ArrayOfLetterBatchStatusAndDesc
class GetBatchStatusResult
  attr_accessor :resultCode
  attr_accessor :iD
  attr_accessor :statuses

  def initialize(resultCode = nil, iD = nil, statuses = nil)
    @resultCode = resultCode
    @iD = iD
    @statuses = statuses
  end
end

# {PostalMethods}ArrayOfLetterBatchStatusAndDesc
class ArrayOfLetterBatchStatusAndDesc < ::Array
end

# {PostalMethods}LetterBatchStatusAndDesc
#   itemID - SOAP::SOAPInt
#   status - SOAP::SOAPInt
#   description - SOAP::SOAPString
#   lastUpdateTime - SOAP::SOAPDateTime
class LetterBatchStatusAndDesc
  attr_accessor :itemID
  attr_accessor :status
  attr_accessor :description
  attr_accessor :lastUpdateTime

  def initialize(itemID = nil, status = nil, description = nil, lastUpdateTime = nil)
    @itemID = itemID
    @status = status
    @description = description
    @lastUpdateTime = lastUpdateTime
  end
end

# {PostalMethods}GetBatchDetailsResult
#   resultCode - SOAP::SOAPInt
#   iD - SOAP::SOAPInt
#   price - SOAP::SOAPDecimal
#   submitTime - SOAP::SOAPDateTime
#   completionTime - SOAP::SOAPDateTime
#   myDescription - SOAP::SOAPString
#   mailerType - MailerType
#   workMode - DetailsWorkMode
#   orientation - SOAP::SOAPString
#   envelope - SOAP::SOAPString
#   paper - SOAP::SOAPString
#   printColor - SOAP::SOAPString
#   printSides - SOAP::SOAPString
#   postcard - SOAP::SOAPString
#   nationalMailing - SOAP::SOAPString
#   internationalMailing - SOAP::SOAPString
#   items - ArrayOfItemsStatusAndDescExtended
class GetBatchDetailsResult
  attr_accessor :resultCode
  attr_accessor :iD
  attr_accessor :price
  attr_accessor :submitTime
  attr_accessor :completionTime
  attr_accessor :myDescription
  attr_accessor :mailerType
  attr_accessor :workMode
  attr_accessor :orientation
  attr_accessor :envelope
  attr_accessor :paper
  attr_accessor :printColor
  attr_accessor :printSides
  attr_accessor :postcard
  attr_accessor :nationalMailing
  attr_accessor :internationalMailing
  attr_accessor :items

  def initialize(resultCode = nil, iD = nil, price = nil, submitTime = nil, completionTime = nil, myDescription = nil, mailerType = nil, workMode = nil, orientation = nil, envelope = nil, paper = nil, printColor = nil, printSides = nil, postcard = nil, nationalMailing = nil, internationalMailing = nil, items = nil)
    @resultCode = resultCode
    @iD = iD
    @price = price
    @submitTime = submitTime
    @completionTime = completionTime
    @myDescription = myDescription
    @mailerType = mailerType
    @workMode = workMode
    @orientation = orientation
    @envelope = envelope
    @paper = paper
    @printColor = printColor
    @printSides = printSides
    @postcard = postcard
    @nationalMailing = nationalMailing
    @internationalMailing = internationalMailing
    @items = items
  end
end

# {PostalMethods}ArrayOfItemsStatusAndDescExtended
class ArrayOfItemsStatusAndDescExtended < ::Array
end

# {PostalMethods}ItemsStatusAndDescExtended
#   itemID - SOAP::SOAPInt
#   status - SOAP::SOAPInt
#   description - SOAP::SOAPString
#   price - SOAP::SOAPDecimal
#   numOfSheets - SOAP::SOAPInt
#   lastUpdateTime - SOAP::SOAPDateTime
class ItemsStatusAndDescExtended
  attr_accessor :itemID
  attr_accessor :status
  attr_accessor :description
  attr_accessor :price
  attr_accessor :numOfSheets
  attr_accessor :lastUpdateTime

  def initialize(itemID = nil, status = nil, description = nil, price = nil, numOfSheets = nil, lastUpdateTime = nil)
    @itemID = itemID
    @status = status
    @description = description
    @price = price
    @numOfSheets = numOfSheets
    @lastUpdateTime = lastUpdateTime
  end
end

# {PostalMethods/AbstractTypes}StringArray
class StringArray < ::Array
end

# {PostalMethods}ReplyAddressLocation
class ReplyAddressLocation < ::String
  Bottom = new("Bottom")
  Top = new("Top")
end

# {PostalMethods}Perforation
class Perforation < ::String
  BottomThird = new("BottomThird")
end

# {PostalMethods}ReplyEnvelope
class ReplyEnvelope < ::String
  Env9ReplySingleWindow = new("Env9ReplySingleWindow")
end

# {PostalMethods}WorkMode
class WorkMode < ::String
  Default = new("Default")
  Development = new("Development")
  Production = new("Production")
end

# {PostalMethods}PrintColor
class PrintColor < ::String
  Black = new("Black")
  Default = new("Default")
  FullColor = new("FullColor")
end

# {PostalMethods}ImageSideScaling
class ImageSideScaling < ::String
  Default = new("Default")
  FitToPage = new("FitToPage")
  None = new("None")
end

# {PostalMethods}PostcardSize
class PostcardSize < ::String
  Default = new("Default")
  Postcard_4_25X6 = new("Postcard_4_25X6")
end

# {PostalMethods}MailingPriority
class MailingPriority < ::String
  Default = new("Default")
  FirstClass = new("FirstClass")
end

# {PostalMethods}Permissions
class Permissions < ::String
  Account = new("Account")
  User = new("User")
end

# {PostalMethods}MailerType
class MailerType < ::String
  Letter = new("Letter")
  Postcard = new("Postcard")
end

# {PostalMethods}DetailsWorkMode
class DetailsWorkMode < ::String
  Development = new("Development")
  Production = new("Production")
end

# {PostalMethods}SendLetterAdvanced
#   aPIKey - SOAP::SOAPString
#   myDescription - SOAP::SOAPString
#   files - ArrayOfFile
#   addresses - Addresses
#   settings - LetterSettings
class SendLetterAdvanced
  attr_accessor :aPIKey
  attr_accessor :myDescription
  attr_accessor :files
  attr_accessor :addresses
  attr_accessor :settings

  def initialize(aPIKey = nil, myDescription = nil, files = nil, addresses = nil, settings = nil)
    @aPIKey = aPIKey
    @myDescription = myDescription
    @files = files
    @addresses = addresses
    @settings = settings
  end
end

# {PostalMethods}SendLetterAdvancedResponse
#   sendLetterAdvancedResult - SOAP::SOAPInt
class SendLetterAdvancedResponse
  attr_accessor :sendLetterAdvancedResult

  def initialize(sendLetterAdvancedResult = nil)
    @sendLetterAdvancedResult = sendLetterAdvancedResult
  end
end

# {PostalMethods}SendLetter
#   aPIKey - SOAP::SOAPString
#   myDescription - SOAP::SOAPString
#   fileExtension - SOAP::SOAPString
#   fileBinaryData - SOAP::SOAPBase64
#   workMode - WorkMode
class SendLetter
  attr_accessor :aPIKey
  attr_accessor :myDescription
  attr_accessor :fileExtension
  attr_accessor :fileBinaryData
  attr_accessor :workMode

  def initialize(aPIKey = nil, myDescription = nil, fileExtension = nil, fileBinaryData = nil, workMode = nil)
    @aPIKey = aPIKey
    @myDescription = myDescription
    @fileExtension = fileExtension
    @fileBinaryData = fileBinaryData
    @workMode = workMode
  end
end

# {PostalMethods}SendLetterResponse
#   sendLetterResult - SOAP::SOAPInt
class SendLetterResponse
  attr_accessor :sendLetterResult

  def initialize(sendLetterResult = nil)
    @sendLetterResult = sendLetterResult
  end
end

# {PostalMethods}SendLetterAndAddress
#   aPIKey - SOAP::SOAPString
#   myDescription - SOAP::SOAPString
#   fileExtension - SOAP::SOAPString
#   fileBinaryData - SOAP::SOAPBase64
#   workMode - WorkMode
#   attentionLine1 - SOAP::SOAPString
#   attentionLine2 - SOAP::SOAPString
#   company - SOAP::SOAPString
#   address1 - SOAP::SOAPString
#   address2 - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   postalCode - SOAP::SOAPString
#   country - SOAP::SOAPString
class SendLetterAndAddress
  attr_accessor :aPIKey
  attr_accessor :myDescription
  attr_accessor :fileExtension
  attr_accessor :fileBinaryData
  attr_accessor :workMode
  attr_accessor :attentionLine1
  attr_accessor :attentionLine2
  attr_accessor :company
  attr_accessor :address1
  attr_accessor :address2
  attr_accessor :city
  attr_accessor :state
  attr_accessor :postalCode
  attr_accessor :country

  def initialize(aPIKey = nil, myDescription = nil, fileExtension = nil, fileBinaryData = nil, workMode = nil, attentionLine1 = nil, attentionLine2 = nil, company = nil, address1 = nil, address2 = nil, city = nil, state = nil, postalCode = nil, country = nil)
    @aPIKey = aPIKey
    @myDescription = myDescription
    @fileExtension = fileExtension
    @fileBinaryData = fileBinaryData
    @workMode = workMode
    @attentionLine1 = attentionLine1
    @attentionLine2 = attentionLine2
    @company = company
    @address1 = address1
    @address2 = address2
    @city = city
    @state = state
    @postalCode = postalCode
    @country = country
  end
end

# {PostalMethods}SendLetterAndAddressResponse
#   sendLetterAndAddressResult - SOAP::SOAPInt
class SendLetterAndAddressResponse
  attr_accessor :sendLetterAndAddressResult

  def initialize(sendLetterAndAddressResult = nil)
    @sendLetterAndAddressResult = sendLetterAndAddressResult
  end
end

# {PostalMethods}SendPostcardAndAddress
#   aPIKey - SOAP::SOAPString
#   myDescription - SOAP::SOAPString
#   imageSideFileType - SOAP::SOAPString
#   imageSideBinaryData - SOAP::SOAPBase64
#   imageSideScaling - ImageSideScaling
#   addressSideFileType - SOAP::SOAPString
#   addressSideBinaryData - SOAP::SOAPBase64
#   workMode - WorkMode
#   printColor - PrintColor
#   postcardSize - PostcardSize
#   mailingPriority - MailingPriority
#   attentionLine1 - SOAP::SOAPString
#   attentionLine2 - SOAP::SOAPString
#   company - SOAP::SOAPString
#   address1 - SOAP::SOAPString
#   address2 - SOAP::SOAPString
#   city - SOAP::SOAPString
#   state - SOAP::SOAPString
#   postalCode - SOAP::SOAPString
#   country - SOAP::SOAPString
class SendPostcardAndAddress
  attr_accessor :aPIKey
  attr_accessor :myDescription
  attr_accessor :imageSideFileType
  attr_accessor :imageSideBinaryData
  attr_accessor :imageSideScaling
  attr_accessor :addressSideFileType
  attr_accessor :addressSideBinaryData
  attr_accessor :workMode
  attr_accessor :printColor
  attr_accessor :postcardSize
  attr_accessor :mailingPriority
  attr_accessor :attentionLine1
  attr_accessor :attentionLine2
  attr_accessor :company
  attr_accessor :address1
  attr_accessor :address2
  attr_accessor :city
  attr_accessor :state
  attr_accessor :postalCode
  attr_accessor :country

  def initialize(aPIKey = nil, myDescription = nil, imageSideFileType = nil, imageSideBinaryData = nil, imageSideScaling = nil, addressSideFileType = nil, addressSideBinaryData = nil, workMode = nil, printColor = nil, postcardSize = nil, mailingPriority = nil, attentionLine1 = nil, attentionLine2 = nil, company = nil, address1 = nil, address2 = nil, city = nil, state = nil, postalCode = nil, country = nil)
    @aPIKey = aPIKey
    @myDescription = myDescription
    @imageSideFileType = imageSideFileType
    @imageSideBinaryData = imageSideBinaryData
    @imageSideScaling = imageSideScaling
    @addressSideFileType = addressSideFileType
    @addressSideBinaryData = addressSideBinaryData
    @workMode = workMode
    @printColor = printColor
    @postcardSize = postcardSize
    @mailingPriority = mailingPriority
    @attentionLine1 = attentionLine1
    @attentionLine2 = attentionLine2
    @company = company
    @address1 = address1
    @address2 = address2
    @city = city
    @state = state
    @postalCode = postalCode
    @country = country
  end
end

# {PostalMethods}SendPostcardAndAddressResponse
#   sendPostcardAndAddressResult - SOAP::SOAPInt
class SendPostcardAndAddressResponse
  attr_accessor :sendPostcardAndAddressResult

  def initialize(sendPostcardAndAddressResult = nil)
    @sendPostcardAndAddressResult = sendPostcardAndAddressResult
  end
end

# {PostalMethods}SendWordMailMerge_Compressed
#   username - SOAP::SOAPString
#   password - SOAP::SOAPString
#   myDescription - SOAP::SOAPString
#   fileExtension - SOAP::SOAPString
#   fileBinaryData - SOAP::SOAPBase64
#   mergeData - SOAP::SOAPBase64
#   clientVersion - SOAP::SOAPString
#   workMode - WorkMode
class SendWordMailMerge_Compressed
  attr_accessor :username
  attr_accessor :password
  attr_accessor :myDescription
  attr_accessor :fileExtension
  attr_accessor :fileBinaryData
  attr_accessor :mergeData
  attr_accessor :clientVersion
  attr_accessor :workMode

  def initialize(username = nil, password = nil, myDescription = nil, fileExtension = nil, fileBinaryData = nil, mergeData = nil, clientVersion = nil, workMode = nil)
    @username = username
    @password = password
    @myDescription = myDescription
    @fileExtension = fileExtension
    @fileBinaryData = fileBinaryData
    @mergeData = mergeData
    @clientVersion = clientVersion
    @workMode = workMode
  end
end

# {PostalMethods}SendWordMailMerge_CompressedResponse
#   sendWordMailMerge_CompressedResult - SendWordMailMergeResult
class SendWordMailMerge_CompressedResponse
  attr_accessor :sendWordMailMerge_CompressedResult

  def initialize(sendWordMailMerge_CompressedResult = nil)
    @sendWordMailMerge_CompressedResult = sendWordMailMerge_CompressedResult
  end
end

# {PostalMethods}GetPDF
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPInt
class GetPDF
  attr_accessor :aPIKey
  attr_accessor :iD

  def initialize(aPIKey = nil, iD = nil)
    @aPIKey = aPIKey
    @iD = iD
  end
end

# {PostalMethods}GetPDFResponse
#   getPDFResult - GetPDFResult
class GetPDFResponse
  attr_accessor :getPDFResult

  def initialize(getPDFResult = nil)
    @getPDFResult = getPDFResult
  end
end

# {PostalMethods}CancelDelivery
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPInt
class CancelDelivery
  attr_accessor :aPIKey
  attr_accessor :iD

  def initialize(aPIKey = nil, iD = nil)
    @aPIKey = aPIKey
    @iD = iD
  end
end

# {PostalMethods}CancelDeliveryResponse
#   cancelDeliveryResult - SOAP::SOAPInt
class CancelDeliveryResponse
  attr_accessor :cancelDeliveryResult

  def initialize(cancelDeliveryResult = nil)
    @cancelDeliveryResult = cancelDeliveryResult
  end
end

# {PostalMethods}UploadFile
#   aPIKey - SOAP::SOAPString
#   myFileName - SOAP::SOAPString
#   fileBinaryData - SOAP::SOAPBase64
#   permissions - Permissions
#   description - SOAP::SOAPString
#   overwrite - SOAP::SOAPBoolean
class UploadFile
  attr_accessor :aPIKey
  attr_accessor :myFileName
  attr_accessor :fileBinaryData
  attr_accessor :permissions
  attr_accessor :description
  attr_accessor :overwrite

  def initialize(aPIKey = nil, myFileName = nil, fileBinaryData = nil, permissions = nil, description = nil, overwrite = nil)
    @aPIKey = aPIKey
    @myFileName = myFileName
    @fileBinaryData = fileBinaryData
    @permissions = permissions
    @description = description
    @overwrite = overwrite
  end
end

# {PostalMethods}UploadFileResponse
#   uploadFileResult - SOAP::SOAPInt
class UploadFileResponse
  attr_accessor :uploadFileResult

  def initialize(uploadFileResult = nil)
    @uploadFileResult = uploadFileResult
  end
end

# {PostalMethods}DeleteUploadedFile
#   aPIKey - SOAP::SOAPString
#   myFileName - SOAP::SOAPString
class DeleteUploadedFile
  attr_accessor :aPIKey
  attr_accessor :myFileName

  def initialize(aPIKey = nil, myFileName = nil)
    @aPIKey = aPIKey
    @myFileName = myFileName
  end
end

# {PostalMethods}DeleteUploadedFileResponse
#   deleteUploadedFileResult - SOAP::SOAPInt
class DeleteUploadedFileResponse
  attr_accessor :deleteUploadedFileResult

  def initialize(deleteUploadedFileResult = nil)
    @deleteUploadedFileResult = deleteUploadedFileResult
  end
end

# {PostalMethods}GetUploadedFileDetails
#   aPIKey - SOAP::SOAPString
class GetUploadedFileDetails
  attr_accessor :aPIKey

  def initialize(aPIKey = nil)
    @aPIKey = aPIKey
  end
end

# {PostalMethods}GetUploadedFileDetailsResponse
#   getUploadedFileDetailsResult - GetUploadedFileDetailsResult
class GetUploadedFileDetailsResponse
  attr_accessor :getUploadedFileDetailsResult

  def initialize(getUploadedFileDetailsResult = nil)
    @getUploadedFileDetailsResult = getUploadedFileDetailsResult
  end
end

# {PostalMethods}GetDetails
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPString
class GetDetails
  attr_accessor :aPIKey
  attr_accessor :iD

  def initialize(aPIKey = nil, iD = nil)
    @aPIKey = aPIKey
    @iD = iD
  end
end

# {PostalMethods}GetDetailsResponse
#   getDetailsResult - GetDetailsResult
class GetDetailsResponse
  attr_accessor :getDetailsResult

  def initialize(getDetailsResult = nil)
    @getDetailsResult = getDetailsResult
  end
end

# {PostalMethods}GetDetailsExtended
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPString
class GetDetailsExtended
  attr_accessor :aPIKey
  attr_accessor :iD

  def initialize(aPIKey = nil, iD = nil)
    @aPIKey = aPIKey
    @iD = iD
  end
end

# {PostalMethods}GetDetailsExtendedResponse
#   getDetailsExtendedResult - GetDetailsExtendedResult
class GetDetailsExtendedResponse
  attr_accessor :getDetailsExtendedResult

  def initialize(getDetailsExtendedResult = nil)
    @getDetailsExtendedResult = getDetailsExtendedResult
  end
end

# {PostalMethods}GetStatus
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPString
class GetStatus
  attr_accessor :aPIKey
  attr_accessor :iD

  def initialize(aPIKey = nil, iD = nil)
    @aPIKey = aPIKey
    @iD = iD
  end
end

# {PostalMethods}GetStatusResponse
#   getStatusResult - GetStatusResult
class GetStatusResponse
  attr_accessor :getStatusResult

  def initialize(getStatusResult = nil)
    @getStatusResult = getStatusResult
  end
end

# {PostalMethods}GetBatchStatus
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPInt
#   itemID - SOAP::SOAPString
class GetBatchStatus
  attr_accessor :aPIKey
  attr_accessor :iD
  attr_accessor :itemID

  def initialize(aPIKey = nil, iD = nil, itemID = nil)
    @aPIKey = aPIKey
    @iD = iD
    @itemID = itemID
  end
end

# {PostalMethods}GetBatchStatusResponse
#   getBatchStatusResult - GetBatchStatusResult
class GetBatchStatusResponse
  attr_accessor :getBatchStatusResult

  def initialize(getBatchStatusResult = nil)
    @getBatchStatusResult = getBatchStatusResult
  end
end

# {PostalMethods}GetBatchDetails
#   aPIKey - SOAP::SOAPString
#   iD - SOAP::SOAPInt
#   itemID - SOAP::SOAPString
class GetBatchDetails
  attr_accessor :aPIKey
  attr_accessor :iD
  attr_accessor :itemID

  def initialize(aPIKey = nil, iD = nil, itemID = nil)
    @aPIKey = aPIKey
    @iD = iD
    @itemID = itemID
  end
end

# {PostalMethods}GetBatchDetailsResponse
#   getBatchDetailsResult - GetBatchDetailsResult
class GetBatchDetailsResponse
  attr_accessor :getBatchDetailsResult

  def initialize(getBatchDetailsResult = nil)
    @getBatchDetailsResult = getBatchDetailsResult
  end
end
