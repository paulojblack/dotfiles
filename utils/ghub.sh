# !/bin/bash
open_repo() {
    BASEURL="https://github.com/GoodwayGroup/"
    REPO=$(pwd | awk -F/ '{print $(NF)}')

    REPOPATH="${BASEURL}${REPO}"

    open ${REPOPATH}
}

open_ml() {
    BASEURL="https://github.com/GoodwayGroup/"
    API="api-looking-glass"
    UI="ui-looking-glass"
    DATA="service-ml-data"
    PDF="service-pdf"

    open "${BASEURL}${API}"
    open "${BASEURL}${UI}"
    open "${BASEURL}${DATA}"
    open "${BASEURL}${PDF}"
}

prs() {
    open "https://github.com/pulls"
}
