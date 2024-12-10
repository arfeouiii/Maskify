# This tool generates Maskify links, helping in URL masking with colorful output for a better user experience.

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            # Display an error message for an invalid URL format
            echo -e "\e[31m[⚠ Error]: Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\n\e[31m┳┳\e[33m┓┏\e[32m┏┓\e[34m┏┓\e[35m┓┏\e[36m┏┓\e[31m┳┏┓┓┏\e[0m"
echo -e "\e[32m┃┃\e[36m┃\e[34m┣┫\e[33m┗┓\e[35m┃┫ \e[31m┃┣ \e[33m┗┫\e[0m"
echo -e "\e[36m┛ \e[34m┗┛\e[32m┗┗\e[33m┛┛\e[35m┗┛┻┻ \e[31m┗┛\e[0m\n"
echo -e "\e[30;48;5;82m    Copyright \e[40;38;5;82m   CetDev \e[0m \n\n"
echo -e "\e[1;31;42m ### Phishing URL ###\e[0m \n"
echo -n "➡ \e[34mPaste Phishing URL here (with http or https): \e[0m"
read phish
url_checker $phish
sleep 1
echo -e "\e[34m🔄 Processing and Modifying Phishing URL...\e[0m"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Domain Masking ### \e[0m"
echo -e "\e[34m➡ Enter the domain to mask the phishing URL (include http or https).\e[0m"
echo -e "\e[33mExample: \e[36mhttps://google.com\e[33m, \e[36mhttp://anything.org\e[33m.\e[0m"
echo -en "\e[32m✔ Input Domain:\e[0m "
read mask
url_checker $mask
echo -e "\n\e[34m➡ Enter the desired keywords (e.g., \e[36mfree-money\e[34m, \e[36mbest-pubg-tricks\e[34m):\e[0m"
echo -e "\e[31m⚠ Note: Use hyphens '-' instead of spaces between words.\e[0m"
echo -en "\e[32m✔ Input:\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[⚠ Error]: No input provided.\e[0m"
echo -e "\n\e[34m🔄 Generating Maskify Link...\n\e[0m"
final=$mask@$shorter
# Display the generated Maskify URL in a colorful and professional format
echo -e "\e[34m✔ Here is the Maskify URL: \e[32m${final}\e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
# Display an error message for invalid input and proceed with generating the Maskify link
echo -e "\e[31m[⚠ Error]: Invalid input. Please avoid using spaces.\e[0m"
echo -e "\n\e[34m🔄 Generating Maskify Link...\n\e[0m"
final=$mask@$shorter
# Display the generated Maskify URL in a highlighted and professional format
echo -e "\e[34m🔗 Here is the Maskify URL: \e[32m${final}\e[0m\n"
exit
fi
echo -e "\n\e[34m🔄 Generating Maskify Link...\n\e[0m"
final=$mask-$words@$shorter
echo -e "\e[34m✔ Here is the Maskify URL: \e[32m${final}\e[0m\n"
