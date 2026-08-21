Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468F4E3793;
	Fri, 21 Aug 2026 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329426; cv=fail; b=oNM6z4cBHJ9rOSA1eg1xuaKX+neEPd7mIQNIDOrSy/1rAL1I2OxenET4VJotuBTPl1Oj7XLT4unCd2PHHW1I1nJ8RSXopkmpOkDWk1ZlEMBkQo2sHkqcXvJr5VomH3Dj1jsujreAK5YQ3hV6MyamNdgR6rBg7t2Y4/j8Rf6dEhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329426; c=relaxed/simple;
	bh=I2CHTXAdhPgqYqHj9MHhlAHpvVTn9A7GZ234SP7ckQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iD6DY/HdU8+JFIWkNO4l+fmys6fPMA5EaiOYeQIecsVty0c9ckVC9GjxCHxFT7FgetnHEsTlc0MYl2cF/PT1Vpgz8HSPig3YOOnG/M273RYAEHg8MEQT7ZCyyvXvTCzaTq6lF/yQZPUUFWbSgE91KOZ3kTKbNMgSnLjYV1bUTVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lsl5tkCL; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lsl5tkCL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUyXJX/kr3MLscH71g4IfTttUXxmoXl9/Xneb1Ft1QfeQpcc9vcZ2rWuUhAF0LlIf7vn9uEZkReC5Dq6I//EbCkDiNzV03e9cjH/vL5yxLzafpvxlwL1tkp034k+WKotI7cfG/ZeXLMf2wiGFhDUb1E94UZEZUTNxbFvLD8lqf3rFGTAyG4qaqeWklVCUQb6wPOk9nalBxHYVH40oxDWfLnfcw7IMwFtMtXl9NJcqFMoRo4KYfYifAlEjnB3OUTT7MdZTTthlYKqu34RxRodCXlp0YfkXbhMEA16bhTaW8Op2yz/O33YV/qzDZ7y3N+oAaFEeiG6M22Q6NDxg0ANZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLv4gkUchbBPnSx/vd8Xv3gGrKa0K6lddwH3mvZHRWo=;
 b=tt5NU7ATOIPJ/7kK+N3tDaR9gAqzQzh7f3Yh1GlExAkJv4kd8Vqo8gBtYtEe2N9LCJDcwenRXuYegiOwkNEZ/RA2LpMZJybVTHALr9bpFy1kw91W2as+MUvq5iqwpsimgEgU/XQGWCGqAHcPiMgpAxGar3usyWmPu5r2SE8pG6fvLgQaFe7pJ+CFPyp1VfXyGZ+nyYKLOToAS4XYua8Vz5qhWWTv9nF+98uKnzt0/FWXahu+vMjw+q3IAMFDrR3HmKx7utWAAaYNzqqBCNN6hUb+IdyQKb99yjWn67i73iNhn8ikS8q987BPPABlDldUtXbJ7KKkE8JTYuW4urHWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLv4gkUchbBPnSx/vd8Xv3gGrKa0K6lddwH3mvZHRWo=;
 b=lsl5tkCLpPjK9+xBPzyBlOzpB5lLiTeR9M2KmMbTGUejsizqJA2+0yWf3jUH25Ng6BBiQzDDQaVoyr9f7ItoP8znI/rTaendXpUlBlavxKYk5ZO3h46SwL6KGrpXQEr6Tj1vizkYVNeFCNTdfxukrmMNypG28DS6usJxKeIl4rNP3b2D9MalEvsi/9xYEa4TLffrRWQb9WOQKMQbOevBAFpJL6796pNQ3NyOvwf2TwvE7+NMCJ7U7grOU2aRsyCLztJGve2GxxVt+3xCjgOy6tfhB44HGmuI08rIuUyUwDJsiraupliIFMIXQSGmor/SwDMjh3KnvYPAsX0ZSU5fvQ==
Received: from AS4P195CA0036.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::29)
 by AS4PR10MB5371.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 16:23:38 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::87) by AS4P195CA0036.outlook.office365.com
 (2603:10a6:20b:65a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:13 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:37 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:27 +0200
Subject: [PATCH 16/16] arm64: configs: enable usb and its dependencies used
 on stm32mp25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-16-c5e27cbc0795@foss.st.com>
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
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000196:EE_|AS4PR10MB5371:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b04264-eb5e-4ec3-95e8-08deffa08e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|7416014|23010399003|82310400026|30052699003|11063799006|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WG2AoKgN/8yMwxY3+RAoYeM4VDXoHzLEeZosK30fsjjRDYSjPjwIqPuGXPbA5x+lKEZhsZiLNbMg8th61va8PZ5JLbbovmn3AVyC0QK4QT353g7EieCQ/lumw2qFJAnLoYXHE00RPDvEbzwcbcafgenKWjJxgMcb7zf9764m7yk0shLgXjn547V5+GqVX4PTUiFlvNDzovUJsX6+9Ak9Y33F1VXZ9q52AQCv/sV1aJdZjtxN3OVp/Jyu7yinEWxDyWvbFY82FBT/rm7d+gBaACYxX6BGldRqNt7q42DkqMOPmqr5TtRjEuj1h8sAVwcM8nYk9UTVjZWaSREtEhmqswQHBO+9nGwlmLNGck2W06S8KoJsC4CCxBZ2nM55s8YluBkNdzaYf2TBApg2lsN+HOqLVtSQc/0FGcLLtDSWQ+j/ak1KnXhSdbvVm5X8MSygbssiIT+l/SF+AWXZSm+ZOYpUaDTvShObrlu7hmiseBWK8XxUNybTPltBpR/nvbI1FkPMaJPTCkcrAXUVbvNKL+p+DJY+Hiz08ltRcvLOihiuOPDHSrELK68EdUxHAX1aYgTMJ115BCp9M2n1MFxC4AmVtXDzZ3JH9m0UvhNz3pSAJGjIjLWGOcbmUm5Nkl9UA+LE6L+hjAInMo2wHCw+sjFACw8yN+QIvmJaBSumKj5qj+C9r0CZn84NYGhbK80EAIgZksiA1vJxtgkDv1lDUdL0s69buxRFyTfeINEjxgaNChvrDOUbJR+MNH4rwsjq
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(7416014)(23010399003)(82310400026)(30052699003)(11063799006)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B8jNc+p6Id/eMlxb2eai2jDcPEF6LA7wY94YJ7eyxH38PgX8KxDd8aorSugMCNvOU0JVUtrtGjSJvcgG8LrNIzH2cXLlHQtxwaAxi9R058T7YFuDO93m+DLxyeEIddooPY+6mG+UUIPnIvZBU9UOA3gBl7v9sE4jLTdnVKqsy+QJZmAUiMJCk8DGtTxbOJUzFntba1UeFgGpIy1Apn4qfZreB0MPDFfuwlp4qCrRCzVbRtgg3VX5SRoe3mMoDAqUpk1WVZFqM0uojg50PQaN5op4Z8C5N8DK4DhvyluLN7IT96OoXzanzsI0hnV4bm1v8ZVmXUwYlKKIwJayUthqPXgjObyAjjANH9TPFxE6ahi7W4EyI9oTFpS4eO7NP92kS+xZqngWxu4TzIB1s8WvZgsMRT/qkYV/GA5p5BzxIPfENQIHdsmkxrrV0MQCAYpZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:37.8099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b04264-eb5e-4ec3-95e8-08deffa08e3a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5371

Enable USB drivers used on stm32mp25 reference design boards.
In addition to the USB HighSpeed and SuperSpeed PHY drivers,
enable the USB Type-C related drivers used on those boards e.g. UCPD,
external TCPP i2c protection chip and FUSB340 SuperSpeed mux.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..b9aceadf31ad 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -633,6 +633,7 @@ CONFIG_I2C_RK3X=y
 CONFIG_I2C_RZV2M=m
 CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
+CONFIG_I2C_STM32F7=m
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
@@ -1251,6 +1252,7 @@ CONFIG_TYPEC_RT1711H=m
 CONFIG_TYPEC_MT6360=m
 CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
+CONFIG_TYPEC_UCPD_STM32=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
 CONFIG_UCSI_CCG=m
@@ -1258,6 +1260,7 @@ CONFIG_UCSI_PMIC_GLINK=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_TYPEC_MUX_FSA4480=m
+CONFIG_TYPEC_MUX_FUSB340=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
 CONFIG_TYPEC_MUX_IT5205=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
@@ -1795,6 +1798,8 @@ CONFIG_PHY_ROCKCHIP_USBDP=m
 CONFIG_PHY_SAMSUNG_UFS=y
 CONFIG_PHY_UNIPHIER_USB2=y
 CONFIG_PHY_UNIPHIER_USB3=y
+CONFIG_PHY_STM32_COMBOPHY=m
+CONFIG_PHY_STM32_USB2PHY=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_PHY_AM654_SERDES=m
 CONFIG_PHY_J721E_WIZ=m
@@ -1831,6 +1836,7 @@ CONFIG_NVMEM_ROCKCHIP_EFUSE=y
 CONFIG_NVMEM_ROCKCHIP_OTP=y
 CONFIG_NVMEM_SNVS_LPGPR=y
 CONFIG_NVMEM_SPMI_SDAM=m
+CONFIG_NVMEM_STM32_ROMEM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_UNIPHIER_EFUSE=y
 CONFIG_NVMEM_ZYNQMP=m

-- 
2.43.0

