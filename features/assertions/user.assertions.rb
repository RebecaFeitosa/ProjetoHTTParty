class Assertions
    def request_success_default(status_code, message)
        expect(status_code).to eql (200)
        expect(message).to eql 'OK'
    end

    def request_success_post(status_code, message)
        expect(status_code).to eql (201)
        expect(message).to eql 'Created'
    end

    def request_sucess_delete(status_code, message)
        expect(status_code).to eql (204)
        expect(message).to eql 'No Content'
    end
end