#!/bin/bash

# Interpolate prompts in ips/ to generate standalone HTML quips bia template.html
for name in $(ls ips/ | cut -d. -f1 | sort -u); do
  echo $name
  
  # Build up quip by reading templates
  quip=""
  indent="      "
  for f in $(ls ips/$name.* 2>/dev/null | sort -V); do
    quip+="$indent{
$indent  '$name.$(basename $f | cut -d. -f2)': 
\`$(cat $f)\`
$indent},
"
  done  
  content=$(cat template.html)
  printf "%s" "${content/__QUIP__/$quip}" > "$name.html"
done

# Generate index.html
for f in *.html; do
  echo "<li><a href=\"$f\">$f</a></li>"
done > index.html
