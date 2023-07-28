local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-tractusx') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse Tractus-X",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    security_managers+: [
      "automotive-tractusx-committers"
    ],
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('DOCKER_HUB_TOKEN') {
      value: "pass:bots/automotive.tractusx/docker.com/token",
    },
    orgs.newOrgSecret('DOCKER_HUB_USER') {
      value: "pass:bots/automotive.tractusx/docker.com/username",
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "pass:bots/automotive.tractusx/gpg/passphrase",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "pass:bots/automotive.tractusx/gpg/secret-keys.asc",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "pass:bots/automotive.tractusx/oss.sonatype.org/password",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "pass:bots/automotive.tractusx/oss.sonatype.org/username",
    },
    orgs.newOrgSecret('ORG_PORTAL_DISPATCH_APPID') {
      value: "pass:bots/automotive.tractusx/github.com/github-app-id",
    },
    orgs.newOrgSecret('ORG_PORTAL_DISPATCH_KEY') {
      value: "pass:bots/automotive.tractusx/github.com/github-app-private-key",
    },
    orgs.newOrgSecret('ORG_VERACODE_API_ID') {
      value: "pass:bots/automotive.tractusx/veracode.com/api-id",
    },
    orgs.newOrgSecret('ORG_VERACODE_API_KEY') {
      value: "pass:bots/automotive.tractusx/veracode.com/api-key",
    },
    orgs.newOrgSecret('VERACODE_API_ID') {
      value: "pass:bots/automotive.tractusx/veracode.com/api-id",
    },
    orgs.newOrgSecret('VERACODE_API_KEY') {
      value: "pass:bots/automotive.tractusx/veracode.com/api-key",
    },
  ],
  _repositories+:: [
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
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('eclipse-tractusx.github.io') {
      allow_update_branch: false,
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('item-relationship-service') {
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_security_updates_enabled: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_ORGANIZATION') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_PROJECT_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
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
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('managed-identity-wallets-archived') {
      allow_update_branch: false,
      description: "managed-identity-wallets",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('managed-service-orchestrator') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('managed-simple-data-exchanger') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('managed-simple-data-exchanger-backend') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('managed-simple-data-exchanger-frontend') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('online-simulation-kit') {
      allow_update_branch: false,
      has_discussions: true,
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
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('dev') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
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
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
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
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
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
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
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
      secrets: [
        orgs.newRepoSecret('NPM_PUBLISH') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('puris') {
      allow_update_branch: false,
      delete_branch_on_merge: true,
      description: "Predictive Unit Real-Time Information Service (PURIS) for Short Term Demand and Capacity Management",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_strict_status_checks: true,
        },
      ],
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
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sig-release') {
      allow_update_branch: false,
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sldt-bpn-discovery') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sldt-digital-twin-registry') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sldt-discovery-finder') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sldt-semantic-hub') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sldt-semantic-models') {
      allow_update_branch: false,
      description: "sldt-semantic-models",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('CLIENT_ID_DEV') {
          value: "********",
        },
        orgs.newRepoSecret('CLIENT_ID_INT') {
          value: "********",
        },
        orgs.newRepoSecret('CLIENT_SECRET_DEV') {
          value: "********",
        },
        orgs.newRepoSecret('CLIENT_SECRET_INT') {
          value: "********",
        },
        orgs.newRepoSecret('IDP_URL_DEV') {
          value: "********",
        },
        orgs.newRepoSecret('IDP_URL_INT') {
          value: "********",
        },
        orgs.newRepoSecret('SEMANTIC_HUB_DEV_BASE') {
          value: "********",
        },
        orgs.newRepoSecret('SEMANTIC_HUB_INT_BASE') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('ssi-docu') {
      allow_update_branch: false,
      has_discussions: true,
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
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN_BACKEND') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN_FRONTEND') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('traceability-foss-backend') {
      allow_update_branch: false,
      delete_branch_on_merge: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('tractus-x-release') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('tractusx-edc') {
      allow_update_branch: false,
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('AZURE_CLIENT_ID') {
          value: "********",
        },
        orgs.newRepoSecret('AZURE_CLIENT_SECRET') {
          value: "********",
        },
        orgs.newRepoSecret('AZURE_TENANT_ID') {
          value: "********",
        },
        orgs.newRepoSecret('AZURE_VAULT_NAME') {
          value: "********",
        },
        orgs.newRepoSecret('GPG_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('GPG_PRIVATE_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('SWAGGERHUB_API_KEY') {
          value: "pass:bots/automotive.tractusx/swaggerhub.com/api-key",
        },
        orgs.newRepoSecret('SWAGGERHUB_USER') {
          value: "pass:bots/automotive.tractusx/swaggerhub.com/username",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('vas-country-risk-backend') {
      allow_update_branch: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
