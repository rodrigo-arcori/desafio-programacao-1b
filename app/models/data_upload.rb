class DataUpload
    include ActiveModel::Model

    attr_accessor :dados, :arquivo

    def save_sales
      Sale.new
      Sale.transaction do
        sales.each(&:save!)
      end
    end

    def sales
      sales_a = []
      arquivo.drop(1).each do |row|
        sales_a << create_sale(row)
      end
      sales_a
    end

    def arquivo
     File.open(dados.tempfile)
    end

    def file_validate
      raise TypeError, 'Tipo de Arquivo inválido' unless dados.original_filename == "dados.txt"
    end

    private

    def create_sale(row)
      line = row.split("\t")
      customer   = Customer.find_or_create_by(name: line[0])
      Sale.new(
        customer: customer,
        description: line[1],
        price: line[2],
        amount: line[3],
        address: Address.find_or_create_by(name: line[4], customer: customer),
        vendor: Vendor.find_or_create_by(name: line[5])
      )
    end


end
