;; Cosmic Insignificance Perspective Engine Contract
;; Header: v1.0.1 - minor metadata comment
;; Provides real-time scale comparisons between your problems and the heat death of the universe

;; Constants and Error Definitions
(define-constant ERR-NOT-AUTHORIZED (err u2000))
(define-constant ERR-INVALID-PROBLEM-SCALE (err u2001))
(define-constant ERR-CALCULATION-OVERFLOW (err u2002))
(define-constant ERR-USER-NOT-REGISTERED (err u2003))
(define-constant ERR-PERSPECTIVE-NOT-FOUND (err u2004))
(define-constant ERR-INVALID-COSMIC-UNIT (err u2005))
(define-constant ERR-TEMPORAL-BOUNDS-EXCEEDED (err u2006))
(define-constant ERR-SIGNIFICANCE-UNDERFLOW (err u2007))

(define-constant CONTRACT-OWNER tx-sender)
(define-constant MAX-PROBLEM-SCALE u1000000000)
(define-constant UNIVERSE-AGE-YEARS u13800000000)
(define-constant HEAT-DEATH-ESTIMATE-YEARS u1000000000000000000)
(define-constant OBSERVABLE-UNIVERSE-DIAMETER-KM u879000000000000000000000000)
(define-constant TOTAL-ATOMS-IN-UNIVERSE u10000000000000000000000000000)
(define-constant HUMAN-LIFESPAN-YEARS u80)
(define-constant MILKY-WAY-STARS u400000000000)
(define-constant COSMIC-INSIGNIFICANCE-THRESHOLD u1000000)

;; Data Variables
(define-data-var next-perspective-id uint u1)
(define-data-var total-perspective-calculations uint u0)
(define-data-var global-insignificance-average uint u0)
(define-data-var universe-scale-factor uint u1000000000)

;; Data Maps
(define-map user-cosmic-profiles
    { user-address: principal }
    {
        registration-block: uint,
        total-problems-analyzed: uint,
        average-insignificance-score: uint,
        most-significant-problem-scale: uint,
        cosmic-awareness-level: uint,
        perspective-sessions: uint,
        last-calculation-block: uint
    }
)

(define-map problem-analyses
    { analysis-id: uint }
    {
        user-address: principal,
        problem-description: (string-ascii 300),
        user-perceived-scale: uint,
        objective-cosmic-scale: uint,
        insignificance-ratio: uint,
        temporal-scope-years: uint,
        spatial-scope-km: uint,
        affected-consciousness-count: uint,
        calculation-timestamp: uint
    }
)

(define-map cosmic-scale-references
    { reference-id: uint }
    {
        reference-name: (string-ascii 100),
        scale-type: (string-ascii 50),
        reference-value: uint,
        unit: (string-ascii 20),
        perspective-impact: uint,
        comfort-factor: uint
    }
)

(define-map perspective-sessions
    { session-id: uint }
    {
        user-address: principal,
        session-start-block: uint,
        problems-processed: uint,
        total-insignificance-discovered: uint,
        comfort-achieved: uint,
        existential-relief-score: uint,
        session-duration-blocks: uint
    }
)

(define-map daily-cosmic-insights
    { user-address: principal, date: uint }
    {
        perspective-shifts: uint,
        anxiety-reduction: uint,
        cosmic-acceptance: uint,
        scale-comprehension: uint,
        philosophical-growth: uint
    }
)

;; Read-only Functions
(define-read-only (get-user-cosmic-profile (user principal))
    (map-get? user-cosmic-profiles { user-address: user })
)

(define-read-only (get-problem-analysis (analysis-id uint))
    (map-get? problem-analyses { analysis-id: analysis-id })
)

(define-read-only (get-cosmic-reference (reference-id uint))
    (map-get? cosmic-scale-references { reference-id: reference-id })
)

(define-read-only (calculate-temporal-insignificance (problem-duration-years uint))
    (let (
        (universe-age-ratio (/ problem-duration-years UNIVERSE-AGE-YEARS))
        (heat-death-ratio (/ problem-duration-years HEAT-DEATH-ESTIMATE-YEARS))
        (human-life-ratio (/ problem-duration-years HUMAN-LIFESPAN-YEARS))
    )
        (if (> universe-age-ratio u0)
            (/ u1000000000 (if (> universe-age-ratio u1) universe-age-ratio u1))
            u1000000000
        )
    )
)

(define-read-only (calculate-spatial-insignificance (problem-scope-km uint))
    (let (
        (universe-diameter-ratio (/ problem-scope-km OBSERVABLE-UNIVERSE-DIAMETER-KM))
        (insignificance-score (if (> universe-diameter-ratio u0)
            (/ u1000000000000 (if (> universe-diameter-ratio u1) universe-diameter-ratio u1))
            u1000000000000
        ))
    )
        (if (< insignificance-score u1000000000000) insignificance-score u1000000000000)
    )
)

(define-read-only (calculate-consciousness-insignificance (affected-minds uint))
    (let (
        (human-population u8000000000)
        (consciousness-ratio (/ affected-minds human-population))
        (universal-consciousness-estimate u1000000000000000)
        (cosmic-ratio (/ affected-minds universal-consciousness-estimate))
    )
        (if (> cosmic-ratio u0)
            (/ u1000000000 (if (> cosmic-ratio u1) cosmic-ratio u1))
            u1000000000
        )
    )
)

(define-read-only (generate-perspective-comfort-factor (insignificance-score uint))
    (if (> insignificance-score u1000000000)
        u10
        (if (> insignificance-score u100000000)
            u8
            (if (> insignificance-score u10000000)
                u6
                (if (> insignificance-score u1000000)
                    u4
                    (if (> insignificance-score u100000)
                        u2
                        u1
                    )
                )
            )
        )
    )
)

(define-read-only (get-cosmic-scale-comparison (user-scale uint) (cosmic-reference uint))
    {
        user-scale: user-scale,
        cosmic-reference: cosmic-reference,
        insignificance-ratio: (if (> user-scale u0) (/ cosmic-reference user-scale) u0),
        comfort-multiplier: (generate-perspective-comfort-factor (/ cosmic-reference (if (> user-scale u1) user-scale u1))),
        perspective-shift: (/ cosmic-reference (if (> user-scale u1) user-scale u1))
    }
)

(define-read-only (get-universal-context-stats)
    {
        total-calculations: (var-get total-perspective-calculations),
        average-insignificance: (var-get global-insignificance-average),
        universe-age-years: UNIVERSE-AGE-YEARS,
        heat-death-estimate: HEAT-DEATH-ESTIMATE-YEARS,
        observable-universe-km: OBSERVABLE-UNIVERSE-DIAMETER-KM,
        total-atoms: TOTAL-ATOMS-IN-UNIVERSE
    }
)

;; Private Functions
(define-private (increment-perspective-id)
    (let ((current-id (var-get next-perspective-id)))
        (var-set next-perspective-id (+ current-id u1))
        current-id
    )
)

(define-private (update-global-insignificance-stats (new-score uint))
    (let (
        (current-total (var-get total-perspective-calculations))
        (current-avg (var-get global-insignificance-average))
        (new-total (+ current-total u1))
        (new-avg (/ (+ (* current-avg current-total) new-score) new-total))
    )
        (var-set total-perspective-calculations new-total)
        (var-set global-insignificance-average new-avg)
        (ok true)
    )
)

(define-private (calculate-comprehensive-insignificance 
    (temporal-years uint)
    (spatial-km uint)
    (consciousness-count uint)
)
    (let (
        (temporal-score (calculate-temporal-insignificance temporal-years))
        (spatial-score (calculate-spatial-insignificance spatial-km))
        (consciousness-score (calculate-consciousness-insignificance consciousness-count))
        (combined-score (/ (+ temporal-score spatial-score consciousness-score) u3))
    )
        combined-score
    )
)

;; Public Functions
(define-public (register-cosmic-user)
    (begin
        (asserts! (is-none (get-user-cosmic-profile tx-sender)) ERR-NOT-AUTHORIZED)
        
        (map-set user-cosmic-profiles
            { user-address: tx-sender }
            {
                registration-block: stacks-block-height,
                total-problems-analyzed: u0,
                average-insignificance-score: u0,
                most-significant-problem-scale: u0,
                cosmic-awareness-level: u1,
                perspective-sessions: u0,
                last-calculation-block: stacks-block-height
            }
        )
        (ok true)
    )
)

(define-public (analyze-problem-significance
    (description (string-ascii 300))
    (user-perceived-scale uint)
    (temporal-scope-years uint)
    (spatial-scope-km uint)
    (affected-consciousness uint)
)
    (let (
        (analysis-id (increment-perspective-id))
        (user-profile (unwrap! (get-user-cosmic-profile tx-sender) ERR-USER-NOT-REGISTERED))
        (comprehensive-insignificance (calculate-comprehensive-insignificance 
            temporal-scope-years spatial-scope-km affected-consciousness))
        (objective-cosmic-scale (let ((calc-scale (/ comprehensive-insignificance u1000))) (if (> calc-scale u1) calc-scale u1)))
        (insignificance-ratio (/ comprehensive-insignificance (if (> user-perceived-scale u1) user-perceived-scale u1)))
    )
        (asserts! (and (> user-perceived-scale u0) (<= user-perceived-scale MAX-PROBLEM-SCALE)) ERR-INVALID-PROBLEM-SCALE)
        (asserts! (<= temporal-scope-years HEAT-DEATH-ESTIMATE-YEARS) ERR-TEMPORAL-BOUNDS-EXCEEDED)
        
        (map-set problem-analyses
            { analysis-id: analysis-id }
            {
                user-address: tx-sender,
                problem-description: description,
                user-perceived-scale: user-perceived-scale,
                objective-cosmic-scale: objective-cosmic-scale,
                insignificance-ratio: insignificance-ratio,
                temporal-scope-years: temporal-scope-years,
                spatial-scope-km: spatial-scope-km,
                affected-consciousness-count: affected-consciousness,
                calculation-timestamp: stacks-block-height
            }
        )
        
        (map-set user-cosmic-profiles
            { user-address: tx-sender }
            (merge user-profile 
                {
                    total-problems-analyzed: (+ (get total-problems-analyzed user-profile) u1),
                    most-significant-problem-scale: (if (> user-perceived-scale (get most-significant-problem-scale user-profile)) 
                        user-perceived-scale 
                        (get most-significant-problem-scale user-profile)),
                    last-calculation-block: stacks-block-height
                }
            )
        )
        
        (unwrap-panic (update-global-insignificance-stats insignificance-ratio))
        
        (ok {
            analysis-id: analysis-id,
            insignificance-ratio: insignificance-ratio,
            comfort-factor: (generate-perspective-comfort-factor comprehensive-insignificance),
            cosmic-context: "Your problem is cosmically insignificant. Take comfort in the vastness."
        })
    )
)

(define-public (start-perspective-session)
    (let (
        (session-id (increment-perspective-id))
        (user-profile (unwrap! (get-user-cosmic-profile tx-sender) ERR-USER-NOT-REGISTERED))
    )
        (map-set perspective-sessions
            { session-id: session-id }
            {
                user-address: tx-sender,
                session-start-block: stacks-block-height,
                problems-processed: u0,
                total-insignificance-discovered: u0,
                comfort-achieved: u0,
                existential-relief-score: u0,
                session-duration-blocks: u0
            }
        )
        
        (map-set user-cosmic-profiles
            { user-address: tx-sender }
            (merge user-profile { perspective-sessions: (+ (get perspective-sessions user-profile) u1) })
        )
        
        (ok session-id)
    )
)

(define-public (add-cosmic-scale-reference
    (name (string-ascii 100))
    (scale-type (string-ascii 50))
    (value uint)
    (unit (string-ascii 20))
    (impact uint)
)
    (let ((reference-id (increment-perspective-id)))
        (asserts! (and (>= impact u1) (<= impact u10)) ERR-INVALID-COSMIC-UNIT)
        
        (map-set cosmic-scale-references
            { reference-id: reference-id }
            {
                reference-name: name,
                scale-type: scale-type,
                reference-value: value,
                unit: unit,
                perspective-impact: impact,
                comfort-factor: (generate-perspective-comfort-factor value)
            }
        )
        (ok reference-id)
    )
)

(define-public (update-daily-cosmic-insights
    (perspective-shifts uint)
    (anxiety-reduction uint)
    (cosmic-acceptance uint)
    (scale-comprehension uint)
    (philosophical-growth uint)
)
    (let (
        (date (/ stacks-block-height u144))
        (user-profile (unwrap! (get-user-cosmic-profile tx-sender) ERR-USER-NOT-REGISTERED))
        (total-insight-score (+ perspective-shifts anxiety-reduction cosmic-acceptance scale-comprehension philosophical-growth))
    )
        (asserts! (and 
            (<= perspective-shifts u10)
            (<= anxiety-reduction u10)
            (<= cosmic-acceptance u10)
            (<= scale-comprehension u10)
            (<= philosophical-growth u10)
        ) ERR-INVALID-PROBLEM-SCALE)
        
        (map-set daily-cosmic-insights
            { user-address: tx-sender, date: date }
            {
                perspective-shifts: perspective-shifts,
                anxiety-reduction: anxiety-reduction,
                cosmic-acceptance: cosmic-acceptance,
                scale-comprehension: scale-comprehension,
                philosophical-growth: philosophical-growth
            }
        )
        
        (let ((calculated-level (+ (get cosmic-awareness-level user-profile) (/ total-insight-score u10)))
              (new-awareness-level (if (< calculated-level u100) calculated-level u100)))
            (map-set user-cosmic-profiles
                { user-address: tx-sender }
                (merge user-profile { cosmic-awareness-level: new-awareness-level })
            )
        )
        
        (ok total-insight-score)
    )
)

(define-public (generate-comfort-from-insignificance (problem-scale uint))
    (let (
        (cosmic-comparison (get-cosmic-scale-comparison problem-scale OBSERVABLE-UNIVERSE-DIAMETER-KM))
        (temporal-comparison (get-cosmic-scale-comparison problem-scale HEAT-DEATH-ESTIMATE-YEARS))
        (atomic-comparison (get-cosmic-scale-comparison problem-scale TOTAL-ATOMS-IN-UNIVERSE))
        (comfort-score (/ (+ 
            (get comfort-multiplier cosmic-comparison)
            (get comfort-multiplier temporal-comparison)
            (get comfort-multiplier atomic-comparison)
        ) u3))
    )
        (asserts! (> problem-scale u0) ERR-INVALID-PROBLEM-SCALE)
        
        (ok {
            cosmic-comfort: comfort-score,
            perspective-message: "In the grand scheme of the universe, this too shall pass into cosmic irrelevance",
            insignificance-level: (/ OBSERVABLE-UNIVERSE-DIAMETER-KM problem-scale),
            comfort-rating: comfort-score
        })
    )
)