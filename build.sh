cat template_head.html > matrix.html
if (ruby matrix.rb >> matrix.html) then 
  cat template_foot.html >> matrix.html
  open matrix.html
  wc -l tags.txt
  cat tags.txt | sort | uniq -c | sort -r | head
  cat matrix.html | pbcopy 
fi
