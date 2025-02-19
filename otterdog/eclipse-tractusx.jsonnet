local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.tractusx', 'eclipse-tractusx') {
  settings+: {
    description: "",
    name: "Eclipse Tractus-X",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('DOCKER_HUB_TOKEN') {
      value: "pass:bots/automotive.tractusx/docker.com/api-token",
    },
    orgs.newOrgSecret('DOCKER_HUB_USER') {
      value: "pass:bots/automotive.tractusx/docker.com/username",
    },
    orgs.newOrgSecret('HELM_PASSWORD') {
      value: "pass:bots/automotive.tractusx/repo3.eclipse.org/token-password",
    },
    orgs.newOrgSecret('HELM_USER') {
      value: "pass:bots/automotive.tractusx/repo3.eclipse.org/token-username",
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "pass:bots/automotive.tractusx/gpg/passphrase",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "pass:bots/automotive.tractusx/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "pass:bots/automotive.tractusx/oss.sonatype.org/gh-token-password",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "pass:bots/automotive.tractusx/oss.sonatype.org/gh-token-username",
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
    orgs.newOrgSecret('SWAGGERHUB_API_KEY') {
      value: "pass:bots/automotive.tractusx/swaggerhub.com/api-key",
    },
    orgs.newOrgSecret('SWAGGERHUB_USER') {
      value: "pass:bots/automotive.tractusx/swaggerhub.com/username",
    },
    orgs.newOrgSecret('VERACODE_API_ID') {
      value: "pass:bots/automotive.tractusx/veracode.com/api-id",
    },
    orgs.newOrgSecret('VERACODE_API_KEY') {
      value: "pass:bots/automotive.tractusx/veracode.com/api-key",
    },
  ],
  variables+: [
    orgs.newOrgVariable('HELM_REPO') {
      value: "https://repo3.eclipse.org/repository/tractusx-helm-releases/",
    },
    orgs.newOrgVariable('HELM_REPO_STAGING') {
      value: "https://repo3.eclipse.org/repository/tractusx-helm-staging/",
    },
  ],
  _repositories+:: [
    orgs.extendRepo('.eclipsefdn') {
      private_vulnerability_reporting_enabled: true,
    },
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('SSI-agent-lib') {
      archived: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('api-hub') {
      allow_merge_commit: true,
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://eclipse-tractusx.github.io/api-hub",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
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
    orgs.newRepo('app-dashboard') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "app-dashboard",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('bpdm') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "bpdm",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('bpdm-certificate-management') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "reference implementation for business partner certificates",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('bpdm-upload-tool') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('bpn-did-resolution-service') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Tractus-X Resolver Service for BPN <> DID resolution",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('charts') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('daps-registration-service') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('data-exchange-test-service') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      archived: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('tractusx-sdk') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Tractus-X Software Development KIT - The Dataspace & Industry Foundation Middleware",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/tractusx-sdk/",
      private_vulnerability_reporting_enabled: true,
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
    orgs.newRepo('industry-core-hub') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Tractus-X Industry Core Hub [IC-Hub] - The Catena-X Use Case Speedway",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/industry-core-hub/",
      private_vulnerability_reporting_enabled: true,
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
    orgs.newRepo('digital-product-pass') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Tractus-X Digital Product Pass (DPP) - An application for visualizing Digital Product Passports, Battery Passports and Transmission Passports, it is the reference implementation of the EcoPass KIT",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://github.com/eclipse-tractusx/digital-product-pass",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
    orgs.newRepo('eclipse-tractusx.github.io') {
      allow_merge_commit: true,
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          dismisses_stale_reviews: true,
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
    orgs.newRepo('eclipse-tractusx.github.io.largefiles') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('eco-pass-kit') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('emergingtechnologies') {
      archived: true,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('item-relationship-service') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/item-relationship-service/docs/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('DEV_ADMIN_USER_API_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('DEV_REGULAR_USER_API_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('INT_ADMIN_USER_API_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('INT_REGULAR_USER_API_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('IRS_CUCUMBER_PUBLISH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('IRS_XRAY_JIRA_SECRET') {
          value: "pass:bots/automotive.tractusx/github.com/IRS_XRAY_JIRA_SECRET",
        },
        orgs.newRepoSecret('IRS_XRAY_JIRA_USER') {
          value: "pass:bots/automotive.tractusx/github.com/IRS_XRAY_JIRA_USER",
        },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Reference Implementations of CX-0084 (Federated Queries In Data Spaces)",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('knowledge-agents-aas-bridge') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('knowledge-agents-edc') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "EDC Extensions for CX-0084 (Federated Queries In Data Spaces)",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('managed-identity-wallet') {
      archived: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('managed-identity-wallets-archived') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "managed-identity-wallets",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('policy-hub') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Policy Hub",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.tractusx/sonarcloud.io/token-policy-hub",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_policy-hub",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('portal') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Portal - Helm charts",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('portal-assets') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Portal Documentation and Static Image Content",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Portal Backend",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('NUGET_API_KEY') {
          value: "pass:bots/automotive.tractusx/nuget.org/api-token",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_portal-backend",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('portal-frontend') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Portal Frontend",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('portal-frontend-registration') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Portal Frontend Registration",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('portal-iam') {
      allow_merge_commit: true,
      allow_update_branch: false,
      description: "IAM - Keycloak instances",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Portal Shared UI Components",
      gh_pages_build_type: "workflow",
      homepage: "https://eclipse-tractusx.github.io/portal-shared-components",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('NPM_PUBLISH') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
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
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Predictive Unit Real-Time Information Service (PURIS) for Short Term Demand and Capacity Management",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "Analyze KICS",
            "Check quality guidelines / Check quality guidelines",
            "check-dependencies-backend",
            "check-dependencies-frontend",
            "docker-backend",
            "docker-frontend"
          ],
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
    orgs.newRepo('puris-backend') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "puris-backend",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('puris-frontend') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      description: "puris-frontend",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('sd-factory') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('sig-architecture') {
      allow_merge_commit: true,
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      delete_branch_on_merge: false,
      description: "Eclipse Tractus-X Architecture topics, general architecture documentation, dataspace usage patterns and overall design decisions.",
      has_discussions: true,
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1
        }
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ]
    },
    orgs.newRepo('sig-infra') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Repository for Tractus-X infrastructure topics and resources. ",
      has_discussions: true,
      homepage: "",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('sig-release') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_projects: true,
      homepage: "https://eclipse-tractusx.github.io/sig-release",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('NOTIFICATION_EMAIL_PASSWORD') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
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
    orgs.newRepo('sig-security') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Repository for Tractus-X Security Topics and Resources",
      has_discussions: true,
      homepage: "",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('sldt-bpn-discovery') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.tractusx/sonarcloud.io/token-tractusx_sldt-digital-twin-registry",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_sldt-digital-twin-registry",
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
    orgs.newRepo('sldt-discovery-finder') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
    orgs.newRepo('sldt-ontology-model') {
      aliases: ['knowledge-agents-ontology'],
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_setup_enabled: true,
      code_scanning_default_languages: ["python"],
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "sldt-semantic-models",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
    orgs.newRepo('ssi-authority-schema-registry') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "SSI Authority & Schema Registry",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.tractusx/sonarcloud.io/token-ssi-authority-schema-registry",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_ssi-authority-schema-registry",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('ssi-credential-issuer') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "SSI Credential Issuer",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.tractusx/sonarcloud.io/token-ssi-credential-issuer",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_ssi-credential-issuer",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('ssi-dim-wallet-stub') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Stub application for DIM Wallet",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/automotive.tractusx/sonarcloud.io/token-ssi-dim-wallet-stub",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_ssi-dim-wallet-stub",
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
    orgs.newRepo('ssi-docu') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('testdata-provider') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Testdata Provider",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('traceability-foss') {
      allow_merge_commit: true,
      allow_update_branch: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-tractusx.github.io/traceability-foss/docs/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('ASSOCIATION_E2E_TXA_HOST') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_E2E_TXA_HOST",
        },
        orgs.newRepoSecret('ASSOCIATION_E2E_TXB_HOST') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_E2E_TXB_HOST",
        },
        orgs.newRepoSecret('ASSOCIATION_KEYCLOAK_HOST') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_KEYCLOAK_HOST",
        },
        orgs.newRepoSecret('ASSOCIATION_SUPERVISOR_TX_A_CLIENT_ID') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_SUPERVISOR_TX_A_CLIENT_ID",
        },
        orgs.newRepoSecret('ASSOCIATION_SUPERVISOR_TX_A_PASSWORD') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_SUPERVISOR_TX_A_PASSWORD",
        },
        orgs.newRepoSecret('ASSOCIATION_SUPERVISOR_TX_B_CLIENT_ID') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_SUPERVISOR_TX_B_CLIENT_ID",
        },
        orgs.newRepoSecret('ASSOCIATION_SUPERVISOR_TX_B_PASSWORD') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_SUPERVISOR_TX_B_PASSWORD",
        },
        orgs.newRepoSecret('ASSOCIATION_TX_JIRA_PASSWORD') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_TX_JIRA_PASSWORD",
        },
        orgs.newRepoSecret('ASSOCIATION_TX_JIRA_USERNAME') {
          value: "pass:bots/automotive.tractusx/github.com/ASSOCIATION_TX_JIRA_USERNAME",
        },
        orgs.newRepoSecret('E2E_TXA_HOST') {
          value: "********",
        },
        orgs.newRepoSecret('E2E_TXB_HOST') {
          value: "********",
        },
        orgs.newRepoSecret('KEYCLOAK_HOST') {
          value: "********",
        },
        orgs.newRepoSecret('ORG_IRS_JIRA_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('ORG_IRS_JIRA_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN_BACKEND') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN_FRONTEND') {
          value: "********",
        },
        orgs.newRepoSecret('SUPERVISOR_CLIENT_ID') {
          value: "********",
        },
        orgs.newRepoSecret('SUPERVISOR_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_ADMIN_LOGIN') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_ADMIN_PW') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_API_KEY_ASSOCIATION_INT') {
          value: "pass:bots/automotive.tractusx/github.com/TRACE_X_API_KEY_ASSOCIATION_INT-secret",
        },
        orgs.newRepoSecret('TRACE_X_API_KEY_DEV') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_API_KEY_INT_A') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_API_KEY_INT_B') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_SUPERVISOR_LOGIN') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_SUPERVISOR_PW') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_USER_LOGIN') {
          value: "********",
        },
        orgs.newRepoSecret('TRACE_X_USER_PW') {
          value: "********",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY_BACKEND') {
          value: "eclipse-tractusx_traceability-foss-backend",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY_FRONTEND') {
          value: "eclipse-tractusx_traceability-foss-frontend",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_traceability-foss-backend",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('tractus-x-umbrella') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Where all Tractus-X comes together",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('tractusx-edc') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-tractusx",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-tractusx_tractusx-edc",
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
    orgs.newRepo('tractusx-edc-compatibility-tests') {
      description: "Compatibility tests for Tractus-X EDC",
      allow_merge_commit: true,
      dependabot_alerts_enabled: true,
      dependabot_security_updates_enabled: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('tractusx-edc-template') {
      delete_branch_on_merge: false,
      is_template: true,
      private_vulnerability_reporting_enabled: true,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('tractusx-profiles') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      private_vulnerability_reporting_enabled: true,
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
    orgs.newRepo('tractusx-quality-checks') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('tutorial-resources') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      archived: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('tractusx-edc-kafka-extension') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Tractus-X EDC Kafka Extension",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
  ],
}
