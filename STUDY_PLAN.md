# Docker와 Kubernetes 학습 계획

이 문서는 Docker와 Kubernetes 노트에서 빠진 주제를 확인하기 위한 참고 목차다. 실제 작성 순서와 범위는 사용자가 정한다.

## 문서 보강 기준

짧은 메모를 보강할 때는 주제에 필요한 항목만 선택해 추가한다.

1. 무엇인지에 대한 정의
2. 왜 사용하는지에 대한 목적
3. 내부 동작 또는 관련 개념과의 관계
4. 간단한 명령어나 설정 예시
5. 예상 결과와 자주 발생하는 실수

실제 실행과 장애 복구는 사용자가 실습을 요청할 때 함께 진행한다.

## 경로

### 1. 기반 확인

- 이미지와 컨테이너의 차이
- `pull → create → start → stop → rm` 생명주기
- 포트 게시, 환경 변수, 로그, 종료 코드

완료 과제: 문서 없이 웹 서버 컨테이너를 실행하고 상태·로그·포트를 확인한 뒤 안전하게 정리한다.

### 2. 이미지 빌드

- 빌드 컨텍스트와 레이어 캐시
- `COPY`, `RUN`, `CMD`, `ENTRYPOINT`
- 멀티 스테이지 빌드, 비루트 사용자, 헬스체크

완료 과제: 기존 Go 예제를 재현 가능한 최소 이미지로 빌드하고 단일 스테이지 이미지와 크기·구성을 비교한다.

### 3. 런타임 데이터와 연결

- bind mount와 named volume
- 기본 bridge와 사용자 정의 네트워크
- DNS 기반 서비스 발견, 포트 게시와 내부 포트의 차이
- 자원 제한과 로그 관찰

완료 과제: 애플리케이션과 데이터베이스를 서로 다른 컨테이너로 연결하고, 컨테이너를 재생성해도 데이터가 남는 이유를 설명한다.

### 4. Docker Compose

- Compose 파일의 서비스, 네트워크, 볼륨
- 환경 변수와 설정 분리
- 의존성과 readiness의 차이
- `config`, `up`, `ps`, `logs`, `exec`, `down`

완료 과제: 앞 단계의 다중 컨테이너 앱을 Compose로 옮기고 장애·재시작·데이터 보존을 검증한다.

### 5. 운영과 보안

- 이미지 태그와 digest, 레지스트리
- 비밀값 처리와 최소 권한
- 상태 확인, 이벤트, 디스크 사용량
- 재현 가능한 트러블슈팅 절차

완료 과제: 실행 실패 사례 하나를 로그·inspect·events를 사용해 원인부터 복구까지 기록한다.

### 6. Swarm

- node, service, task의 관계
- replica 확장, rolling update, rollback
- overlay network와 service discovery
- manager quorum과 장애 시 동작

완료 과제: 서비스를 배포·확장·업데이트하고 실패한 업데이트를 롤백한 뒤 각 단계의 task 변화를 설명한다.

### 7. Kubernetes 설치

- 로컬, self-managed와 managed Kubernetes 환경의 차이
- Minikube를 이용한 로컬 개발 클러스터
- K3s를 이용한 경량 server·agent 클러스터
- kubeadm을 이용한 control plane·worker node 구성
- kOps와 GKE의 클라우드 클러스터 관리 방식

완료 과제: 목적에 따라 설치 방법을 선택하고 Minikube, K3s와 kubeadm의 control plane 관리 책임과 기본 구성 차이를 설명한다.

### 8. Kubernetes 기본 리소스

- Kubernetes 오브젝트와 선언형 YAML Manifest
- control plane과 node 구성 요소의 역할
- Pod의 lifecycle, multi-container와 sidecar
- ReplicaSet의 reconciliation과 label selector
- Deployment의 rolling update와 rollback
- Service, EndpointSlice, ClusterIP, NodePort와 LoadBalancer
- `externalTrafficPolicy`와 ExternalName의 동작 차이

완료 과제: Deployment로 Pod 세 개를 배포하고 Service로 연결한 뒤 Pod 교체, scale, rolling update와 rollback 과정에서 ReplicaSet·EndpointSlice의 변화를 설명한다.

### 9. Kubernetes 구성 관리

- Namespace의 이름 범위와 namespaced·cluster-scoped 리소스
- 같은 Namespace와 다른 Namespace의 Service DNS 접근
- ConfigMap의 환경 변수·volume file 전달 방식
- Secret의 Base64, etcd 저장 암호화와 최소 권한
- Generic, private registry와 TLS Secret
- Kustomize generator, content hash와 설정 변경 rollout
- Kubernetes ConfigMap·Secret과 Docker Swarm Config·Secret 비교

완료 과제: Namespace에 Deployment를 배포하고 ConfigMap과 Secret을 환경 변수·파일로 각각 전달한 뒤 Kustomize로 설정을 변경해 새 ReplicaSet이 생성되는 과정을 설명한다.

### 10. Kubernetes Gateway API와 외부 Routing

- Ingress의 기본 역할과 Gateway API가 확장한 범위
- GatewayClass, Gateway, HTTPRoute, Service와 Data plane의 관계
- host, path, Header, Method 기반 Routing과 Traffic weight
- LoadBalancer·NodePort 노출과 Bare metal의 MetalLB 연동
- HTTPRoute Filter를 이용한 URLRewrite, RequestRedirect와 Header 변경
- HTTPS Listener, TLS Secret, ReferenceGrant와 BackendTLSPolicy
- allowedRoutes를 이용한 공유 Gateway와 여러 Controller 분리
- 구현체 Profile, Core·Extended 기능과 Conformance 확인

완료 과제: 하나의 Gateway 진입점에 여러 HTTPRoute를 연결해 host와 path에 따라 Service로 요청을 전달하고 TLS를 적용한 뒤, GatewayClass·Gateway·HTTPRoute·Service·EndpointSlice의 관계와 status Condition을 설명한다.

## 현재 문서 상태

Docker Compose는 사용 이유부터 Swarm Stack 연동까지 다섯 문서가 보강되었다. Kubernetes 설치는 환경 비교, Minikube, kubeadm, K3s, kOps와 GKE의 여섯 문서로 정리되어 있다.

Kubernetes 기본 리소스는 오브젝트와 클러스터 구조, Pod, ReplicaSet, Deployment와 Service의 다섯 문서로 정리되어 있다.

Kubernetes 구성 관리는 Namespace, ConfigMap, Secret과 Kustomize의 네 문서로 정리되어 있다.

최근 변경은 `k8s-ingress/`이며 Ingress의 기본 배경 이후 내용을 현재 Gateway API 중심으로 재구성했다. GatewayClass·Gateway·HTTPRoute, Controller와 Data plane, 구조화된 Filter, TLS, ReferenceGrant와 여러 Gateway 운영을 일곱 문서로 정리했다. 문서 예시는 아직 실제 클러스터에서 실행하지 않았다.

이는 추천 진도가 아니다. 사용자가 새 목차나 메모를 작성하면 해당 내용을 우선 보강한다.
