# 문서 및 실습 진행 기록

문서 작성 상태와 실습 여부를 구분한다. 노트가 존재한다는 사실만으로 실습이 끝난 것으로 기록하지 않는다.

## 현재 상태

마지막 점검: 2026-07-28

| 영역 | 문서 상태 | 실습 상태 | 다음 보강 후보 |
| --- | --- | --- | --- |
| Docker Engine 기초 | 정리 중 | 미확인 | 짧은 개념 문서의 설명과 예시 |
| Dockerfile | 정리 중 | 미확인 | 캐시·PID 1·비루트 실행 예시 |
| 네트워크·볼륨 | 정리 중 | 미확인 | 앱과 DB 연결 예시 |
| Docker Compose | 초안 보강 완료 | 미실행 | 필요할 때 예제 Compose 파일 실습 |
| 운영·레지스트리 | 정리 중 | 미확인 | 현재 필요한 범위의 예시와 주의 사항 |
| Docker Swarm | 초안 보강 완료 | 미실행 | 다중 Node에서 Service·Network·Storage·Drain 통합 실습 |
| Kubernetes 설치 | 초안 보강 완료 | 미실행 | Minikube·K3s 또는 kubeadm 실습 요청 시 진행 |
| Kubernetes 기본 리소스 | 초안 보강 완료 | 미실행 | Pod·Deployment·Service 적용과 rollout 실습 |
| Kubernetes 구성 관리 | 초안 보강 완료 | 미실행 | Namespace·ConfigMap·Secret·Kustomize 적용 실습 |
| Kubernetes Gateway API | 초안 재구성 완료 | 미실행 | 구현체 선택 후 Gateway·HTTPRoute·TLS 실습 |
| Kubernetes PV·PVC | 초안 보강 완료 | 미실행 | CSI Driver 선택 후 Dynamic Provisioning·Reclaim 실습 |
| Kubernetes 인증·RBAC | 초안 보강 완료 | 미실행 | ServiceAccount·RoleBinding 적용 후 401·403 진단 실습 |
| Kubernetes 고급 운영 | 초안 보강 완료 | 미실행 | Resource·Scheduling·Rollout·HPA 통합 실습 |
| Kubernetes API 확장 | 초안 보강 완료 | 미실행 | Kubebuilder CRD·Controller 생성과 envtest 실습 |
| Kubernetes 기타 Workload | 초안 보강 완료 | 미실행 | Job·DaemonSet·StatefulSet Lifecycle 실습 |
| Kubernetes 모니터링 | 초안 보강 완료 | 미실행 | Metrics Pipeline·Prometheus·Grafana 통합 실습 |

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

### 2026-07-27 — Kubernetes Gateway API 문서 재구성

- 첫 문서에 Ingress의 기본 배경만 남기고 이후 여섯 문서를 현재 Gateway API 중심으로 전면 재작성했다.
- GatewayClass, Gateway, HTTPRoute, Controller, Data plane, Service와 Pod의 연결을 YAML과 Mermaid로 정리했다.
- Service별 LoadBalancer와 공유 Gateway 구조, Worker Node 0~2 요청 흐름, host·path·Header Routing과 Traffic weight를 추가했다.
- URLRewrite, RequestRedirect, Header Filter, HTTPS Listener, ReferenceGrant와 BackendTLSPolicy를 안정 API 형식으로 설명했다.
- 공유 Gateway, 여러 GatewayClass·Controller, Core·Extended 기능과 Conformance를 기준으로 구현체를 선택하도록 정리했다.
- 문서 속 kubectl, curl, OpenSSL 명령과 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-27 — Kubernetes PV·PVC 문서 보강

- PersistentVolume 필요성, Local·임시 Volume, NFS, PV·PVC 역할 분리와 사용, Binding 조건, Reclaim Policy와 StorageClass의 여덟 문서를 작성했다.
- emptyDir·hostPath·Local PV의 Lifecycle과 위험을 구분하고, NFS 정적 PV와 CSI Dynamic Provisioning 구성을 추가했다.
- Capacity, Access Mode, VolumeMode, StorageClass, Label Selector와 Pre-binding 조건을 YAML과 흐름도로 정리했다.
- Retain·Delete Lifecycle과 삭제 보호를 설명하고 Deprecated Recycle은 신규 사용하지 않는 과거 방식으로 분리했다.
- ReadWriteOncePod, WaitForFirstConsumer, Default StorageClass, Volume Expansion과 CSI Driver 유지보수 기준을 반영했다.
- Persistence와 Backup을 구분하고 NFS Backup Repository의 격리·보존·Restore Test 원칙을 추가했다.
- 문서 속 kubectl, Helm, Linux Package, NFS와 CSI 명령 및 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-27 — Kubernetes 인증·RBAC 문서 보강

- API 요청 보안, 인증·인가 과정, ServiceAccount, Role·ClusterRole, API Server 접근, SDK, ImagePullSecret, kubeconfig, User·Group과 X.509의 열한 문서를 작성했다.
- 사용자가 `:`로 표시한 인증·인가와 RBAC 핵심을 유지하고, `-` 항목을 YAML·CLI 예시와 Mermaid 요청 흐름으로 확장했다.
- ServiceAccount Token은 TokenRequest 기반의 짧은 Projected Token을 기본으로 설명하고 장기 Token Secret은 제한적인 예외로 분리했다.
- RBAC의 Namespace·Cluster 범위, Additive 권한, Aggregated ClusterRole, 최소 권한과 `kubectl auth can-i` 검증 방법을 정리했다.
- 사람 인증은 외부 IdP·OIDC를 우선 방향으로 두고 X.509의 CN·O Mapping, CSR 승인과 인증서 폐기 미지원에 따른 짧은 수명 원칙을 추가했다.
- 문서 속 kubectl, curl, OpenSSL, SDK 명령과 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-28 — Kubernetes 고급 운영 문서 보강

- Requests·Limits, CPU 경합, GPU, QoS·OOM, ResourceQuota·LimitRange와 AdmissionPolicy의 자원 관리 문서를 작성했다.
- kube-scheduler의 Filtering·Scoring·Binding, nodeSelector·Affinity·Topology Spread, Taint·Toleration과 Node Drain·PDB를 흐름도와 YAML로 정리했다.
- Deployment의 Recreate·RollingUpdate·Blue-Green, Jenkins와 GitOps의 역할, Pod Lifecycle·Probe·Graceful Shutdown과 HPA Behavior를 추가했다.
- Pod의 `Completed`·`Error`·`Terminating`은 공식 Phase가 아닌 kubectl STATUS임을 구분하고, `nodeName`은 Scheduler를 우회한다는 점을 명시했다.
- Kubernetes 1.36의 Pod-level Resources와 DRA 일부 확장 기능은 Beta로, DRA 핵심 기능·ValidatingAdmissionPolicy·Container Resource Metric은 Stable 기능으로 지원 상태를 구분했다.
- ResourceQuota·LimitRange는 Built-in Admission 기능이고 ValidatingAdmissionPolicy는 Custom 검증용이므로 서로 대체하지 않는다는 경계를 반영했다.
- 문서 속 kubectl, Jenkins, 부하 생성 명령과 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-28 — Kubernetes Custom Resource·Controller 문서 보강

- 선언형 제어와 Reconciliation, Custom Resource 도입, CRD Schema, Lifecycle, Controller 구현, 도구 선택과 운영의 일곱 문서를 작성했다.
- 사용자의 `:` 핵심을 중심으로 CRD→Controller→CR→Watch→Reconcile→Status 흐름을 YAML·Go 예시와 Mermaid로 확장했다.
- 과거 최상위 `spec.validation` 표기는 `apiextensions.k8s.io/v1`의 `spec.versions[].schema.openAPIV3Schema`로 수정했다.
- Status Subresource, Condition, generation·observedGeneration, OwnerReference, Finalizer와 served·storage Version Migration을 추가했다.
- Kubebuilder와 Go Operator SDK가 controller-runtime·Kubebuilder 기반을 공유함을 설명하고, 새 Go Controller는 Kubebuilder를 기본으로, OLM Bundle·Catalog가 필요하면 Operator SDK를 선택하도록 정리했다.
- envtest·실제 Cluster E2E·Upgrade Test, Leader Election, 최소 RBAC, Metrics와 Finalizer Runbook을 유지보수 기준으로 추가했다.
- 문서 속 kubectl, Kubebuilder, Operator SDK, Go Build와 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-28 — Kubernetes Job·DaemonSet·StatefulSet 문서 보강

- Job 기본·병렬 완료 조건·CronJob, DaemonSet 기본·Scheduling, StatefulSet Identity·Storage 운영의 일곱 문서를 작성했다.
- Job은 항상 Running인 Pod가 아니라 완료를 목표로 하며, `parallelism`은 동시 실행을 제공하지만 Work Partition은 Application 책임임을 명시했다.
- Indexed Job, Pod Failure Policy, TTL, CronJob Time Zone·Concurrency·Scheduled Timestamp와 멱등성 기준을 추가했다.
- DaemonSet은 모든 Node가 아니라 Selector·Affinity·Taint 조건을 통과한 적격 Node마다 실행된다고 수정하고 Control Plane Toleration·RollingUpdate·Node Agent 보안을 설명했다.
- StatefulSet과 Headless Service의 Stable DNS, `volumeClaimTemplates`, ReadWriteOncePod, PVC Retention과 RollingUpdate·Partition을 정리했다.
- StatefulSet은 Database Replication·Backup·Failover를 자동 제공하지 않으므로 유지보수되는 Operator나 Managed Service를 함께 검토하도록 추가했다.
- 문서 속 kubectl, Job·CronJob 실행과 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-28 — Kubernetes Metrics·Observability 문서 보강

- Observability 구조, Application Metric, Metrics 분류, Metrics Server·APIService, kube-state-metrics, node_exporter·cAdvisor, Prometheus·Thanos·Grafana의 열한 문서를 작성했다.
- Metrics·Logs·Traces를 별도 Signal로 구분하고 Python·Go·Java·JavaScript의 `/metrics` Instrumentation 예시를 추가했다.
- Metrics Server는 HPA·VPA·`kubectl top`용 최신 CPU·Memory Pipeline이며 Prometheus 장기 Monitoring을 대체하지 않는다는 경계를 명시했다.
- kube-state-metrics의 Object State, node_exporter의 Host Metric과 kubelet/cAdvisor의 Container Metric 역할을 구분했다.
- 신규 Kubernetes 수집은 Prometheus Operator의 ServiceMonitor·PodMonitor·PrometheusRule을 중심으로 설명하고 Annotation Scrape는 구현체 Convention으로 분리했다.
- Thanos의 Sidecar·Query·Store Gateway·Compactor와 Object Storage 권한, Grafana Dashboard ID·Revision 고정 및 Git Provisioning 기준을 추가했다.
- 문서 속 kubectl, curl, Docker, PromQL과 Manifest는 실제 환경에서 실행하지 않았다.

### 2026-07-28 — Docker Swarm 추가 문서 보강

- Swarm 도입 판단, Manager·Worker와 Raft Quorum, Cluster 구축, Service 운영과 Node Scheduling의 네 문서를 보강했다.
- Manager 수를 단순한 `2n-1` 규칙 대신 과반수 Quorum과 3·5개 홀수 구성으로 수정하고, 기본 Network Port에서 불필요한 `4789/tcp`를 제거했다.
- Replicated·Global Service, Task 장애 복구, Rolling Update·Rollback을 명령과 `curl` 확인 예시로 정리했다.
- Config·Secret의 불변성과 Version 기반 Rotation, Ingress Routing Mesh·Overlay·docker_gwbridge와 VIP·DNSRR Discovery를 추가했다.
- 기본 Local Volume은 다른 Node에서 같은 이름으로 새로 생성될 수 있지만 데이터는 공유되지 않으며, Bind Source가 없을 때 Task가 실패한다는 차이를 반영했다.
- Active·Pause·Drain, Node·Engine Label, Constraint·Placement Preference와 Pending Task 진단 절차를 추가했다.
- 문서 속 Docker, curl과 Host 명령은 실제 Swarm 환경에서 실행하지 않았다.

## 기록 템플릿

### YYYY-MM-DD — 주제

- 대상 문서:
- 보강한 내용:
- 실습 여부:
- 다음 보강 후보:
