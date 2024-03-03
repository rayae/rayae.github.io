git add .

time=$(date "+%Y-%m-%d %H:%M:%S")
commit="Site updated: "$time
echo $commit

git commit -m "$commit"

git push origin main
