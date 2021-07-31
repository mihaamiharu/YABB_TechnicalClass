require '../app/wli'

describe WhoLikesIt do
    it "no one like this" do
        wli = WhoLikesIt.new
        wli.names = []
        p wli.likes #p stands for puts
        expect(wli.likes).to eq("no one like this")
    end

    it "one person likes this" do
        wli = WhoLikesIt.new
        wli.names = ["Tata"]
        p wli.likes #p stands for puts
        expect(wli.likes).to eq("Tata likes this")
    end


end