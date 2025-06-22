;; CRM Manager Verification Contract
;; Validates and manages CRM managers with role-based access

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_EXISTS (err u101))
(define-constant ERR_NOT_FOUND (err u102))

;; Manager data structure
(define-map managers
  { manager: principal }
  {
    verified: bool,
    role: (string-ascii 20),
    created-at: uint,
    permissions: uint
  }
)

;; Manager verification status
(define-data-var total-managers uint u0)

;; Add new CRM manager
(define-public (add-manager (manager principal) (role (string-ascii 20)) (permissions uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? managers { manager: manager })) ERR_ALREADY_EXISTS)
    (map-set managers
      { manager: manager }
      {
        verified: true,
        role: role,
        created-at: block-height,
        permissions: permissions
      }
    )
    (var-set total-managers (+ (var-get total-managers) u1))
    (ok true)
  )
)

;; Verify manager status
(define-read-only (is-verified-manager (manager principal))
  (match (map-get? managers { manager: manager })
    manager-data (get verified manager-data)
    false
  )
)

;; Get manager details
(define-read-only (get-manager (manager principal))
  (map-get? managers { manager: manager })
)

;; Remove manager
(define-public (remove-manager (manager principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-some (map-get? managers { manager: manager })) ERR_NOT_FOUND)
    (map-delete managers { manager: manager })
    (var-set total-managers (- (var-get total-managers) u1))
    (ok true)
  )
)

;; Get total managers count
(define-read-only (get-total-managers)
  (var-get total-managers)
)
