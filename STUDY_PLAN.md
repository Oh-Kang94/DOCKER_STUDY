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
- manager Raft quorum, join token과 cluster 보안
- replicated, global과 완료형 job service
- replica 확장, rolling update, rollback
- config·secret의 전달과 version 기반 rotation
- ingress routing mesh, overlay, docker_gwbridge와 service discovery
- local volume·bind mount의 node 종속성과 shared storage
- node availability, label, constraint와 placement preference
- manager quorum과 node·task 장애 시 동작

완료 과제: Replicated·Global Service를 배포하고 장애 복구·Rolling Update·Rollback을 관찰한 뒤 Network·Storage·Placement와 Manager Quorum의 운영 책임을 설명한다.

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

### 11. Kubernetes PersistentVolume과 Storage

- Stateless·Stateful 데이터와 Volume Lifecycle
- emptyDir, hostPath와 Local PersistentVolume의 차이
- NFS Server·정적 PV와 유지보수되는 NFS CSI Driver
- PV·PVC를 이용한 Storage 제공자와 사용자의 역할 분리
- Capacity, Access Mode, VolumeMode, StorageClass와 Selector Binding
- Available·Bound·Released·Failed Lifecycle과 Retain·Delete
- Deprecated Recycle Policy의 Dynamic Provisioning 대체
- Default StorageClass, WaitForFirstConsumer와 Volume Expansion
- Persistence, Snapshot과 Backup·Restore의 차이

완료 과제: 유지보수되는 CSI Driver와 StorageClass를 선택해 PVC로 Volume을 동적 생성하고 Pod에서 사용한 뒤, Binding 조건·Topology·Reclaim Policy와 Backup 책임을 설명한다.

### 12. Kubernetes 인증·인가와 RBAC

- TLS, Authentication, Authorization과 Admission의 API 요청 순서
- ServiceAccount Identity와 짧은 수명의 Projected Token
- Role·ClusterRole과 RoleBinding·ClusterRoleBinding의 범위
- apiGroups, resources, subresources와 verbs를 이용한 최소 권한 설계
- Cluster 내부·외부에서 ServiceAccount로 API Server에 접근하는 방법
- 공식 SDK의 In-cluster 인증과 Token Rotation
- ImagePullSecret과 API 인증 Credential의 역할 차이
- kubeconfig의 clusters, users, contexts와 안전한 Credential 관리
- 외부 Identity Provider의 User·Group Mapping과 OIDC 기반 사람 인증
- X.509 Client Certificate의 CSR·승인·RBAC 연결과 회수 한계

완료 과제: 사람과 Workload Identity를 구분하고, 최소 권한 Role을 ServiceAccount 또는 Group에 연결한 뒤 Authentication과 Authorization 실패를 각각 진단하고 Credential 수명·회수 방법을 설명한다.

### 13. Kubernetes 자원·스케줄링·배포 운영

- CPU·Memory Requests와 Limits, Overcommit과 cgroup 동작
- GPU Device Plugin, 확장 리소스와 Dynamic Resource Allocation
- Guaranteed·Burstable·BestEffort QoS와 OOM·Eviction 차이
- ResourceQuota·LimitRange와 Admission 단계의 Namespace 정책
- ValidatingAdmissionPolicy를 이용한 CEL 기반 선언형 검증
- kube-scheduler의 Queue, Filtering, Scoring과 Binding 과정
- nodeSelector, Node·Pod Affinity와 Topology Spread Constraints
- Taint·Toleration과 Cordon·Drain·PodDisruptionBudget
- Deployment RollingUpdate·Recreate·Blue-Green과 Jenkins Pipeline
- Pod Phase, restartPolicy, Init Container, Lifecycle Hook과 Probe
- HPA autoscaling/v2, Metrics Server와 Scaling Behavior

완료 과제: Namespace 자원 정책과 최소·최대 Workload 자원을 설계하고, 여러 Node에 Pod를 의도대로 분산한 뒤 RollingUpdate·Node Drain·HPA 상황에서 가용성과 상태 변화를 설명한다.

### 14. Kubernetes API 확장과 Custom Controller

- 명령형·선언형 제어와 Controller Reconciliation Loop
- kube-controller-manager와 Custom Controller Manager의 역할 차이
- Custom Resource·CRD·Controller로 구성되는 선언형 API
- `apiextensions.k8s.io/v1`의 Version별 Structural OpenAPI Schema
- spec·status, Condition, generation·observedGeneration과 Status Subresource
- OwnerReference·Garbage Collection과 Finalizer Cleanup
- served·storage Version, Conversion과 CRD Upgrade Lifecycle
- controller-runtime Watch·Queue·Reconcile·Status Update
- Kubebuilder와 Operator SDK·OLM의 선택 기준
- envtest·E2E·Upgrade Test, 최소 RBAC와 운영 관측성

완료 과제: Namespaced Custom Resource API를 정의하고, Controller가 Child Resource를 반복 가능하게 Reconcile하며 Status·Condition·Finalizer를 처리하는 흐름과 CRD Version Upgrade 절차를 설명한다.

### 15. Kubernetes Batch·Node·Stateful Workload

- Job의 완료 목표, 재시도·Deadline·TTL과 멱등성
- completions·parallelism 조합과 Indexed Job의 작업 분할
- CronJob Schedule·Time Zone·Concurrency와 중복 실행 대응
- DaemonSet의 적격 Node별 Pod와 Node Agent 사용 사례
- DaemonSet Scheduling·Toleration·RollingUpdate와 자원 관리
- StatefulSet의 Ordinal·Stable DNS와 Headless Service
- volumeClaimTemplates와 Pod별 PVC·PV Lifecycle
- StatefulSet PVC Retention, Scale·RollingUpdate와 Backup 책임

완료 과제: 멱등적인 Batch Job과 CronJob을 설계하고, Node별 DaemonSet과 Headless Service·고유 PVC를 갖는 StatefulSet의 생성·업데이트·장애 복구 동작을 설명한다.

### 16. Kubernetes Metrics와 Observability

- Metrics·Logs·Traces Signal과 수집·저장·Alert 구조
- Python·Go·Java·JavaScript Application Metric Instrumentation
- Counter·Gauge·Histogram과 Label Cardinality 관리
- Metrics Server·Resource Metrics API·kubectl top과 HPA Pipeline
- Aggregation Layer·APIService와 kubelet `/metrics/resource`
- kube-state-metrics의 Kubernetes Object State Metric
- node_exporter와 kubelet/cAdvisor의 Node·Container Metric
- Prometheus Operator·ServiceMonitor·PodMonitor와 PrometheusRule
- PromQL, Recording Rule·Alertmanager와 Runbook
- Thanos의 Object Storage·Global Query·Dedup·Compaction
- Grafana Data Source·Dashboard Provisioning과 안전한 노출

완료 과제: Application·Container·Node·Kubernetes Object Metric을 Prometheus에서 수집하고, RED·Golden Signal Dashboard와 Alert를 만든 뒤 Retention·Cardinality·장기 저장·접근 보안 책임을 설명한다.

### 17. Kubernetes Logging과 Distributed Tracing

- stdout·stderr, CRI Log File과 kubelet Rotation
- Cluster-level Logging, 구조화 JSON Log와 민감정보 관리
- Fluent Bit DaemonSet의 Tail·Metadata·Buffer Pipeline
- Loki Label·Structured Metadata·Object Storage와 LogQL
- Trace·Span, W3C Context Propagation과 OpenTelemetry Instrumentation
- Head·Tail Sampling과 Trace·Log Context 연결
- OpenTelemetry Collector Agent·Gateway와 OTLP Pipeline
- Tempo 3.0 Monolithic·Microservices Architecture와 TraceQL
- Grafana의 Metric→Trace→Log Correlation
- Retention·Cardinality·Backpressure·Drop과 Pipeline 보안

완료 과제: Application의 구조화 Log와 Trace를 Fluent Bit·Loki 및 OpenTelemetry Collector·Tempo로 전달하고, Grafana에서 Metric·Trace·Log를 오가며 장애를 조사한 뒤 Sampling·Retention·유실·민감정보 책임을 설명한다.

## 현재 문서 상태

Docker Compose는 사용 이유부터 Swarm Stack 연동까지 다섯 문서가 보강되었다. Kubernetes 설치는 환경 비교, Minikube, kubeadm, K3s, kOps와 GKE의 여섯 문서로 정리되어 있다.

Docker Swarm은 도입 판단, Manager·Worker와 Quorum, Cluster 구축, Service·Task, 장애 복구·Rolling Update, Config·Secret, Network·Discovery·Volume과 Node Scheduling을 네 문서로 정리했다.

Kubernetes 기본 리소스는 오브젝트와 클러스터 구조, Pod, ReplicaSet, Deployment와 Service의 다섯 문서로 정리되어 있다.

Kubernetes 구성 관리는 Namespace, ConfigMap, Secret과 Kustomize의 네 문서로 정리되어 있다.

Kubernetes 외부 Routing은 Ingress의 기본 배경 이후 내용을 현재 Gateway API 중심으로 재구성했다. GatewayClass·Gateway·HTTPRoute, Controller와 Data plane, 구조화된 Filter, TLS, ReferenceGrant와 여러 Gateway 운영을 일곱 문서로 정리했다.

Kubernetes Storage는 Volume 필요성, Local·임시 Volume, NFS, PV·PVC Binding, Reclaim Policy와 StorageClass·Dynamic Provisioning을 여덟 문서로 보강했다. 신규 운영은 CSI Driver와 Retain·Delete를 중심으로 하고 Deprecated Recycle은 과거 방식으로 분리했다.

Kubernetes 인증은 API 요청의 인증·인가, ServiceAccount, RBAC, Cluster 내부·외부 API 접근, SDK, ImagePullSecret, kubeconfig, User·Group과 X.509 인증을 열한 문서로 정리했다. 신규 사용은 짧은 Projected ServiceAccount Token과 OIDC 기반 사람 인증을 우선하고 장기 ServiceAccount Token Secret은 예외로 구분했다.

Kubernetes 고급 운영은 Requests·Limits, CPU·GPU, QoS·OOM, Namespace 자원 정책, AdmissionPolicy, Scheduling, Affinity·Topology, Taint·Drain·PDB, Deployment·Jenkins, Pod Lifecycle과 HPA를 열네 문서로 정리했다. Kubernetes 1.36 기준 Stable 기능과 Beta 기능을 구분했다.

Kubernetes API 확장은 Controller와 Reconciliation, Custom Resource 도입, CRD Schema, Status·Finalizer·Version Lifecycle, Reconcile 구현, Kubebuilder·Operator SDK 선택과 운영 테스트를 일곱 문서로 정리했다.

Kubernetes 기타 Workload는 Job·병렬 완료 조건·CronJob, DaemonSet 기본·Scheduling, StatefulSet Identity·Storage 운영을 일곱 문서로 정리했다.

Kubernetes 모니터링은 Observability 기본, Application Metric, Metrics Server·APIService, kube-state-metrics, node_exporter·cAdvisor, Prometheus Operator·Alert, Thanos와 Grafana를 열한 문서로 정리했다.

Docker Swarm은 현재 Docker Engine의 Swarm mode를 기준으로 네 문서를 보강했다. Manager는 홀수 Quorum을 중심으로 설명하고, Service 운영은 Config·Secret Rotation, Ingress·Overlay·docker_gwbridge, VIP·DNSRR, Local Volume의 Node 종속성과 Node Availability·Placement까지 포함했다.

최근 변경은 `k8s-logging-tracing/`이며 Kubernetes Log 구조, Fluent Bit·Loki, Distributed Trace, OpenTelemetry Collector, Tempo 3.0과 Grafana Correlation을 여덟 문서로 정리했다. 신규 Log Agent에서 제거된 Promtail은 제외하고 Fluent Bit 공식 Loki Output을 사용하며, Loki Simple Scalable Mode의 폐기 방향과 Tempo 3.0의 Kafka 기반 Microservices Architecture를 반영했다. 문서 예시는 실제 Cluster에서 실행하지 않았다.

이는 추천 진도가 아니다. 사용자가 새 목차나 메모를 작성하면 해당 내용을 우선 보강한다.
