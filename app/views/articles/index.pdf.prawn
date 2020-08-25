prawn_document do |pdf|
pdf.text 'Title/Text:'
  pdf.move_down 20
  pdf.table @articles.collect{|p| [p.title,p.text]}
end