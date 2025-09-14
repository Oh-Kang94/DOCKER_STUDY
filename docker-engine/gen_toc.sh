#!/bin/bash
# generate_index.sh
# docker-engine 폴더 안에서 실행

OUTFILE="$(pwd)/0.index.md"

# 초기화
echo "# Index" > "$OUTFILE"
echo "" >> "$OUTFILE"

# GitHub anchor 생성 함수
generate_anchor() {
    local text="$1"
    echo "$text" | tr '[:upper:]' '[:lower:]' | \
    sed 's/[[:space:]]\+/-/g' | \
    sed 's/[^a-z0-9가-힣.-]//g' | \
    sed 's/-\+/-/g' | \
    sed 's/^-\|-$//g'
}

# md 파일 순서대로 처리 (0.index.md 제외)
for FILE in $(ls [0-9]*.md | sort -V); do
    BASENAME=$(basename "$FILE")
    [[ "$BASENAME" == "0.index.md" ]] && continue
    
    # 파일명에서 제목 추출
    TITLE=$(echo "$BASENAME" | sed 's/\.md$//; s/-/ /g')
    echo "- [$TITLE]($BASENAME)" >> "$OUTFILE"
    
    # 내부 헤더 처리
    while IFS= read -r line; do
        # 헤더 라인 매칭 (##, ###, #### 등)
        if [[ $line =~ ^(#{2,6})[[:space:]]+(.+)$ ]]; then
            HASHES="${BASH_REMATCH[1]}"
            HEADER_TEXT="${BASH_REMATCH[2]}"
            
            # 레벨 계산 (## = 2, ### = 3, #### = 4)
            LEVEL=${#HASHES}
            
            # 들여쓰기 생성 (## = 2칸, ### = 4칸, #### = 6칸)
            INDENT=""
            for ((i=1; i<LEVEL; i++)); do
                INDENT="${INDENT}  "
            done
            
            # GitHub anchor 생성
            ANCHOR=$(generate_anchor "$HEADER_TEXT")
            
            # 목차에 추가
            echo "${INDENT}- [$HEADER_TEXT]($BASENAME#$ANCHOR)" >> "$OUTFILE"
        fi
    done < "$FILE"
done

echo "0.index.md TOC 생성 완료!"