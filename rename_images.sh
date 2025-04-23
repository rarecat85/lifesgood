#!/bin/bash

cd /Users/seungjoopark/Documents/GitHub/lifesgood/ai-gate/sample/src/assets/images

# ai-gate-image로 시작하는 파일은 이미 변경된 것이므로 제외
for file in $(ls | grep "^ai-gate-" | grep -v "^ai-gate-image"); do
  # 새 파일 이름 생성 (ai-gate-를 ai-gate-image로 교체)
  new_file="${file/ai-gate-/ai-gate-image-}"
  # 파일 이름 변경
  mv "$file" "$new_file"
  echo "Renamed: $file -> $new_file"
done

echo "파일 이름 변경이 완료되었습니다." 