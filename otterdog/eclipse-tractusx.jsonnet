
local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-tractusx') {
    settings+: {
      billing_email: "webmaster@eclipse.org",
      default_repository_permission: "none",
      default_workflow_permissions: "write",
      dependabot_security_updates_enabled_for_new_repositories: false,
      description: "Lets give the org some description",
      members_can_change_repo_visibility: true,
      members_can_delete_repositories: true,
      name: "Eclipse Tractus-X",
      packages_containers_internal: false,
      packages_containers_public: false,
      readers_can_create_discussions: true,
      security_managers: [],
      web_commit_signoff_required: false,
    },
    _repositories+:: [
      orgs.newRepo('.eclipsefdn-private') {
        allow_forking: false,
        archived: true,
        description: "Repository to host configurations related to the Eclipse Foundation.",
        has_projects: false,
        has_wiki: false,
        private: true,
        template_repository: "EclipseFdn/.eclipsefdn-template",
      },
      orgs.newRepo('.github') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('SSI-agent-lib') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('app-dashboard') {
        allow_update_branch: false,
        description: "app-dashboard",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('bpdm') {
        allow_update_branch: false,
        description: "bpdm",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('charts') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('community') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('daps-helm-chart') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('daps-registration-service') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('data-exchange-test-service') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('demand-capacity-mgmt') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('demand-capacity-mgmt-backend') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('demand-capacity-mgmt-frontend') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('digital-product-pass') {
        allow_update_branch: false,
        description: "digital product pass",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('e2e-testing') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('eclipse-tractusx.github.io') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('item-relationship-service') {
        allow_update_branch: false,
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('main') {
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('knowledge-agents') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('knowledge-agents-edc') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('managed-identity-wallet') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('managed-identity-wallets-archived') {
        allow_update_branch: false,
        description: "managed-identity-wallets",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('managed-service-orchestrator') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('managed-simple-data-exchanger') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('managed-simple-data-exchanger-backend') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('managed-simple-data-exchanger-frontend') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('online-simulation-kit') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('ontology') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('portal-assets') {
        allow_update_branch: false,
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('main') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('portal-backend') {
        allow_update_branch: false,
        default_branch: "dev",
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('dev') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
          orgs.newBranchProtectionRule('main') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('portal-cd') {
        allow_update_branch: false,
        default_branch: "dev",
        delete_branch_on_merge: true,
        description: "portal cd",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('dev') {
            required_approving_review_count: null,
            required_status_checks: [],
            requires_approving_reviews: false,
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
          orgs.newBranchProtectionRule('main') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('portal-frontend') {
        allow_update_branch: false,
        default_branch: "dev",
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('dev') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
          orgs.newBranchProtectionRule('main') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('portal-frontend-registration') {
        allow_update_branch: false,
        default_branch: "dev",
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('dev') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
          orgs.newBranchProtectionRule('main') {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('portal-iam') {
        allow_update_branch: false,
        description: "portal iam",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('portal-shared-components') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('puris-backend') {
        allow_update_branch: false,
        description: "puris-backend",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('puris-frontend') {
        allow_update_branch: false,
        description: "puris-frontend",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sd-factory') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sig-infra') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sldt-bpn-discovery') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sldt-digital-twin-registry') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sldt-discovery-finder') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sldt-semantic-hub') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('sldt-semantic-models') {
        allow_update_branch: false,
        description: "sldt-semantic-models",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('ssi-docu') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('testdata-provider') {
        allow_update_branch: false,
        description: "Testdata Provider",
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('traceability-foss') {
        allow_update_branch: false,
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('main') {
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('traceability-foss-backend') {
        allow_update_branch: false,
        delete_branch_on_merge: true,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
        branch_protection_rules: [
          orgs.newBranchProtectionRule('main') {
            required_approving_review_count: 1,
            required_status_checks: [],
            requires_status_checks: false,
            requires_strict_status_checks: true,
          },
        ],
      },
      orgs.newRepo('tractus-x-release') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('tractusx-edc') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('test-repo') {
      },
      orgs.newRepo('tractusx-quality-checks') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('vas-country-risk') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
      orgs.newRepo('vas-country-risk-backend') {
        allow_update_branch: false,
        secret_scanning_push_protection: "disabled",
        web_commit_signoff_required: false,
      },
    ],
}