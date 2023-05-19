module ApiExceptions
  class SyncError < ApiExceptions::BaseException
    class PayloadError < ApiExceptions::SyncError
    end
  end
end