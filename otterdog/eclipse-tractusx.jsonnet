local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-tractusx') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
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
      value: "pass:bots/automotive.tractusx/gpg/secret-subkeys.asc",
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
    orgs.newOrgSecret('SWAGGERHUB_API_KEY') {
      value: "pass:bots/automotive.tractusx/swaggerhub.com/api-key",
    },
    orgs.newOrgSecret('SWAGGERHUB_USER') {
      value: "pass:bots/automotive.tractusx/swaggerhub.com/username",
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('SSI-agent-lib') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('app-dashboard') {
      allow_update_branch: false,
      description: "app-dashboard",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('asset-tracking-platform') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('bpdm') {
      allow_update_branch: false,
      description: "bpdm",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('charts') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('daps-registration-service') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('data-exchange-test-service') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('digital-product-pass') {
      allow_update_branch: false,
      description: "digital product pass",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('e2e-testing') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      has_discussions: true,
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/",
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
    orgs.newRepo('eclipse-tractusx.github.io.largefiles') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('eco-pass-kit') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('item-relationship-service') {
      allow_update_branch: false,
      delete_branch_on_merge: true,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      description: "Reference Implementations of CX-0084 (Federated Queries In Data Spaces)",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('knowledge-agents-aas-bridge') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('knowledge-agents-edc') {
      allow_update_branch: false,
      description: "EDC Extensions for CX-0084 (Federated Queries In Data Spaces)",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('managed-identity-wallet') {
      allow_update_branch: false,
      has_discussions: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('managed-identity-wallets-archived') {
      allow_update_branch: false,
      description: "managed-identity-wallets",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('pcf-exchange-kit') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('portal-assets') {
      allow_update_branch: false,
      description: "Portal Assets",
      delete_branch_on_merge: true,
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
      description: "Portal Backend",
      delete_branch_on_merge: true,
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
      delete_branch_on_merge: true,
      description: "Portal - Continuous Deployment",
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
      description: "Portal Frontend",
      delete_branch_on_merge: true,
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
      description: "Portal Frontend Registration",
      delete_branch_on_merge: true,
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
      description: "IAM - Keycloak instances",
      delete_branch_on_merge: true,
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
    orgs.newRepo('portal-shared-components') {
      allow_update_branch: false,
      description: "Portal Shared UI Components",
      delete_branch_on_merge: true,
      gh_pages_build_type: "workflow",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
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
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('puris-backend') {
      archived: true,
      allow_update_branch: false,
      description: "puris-backend",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('puris-frontend') {
      archived: true,
      allow_update_branch: false,
      description: "puris-frontend",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sd-factory') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sig-infra') {
      allow_update_branch: false,
      has_discussions: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sig-security') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('sig-release') {
      allow_update_branch: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      homepage: "https://eclipse-tractusx.github.io/sig-release",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      environments: [
          orgs.newEnvironment('github-pages') {
            branch_policies+: [
              "gh-pages"
            ],
            deployment_branch_policy: "selected",
          },
      ],
    },
    orgs.newRepo('sldt-bpn-discovery') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('testdata-provider') {
      allow_update_branch: false,
      description: "Testdata Provider",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('traceability-foss') {
      allow_update_branch: false,
      delete_branch_on_merge: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('tutorial-resources') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
    orgs.newRepo('vas-country-risk') {
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
      web_commit_signoff_required: false,
    },
  ],
}
