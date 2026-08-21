Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740142B75A;
	Fri, 21 Aug 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329412; cv=fail; b=q4KaG/vRffTXt8Tx4TAxBYhz9pTI+it4FxMzaHtjTyg2Dv1CuhbpUKdF5RRUXFYM/3TrLZ4JuDkMDsPXD8jKhnFFEjQJkrr81bfEOrsJXofx988oG+1X4VTI8ux4wHXCkpOjy7oSzp7O9UMJwarxTQWYI5B1nZXHpYPyVSSC/Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329412; c=relaxed/simple;
	bh=7ATsNDubSp2CpR+gXkYIatjmZjzVvROOrAmOvkU1KWo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cK5YnGLf5Ps9nIaTDVsOU8nfUMrfKvoIEihIHaNVqoaztQkVWMta2fG2PGB0yH9V2Ph6hbAb6Ng4ouTc0Gf3F7B/lq1RQ+sxxdmCjn0p4a9UpJPVCFHKyF/IhjtjWGPZTI400JwE8yIhmOgygO11XruoiHfzd5j4RtOKw8v00Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QuXc1kfp; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QuXc1kfp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pb8Bea9+CMJdcpKgLKCmNgXPWbJprq3eX2uUtFzHPzQFuzueuZ2AKM1xQqDXnlu2RUapetns+Xfc/HXGue2TGRbPjf4s8Ilt114UjgtHmmyKOMr3MWdRLIElnUMsDiWRPrAVcfnFHOcx9Q2cWRe+tw4vzshSF7jQ2Xh/9jriLdRgNjPGN/RFboxhuknY2+fBN7s2TCqUmEmEWYnxIcMdKX17TjDykwHtIMBo4o0RyIELa4CgM+M94PWjteb7Ur+c9Skac6AcuT64+XhtmTjlAF2B1Vtc2uZyTLXfBjOvvewyHZ5n9GXkwm4pzfvajp6DH95S5dASSeicqmbQZbpU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDQtmdBzMLSyGjq+1y+jmsODvFOZl9MJgWzBTtKwH1Q=;
 b=rPajR7UGWioTSezAwfKimgy4Q6LM6FctMMTM3ZY66aMMv/5sfVn9dJvSV4djYjmO+9q1EooUhbHK7W7/UOlpRTEb4Y4E9mgygsAo12Quhu0cjhSDTwUhwcCrU9kPl7fJjeZH9Ro9Sn+kuUzHVzjh9tZGLzuUiLPAgTd+kU+PUadsq3Ge3n2sH7xdD2HIAC1QpzKr5NyYIklD44DaIviYs+/HQUDqw+gn4geg9jtkkE9DD9tX6DO8hgDoOwuhkgm3vh8EWO4FRI8ZIp/0bM3s69g93hOp4Qs2vpdr/B6fHTFHxpecpYdeM+i+xvLaIatQQE7LnV/8h7yiDodkgf8vpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDQtmdBzMLSyGjq+1y+jmsODvFOZl9MJgWzBTtKwH1Q=;
 b=QuXc1kfp7jtcHHWxyjkHwBURjedwGnJUCwWB5D83gLoDvsnQ+qShW92h8LwIhqMIJ9TWpHYwCS3SXyDI911kod+mQF5SNV1/bQLY8MRgzcHMSx6ytYDlndDRNSV3xF236BnDlNZQWHQvinm2gHMwhOXi4onr/zLmalYguFBKAMD3LnFlYbADf24UHQFvRLPZBnvnV9fbsY1AvmJFHTKcjNvKP2VcRq+PAFqVweoYXjpQ7WR1UxlwiO4oLaUPO0ygeDgOVkhro28JcycO8SqSoBv0X62VjKH51eimS3RDWm/mWkee2kw2K1uEfZHyAua0e3BO+pBYg/Ha7+0J9eWaPA==
Received: from DU7PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::12) by AS8PR10MB6338.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:53e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 16:23:26 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::6f) by DU7PR01CA0039.outlook.office365.com
 (2603:10a6:10:50e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:25 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:24 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH 00/16] Add support for USB Type-C on STM32MP25
Date: Fri, 21 Aug 2026 18:23:11 +0200
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHB7iGoC/y2NQQ6CMBAAv0L27CZLi0j8ivFAy1bWA2C3JSaEv
 1uV4ySTmQ2Uo7DCtdog8ioq81SgPlXgx356MMpQGAyZljpTY/bLgOOsCUNWZxvC9YIGY/DY2Ta
 Q6z2dGwslsEQO8v7Fb/c/a3ZP9ulbPIzIr1yu6dD2/QPQ8eLWkwAAAA==
X-Change-ID: 20260821-ucpd-host-fusb340-v7-2-rfc-836f0bac0543
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|AS8PR10MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a9cbb5-cd30-44c1-2c69-08deffa0870b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|7416014|376014|10067099003|56012099006|18002099003|11063799006|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	U/mykmKR8dE5bIfkSv47dHsp2xIZXJJBZ36ZtjNtK+ieH+Cp55UzqGGkww9M1FINWr/IJgeef1VGa8r0f2OIO6KEi63FtdwvxjsU/6daarJLhpQ5vBMj3YqzfDmq7po1UyBdtzd2roYlGVnSI00anmmM/YYea4ufMZOcZKDHZdHGlvQgo8vKvjNfC2dXH9dmq3aofHJP03i61r+ilJapzvBYHURM2Ghf2YUva5HM48t9mx27PgtE7umGzDV/bkXHyx2te9zDQL+Abl1Nr2K1RcgLEJlmsqa92skUZhNA6xKJU8geP4bEnyHtwtWcLiI2aw074+MwQggU5RjI3b5KnA7yXqH1ZTo4nfvCvzzWeXA4swbqQTwyHdG+RQUjcME6dYI3+O9Rh0dxDxPZZGJiBvnzKIf4pud+kJXva9wQevtoxuM3nimx9WaRDAB3b5oANqnOElmkFn6cDjPwaSjU6cFPtXIwj+fEg1y3feQMXnscoO0GnTyCp8LrHdpIWaWAC36Gv9+27zewQ+V6wIgVzev49D/pMZis3x33QjQ3OkL+aZ1aD4jl5dy+jjrbOpgTlCwlxyjBPBMaeaSV/GjCw9GdcLNwfGQjcFsnIj6eKjwEGz5n7OdlU9pIPw9Q4JOIIyq+jgw836r9pXlbvyZDMkEtT1Mf6Q9+piyNono0EW2cziHCRwkS+sd+op2MKv+YsfBzY/O9OIJeqI5BC+gSuwVpn8z/vTqGa7Eb/lzrtNbObp72NYPshPqZ9W7TD/IG
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ILsEs1HXKQUzNlqfqOCQpmiA3K5DOvi501x2rXuvI4oN1E49ThhYZo8kDnBEJtDSAIbFMni1REFCzFEpNRN1lbfHqL7GFeA4QU1erizN/5VCmFSr0+cmHUu4/bmoDuEZ1zB9kxj1e501RxVy+8Lo3hqNnroLoM4+6Nid9K8KLlHpnmEtwaW99E1pBEWmwisfYF5jCKf/iLm74+H/34yU9O946syMvOD4UnMMMTr2r981fEbJ0Pibsz1uQdPwD4FcMcV7CGheeYbKT1oYJikob1iQEUz/ZzUZUnoFlyKyha4vb1jgKk9QQ6IYseSopBLsQcA1bGNeTk5hh/2CZKvTw7o/J5UOhBJUXkxG9GnPHc6s1wAyoSCOecCtL6HPPxvldsUTgcSG685namgBM7CczW4w9/C2wEwWguhLtGSZaTDp91mWt3zVM6MpS9RLaofP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:25.7501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a9cbb5-cd30-44c1-2c69-08deffa0870b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6338

Add support for the UCPD controller found in STM32MP23 and STM32MP25 platforms.
It is tigtly coupled with external TCPP02/03 I2C companion chip to interface
and to protect UCB-C DRP port.

Purpose is to propose a complete set of drivers and bindings to enable USB
Type-C support on STM32MP25 reference design boards, EVAL and DK, compared
to alternate UCPD series [1].

This is an on-going work on top of over series [2] and [3].

[1] https://lore.kernel.org/all/20260819163410.119755-1-marex@nabladev.com/
[2] https://lore.kernel.org/linux-phy/20260816213849.1044073-1-marex@nabladev.com/
[3] https://lore.kernel.org/linux-usb/20260817163101.6203-1-fabrice.gasnier@foss.st.com/

---
Christian Bruel (6):
      dt-bindings: usb: st,tcpp: Document TCPP USB-C PD protection chip
      usb: typec: tcpm: Add STM32 tcpp driver
      dt-bindings: usb: st,stm32-ucpd: Document STM32 UCPD controller
      usb: typec: tcpm: Add STM32 UCPD driver
      arm64: dts: st: add i2c1 pinctrl entries for stm32mp25
      arm64: dts: st: add tcpp pinctrl entries for stm32mp25

Fabrice Gasnier (10):
      dt-bindings: usb: add FUSB340 switch binding
      usb: typec: add FUSB340 SuperSpeed switch driver
      dt-bindings: nvmem: st,stm32-romem: align patternProperties regex on nvmem-deprecated-cells.yaml
      arm64: dts: st: Add ucpd node on stm32mp251
      dt-bindings: usb: dwc3: stm32: refer to dwc3-common
      dt-bindings: phy: stm32: adapt usb2phy as syscon child on stm32mp25
      dt-bindings: arm: stm32mp2: allow child nodes since simple-mfd transition
      arm64: dts: st: enable usb on stm32mp257f-ev1
      arm64: dts: st: enable usb on stm32mp257f-dk
      arm64: configs: enable usb and its dependencies used on stm32mp25

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  10 +
 .../devicetree/bindings/nvmem/st,stm32-romem.yaml  |   2 +-
 .../devicetree/bindings/phy/st,stm32-usb2phy.yaml  |  20 +-
 .../devicetree/bindings/usb/onnn,fusb340.yaml      |  73 ++
 .../devicetree/bindings/usb/st,stm32-ucpd.yaml     | 134 ++++
 .../devicetree/bindings/usb/st,stm32mp25-dwc3.yaml |   3 +
 Documentation/devicetree/bindings/usb/st,tcpp.yaml |  63 ++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  27 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  51 ++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          | 111 +++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  79 ++
 arch/arm64/configs/defconfig                       |   6 +
 drivers/usb/typec/mux/Kconfig                      |   8 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/fusb340.c                    | 169 +++++
 drivers/usb/typec/tcpm/Kconfig                     |  22 +
 drivers/usb/typec/tcpm/Makefile                    |   2 +
 drivers/usb/typec/tcpm/st_tcpp.c                   | 418 +++++++++++
 drivers/usb/typec/tcpm/st_tcpp.h                   |  21 +
 drivers/usb/typec/tcpm/stm32_ucpd.c                | 818 +++++++++++++++++++++
 20 files changed, 2024 insertions(+), 14 deletions(-)
---
base-commit: a8eb98861eefbab7fc254c8014712471448b295c
change-id: 20260821-ucpd-host-fusb340-v7-2-rfc-836f0bac0543

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

