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

    it "two people like this" do
        wli = WhoLikesIt.new
        wli.names = ["Tata", "Titi"]
        p wli.likes #p stands for puts
        expect(wli.likes).to eq("Tata and Titi like this")
    end

    it "three people like this" do
        wli = WhoLikesIt.new
        wli.names = ["Tata", "Titi", "Toto"]
        p wli.likes #p stands for puts
        expect(wli.likes).to eq("Tata,Titi and Toto like this")
    end

    it "four people like this" do
        wli = WhoLikesIt.new
        wli.names = ["Tata", "Titi", "Toto", "Tutu"]
        p wli.likes #p stands for puts
        expect(wli.likes).to eq("Tata,Titi and 2 others like this")
    end


end