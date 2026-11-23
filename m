Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795420084;
	b=p9BcsQ0Fm+2KsNvzJw3i4qG1oXf33CjkXaHnDkX9yN5TzHRzqBfQpIIsCXRaldTVhoqC
	 SQYLFK0RfLzHNg/nWK6Gwtu8pblzQNjG+2EmfT8IcImUlv8EdTC4RYUmWQdeti9Deiu4S
	 U99xzDLHcZdtW/Ihm/FeG/Iud7Fcx7+er+bEBH9R5/cSr02E3NfM2xGs0SrWEiTkJcPVt
	 zE747omL5t+89x5EoQpZERTXAvuz5XKNvD4BszdD87RdWgsZ9qxSy7VLIPcUd/80tNlSC
	 KYJ+X6FCupVCKrBJFdW3h8jQ5lGutZX2pNMQUkoUnfWQGEgGKgAlAdpJQ+x6S1XBMAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420084;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GquE4IGtJv/W1/FEfQ6RT8Glw/cJ/HQHjZ0ehXTMvKo=;
	b=WjSW5D7jjWRoE2Exwh4zuaW0Vm+kSWwCDAdgu4PvNfN0L8fJYhnHoHLAf1P9zBdYaFis
	 +2VYfAbCA4DGUPDgRWxiPu2BCh98v2z8HNt7lXHoB6U/KfFCx1RORRRrny92n6xWVeI0F
	 R7xOCtSjEmbEiMsAQcV9U0FW8SxycuV7ZlEiPK6d161/poQ+akhmOFQikatcIapGrxasN
	 1ZyAXLr9BXQ20qGmNjJ+aWUoXt/qyQiR67Zqw9RAWh42bW6QVTpwDNFw6PBxIqBlLJTng
	 wgR8OEd1AiALSRPZrQINu9KJr4fUeRx5i3ZVjFhLPu4VLJRiccQkl8MZg+3TnLeGPjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H00848vq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.58
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E52606A31E;
	Mon, 23 Nov 2026 07:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E52606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H00848vq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EP0fnIQkLCh/+EBbSf5p78J2NoB18bKeL3luexUfDjOSYr9YJMuy/QczPpnK3NxHAi29ApWcY3W7O0sy2vtEOPdoBVHRTuCg/I+wfiv24l51sApPuUDOktqwKkaB282IGczKflaczkkr7gs+KRUmTa8c4jnAin469ISEbYv1qcyAJMe3mTMT2lqFfmXB5MDzXFyWEXQRGM1/XVZ41bxblzNzexqR8tF21CK71P6UVDQIKpcNpDdmQlghQ0JYohCTlUwJZbf9CKeEG3psUppXzL/2b/LmoJeZnyHOfkiExQx9n3TxSb/IRBr58CPR05tx3q3b1rYiwroO/Aw8mnm5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GquE4IGtJv/W1/FEfQ6RT8Glw/cJ/HQHjZ0ehXTMvKo=;
 b=tIkOCMsV68+3bE9mPf8KnjaX+NK9KHQ+VyMPYqOF94E2Flud/u9sJ1eN3XtGIOWpZZhXfruFcNTad/Xma7TmiPFHaSdMZ21eJYp3USegcKjt2KgP1nKsPRcUzOqr3PJj2odt1zxkVu9w9C+bpgBN5d2PswOXcUGZMoXLqNkwGT00dXU51b3wzGnOEq8FwIRXV/QTBGEQWed/STjoBe1YOUEiifSq5LhN/71uiYqevcvZGL5WqjQu1KqnBvMSnFqEWFPC/xKw9GpZ/Z2Z4QJQpaQV2W3AoTTBv57H6WAG4MPI6wDtYcftGthh7OXFJq89WdRjNsT/gZpsS56lnAo8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GquE4IGtJv/W1/FEfQ6RT8Glw/cJ/HQHjZ0ehXTMvKo=;
 b=H00848vqcl1mWx8SpU7MMebJgTtD+L6rRaO7s0wadT0sAJWJzqpoJgtzvfDucoAZpvYuIT8sDDbHyNHQlS++F71b6mToJy8L5kV0QVVtvCXWLztzD3dh91SEofc/0EbCGPW1SgIqEj5LcdNJctv+P6v2mqMw+yofVG64g0xpf0St+aM30aUXbYK+l+uafGFn8ZSo2iUTkjqrVzgZAlYHyhGXLwmpnsL8yIKnpPuP0Ve19EfM0qaKqD5BQqKMFLPubIhZxbdWVFnix/tBSqefqlqL/ijtzFyMqbuDPITstwS+0eXIcrV8d48dJQj9LwehnlpPtiS+kteqOmaQNUib1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by ZR6PR04MB438545.eurprd04.prod.outlook.com (2603:10a6:910:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 07:48:01 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:48:01 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: typec: pd: mark usb_power_delivery sysfs devices as PM not required
Date: Mon, 23 Nov 2026 15:52:58 +0800
Message-Id: <20261123075258.651291-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|ZR6PR04MB438545:EE_
X-MS-Office365-Filtering-Correlation-Id: 710327cf-c995-42ac-36df-08df49361944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261026121527099003|261102123227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RwkKXTMoOCgJ7cqf9fOrXOTsd6EdDWbR6FvRX71heH5rIgFefwQ+sDS6ixlt0VMoR9VN9slHZY1uoGDjhQ8ME6aR0BgB1n2o7kdPLoCq0k3m3wmQi66dqIzQiz4OejSBXNfGEjj2KdvKtNwK29wpJCifF/rkmV1vX1mh9MU1OiUGzd91dh9y0BXSyiWLpy8RXMcHXrjgRioc5EQUZs7lSfHGA8YLzn/K/1vOi1ozG5nl9++KScnSodhpdd1GkU1KZYw+8MYKtqa0iiKZaZPUl8sYS0kJuE6qKC/9OnD6VQdx29PzHoz0RX75QwRNoH+K6086koY8oWo7rawXGmoBU8jtiUeJVoWmtE0I4i+WmQeemCi8CoVcEJ1rsU+f1S5h7aZ1mJoZwkbFSMfvQ6fMkVCVGdMrNq3s45VufN//0j/qsab0DFD1QJh4oEQafSTsJdPglnVd1nN1oceUuKhEYxZH3gOcKHvCMPoi/4RcZaQUSk8nsVfqxfuppBnFqfbK2W638BgoeKW5qQ0cnRCcdFxJvcrQwEbIPl174OL3FyLTQGUL7hE5IGReh4bG2LGCo6ODDimLBjK89LwQ3W7arv0o1EJkWyG9jie9/u///iuTmc/0b3sMzRKcXgZKDh4Q5FK0SGt25S3ScX+A7hLzIQAH2WSFhsOnXKh1nddsJi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?crvZZ+wymq7JO8UPqCpE0djVbF00v49VuxOTrWSvTQokCnRqmFEDgyj5Eb1B?=
 =?us-ascii?Q?trxOUqP6PmF1D15mNkCBndsQkHZdLmr6CoFxtHCQd5itha9pvm4nsRQO+gsd?=
 =?us-ascii?Q?mzABoCyld/QMkOAPdOEturWFRDAMyo8z1rDxWGyPauyL4mdNwgF1TJxtFl6R?=
 =?us-ascii?Q?k+8h8cKuxNYLq74Az2WFTAI6Si5ir0TT+LXtCS92tsQfUyrlmesONipmC0pA?=
 =?us-ascii?Q?NpUDMMd7Es/jhA1d8FKUxEZ0aj7/z1YunCZtZkP44sqch6fadj6jXfsNQ+gl?=
 =?us-ascii?Q?m1QZQvcYO0Q5zwOnsbJkCuIvgDEd/nmvCgxzBGYNXQQYpmlzhDCVtspbhlNX?=
 =?us-ascii?Q?t67E7mEde9adT8tUtg0fEFk4F2pUuoZQQyK4X6aMqaxxBDNBcuZOgqNf/eTK?=
 =?us-ascii?Q?QuMmlTUjbJqJY9gKgecMLSt2Nv1fN9UMPq2vefvmveeQCWKG6/E15pW/gBSJ?=
 =?us-ascii?Q?rRCCBXgMsGw8X1kMSCKjTtCwGMJhgMAtDBxstHkkSsrSzt1VNR8aFTR6gUYy?=
 =?us-ascii?Q?Pn/m3k9zSayPKTkT1GDZgMlufOrf7Fx1aweXS40OwjXsJN8k2sbvZFrCF/MX?=
 =?us-ascii?Q?FN0ucF5SBwvi8Gk+Duee4yGm7BrOR0aWqqX6mI1P7NXgNbs01k9Wg2qqK24M?=
 =?us-ascii?Q?lcpJMRrg0Ozz9brxUJqdI4ap/V2TcE09GfGY6YpWwyAJPD6PYvKrf+2zaT6D?=
 =?us-ascii?Q?qYEaRod14XEl/uxhln0lqKMsW+48tjA+IC4KWwiL0YCmJfhdyk8lN2kBmQuZ?=
 =?us-ascii?Q?6bh86nnrL8RKtjG6Lj3y+L3jvulCd4Lw8AvkNTqdP/XCxduKVN1DSiVIxgaD?=
 =?us-ascii?Q?REhlBLWVx2/DwF+0EUhRUxCz7CdevVUA2o+K+JbtTeJYIQ+323JcqkKCqI9s?=
 =?us-ascii?Q?WDeunna9foAgniZi4EB4LNu0gFQ1ikekfL0Ezfnn8upfY18RdSWl6yRFalhR?=
 =?us-ascii?Q?l/sj9yfj/+hY7EAsJ4rodlrnOkudwzCBnLQ7VYf83y48FJ56H5XsZTtcexKO?=
 =?us-ascii?Q?OTNgwlqwIYvBBJDymdrK8gH5q6tl2rCvDICNO7G0w7zSIurX3ljWPqPnGccw?=
 =?us-ascii?Q?FfRuJw8KgKnwsk2OyxmH5kqll0kglBD83reUQp+9uHU3KZqIIqAyXf9T/1yg?=
 =?us-ascii?Q?6uxvaZSzNxkIr0yzRLpGcklsAGnqcxYaP+WLcTg3ZwJRjx6ihAofqL0eFS00?=
 =?us-ascii?Q?EM3kGqWHM517Ip4HUlFkmW8deM61t0vLs+2rjHf5MNwCL8RCZ5+QcnOaG6WQ?=
 =?us-ascii?Q?v+cvHCo1lZxfVQUaPFjNowH4mXndQ0rXV+SmzejuVYeuuckCPfe3oKDqoJMl?=
 =?us-ascii?Q?ss7gbKCAzLL4vAJFSm86LSpF1Ur/46fxonVdOA1oWGwRTe/qjT0OPxUkF+sx?=
 =?us-ascii?Q?za0zPFv34uSj5afxyX+kuPB/bXXWRGt7+Qnj/wM/Nzgmv7c0rcZsbsYs9DVt?=
 =?us-ascii?Q?2/bsqljvULl1kdllHzVop60vKCoi0EQCoEguj/lSm0ckTRaJkNzLNocj/olr?=
 =?us-ascii?Q?R4+02wBdjH3BISsIIQyitaqsmtrE/L948r/p+tAHdpV4i6MP1Kf2fUxviDy1?=
 =?us-ascii?Q?CkrUJRGHnABDzr8TGBW4IN326AFPKQOys99i4643HzFEraqUBl0TSMGCIMXr?=
 =?us-ascii?Q?jmNitDi3TCf7pB6NpVx2l+83SP3gqNEozdKLC7TYAfI62/vnca2XNgvzdmUr?=
 =?us-ascii?Q?RfCeBDyTwuarIPttOiQaFp6xysxgBxjPt+E41Ca8i4dz/dGdYkwIACNldR4v?=
 =?us-ascii?Q?PoQtZV3Iui1X+9uZor6JoxHjqjx//eU2Botdx39JeQ1brwFkqX9f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710327cf-c995-42ac-36df-08df49361944
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:48:01.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rbgxFWoiJtjE74ibXXknxpl5kBMmz2WIp+MwokZFJ2K8GnDQ4/MdbzPLYhAJJFTAV4TUwQCbkHzzJYXJkU2ZehWvHpCOS3rStTz/JoI9McQc55C3kQtVIkr0PzY3fhp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB438545

From: Xu Yang <xu.yang_2@nxp.com>

The usb_power_delivery device tree (pd, capabilities, and pdo objects
created by usb_power_delivery_register()/_capabilities(), and add_pdo())
is a pure sysfs representation with no PM callbacks of its own.

TCPM's state machine runs in its own kthread and is not synchronized with
the system PM core's suspend/resume sequencing. A Type-C wakeup interrupt
can resume the system and let TCPM register a partner's source/sink
capabilities (and their PDOs) before the parent device's device_complete()
has cleared its power.is_prepared flag. When this happens, device_pm_add()
observes the parent's stale is_prepared state and prints a spurious:

  source-capabilities: PM: parent pd1 should not be sleeping

This is harmless but confusing. Mark all three device (pd, cap and pdo)
types with device_set_pm_not_required() so PM core will skip dpm_list
tracking for them entirely.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Rb tag
---
 drivers/usb/typec/pd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index 766c76d63328..a200d1f50977 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -517,6 +517,7 @@ static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int pos
 	p->dev.parent = &cap->dev;
 	p->dev.type = type;
 	dev_set_name(&p->dev, "%u:%s", position + 1, name);
+	device_set_pm_not_required(&p->dev);
 
 	ret = device_register(&p->dev);
 	if (ret) {
@@ -579,6 +580,7 @@ usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
 	cap->dev.parent = &pd->dev;
 	cap->dev.type = &pd_capabilities_type;
 	dev_set_name(&cap->dev, "%s", cap_name[cap->role]);
+	device_set_pm_not_required(&cap->dev);
 
 	ret = device_register(&cap->dev);
 	if (ret) {
@@ -715,6 +717,7 @@ usb_power_delivery_register(struct device *parent, struct usb_power_delivery_des
 	pd->dev.type = &pd_type;
 	pd->dev.class = &pd_class;
 	dev_set_name(&pd->dev, "pd%d", pd->id);
+	device_set_pm_not_required(&pd->dev);
 
 	ret = device_register(&pd->dev);
 	if (ret) {
-- 
2.34.1

