Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11553D47B3;
	Tue, 25 Aug 2026 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662774; cv=fail; b=FhL4MPWDjmRZQBcoOquhkd2SCZVtA55FUazBK2uj7n+256aQb1Bkyg8VghUNyjQwqlX5vLrPV0/r58SySszMR87Iwy6KYgVhr1zaNws5aGRXwKwRDb6+MCTa0pXI2Kfa9dDV+4rga6GEhkfj5gjH5qkIUDEONNKStEyDJouNGBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662774; c=relaxed/simple;
	bh=Jy0ytjAQ2Obc7cuOMaqoLc6V1FfLKx2h0M6dt2lawTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i1cRSu2loGukIDbwRRz5cYulQ6mjg/lPhygd5viv0zjOoCHpsh/q8H1ovbIu0dwDxEpeF2+8mtwfgoPzMPfF1yfbH/SSlnSDbNItrT3nkCWSqu+dZtT+JARX0ZWQ3JjZwA8NOSRmBjF63j6pr9aA+pf0OdX1MqlNJn5kGE/t6q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CCiEKQ/3; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CCiEKQ/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA4893w0IuOsQUrcwL71QZmnFegs3utyJwY+eDECKZg59N+gowy+SL3oFyOFovsc3MQ5aJkzVuQ9TLYLufSmxa2m1r+cH5pTBfhFUvrCbxPwdfBj1MWBXEZzRVTfOEIYchiaIBanCnZYougGi3UQ65e9ife2ujqf7aTxyhbTwkSGR0XYQhpIL4Cs9waXOQfUXJkAZ/RgL7hScbKunYsDw/j/hXLyPe7C/RrEL5+cfYwMnDdOtoBO6916R/wieqJfGq1f02/836y8+EUxsD5SEkzBxYJU+WCtyvlnbKuFryBfYlaLeK2pbPksWEBb57TRk2Tg4ni0XIt8uUyM+OAVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijhTo2BDKPqbCL7RAQ2C8XhzIChtfkjGHv6eq3z7+Ds=;
 b=T8mSTQkDUezlTQ+IvSA/lC/ax496g/qc+moo1Ap+wm9DOH/ICiCcTxPJCV6JKhY5moWShUP/Foersm5wJZjfM/L3Cx23BlPI2yfBDUCfIU0/0U73J9HeHO+irNVT1bpw2DL+3zrewXmuk1cQIqZYQ7YmM7KQP5Fj5ibol1GDiSUNF9dMEBk/F566vnoBG7wBkwBEst7KkUom2R2y6h7QTTEU93s5AX9KdELiynVHO3Dh03K0ujIwlfcwAM/rUDJrhMrKn19URY1SlKJ+l+VJ2aD/juNKHjDIywIZ9oFGlM2ajBGWbWx+qvxKQBkuvOSww7Upq9BxcLJy/Y98fQLQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijhTo2BDKPqbCL7RAQ2C8XhzIChtfkjGHv6eq3z7+Ds=;
 b=CCiEKQ/3PkTZi+QzxcjRO+lz6p9tvOXe//iirggQutjeAdWrJvv4yvXVj8C/5JNLz43JhGD2BG6k08A0Jg0Ol7qa4DN113GIJmeKTI/8UBzmZjOYzBeTKXQsx7b6ckfK9dfwaC6Eej5LHEVJazdlDJson45I3hR5/m1Mbe2JWSJp2KUl0rnvmXr5Xv5KZMa94jzAx5vcByiT+9JwNuLb3cJvx2+oZx1vpanUfh9rhj0q8IfqY6rt8VhYLXmTuwFZf6FiwISROqH6l1ODv+ehIcWEm+0xfgvT0oSiCH+91Gaf0wka/cb27DlJO/TCRvz/sT5+26c8RqkaG9wOCh1+9A==
Received: from AM8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::21)
 by PAVPR10MB7092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:316::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 12:59:29 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::89) by AM8P191CA0016.outlook.office365.com
 (2603:10a6:20b:21a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 12:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 12:59:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 15:05:22 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 14:59:28 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue, 25 Aug 2026 14:54:23 +0200
Subject: [PATCH 1/2] dt-bindings: usb: gpio-sbu-mux: Add compatible for
 FUSB340
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260825-usb-fusb340-v1-v1-1-2191179b0661@foss.st.com>
References: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
In-Reply-To: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|PAVPR10MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 746ccf4d-5947-40e5-cd9e-08df02a8b308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EltSc6V8L69BAmKk3nUwLipgSTGg2Crh0qkQba0n+uflXZAHcXTn/uoqPx+WkJk5d35jciDY2y1EYXxgie7v7TUbVczo/J9h8hS9POW0Xh0vNsHRQKEuwdaDQUir5GMd3AuQ+QWVZdqRw235v7GN54j925a9S9dldw30vbmb4FaHRQgsSTK2dUWmyFRobgy/5m17h/UnJE6/2dI8XUBMY97ci33Ljoq29Vtrz/QC1SL2xjb0/g1KY3f0kxfG0DCIA+wTwoWe2vtuqbUo7Mga/PMNgIy0JRHQHpgLXXwt12zvvomXstXhcmI3aAp+PID7R0ENnLMwsNSbANsClJo9ymN78IgH5W4fbbeh1VogPOvIJy4WSiIFvdbjN70qMJRcq/TQGv6zre5e1VkbCoXh9j+z2Cgmd+ruIueSvjNm+fjq0dOXVaRnuBSrQ9DpRzGAvF0rV3amMD8XH00U+bDacsgEMqQwV/0JPi/RgKw30DwRooszvsuokcGFhR4LF7ESw6LNUPk+eMK69igBHdL1JRzrQlP+3RNxDyX2c4HLlaOGkLfnno2cDv7jUd1HZ/DsLlgjvml/ZvkJiawyDNaUtkzBqbhXRa+3xevPoQeItTyTinjXVfmXoiXrb031paJO2/XBt1BaQGLHdm2CTrK364RhF6UR8xB02G3tQnvNXJJf2GHe8zjLuPeWVjPiPgI3TUsM31zOnAnzLBNKR7Lbaw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hfMHoin7Pl2eEYW3omMn5o/yA+X1mRH1DE1IJAxL+HSoNl+oBPNKUBcw/5baGDWpXQpPEwD7J2m6RUgZ2FYKO26aXi+Q308pndbEu0NjNbluLJJl7HIV5xvBtg1UB5Vt69OXNEcjmRrMIgLm73jm3qmHHKGQkS5uuTt8Ce9RBW+y7alC/qaBS/eQvrjwYg5sXDnKtnOYwdlMKmHbh/CA/p2FUqn1BSgw5D9F9wq9MXLGOr6cV3IBcxYWxp0k/Z3iMhLFavjXqZNnta4rNu/N/eBo0NSj1+lUmsP6YBtWSFbC3WYq9KzuvysaL39C5egMxamefd/bAO425mS9y8kmFgMOQYWomLErTDBqxPHWS5SOuO7sRqW0i1mPho0nS1P1yRK3JaMRPo1yLbdOxkidVDlY7qkeL8eXe/04doXaOMi7ZRbs7us4lC3eXyamD+Hr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:59:29.0448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746ccf4d-5947-40e5-cd9e-08df02a8b308
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7092

Add a compatible for the FUSB340 GPIO-based 2:1 SuperSpeed switch
with enable-gpios and select-gpios controls. The switch can be used
in Type-C applications where a reversible cable requires a switch.

Suggested-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index 793662f6f3bf..c0e60848d8ab 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -22,6 +22,7 @@ properties:
           - nxp,cbdtu02043
           - onnn,fsusb42
           - onnn,fsusb43l10x
+          - onnn,fusb340
           - pericom,pi3usb102
           - ti,tmuxhs4212
       - const: gpio-sbu-mux

-- 
2.43.0

