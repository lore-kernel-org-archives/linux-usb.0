Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C03D6CCF;
	Thu, 18 Jun 2026 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768898; cv=fail; b=Yvv0ympaIPhGfqScMS3loJHGHnlHcQuRmS8qaLPsMtRpM47QUfc24OYUvJSiKBcpzpBu+ZV6d0ewB4Mcdh6gb3aSa5arNpr4ZD8VCbqtZKFxUD0NJm+7xphnkb/6AOZYTY0IAXaI9e/jaNyHv5YagTolY0ymPraf87nIX2ELyzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768898; c=relaxed/simple;
	bh=LRKkVWsEwhH/OGNFZk3sF4SSOMkqPIgbFtnM9g1Jx2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tk5fbjEIe5yzlIjtkEHbAJYtcYOGNOE5cXJTY17S2kTFgalHHTwWGY7VCODIrVhRsNYERXfeyAhzsCJ5EfsVAUrIn6jzHFFHah2YoTphGVImQG1NPrfDWLpDp6NBRJg1ErTZ7RO8AoNBqyOROOamXW6jYULpTW1h8dm8GAqWwJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WBJhS+jg; arc=fail smtp.client-ip=40.107.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WBJhS+jg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcAL7hXu+TVZShxcBLx8L9SFBORZn4BRNk3j7LjhMhU4G77KUl/KL709rvlSXl7LEZRwADvWGUF1Py1V3SPZNWIZVIPvKY7Y6t6SVH2U4Zs1bTKHucAur+ncI+17VnKj6IXqPc9Xjlas7UFSa6dM8YoCt1aLF+tjMXPobdLPSzWVVjrrNsIlhLOatJGazCHfWBXQ4iLjWefui0jGUIfdb50G1m+a3o58WC9u+od0vFnuAvtiD97TjXX6PR/RE2VgPiRtQNg5jk8vCf8OrG/KPvJOJiEKUGD3OkhA0QvXAf+z0KGeNeIW6DDXbrthTXid3JreAKb6vvjOaXPzijy5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swf2N69/xg2BPKziwjf2/HhhIZx4Fdjr7psb1c2Xejg=;
 b=bglJlkGSyrTxhZ+3mtvLcnGdknuPqoNWo/ex3FvVU31EpQlWCXNLg4+fIf4M+ZkSWgjuQfSc9D8JpgvaUFcbLTx+P3L8KxUe2ORJWTIMeNXJVPnJ4hb6lUDY2Ndu47kPVb+ubnSgmyzJfVvxDcLCzsrJlbz/QBa7UL+hAvuXz8fyp3xHZaZjEYYmAHFDoiE/SkGXU8rq4CjT1RlEzkxbsVsTcHj5VcJ5GzMBVQIVyVQVuZxU+gmwbJoM8q3mjKeFQJq1BD1JjDaKSl4901HHin1TvIRh6TN+i6+hWeYWZSbZuo1rchCfuQ2Fogs68NNWyKa7koE/qPWr+c2sfK8tpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swf2N69/xg2BPKziwjf2/HhhIZx4Fdjr7psb1c2Xejg=;
 b=WBJhS+jg9RFF6EGRiCYyt9tO+M2j7N9mXf6raSyGdpatXj3Y1evZynY3tCY/cQ0Ai84QTalv1ono8g01cOxDw1D8Yz63D4VdJkAdnxiah6YG49jOjyXotDvE3ixFuNWkLrThXOp2OBST3crRgMmbEzlpiFvzdD1r67CkSQI6WU4=
Received: from CY5PR20CA0014.namprd20.prod.outlook.com (2603:10b6:930:3::29)
 by SA6PR12MB999199.namprd12.prod.outlook.com (2603:10b6:806:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 18 Jun
 2026 07:48:13 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::87) by CY5PR20CA0014.outlook.office365.com
 (2603:10b6:930:3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Thu,
 18 Jun 2026 07:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:48:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:06 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:48:05 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 3/3] usb: typec: tipd: name TPS_REG_POWER_STATUS field masks
Date: Thu, 18 Jun 2026 13:17:44 +0530
Message-ID: <20260618074745.629638-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
References: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA6PR12MB999199:EE_
X-MS-Office365-Filtering-Correlation-Id: af267079-a553-4fed-f92a-08decd0df2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	PbArJ/ykcfO+a8fLevOmbLqjShQajBEMAJYY+LropBztJbsn5smByFGARvdBBMl+JMdoS+kff0q/b7J1pdSKP0lxS4byg8eIBjHNxnBIWL1KzgSsOvUux6pTV385eQn4kCAbngUQGltnmSzWg4ebDr1q1QAany/MtGBmPFTGp3J5cuIVI8RU7leQfW71GFRyNg1mXt/EzMFgMtL5qDM8mV6onFUpIvLScPSgD99FPoGtUJfqtZXMdSRJA8F5SJLksmVhmDoSfbJBIO8mzjoIzXTr/PH1eg1lmcsdJ8o6H1ZG1lcocUX+vK1uPG14PR0nSzKEHnCg1xOnYHwUhlkieOLpFXcioU4adxYtP0PDwszgUiru1qu1UiULNlBZJwxf+iLXn3bNqNYaNj2cJhrCTRtikHfIuliHYCEKF+SFUt0iMIn57mu+Gdu62Z8uRVX3p4mn4kUI1XP/TufREbgz1B0o7hnlKUen09VKe/EKUPLGvQnwDvNewyIVHby4KpHyEZEioMefCoWH01/CBWeoai/GoVvlDW/81bU2Onixm1OqHLEeOOxkqGUYnpmMhUTMHgizjyLi7HuuP/ITt0dEOH5Hn7AxofEHxmW6TzpcQQa8ombqmFynHKD42qvHwaxAiGOWHHDWEVvs0263iGDmOjQD1f1E+20i5etzlRW9LDCQlmjT6Y9DiXrpNr9Dsycn7lYau8fYyiLLvg0DogIdzoP/dnUyks5wvcvBtmlkqPg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HGmOqEx0+d6CQ5rosWjPf/mB0XOlqCmL/1xj6kpmnTnJHtNwanbg5OQkeEHmAtZLC4C0A6Qe1iMRGYt/hl6/X0yPKvwootGBbXNcgkxWzikcwKxEz6aL2CHZd5VyuoQK0kJJ5M5Yn5S4ne32bBQQLKkEsLuxjYSRGvfWxUHRwNVTYcWuV7qoaAR7Mhoc8DYVX+XETam4YfXmXF1jJCGu1TZisy4LIR8BZndaWTle1kn+BGbYnhJEHClTQ1+lww1WJ1KjLjoAKLfP5UkBpT0coJngeIACztUR105EiKDfnsbP25EZxIYIEhF1S82BbcO9TLF9GvkiBUx+UqkqQFiYqQkkFVCkceXlTaB/HgJmQJU6dWFUpV69W2oq8QXL1YwGPkMXtaLEKZG1VyqkqTSLfun0SPSFLEs3cEi+tK8HVmVy84OHk/ZDLzO6qaT5fH/0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:48:12.6152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af267079-a553-4fed-f92a-08decd0df2e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999199

Define named masks for Power Status fields (connection and source/sink)
and reuse them consistently for both field extraction and value
construction. This avoids raw bit usage, keeps the definitions aligned.
No functional change.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- None.

Changes for v2:
- Add Heikki Krogerus Reviewed-by tag.
---
 drivers/usb/typec/tipd/tps6598x.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 03edbb77bbd6..d4140f4da5bb 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -142,9 +142,13 @@
 #define TPS_SYSTEM_POWER_STATE_S4	0x04
 #define TPS_SYSTEM_POWER_STATE_S5	0x05
 
-/* TPS_REG_POWER_STATUS bits */
-#define TPS_POWER_STATUS_CONNECTION(x)  TPS_FIELD_GET(BIT(0), (x))
-#define TPS_POWER_STATUS_SOURCESINK(x)	TPS_FIELD_GET(BIT(1), (x))
+/* TPS_REG_POWER_STATUS bits (masks shared by TPS_FIELD_GET accessors and FIELD_PREP) */
+#define TPS_POWER_STATUS_CONNECTION_MASK	BIT(0)
+#define TPS_POWER_STATUS_SOURCESINK_MASK	BIT(1)
+#define TPS_POWER_STATUS_CONNECTION(x) \
+	TPS_FIELD_GET(TPS_POWER_STATUS_CONNECTION_MASK, (x))
+#define TPS_POWER_STATUS_SOURCESINK(x) \
+	TPS_FIELD_GET(TPS_POWER_STATUS_SOURCESINK_MASK, (x))
 #define TPS_POWER_STATUS_BC12_DET(x)	TPS_FIELD_GET(BIT(2), (x))
 
 #define TPS_POWER_STATUS_TYPEC_CURRENT_MASK GENMASK(3, 2)
-- 
2.43.0

