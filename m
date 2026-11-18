Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003705;
	b=UZsckqJzmY0J74bgPddcc/PoQjLZEZe5gqcoapO/zyu/UesodRIqlYlhWx65lsfJQt3h
	 fQEa2oPdVqal1OPaPErbtwHDebFCnUs+3Xz8meOwbHvrAX76APhmQHCpSvjsrHOUNMBvJ
	 XCD+6gbFS5nkD6dgau0zjB1gm5/NMhZHKbMz40M4AXy08aKdNl+ICwwBAFwdelsRg0xqx
	 fRPeUu17wUmwwvVztp5Czu2WumbVTTcWBnDVAL7Xe81u918BpJKmIWdHP5rtq0fSDSdqa
	 JW2dU+BG3Mw43rSWaVhhV5U7y1MkvzTrRfktVd3I75XXkd5jgEi7ecypX7niujYCYRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003705;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+VbWtfq+Ox3MSoXAgs6LwTdQofVbO7Hu37NE8+JdFzs=;
	b=mE7aHQRJiMvrNU8XAGQJYpL21eNME5K9GC4suwATD6TxjbYqA+aZvROtHodX+iOWoT7e
	 XpNDVTYqizDE5BzebUeVbueB0sQcE8gQvose90Pf7qyno/nnUUNaoZ70fq9tT11gMDF6Y
	 IQw34rPEeZ9/dzlfeyHniyBAjEWY/o0XTMsvmVreMQmmko+p9MHVAO+ExxqX6BTjdPcqi
	 XwJJWzUCdRI3kb0JAibjvXc928kOraUMk/WIlUaoq4CKEetbjScL8E55dkxhwNP+PgDS8
	 7WJ62/7/wiP98OdPv0+fKrhab7KUDnojnmbVfeFGEc4h8/fn0LUuluqs6E30Eb4dQPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.84
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022084.outbound.protection.outlook.com [52.101.126.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967B606A320;
	Wed, 18 Nov 2026 12:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6967B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqHFfxGpwCsNV/hSKwRly4HwqaEp8G77BrTJihKrHZtbcASco/OFhDvqLcvco5Op5R9tzPSaJsQrdovglYzA/JxF8gaMYgbFjvUWKGhOWlBySergeyANfWzZxTaSkrFf16ivOsPNubP4QPD28K2Ffi4RsACVcTwBAvv5KSPVu9ThxxhoH5fx1uWqjzeyWcT6j0Vt/0tJ7abK9wRIzSJ+B6CO486dT80LzFtCeGwaZqHXFj7n27DjxTBLEu6N0Zo/zFoKowY7tlF3BrU6CLZt9Zyh47uwZ5olwtt3RUr9aT3HK4IXAgye6337A0iior8uxHtnNOCmSvnw3Nps+X/p7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VbWtfq+Ox3MSoXAgs6LwTdQofVbO7Hu37NE8+JdFzs=;
 b=HJNTOBdt6oNDH27eVv85ifz3DjiUPPKfThnTjME3qyJzX5fb0QKc3cfM0mHlZ8OnvqPxdt5dnK/GvNLsuwhMvLOkNBqVWyXKtkGXD1Ou0Pb4ZxtRWgFHaLgIweqRDaqyCYCKUicXltPUVQKcUtDLxOlqdgs5/Pfz+x4isfROjeKHBcxpvbiAodD/HJzpgDbJnwIj7teajrsV7vWM3Da0tX0pdsKtnyA4L3mE2Cfwq0C8PtMtY//D+QuuPvqAhI+NqyiLU1G9fmqaek5f28K1pSF1Mw1eKQu3DqphxjYDTcYvHzRvjXzqy4Qxw8zy6B1SHtPSES09nAZAiOomRZ5A7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0053.KORP216.PROD.OUTLOOK.COM (2603:1096:301:210::16)
 by TY2PPF7D00602AD.apcprd06.prod.outlook.com (2603:1096:408::798) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 12:08:20 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:210:cafe::1a) by PUVP216CA0053.outlook.office365.com
 (2603:1096:301:210::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 12:08:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 12:08:19 +0000
Received: from gchen.. (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D0EAD427EFD0;
	Wed, 18 Nov 2026 20:08:16 +0800 (CST)
From: Guomin Chen <guomin.chen@cixtech.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guoming Chen <chenguoming88s@gmail.com>
Subject: [PATCH] usb: cdns3: fix NULL dereference in cdns_host_resume()
Date: Wed, 18 Nov 2026 12:08:16 +0000
Message-Id: <20261118120816.1974909-1-guomin.chen@cixtech.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY2PPF7D00602AD:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a7d6f7f-db07-4082-174e-08df456ca294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|56012099006|5023799004|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5DnHu6I7G8SD/7nlZG0+2MdeNGG2lClxI7xTrU4pfJ9eai+Ba5OQGj6pLSrbltuLO4Z/XhE+cprSDEY5NGBNcOAMD7KUfTXNkvPl5VIYa0owGoZIN6ELQOUjok0y5hCWk+xnmt3zPI0BMqBYsxpyVPNp65UAN5ah9uQiEWz5MqX4U6O/xvOUFmqTaTapQWUpdgGNCjNEnEQ06OErOObFRS/d1XfYxhVHo1TyWM3wawBAT7FQ7j8xHF9YTDh0Ol1wpA1oS3B5//Meh+PhJiWw6JC0Roe2xqoB192QSXCFO99Tn7mmXRDsf7tTdPsA/ieG7T3fCIzUk0nTcNS1XTb8slvfGKd3AU9z6vFqHMp1bOBdTqr0dG1Ob5FNQnlGPRnmZmxdawfAOevEdmHdIlXhrxPsuh597PDiTcKensJcNcNxEY5YxR/w/UH0k7wUzgS+OMmHrQt1hcqYT6kyho8J/SpYno4Sehgx1uaCejeFwn252oRAB6zCyHAD0hZZnpgYGI7LF7tcsarqsb/sI8jTdEhR8A7a4GNSlzjatt/h9I1qaN4aKdpXwuHYb2bZttg3NRMU+3FuM3GiBHnG2mq9cQu39b0Z4+PLg+N0AfPHuL1q/wRpyc0oL44W1pI1hbqVexFROveTmTLFnBrWE9A2GRQ/EE6QELExLxfPperHAW5KeZ+pBoBv/3j72hJLIMXvyxXqdiesm+9VDMKWjibpZw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(5023799004)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3DlCDs+PIJCdX+/X6fy/GCmzauSwQ7xd6LGGJLetMbvqWtjMUVi2mN9EEWDsiHcBUopWvbEhcjEOEmeGh2O+huXKmOJvlpvjEuP+rButci6JMmSIoQgnhdkoQ4TOn8ZlYtfGiRJzUcZ9dmr7cX4toDf70ScryJsTr5D2K8vmFeOWCF4WSVpevnDCLPB/OQNvRvMN+Gdl/u+SdPBbS6U31l/7amQijBqDXXsxBsd8b952hJKdATU1w+3m9eyuZqmHnvMb1ztSpPIsl+Vmpo2L1374iYz22k+a/K1X/drgGSed0YBRv+8PNkDepoi7RQYFwIl2YATCVgbLsxiCkQDFxAT3EO6K0CNkjGPRZuoj7/4BmlZuVbBFKa/GObW5rx9/Dmis0qGDSLn6N9BzMH8qFki09Og2vRYmI4WVoqb2ihsSn4UfaFhbDTIuVCK7W2/+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:08:19.2244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7d6f7f-db07-4082-174e-08df456ca294
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7D00602AD

From: Guoming Chen <chenguoming88s@gmail.com>

cdns_host_resume() assumes that the xhci-hcd child device is bound and
passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
not guaranteed: __cdns_host_init() creates the child with
platform_device_add(), but the child is only probed once xhci-plat
registers.  cdns3/ is linked before host/ in drivers/usb/Makefile and
both are module_init(), so at boot the child stays unbound until
xhci-plat's initcall runs; when xhci-plat is a module it stays unbound
until the module is loaded, and it is retried even later when its probe
returns -EPROBE_DEFER.  Platforms that set
CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx is the only in-tree user) let
the controller autosuspend (20 ms), so the parent may already be
runtime-suspended by the time the child's probe actually runs.

When the child is finally probed, driver core resumes its parent before
calling really_probe() (pm_runtime_get_sync(dev->parent) in
__driver_probe_device()).  That runs cdns_resume() ->
cdns_host_resume() while platform_get_drvdata() still returns NULL,
because the drvdata is only set later, by dev_set_drvdata() in
__usb_create_hcd() called from xhci_plat_probe().  hcd_to_xhci_priv(NULL)
then evaluates usb_hcd_is_primary_hcd(NULL), which dereferences
NULL + offsetof(struct usb_hcd, primary_hcd) (the offset depends on the
configuration).  The oops faults in the first instruction of that
helper:

  pc : usb_hcd_is_primary_hcd+0x0/0x1c
  lr : cdns_host_resume+0x24/0x44

Return early when the host child is not available: it has either not
been created yet or not been probed.  cdns->host_dev is also cleared by
cdns_host_exit() while cdns_role_stop() leaves cdns->role pointing at
the host role, so a resume after a role stop reaches this function as
well.  Nothing is lost in either case: the child's probe initializes the
controller from scratch, and xhci_plat_priv.power_lost is only consumed
when an already initialized host resumes.

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
---
 drivers/usb/cdns3/host.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index e01264dc625d..3456f065111b 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -140,9 +140,21 @@ static void cdns_host_exit(struct cdns *cdns)
 
 static int cdns_host_resume(struct cdns *cdns, bool power_lost)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
-	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	struct usb_hcd *hcd;
+	struct xhci_plat_priv *priv;
+
+	/*
+	 * The xhci-hcd child may not be bound yet (xhci-plat can probe it
+	 * after cdns3 created it), or may already be gone after a role stop.
+	 */
+	if (!cdns->host_dev)
+		return 0;
+
+	hcd = platform_get_drvdata(cdns->host_dev);
+	if (!hcd)
+		return 0;
 
+	priv = hcd_to_xhci_priv(hcd);
 	priv->power_lost = power_lost;
 
 	return 0;
-- 
2.43.0
