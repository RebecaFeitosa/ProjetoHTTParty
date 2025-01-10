class Assertions
    def request_success_get(status_code, message)
        expect(status_code).to eql (200)
        expect(message).to eql 'OK'
    end

    def request_success_post(status_code, message)
        expect(status_code).to eql (201)
        expect(message).to eql 'Created'
    end
end