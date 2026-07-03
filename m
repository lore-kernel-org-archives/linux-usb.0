Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3A3812FB;
	Fri,  3 Jul 2026 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783060179; cv=fail; b=tWT2FyFt8fyDucj0yQbOVcJL3vXQ/YsKosN9XM9X50uh+BQ1kbiNRsSEa+Z6sfSTQgAR21Th7sI8sZK+lkAXVHsxgJBPr/7hMQJJutuCHqU96nCxcMaA2tDR7IC3Wyx9dC+zmzy/a4FyQcI/Mq9ZNY3McxrAWeVpS5xl2GEWmN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783060179; c=relaxed/simple;
	bh=AbOkRV9U9+fGD0bClkAdm/Ioaritktl4MV/P58a0CDU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YOj2dEjC2ToMjKxN8rIBFX7bWJsrW10V4ySIMJIgggdjJmfz3j9FZM8EXJZndgZY+DLsLLxml/Ps7DP2kBp7dGbZC2Gc+rClfypW8XmEPf27JKdu49Lpk5vwn7mTCVbkVUFm+BY9LlEw/vRsdO4j5EOo1EV8YWJWvKby9xpKDHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xjAygFdJ; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xjAygFdJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peH0WsKxs0x240vXukCyf28eJ/q1tTwlW8KZDMJhzwSYtNcnntxFdNRpuG7JFyiOrjl4BSoJUkAUTM4lj2g781jzvrK+W8eaQFLtsDhB7FZ1nVxQsh7ngaKitZ9dtulZat9yvFU4oLO6RqSuDOo/fzkO6HNxkLOM/6xUVDWcZzl6W/cYBruWJt0fGpoMRspdlL+AGCATHVPGDvpGPGzogCsLzQrmEa8OqhNRNeuAOHaTskbUdvh4jamGVdOLawchusECtDf3+qlOiARysEB3QOAHF63sQuXc9KlHDAuPlobOQoRWNCdcORJxOo0vu3ZfSGX8dbLGgVF/UbIdlqfTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6so6YCJe2b506RFXzzAzvkX3sfeo+S9jkF21qyUbD4=;
 b=jIOE7Ccf34QFQQG2cA79tl1U38sgbdiecV0llieUx7+8sau18hsw3nQfsDNm7BFaJafEEtd2KWOcpWFu92NL+cGKXXMpTvZy9CLsJa0NucctefC6gj6ftgPZSdLag1kQZl98DzCTSOeGU0a6ltj0EHWJs2imMsfKvw9PNTLAgMfqS8iSH72jHxqfg3v8r2iAdUEg0tlUJhI6WQB+UEBqfUQjh/4zmfzYHTyBzFkDivFmVlY8l2laiHVlAMoI3gqvgAr7/MPhu/a6KMDlqwgML+9+BRTo0Ze++Vvb1PF7ZuRtxZPWMJe99JgFObaIa8fznQyd6rReljyWeW5WtzXNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6so6YCJe2b506RFXzzAzvkX3sfeo+S9jkF21qyUbD4=;
 b=xjAygFdJ07hEaW81QmTnrknvZ1p5OM+6z2lXj6WR7GIjeRJcidY5dxY0jgoZbVYi96lvqZgR4MoSx5Bz8svZQf/JdN36t1Oytwkn6rU51oscHw7s+JD4Rl2HdNuvcj7YbB1ikURoeaQHsnseJjP1pm5D8Sw237dRa34ycaSpdtAsOiHyFnmZe4PnDRqGRSgIE9CuzV10FcZD6ViQiObp0j+K/zWguZHEcerFKwCh5PeWnodCtCBzpdksBljip01RziCH5tmoqhkW0oBIchO0nqVNconXLEdPJ5GY2QvW4+Ps3HNRS8fUX8z0KKxqJCPPnCKukYDKYdG890vXlHPNzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI1PR04MB10075.eurprd04.prod.outlook.com (2603:10a6:800:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 06:29:33 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 06:29:33 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
Date: Fri,  3 Jul 2026 14:32:47 +0800
Message-Id: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI1PR04MB10075:EE_
X-MS-Office365-Filtering-Correlation-Id: 79880547-bf13-4924-6dab-08ded8cc721d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jbCbU4VuQFK2aLxQ6C3N5P/aRTsDRQLWHwyaxkop2KcUW28RwZBd1pueo7qpAWIMepo238EVmi8wwTJ0kg1I2IMecqlFaUGfixd2ia7ueVahgDC8bUgBwayqE5tfaqy2WnAbb/FYhEfYAejARLs3G6HomMG+D9Zy6GLOPGmu9PS29ZSCE0UdhZvI2P+gLiHR69P+2eaWGYr5hML5tnBe5woIiD1XVJSl2RcVoQEVZSFh80RplelJxtKQoTPrG/wmiQA0jYyBeOpJDQOL8cZuEdksLEyDCuccWozpEopUQFoQeUhAG/1cx8vdZuNf1HxXDiQVZsQOW4hr/zD8oytDM/vgiXFKSi1K1dXrBpxCHUNOMTPVsyldgYzFDBnNxMfgItqRK386eVWTo8Y4qDgrON7Ul4v00kRqmQwOvMF+0D63BAK0k3GdrchooFSC6mlwQrCfm3sefUZTCEX4HJMuSxxWzdp/ozdhO7fyI6rEJBZMorkeWnDNCTxO7mCJIzlmSJQOJqYqGwnx8uQkcAxU3K44CGqwF+oGypImFJgacUPliJtBcgHIkhn/HAXYvwSXZsM2eHh8ZArzlSWOXYn59qMdACeu93LExULFgrrnxvNGA7gBWoeUxd8GmGo9Y8qxKVxOBQRGin+OOHzKAlr+dIDj7YUFNugNDrEETWd2BYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pOHDRDYEEGwNVPzkHH0So5iGoL6u1k4JOSWpzr0zxST6h0uwpgEhEXhwrDxv?=
 =?us-ascii?Q?s1mf0QfVz+igsUtVyUmowGZSFGHXyny2xomh2G7iM1bU65CmOJX53pkrwYak?=
 =?us-ascii?Q?oL4nICkOqAg1b/J8+Y/Bt1SjNHQgDSsEexRwNi/gAAXrrSkNlPEZGDGG8N/W?=
 =?us-ascii?Q?tfmFRPKypIzuu4SqkjLxl61Gsib0Jf2Lr9+41ElUwvIQtrZZHDTDp5SmbFy5?=
 =?us-ascii?Q?LegeCX8JWKWsLmLq0rekHTfsnrFYabb2a9SWbgyL7pflDV8mwSHVJVK2Ufg3?=
 =?us-ascii?Q?1X8RRCztEHHczQGurTq8Qel8ip7K8KTI+mH+MEy34y4+wPPBShvtCOKRtVJb?=
 =?us-ascii?Q?C2y6yA8tuDpn+rOpeDMFAi9+2QAZKzTY78rjVMt1x3UH0lIFkF9vssSdEAmq?=
 =?us-ascii?Q?e6Z6KPBIuivRXSAAP8ikWDQTkgP3KXpJrpNI19psnfdSz0GEH0ms7P8KfdBQ?=
 =?us-ascii?Q?YEgZlUWiNNfc50SbRnWOj5VBUEKuy7UmgKI7yuRFpFEFFIGrzdSRuaoYGEuD?=
 =?us-ascii?Q?DE4j975fCLQQ0ITfariSxjPM0SqsOCXyGxCLYuF+PUwInH0oPp55RJxsYxsJ?=
 =?us-ascii?Q?NhBcSUK0ug84eZr5wJ6ow/OEynbVjAKqliE78urSwbc8Q2M0s0AuFvs8FXEV?=
 =?us-ascii?Q?brfEpD8NPshlCA9ml9xKzj4oIjSK8Ka4O5DoNeT1ecvIeJEhWgv6lOF2BybM?=
 =?us-ascii?Q?5fSnd/v5SGWYj9UHldkn3ZQP+b2tH34yBv5p3KxLbqfCvPmIfOa2RswFEDPU?=
 =?us-ascii?Q?ppVe8YI+G8szXmkGjdqcKTJn6zMRpWh3KyrwQHEanr29w/Cw6oE6FO+Xf6Ul?=
 =?us-ascii?Q?vpcVKqT5q8V191fwSGcMa7utWN/ojEGd5mN7bh3u6g5po//cw9B+ARAnLMzt?=
 =?us-ascii?Q?Le7lUJPBYdyyLyVoCm0Qoa6574XODw6L7Lsp4yhBUT+nZvV64QLScjOreJUj?=
 =?us-ascii?Q?by4bjt4EYAf8FLGQaSQqSZuT5/A733JEuFpAYMyXwEzWwvXH3mOEfdmM4TAo?=
 =?us-ascii?Q?B16tIsit3iw2s4iM7Hu+7tgriZGV3T8t7JiWY3HBcIj9pvmcq7Fl4ju5NXgV?=
 =?us-ascii?Q?3GM4uJxJkPCkeZE8cUdG8kGjapc40WE/3EpE1FK0kFqd2bHWCVmGUQPMK4hV?=
 =?us-ascii?Q?YTns/adUq8spHC8Kt1m61iL/zgcfdeG2cpV9zZfS69dJevHM7MYxWqrynR3g?=
 =?us-ascii?Q?Hq+5tJHs7udnYYycT7kR26TdsAvR8EbR/tWGZUSAu6CubIyLHwdzlksakNkQ?=
 =?us-ascii?Q?cDKHHP8OEc5z+aUnLrbLjiro/oiGLZYwSrNnJd5NIzZycb/3D3XTOxdvs29j?=
 =?us-ascii?Q?sXapuQFMiohE3HCMQ62zTtnTXEdEFAdtqzYFysh1h07HF9dIjCp1NBNoUEdz?=
 =?us-ascii?Q?5ZxAhymSmn0Vm2F4tstVbJoThklk53vy73vTDFae7lfZEUSNCPkq2T022uuD?=
 =?us-ascii?Q?B//jPt7Ojn0FLQDbiSv98ot1VUpMpIJiLJSJAUZ/0JFkL3C4vBRfHtXKGIpz?=
 =?us-ascii?Q?MU4h7fsyi8qj4ngYiiq8zp4va7CxkJ1giCJ6Xn70ctn19yVtO2jxHyZDFbZ4?=
 =?us-ascii?Q?9zT3/6H6y6apgOjmJnAJFTo1UuqyCf0bGSnbF60oQ5aVg9y6S380M77VCZ/K?=
 =?us-ascii?Q?wlpuutPSTk9YtQDNDN2fb94YIl5QbMZPgB7BiLCNKuL4vT3R9TAMqK89FysG?=
 =?us-ascii?Q?Rprwz05HCygHqkVF6dnCP9OYP4XWy3JAvBOwGvxeS5XVnphHrHfz3zW11SZl?=
 =?us-ascii?Q?6y5Lc2xJiadgyBJzAlDE2feWtdurre+OFoJM/TjyAJG96dMzRw1u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79880547-bf13-4924-6dab-08ded8cc721d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 06:29:33.6710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3G97+Cz4aN5PKDC5V2y8m3JG+cRgPBbs+zURnmfXDuvX+PJeg110j6WNQGm9rsQn/U/mPiym9FC5mU6bL5hnFP+3ygKcN8SYxfTn7lGpAi7LKcg78gvk0wm0CzaYWCp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10075

From: Xu Yang <xu.yang_2@nxp.com>

Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
to tcpm_pd_receive(), ignoring the actual frame type reported by the
TCPC_RX_BUF_FRAME_TYPE register.

Read TCPC_RX_BUF_FRAME_TYPE after receiving a PD message and map it to
the appropriate tcpm_transmit_type:
  - TCPC_RX_BUF_FRAME_TYPE_SOP1 -> TCPC_TX_SOP_PRIME
  - TCPC_RX_BUF_FRAME_TYPE_SOP  -> TCPC_TX_SOP (default)

This allows TCPM to correctly distinguish SOP from SOP' messages, which
is required for proper cable plug communication during PD negotiation.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 7ac7000b2d13..c19413f41bcb 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -748,7 +748,8 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 
 	if (status & TCPC_ALERT_RX_STATUS) {
 		struct pd_message msg;
-		unsigned int cnt, payload_cnt;
+		unsigned int cnt, type, payload_cnt;
+		enum tcpm_transmit_type rx_type;
 		u16 header;
 
 		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
@@ -763,6 +764,17 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		else
 			payload_cnt = 0;
 
+		regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &type);
+		switch (type) {
+		case TCPC_RX_BUF_FRAME_TYPE_SOP1:
+			rx_type = TCPC_TX_SOP_PRIME;
+			break;
+		case TCPC_RX_BUF_FRAME_TYPE_SOP:
+		default:
+			rx_type = TCPC_TX_SOP;
+			break;
+		}
+
 		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
 		msg.header = cpu_to_le16(header);
 
@@ -776,7 +788,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		/* Read complete, clear RX status alert bit */
 		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
 
-		tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
+		tcpm_pd_receive(tcpci->port, &msg, rx_type);
 	}
 
 	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
-- 
2.34.1

