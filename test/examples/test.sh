testAddFis() {
    sh ./add_fis.sh
    flag=0
    if [ -f "package.json" ] && [ -f "ci.yml" ];then
        flag=1
    fi
    assertEquals "package.json or ci.yml is not exist!" '1' "${flag}"
}
. ./test/shunit2