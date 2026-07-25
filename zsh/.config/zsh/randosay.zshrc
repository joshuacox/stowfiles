horizontal_rule () {
  rulez=( '!' '@' '\#' '-' '>' '<' '.' '_' '^' '*' '%' )
  rulez+=( '_' '-' '~' '=' ':' '"' 'w' 'W' 'v' '^' 'V' 'm' 'M' 'n' 'N' 'U' )
  rulez+=( '!' '@' '\#' '$' '-' '>' '<' '.' '_' '^' '*' '%' '.' ',' '?' '+' )
  rulez+=( '!' '@' '\#' '$' '-' '>' '<' '.' '_' '^' '*' '%' )
  rulez+=( '!' '@' '\#' '$' '%' '^' '&' '*' '(' ')' '[' ']' '{' '}' '|' )
  rulez+=( '!' '@' '\#' '$' '-' '>' '<' '.' '_' '^' '*' '%' '.' ',' '?' '+' )
  rulez+=( '1' '2' '3' '4' '5' '6' '7' '8' '9' '0' )
  rulez+=( 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' )
  rulez+=( 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' )
  selected_rule=${rulez[$RANDOM % ${#rulez[@]} ]}
  if [[ -z $selected_rule ]]; then
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "_"
  else
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "$selected_rule"
  fi
}
horizontal_rule
randosay
randosay
horizontal_rule
