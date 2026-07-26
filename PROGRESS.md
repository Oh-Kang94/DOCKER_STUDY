# 문서 및 실습 진행 기록

문서 작성 상태와 실습 여부를 구분한다. 노트가 존재한다는 사실만으로 실습이 끝난 것으로 기록하지 않는다.

## 현재 상태

마지막 점검: 2026-07-27

| 영역 | 문서 상태 | 실습 상태 | 다음 보강 후보 |
| --- | --- | --- | --- |
| Docker Engine 기초 | 정리 중 | 미확인 | 짧은 개념 문서의 설명과 예시 |
| Dockerfile | 정리 중 | 미확인 | 캐시·PID 1·비루트 실행 예시 |
| 네트워크·볼륨 | 정리 중 | 미확인 | 앱과 DB 연결 예시 |
| Docker Compose | 초안 보강 완료 | 미실행 | 필요할 때 예제 Compose 파일 실습 |
| 운영·레지스트리 | 정리 중 | 미확인 | 현재 필요한 범위의 예시와 주의 사항 |
| Docker Swarm | 정리 중 | 미확인 | 사용자가 작성하는 다음 항목 |
| Kubernetes 설치 | 초안 보강 완료 | 미실행 | Minikube·K3s 또는 kubeadm 실습 요청 시 진행 |
| Kubernetes 기본 리소스 | 초안 보강 완료 | 미실행 | Pod·Deployment·Service 적용과 rollout 실습 |
| Kubernetes 구성 관리 | 초안 보강 완료 | 미실행 | Namespace·ConfigMap·Secret·Kustomize 적용 실습 |

## 기본 다음 행동

사용자가 목차나 간단한 메모를 작성하면 구조를 유지하면서 개념 설명, 동작 원리, 예시와 주의 사항을 보강한다. 실습은 사용자가 요청할 때 시작한다.

## 세션 기록

### 2026-07-24 — 학습 코치 초기화

- 저장소의 기존 목차와 최근 변경을 기준으로 현재 위치를 추정했다.
- 실제 이해도는 아직 검증하지 않았으므로 기존 노트 대부분을 `미확인`으로 두었다.
- 다음 세션은 Swarm 서비스 진단과 확장 실습부터 시작한다.

### 2026-07-24 — 작업 방식 조정

- 질문이나 퀴즈로 수업을 주도하지 않는다.
- 사용자가 작성한 목차와 간단한 내용을 중심으로 설명과 예시를 보강한다.
- 실습은 사용자가 요청할 때 함께 진행한다.

### 2026-07-24 — Docker Compose 문서 보강

- 사용 이유, 기본 CLI, Compose 파일 작성, 네트워크·scale, Swarm Stack의 다섯 문서를 보강했다.
- 현재 Compose Specification을 기준으로 서비스, 네트워크, 볼륨, 검증과 Swarm 배포 차이를 정리했다.
- 문서 속 명령과 예시는 실행하지 않았다.

### 2026-07-24 — Kubernetes 설치 문서 보강

- 설치 환경, Minikube, K3s, kubeadm, kOps와 GKE 문서를 작성했다.
- Kubernetes 1.36, K3s, containerd와 Calico 3.32 공식 문서를 기준으로 예시를 정리했다.
- 클러스터와 클라우드 리소스는 실제로 생성하지 않았다.

### 2026-07-24 — Kubernetes 기본 리소스 문서 보강

- Kubernetes 오브젝트와 클러스터 구조, Pod, ReplicaSet, Deployment와 Service의 다섯 문서를 작성했다.
- 사용자가 `:`로 표시한 핵심은 각 문서의 중심 설명으로 유지하고, `-`로 적은 항목은 하위 개념, YAML·명령 예시와 Mermaid 흐름도로 확장했다.
- Service 문서에는 EndpointSlice, ClusterIP, NodePort, LoadBalancer·MetalLB, `externalTrafficPolicy`의 `Cluster`·`Local` 흐름과 ExternalName을 포함했다.
- 문서 속 Kubernetes 명령과 Manifest는 실제 클러스터에서 실행하지 않았다.

### 2026-07-27 — Kubernetes 구성 관리 문서 보강

- Namespace, ConfigMap, Secret과 Kustomize의 네 문서를 작성했다.
- Namespace의 리소스 범위와 Service DNS, ConfigMap·Secret의 환경 변수 및 volume 전달 방식을 YAML과 Mermaid 예시로 정리했다.
- Secret의 Base64와 저장 암호화를 구분하고 Generic, private registry, TLS type과 최소 권한 원칙을 추가했다.
- Kustomize generator의 content hash가 Deployment의 Pod template을 변경해 rollout으로 이어지는 과정을 설명했다.
- Kubernetes ConfigMap·Secret과 Docker Swarm Config·Secret의 저장 및 갱신 차이를 비교했다.
- 문서 속 kubectl과 Kustomize 명령은 실제 클러스터에서 실행하지 않았다.

## 기록 템플릿

### YYYY-MM-DD — 주제

- 대상 문서:
- 보강한 내용:
- 실습 여부:
- 다음 보강 후보:
