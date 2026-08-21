Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F674D90DF;
	Fri, 21 Aug 2026 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329420; cv=fail; b=INiJiU83feRGPv6eKQccL1ldP1LG7uUt2005/aJAN6oH8E8yMs0BPMMqxlEx8ETPtcyPEBvtya7WNVGtuCEsNd6f0RkDbWrs/5CbrP3TYRLNCXVq8LnukH1GB/aAq1W+XMxw3H5Cbf2PXhH8VzPF1fFTlMWDQzw9z23Eu5DRIHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329420; c=relaxed/simple;
	bh=jIqQNYxVOsuaWFbRBUWZhXJ2fDuUS5zaM0rLnbvuVUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WJthNoivucpJDwmIR5y9glbhgdIQTnoRIIyOZH60H5vQnKvDD7jb0L9aC1Nh07icrAkmX1h4ITksIzV0EhDo0ZUWTZZw1ANJ369ucIggIipkDJ6KNFga2LVcYoSu3OSId5xTPJeumQGWexhJYd7nJUW4xBMwsJSYw5G+dGLbBwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=g0+kb3k2; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="g0+kb3k2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQYtvOAFkMo25t6EyhWVnYsyBdckR7IWiN/toYTwIcn7kon+GaA+lnpX0r+a4pNY4lMtJ2h2HkWhQNg8MVoGkH5nFafGEUcTd81qt5A0YbARksDtPVAfuKT8T2cCdZVOeonTsWDBfznFUzDCCJ2eVkW7lMT9qCYkye+K/VsnGUvzSRPzCPfyRLPzAvUNA6fLvLw79n/hLMIpnNj/AFOSvWodCAb+Z27FmsiDwX5/8elt+9jw3ploq4jEo8gv67StL5xiMoBPeKErrgRfSy2K1cr05ZADxEycilZgcNsok7blt4INkm3MjY5N9ytDe6zsJnRYsk+Qw64q9PCMTutdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGJHE9Gp/IOSpQbUyxhMRCtrRoqngS7YQIEjV6X8pUQ=;
 b=Q2H7bR2oIsl3yY2oscHu7iWvPGDgKQe5FgsqAxr9Djfe/eVXZy1P/B5dK1F82z/TjQWIttCBfPvInR+VKpd6c2pjYv5RquOMSDxaLORG9LhlSZvNtHq9msrj9Sj1pEIthCwkgT1oWQhpt7TZdS8igPpMBNFlhlSbn113rikQ+tqK5W5hJtCtPxzbKY7VuYmN1TywSBa6gTwSz63qRCupmRBnw729xzxFDuOBOYpHcNP4cp6k8X73Wh2m7cFaPKBMXrIYYhUqv/6rWFvN2GvA213iujAi7buMpP3hhNAUDozGWJGgxIMxisO6ZTYmYxbVs8nSTWWWd0q7/cr+e+26hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGJHE9Gp/IOSpQbUyxhMRCtrRoqngS7YQIEjV6X8pUQ=;
 b=g0+kb3k2HUtt9tSIia9sCEffMaxilyfTbCyrv+axIRSO1EX6UOwrVzgY20onJWIF2KVr46Gf8IDk64cLLImAYk7SSG/Wfssf+dQqNqDg60tP3GqBvjZkH4ejia6jB0iZtGarifPlNj44KbTZlR0HuU2z2Cf5A0hbTwm81yLJyDHdfeOhirr8yEtj7OY1pbM99cm0It5/tmujrXlxog3923GOFXyNKVcwlLMwUbuCW9IQzSjHIP7PtyfZXuTHxlLsHjqmLVoeoY+FF4a9n4KXctuJzSFA96HaGkY1us6asiHBXn0NujjCecjni/uDLFbcW59V8bPJ1IDcDo5OC9fm6A==
Received: from AS4P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::6)
 by DU0PR10MB6228.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:31 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::9) by AS4P190CA0021.outlook.office365.com
 (2603:10a6:20b:5d0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:06 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:18 +0200
Subject: [PATCH 07/16] dt-bindings: nvmem: st,stm32-romem: align
 patternProperties regex on nvmem-deprecated-cells.yaml
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-7-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Thomas Bourgoin <thomas.bourgoin@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|DU0PR10MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 623d2469-4bdb-42af-9e7f-08deffa08a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	LfmjsHuPWhtfFsLIz8SBbIlUSQ85AReGZaEj2bXLQGpdbrKmcq+RUtmu2YDthOP6A0aDrsRCRe7q9rPxH+81AlRzckX3q5yUu0WMX/bFce+gpG87jBUV/oWhGp7Pw9+6YYqKsxuYmv+J1WRgwJogSwgo0F51bFfNUx3hokb8fd6yjdZJHWD3sgXnMVknqALX5WteBvNhJQJl8C221CEUJbVKwzZVYyZA1iNDF3T8QOF4fc6fE/ShcWHvzyk0CNmPxwz+HtRcpCWsnqzptBuClGkEu0m4szIytVsnEQ+dSehXFZnLIjegma6d4TAeWPwa6NdiFnM32tT37oUxXC1edW6GEVG0NIolvksDea3dgFVuOsyt3aU8p8Js4qNOCcRRpgxrKC62bvDjaOCO4rOEEMfOMhNP7+/xy6pUROzvS7mn673awds4lt3Omq4zOVmQt5d7VISL4IXJBCb2ZfJ22LbT1PdduIZL6hHtsGnqVCvTRPoFszsfcEIX9IU3nSREIdEbxHp13gBEb/VDDSTGi0JCkrJyMgFoKJydWNwxQSUJ6Oh55KRNDL+Lrb1zz/sNbzA3sOpqwqpd3NiiWlK2l10uZgPr8197yOEzjZzWmfn9VP0dKjXPd9IU0s2ZoL67NHn63b4KNuKqrU6PJzwh+DHHz33rpOmi9YaAb0RIeAO8fSG/DwvLx6OMZrNWnd/sZAyX8A5suwRSr9f5fxxu/LIajpLT/XyiZw/trnxZ/mdxSs3WFYhAhqBcM/iusjFj
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LcEV0YroSdxgwuMxFtxHSy5B+qqSSlyD6oU/yehzGMbH2NgXsz3ZrFVzQOpg5x8nOy8IVOxA8RYyF1bJVFTcnr98tzAAiwtBgKqxGiynzRUdWKuQ+sg8VAno4N2mCzPjnT1Eo0oE4W++0Ge2f/lS5Sk1RLSnJcpRRPiE9WykzklUDT3HcJVK0Kq35c+l+5eGvu+TfSTtYFB/fCD02MTjDcrU5HpeZq+i7j52GgqTEuIvQw6UO3XjGLo106QlNPESO9PXvKGuRhVBzjUZWtFmrqwl3SpTUGRSzatnRcWfVIsukxpYW9uBfSwcso/ehYJPn0YvMRe4UDUKty2RDG22xAnkk+26JOc57IHIQpg2lrNrrxBxokuVzBaHGrLu68b42ywUsC3ySs9S+ETNsfY+zHS9FmDAxML3Os7KQCPFgPg0kBKKl5zYyF405nu0Ahoe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:31.0158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623d2469-4bdb-42af-9e7f-08deffa08a2a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6228

Align the regex with the one used in nvmem-deprecated-cells.yaml
("@[0-9a-f]+(,[0-7])?$") so both patternProperties definitions apply
to the same set of node names.

The patternProperties key only matched node names of the form
"name@address" ("^.*@[0-9a-f]+$"). It did not match nodes using the
extra unit-address index used to disambiguate cells sharing the same
reg, e.g. "trim_rd_cc1@1e8,4", causing dtbs_check failures such as:

efuse@44000000 (st,stm32mp25-bsec): Unevaluated properties are not
allowed ('trim_rd_cc1@1e8,4', ...)

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index ab4cdc4e3614..a9988b1d63f5 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  "@[0-9a-f]+$":
+  "@[0-9a-f]+(,[0-7])?$":
     type: object
     $ref: layouts/fixed-cell.yaml
     unevaluatedProperties: false

-- 
2.43.0

