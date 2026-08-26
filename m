Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21C3D6CC1;
	Wed, 26 Aug 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738009; cv=fail; b=blpkMUWhaLhdloLJgKXG6kyxXyy0ymfRrEnNPk5NDYW03C8YtSP6+64BzWihhugq7cYPJI81gU9ZWkH48zraUhf0OgVOUjB5Ni26GE7MMusJWaecNRvaMglO4cO2kpQz5u6l85FUzuZIld6ZvYN4ONiFvV/NzxvmFPEvuUn0BJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738009; c=relaxed/simple;
	bh=sbB/kkHNW5GtZXKUjdgbQkGlGPgOWSnyVx33KtTxN9U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=MyDmtBNgapPy5W1I383QwnNjmfaxHGLe6Z7rvOcTDib5nQMW/N482bOuJs/n7IRb5LkUuML8CaW0B6rMO/gsjZWRBzNBT7H1vRq7wXmoVskcsPlIGXgmvE6vPQnzoGJv3TGLBf95tkMbZDTi2rP2wW1CFMKdIxB+peoI9OPiJZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BGt30pQJ; arc=fail smtp.client-ip=40.107.159.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BGt30pQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtbgrrLfdUP1Yz90dhE6OAMPvGI5+Z0PHTcHzRtZg0mSa+AS5i7C59Ifr7p7A5E8r9wZiM7afp8LWUJ/wiGbwhrrTcn1bpMd2aGNyZ3+SnILB6CvRV3Xe82F5lBCeYik4MHp3lYdlLXjG8mwZswhfJECBlu1ktnI4bfmHr5inb3T73+rwklb5rwLHYSu++br1I4U5JkA799Jnk3jo5SiWtaQcumsCM6SDUaC4KaXcxMtnKLzjIvFrHoAmtjHOvjeb9Kj5kiMT2glhfSDSwKx5scuLxiu0WTeHhxXbAHmZbSpQmH2d+TjFiyZT/WT+855D7szc+59csUBjrposLpfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWlca3bYbnY/+/1JVOW3emc8SYrPWW7Ltrgqb5K/DS0=;
 b=V00QzNou6U5d86kouE7wSic7g136H+qLjiWulqtSBQkxAtZHYbEP2VwJF9GfXCAeLeA+JC2FOZCdYC+DVxGPKVuVe80K3AsMDG3IHEN+iLqZK4OqDdy3WatPGC7ACAtMcMIBfAbc9Eg+7Gj0P0Cj1aTjsYdHazL+WDAMunPMvwK06xGlqg4fwKKYO92/N/l9uIR8Q8UNcn9m8vtbyOkfdVRO5g9RJqM6lO7ZGUEJJh02h3VW4MaIo20gEWr8Ar8fsF+w2YsHbllMCXHPgCauqWQXJUzTTcvCsEJSnC95UwEJGLiYlr8cZJ7Q/Fj7ad1ehYkbFqwNNZdgSpAb/fTFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWlca3bYbnY/+/1JVOW3emc8SYrPWW7Ltrgqb5K/DS0=;
 b=BGt30pQJ0fzU9m8aqdD4qPBDndkGHf5IPdseZLdg0KTuZ/5CGdwg+CVxrqLvWk0lSkRTvhgJjUF04vvkH0J9yxeNuIYOddws/X9VJ09fXwSaA1oq2sZXfKuAb83O5nuX108w1KjRkk7bTC+zWifLgm21VDU85caBCm0tXi2eanTuKf4+/QcuDpxTt7ZNH48lExi/iYd2uYriTCmAt8jZcxYNYugQ8ghnBpUEZ9rTJ8f6D9La6MZPq1U2PraI62YtAKAM7KfwEbm16JrLv9N323eeA58bNh/mcwwRYv1q9WCxJ1KLbuWTcP6qr5K8uCKCIbxnJHnqd0BfXS2WnFiNIg==
Received: from DU7P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::13)
 by FRWPR10MB9280.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:178::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 09:53:22 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::67) by DU7P189CA0022.outlook.office365.com
 (2603:10a6:10:552::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.9 via Frontend Transport; Wed, 26
 Aug 2026 09:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 26 Aug 2026 09:53:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 11:58:41 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 11:53:21 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 0/2] usb: gpio-sbu-mux: add FUSB340 and enable option
 for orientation
Date: Wed, 26 Aug 2026 11:53:12 +0200
Message-ID: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIm3jmoC/3WNQQqDMBBFryKzbmQSNdWueo/iwsSkplBTMhpaJ
 HdvtOvC8OHB/282IBOcIbgUGwQTHTk/ZxCnAvQ0zHfD3JgZBAqJrWjYSorZHFWNLHJmUeLQ2LY
 eKw159ArGuvchvPU/plU9jF52y96YHC0+fI6Pke+9v/J8yATvOD93CqXkV+uJSlpK7Z/Qp5S+X
 JeGUcAAAAA=
X-Change-ID: 20260825-usb-fusb340-v1-f060a5f84d3c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley
	<conor.dooley@microchip.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|FRWPR10MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7aada1-2125-4e43-026c-08df0357ddb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NKMCm7u+ngEkTFKGRBtWkAgh9PaN0oFPcR2behA4WP6YjxgTBxUiyz1nv4pLc/zJKqAqNCIxvgfiJ9wlEzxvKCeesuoT1k0baIv1rvwoRdOU0LVgopDZaGvbviuHnSXseIAPTZxlh5+7KOYjcOsXOqPJIzV9fAQLpk/TrnhOj4mR6lidzz3sGeYGU6cA99Fp3ZqDTKNHWVWJJD/k9bsqTcmX8x76TQga68hn5fVpgYEoVT1QJsIe5V0qQazaG2CsQXzBbtPVbsq5IJVwMKMBihTOT/8yHFOLv8VCee/obBfAw0ZefWgG+SXIAZ7mseWU7T+mQ4KHQgPiDM8uOyXKSKwKe3rAtXKVVPr3WGooT1cwCaoZQi9eCMe2lw8wbuwnIUMClapBYTY7BjF9yeRm3RQA+TOE//U19RzlWhZa7tq80XVmXjSSS7eynewTrMCmHHfQPStTUg/plGUTH/emvPJr5kwzrS3ZhcClQ44BxsrxamHZp6UdTq/s3bWjvxzQ1j/ySuaVjbWDLFDEaCH+poF6OppKgZnn+Zhp8326kCWVnot9qQbwbfqDDhp4TRCOWC/twJ592WAZD5wnGtyaMqF76qTeLlnMyhJ+SwXTXM6mJ9JRhmRDJ7+8KMSh64iUQeT2iI6bPnr6rBRUfZ/pvQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q0aqYRf89toXScfKvrI4ZZa/zDty16nqJ1FQB+FPoatIAJ5fxMs1E6UMLLY91QokZFO5FwhTTf+mO5MqwvcTWFRNBHsE9ML+HfkSqnyevuuxAdyGeRUnoStMH2A8rsxstIPsCV5CXzASmbED51wQL29XrEuQ06ePrvkd5BcgF2Hcly7ERUfQStz/A8h0sFlfad7pbu46CF7+ULHWF6Y8cEcaBjRBuVl9b89LQyUoLZ2glDABm7tjjJNd6GgFgf39egBKqLdK24V0+K616WEV0Rp1t9UxzKVorOQmDEYOkIkVOzp/nGrf0j5TYd1DZzgYJvjZ4wh4TZpv36lEbvWWni5GMFPjkXBlafP4gVYOuM4zAYgSEFVaQKS9caQKrZIeAoxuaw0fmzCI/86AXLZi4UUsm7teHFT1GcKd1Dn+wQdoSy6LirL0CghPWqSmJfFW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:53:22.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7aada1-2125-4e43-026c-08df0357ddb1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9280

Add a new compatible for FUSB340. Also mange the enable GPIO, when used as
orientation-switch only.
It is used on STM32MP25 DK boards, as orientation-switch only for
USB SuperSpeed lines on the Type-C connector, the enable GPIO being
connected to the SoC.

- - - - SoC - - - - - - - - - - board - - - - -
                        |                 USB-C
+------+  +----------+  |                   +-+
|      |--|  USB2PHY |<-----------------HS->|*|
|      |--|    HS    |<-----------------HS->|*|
|      |  +----------+  |                   | |
|      |                |    ________       | |
+ dwc3 |  +----------+  |   /        |<-SS->|*|
|      |  |          |<--->/         |<-SS->|*|
|      |--| ComboPHY |<--->  FUSB340 |      | |
|      |  |    SS    |  |  \  __     |<-SS->|*|
+------+  +----------+  |   \_en__sw_|<-SS->|*|
                        |     ^   ^         | |
          +----------+  |     |   |         ...
          [   GPIO   ]--------+   |
          [   GPIO   ]------------+
          +----------+  |
- - - - - - - - - - - - - - - - - - - - - - --

This is a subset of STM32MP25 Type-C support [1].

[1] https://lore.kernel.org/all/20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com/

---
Changes in v2:
- Added Conor's Acked-by
- Fix new driver issues introduced in v1 as reported by Sashiko, on
  a possible race during probe and a possible glitch upon enable.
- Link to v1: https://patch.msgid.link/20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fabrice Gasnier (2):
      dt-bindings: usb: gpio-sbu-mux: Add compatible for FUSB340
      usb: typec: mux: gpio-sbu: enable when only used for orientation

 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml |  1 +
 drivers/usb/typec/mux/gpio-sbu-mux.c                    | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260825-usb-fusb340-v1-f060a5f84d3c

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

