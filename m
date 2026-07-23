Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099841E6DF;
	Thu, 23 Jul 2026 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803362; cv=fail; b=oouXquLQBdjZFKkjeRZU+cMf8tcDlXaQZl+detJOKvtZseAzy2oTcNpDKGX/HmLXThThGKyKywnaA6OwZNpkE/TLJpXmDrVaEQGD80tzHYzgwF2OH8quDVsmzSNWQt8VBSVcbft1ZpHsEon6SOouYazzjfqI0TsMJA3gCjBO8vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803362; c=relaxed/simple;
	bh=XM6mmRYoC57eGNkmS1YISCFkU4yCdeMM+DTvj4orxHU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Rp6P8dqg7G3yXVvYvCySgMFQLl3xRF8MhNLbJqv/apOS/cXhCj0brOTrrNsX6laTpHW0IoAfciMMm9p7RANTe/Cfi/FACCJC4ERvx+0XkVI/AWJj0fu9IYx1jY+N8SCLtjLnCMjc/eiqg7XiQVhfsMhnyK4DzpoEewdoTMBEXec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CPfKBNlC; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CPfKBNlC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVqYgLj4kBtu7GkU70eaPIPE0fSgUSO0z70GCjek37iiTSoQriFgaka4nOhzb7S/9MBWcO54KCOWH4tT9w8IFCoHFKE4xFr7Pr5mZMr7bKWb4bHlLIWVY7HlZFSLjIUJ0zVABxYwlMCfWA7pI/Pc2Ng79Z454N41WAV33eyvkDahi0KcnMWRbELhaCB4rvBrgRaMZvkekCVuGH3gg8auuCasQDd94RcD7x/9B2Uw991cF8jriPLO0EjwTLf5fiye7F0k8I7rWr22WgCjNTqyYyHt1rqjAXvLHCmR/vXYEqkerA798CH5ukwQKoS4Id3wTexvrk/5D9ZsFqOHn73/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzz1z6B29hK/fHr98QJg2dNONmVn4Wal8nOJ4UZ/Foc=;
 b=kNwvv0R+BTmdpKYj0/aRIjKFwhJcEFgLfVymM2O7b83Q0FiPGUV/x8/lZp8HXO78MMTRtcZTRJcaXsWYZs9SesyDv5EezN51T4ai246oP28w5CGbVBbsBFbBb1B0EdKAAeKP021OwX+pgfDNgssq1uQuk6in1+O5PFmL/3XJDy32iPFilppoiRyRaq8drkCkdyxWoobflUeVniqnccgGDEvJuT9r0Z95T55497MCg1VVPI+y2ZxQqNW+0T70aE46u9RxUzhOLl3T/nW0NTlVBj7ju8362lofvRJ8B8hROfYtLS852kp2PXiPxdqvAhAef/DV27dotOsSirz8oWvsQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzz1z6B29hK/fHr98QJg2dNONmVn4Wal8nOJ4UZ/Foc=;
 b=CPfKBNlCnsXbCJD5f2rnOKgFAHoSfbmdtej2+gHUqJWpTVITh8Ot0ibtj47GfQXUWgKel0VJ5TgPf11nUFf7w4zd/7X0nU9FRhAOJdek5gqq8w1yWDvAbwtJQC4eUJb6umjfijCBT0kfZj4yiZ+BYbY6wH3s/wlQK9g+XkJfxs2vMCU5GHPGzRzVJxkrMGy2wnuPmxPRKNtR4/Odwo1K5s4rwG0T+4stMJCEXEVTt9pi1CJ2FTEFS8cVhRmJKaEM8EZuGWw3NLjzFC906l5I1M09Flk+oMHC9+mfQ9cE+tNZJ3gMPZGfq7aIzn0KiFGZ2XFOaOQo2pW/G6M2A4wC2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DB9PR04MB11577.eurprd04.prod.outlook.com (2603:10a6:10:607::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:42:35 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 10:42:35 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
Date: Thu, 23 Jul 2026 18:46:14 +0800
Message-Id: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DB9PR04MB11577:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cbc6fb-fdf3-4fcd-41d7-08dee8a71b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|10067099003|11063799006|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	JDCX0b0fb+yCOInlabcENDPukMTcmT93V3L+aVZxIkGL0MrnM0jrGL+YRuDsPnKiYJbPGmfqxkVycDhZM1OxLJyQ3ElKNSCg945hzBaH6EBhYxm+PpNoHq164DWpGAsI0C5tbJTCq/lPwReW86LuGqf9vfuGYBffNEBEgKS46og6qXm2JuKurOa9/o6E8Sg1o3GowKCZcmCGN4xSFn7ImZpZd7IZqumZqVCuwQehxbg7FKgopRaProVbXHHRS+g6VZANMe68IJsiAX3nL1PrzdfADcis1C32tABiDJ7W/0A1EbjQgsZSZVkaab7mWXJ7+GEAgpRUqbQGmACcqWrfyT4qEdKpZ+xO7WPlUchGf1oqM7zolNK8+rhCgRafSJqhArZEZuCLM1V6nGwNGSwyAyh0LfHWgQleqJqOvZe/VIhfoN+QvLaa9INL2R1tuz8t4jIge7eDH6me1IK4zimODd2SGESTqynyAzEVcbZzaUJ2hdDE3BdB0/E3rRFtDoEpRyjImfuPAbjYRhfEtJMLVNB2kj+eTu3fTwn0VNpLLf40xqoJ/xCU5VIsMHn0DogLpvhQk1Ok7XjmniNcUy9I7iW3XQ/v6BL2r+rAK3S+YBpPyollR1yAZ4ZNgPDGfaBNa9zNVRO6bwXk21BxsQ53vx4A8xohBzUeltQWsRXzURM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zfXCwnQkOHZFhzG+xlZv5Pj0FFoshBjaUK7t6pjdniixj20ulNEVmMoWTb4E?=
 =?us-ascii?Q?ytNT6nrlllbmHwvBZFG1NmXTw0Y96uaAl7cl5kXpiz4755lF9nslEeYtjIaz?=
 =?us-ascii?Q?09CMWilkmI2oxff8z3ctQQXyOtIoI3uCvBeTvX+rrdEVkB2TjHTejncL/1Tv?=
 =?us-ascii?Q?+Gn8XAKzXDCGzIzmb1QKtlFdPU5GHrLWZJRuwziPaO0bc6983WXuBUvf9UJS?=
 =?us-ascii?Q?sUkxDZkQPXsYmIK5nJUTEozOxm2GPbzpfKVYMYZVJ2pzB3vKL5iXEn1YJz0H?=
 =?us-ascii?Q?sZQevr3tGDbsE3JZdDCPep1OCQEc+qBv/YmbyNiqAohqg6o1TWuCqWxfPk/M?=
 =?us-ascii?Q?Aql8aMGC2OT0DBjL3CVeYyAgh4c+Yr/uQpP41L4/vEr6O0M05vQh11MOpatm?=
 =?us-ascii?Q?tW2K5pWkX71OtvD+OoG6jSpUi6Xv5gNQ9KX9lGhL0V+bTRdwkDCqn3nolrLF?=
 =?us-ascii?Q?ZpRHKE+fClQTNb/rmmcafVo/cVDBaku2dXke2j7N18nQLVy/cLBSfB1zdpcY?=
 =?us-ascii?Q?ffxUXlY4BsCKW1N24onqrgpudqyJhB+xAmSjgtGtRWZCtHtUYu94HnyZPD/6?=
 =?us-ascii?Q?vbCZoHm8cwIoi+QgOto4IBA49jPesqp3b6xng9J0DFhwSRkGI0qW0Y/lBG/c?=
 =?us-ascii?Q?a7i3RJqAxyBYyBpZ+FpPgamnchmF0MbJxJu6fXnufoecBVrNgqv/MpgWV4s6?=
 =?us-ascii?Q?0otTdSWBInNPVHWPS5vsriZeH8/wX9JLayAUmzEe358x1nLx/x3jeDnjnjSp?=
 =?us-ascii?Q?G/kGFKzXnvEsqAGZeOMYNF7hIL/eh5rT05iuSPT61oKHeercDvaDO0Qs1AKe?=
 =?us-ascii?Q?DESFNE3um/w+0A0m5z9MCgAUhTr//IJXIHJTHQJ4pf6p1niSr+0ncA3g+jj9?=
 =?us-ascii?Q?tXfsLGT/ildJCt+swu3V5JuJw49PpZWKUKYQIrihMsgrza5zjjGp5Ama0ZiE?=
 =?us-ascii?Q?HTWkdMaCNf5Gun1t2udYcsd6vmPgfdYosK7gnNd5HNDmc2qZzWw+c70GniJ0?=
 =?us-ascii?Q?I3RHEp7PpF4ivPuLZw1DMHkp5M+VuL+vxS/OErJRzzUkHOx3AoPjFCoeYtmQ?=
 =?us-ascii?Q?f6vkEVswWQTE/avCcPfx1H6edbDD2u/iWi6VwMtFJMANz7/oed5U7x1GxH6j?=
 =?us-ascii?Q?2laz8ScQi/TZeK5OIN9ZYSdsOxIpyFa7EjYH9mOS2ls/n3x2p51zttjYbdQq?=
 =?us-ascii?Q?qWNj9XBxLsn0uuCD/uqJwtbvrRpfVNFBfMV/ySHT9RWLpQ1g7sadcmqCIwQq?=
 =?us-ascii?Q?wenexZ3I1GoAI23oeASryII1bGztRhKeJg5OGcCxkR5fT0M1n1nq/5ig7rxw?=
 =?us-ascii?Q?K40VHWIU6JGrYuOJyTq1dVZwQCjcXAlsD2b+09rpI5UuCYRrkH+kX41Fi6PV?=
 =?us-ascii?Q?7yI57QABuq/IvWsrVm+RsOXPxu4f2SQdtexD/Ab1bB2jroQu4BbcQWKq/zNI?=
 =?us-ascii?Q?oHAzg1nD+T2bLChKV1N7sFDtITkfQ0E7DRwrJpxfyrMYj4xubSbS7lZBRYdA?=
 =?us-ascii?Q?M/mvGAN7I4/QTGlfBlR9z9P0ix8uNbqD/GOLLUQGe/ERuxPPy0E79N02vWr0?=
 =?us-ascii?Q?glDyhoGReL6VwVkHjrU18AsLcmT/LI4CKwHozRuQJ3XyeIvrT9amuclNX2eC?=
 =?us-ascii?Q?9oZxVqvchI3Ok7I1Jn8x5BZ3UTniBj/O48l+EwVDnu5MTzY5pS/NZ9snJ1M1?=
 =?us-ascii?Q?ywFKK1k8WSWHEjPgX5WdldogHUP+XWJ3MLyhgX/WiYm4pQy4I29JnQDodbXX?=
 =?us-ascii?Q?bX+ZkGr7daFzQYOrpJfUanUvxHqkn78ch4DaIcbXvQCqbeuqyXJH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cbc6fb-fdf3-4fcd-41d7-08dee8a71b47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:42:35.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKftJjBM9v6u614n/r4y/wuX8bVgr+wAB+6FgY1HcZCUnjRhZw9NHEdgSn+AO2+lDxqC61+VsunhI2A3o05usnOdAsKY21RjvJsueOW5UJNBaIg3QGcXAwIKbNBE1ep/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11577

From: Xu Yang <xu.yang_2@nxp.com>

Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
to tcpm_pd_receive(), ignoring the actual frame type reported by the
TCPC_RX_BUF_FRAME_TYPE register.

Cache the TCPC_RX_DETECT register value in rx_type_mask variable. When
a PD messageis received, read TCPC_RX_BUF_FRAME_TYPE register and handle
the message only if its frame type is enabled in mask.

The TCPC_RX_BUF_FRAME_TYPE register records the received message type,
which has a 1:1 mapping to enum tcpm_transmit_type.

Fixes: fb7ff25ae433 ("usb: typec: tcpm: add discover identity support for SOP'")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add fix tag
 - check return value when get RX SOP type
 - pass all possible RX message type to tcpm_pd_receive()
 - cache TCPC_RX_DETECT to filter out unallowed RX messages as suggested by Badhri
---
 drivers/usb/typec/tcpm/tcpci.c | 12 +++++++++++-
 include/linux/usb/tcpci.h      |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 7ac7000b2d13..6717ac914c6a 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -38,6 +38,7 @@ struct tcpci {
 
 	struct regmap *regmap;
 	unsigned int alert_mask;
+	unsigned int rx_type_mask;
 
 	bool controls_vbus;
 
@@ -488,6 +489,8 @@ static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, bool enable)
 		if (tcpci->data->cable_comm_capable)
 			reg |= TCPC_RX_DETECT_SOP1;
 	}
+
+	tcpci->rx_type_mask = reg;
 	ret = regmap_write(tcpci->regmap, TCPC_RX_DETECT, reg);
 	if (ret < 0)
 		return ret;
@@ -749,6 +752,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	if (status & TCPC_ALERT_RX_STATUS) {
 		struct pd_message msg;
 		unsigned int cnt, payload_cnt;
+		enum tcpm_transmit_type rx_type;
 		u16 header;
 
 		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
@@ -773,10 +777,16 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
 					&msg.payload, payload_cnt);
 
+		ret = regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &rx_type);
+		if (ret)
+			return ret;
+
 		/* Read complete, clear RX status alert bit */
 		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
 
-		tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
+		rx_type &= TCPC_RX_BUF_FRAME_TYPE_MASK;
+		if (tcpci->rx_type_mask & BIT(rx_type))
+			tcpm_pd_receive(tcpci->port, &msg, rx_type);
 	}
 
 	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index f7f5cfbdef12..9b46a6bc762c 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -144,6 +144,7 @@
 #define TCPC_RX_BUF_FRAME_TYPE		0x31
 #define TCPC_RX_BUF_FRAME_TYPE_SOP	0
 #define TCPC_RX_BUF_FRAME_TYPE_SOP1	1
+#define TCPC_RX_BUF_FRAME_TYPE_MASK	GENMASK(2, 0)
 #define TCPC_RX_HDR			0x32
 #define TCPC_RX_DATA			0x34 /* through 0x4f */
 
-- 
2.34.1

