Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B53537FF;
	Fri, 31 Jul 2026 03:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470142; cv=fail; b=dRbGu9yeVAHNFiKDWdvfjZVKYw2+x5VjscRoFgIs/U30JZFNxvcWvmGoqDTRQQLjAOVinH0EHrl2o5TYvAzfv/uNmO682yjHKyq0K9EKeJDepdv8HZI/LrCSv0uuI6Q9hB7t+Qg02yd/CC4oVushcVtUHk3h9p31pv6Zh3NikOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470142; c=relaxed/simple;
	bh=TMmgGdMUsx0+4+Usr/sbH3bflanAtMPzEcDHFFROYzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tu2fRK7ByPLYovajeDa4gcc1p/nGQVek5n09yJ1FpZpeE/I2xE5dbbIZQNjjuf++5v8CAXXT2GB8I9qZ02Vydc62HCP9dQiUN4KXOLenWwf0N1mVcIii7uYDHMM5KipaOAyyIZHIAMVo0sAtQjwULAOVon4VVAPlkThQZC9l0pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=FVK/ThsY; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="FVK/ThsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIg76rYGBbzUcFRP2EstieYAs01Mh8/nyuixCAJAT1imesDwibDu7F4F+uE2p3vgjA03VwkKLqEVK7PmyPD7ggo7IlDtO5tOt1XSh0YZFrkmaLj7i5a5WXYlXdS8K40NHdxpaJaaZAzvI9lhCMY4jaJ9XcWyY728k+LOJj9hlgbSfzcLm7xXvfTXZIFDSmcD9xN3++S0UaTENMwiLD8mPoaa0EYMapwngKnhidAPe3o8U0lS/cC4Pu3ZZ+eZSFN+1cxVdPKzoy7znv7akND52paiGKDpJxfKp4xOCtMi2MQDhBNjss1aL/n+BE76BAvUoljISccZyZj4RDjZ4Primw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU+n0XVhhHn1ynpWm1piJ8ZNr2rfjnr6F7+efTCgAUM=;
 b=DC4z3wQjHxIji8arUUQPbwJBwnJX0+3xF5M8iFHklU+S5CbZ0n5TLZQfpcDtn15tCbnGEy1cfydsk5N4kep8eQYqbP8jRgIf9oh4NVDor3wevFDxC4NyIdzrPLYQ8Wp5s39Mytivq7JCfwE4xNcV34Y8rvQX6zcySTdXRO4lEvrTqQNlJBY3QVFu07OuLmsgMC1K7GxKnRbd6D9H7ZP1ubzJXsCfdc6k5H/7TgrLCdcySsOf3+ojw483qpbr5gFDJlxxxz8zL+N2dArO1ECide845z+aLCR453G9u+x0IUOZBFQLznEe43scv1rPVBzTi2DONICBTKPkZDfGmPiYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU+n0XVhhHn1ynpWm1piJ8ZNr2rfjnr6F7+efTCgAUM=;
 b=FVK/ThsYLKCt5TcX0Kj9qg4J3Des1znhD5jKwsRXMK5KZytcJaGd1/iGfK6kDBVpwZ2ue1gT2Bu7sBEj+iqtWyUaLZiCaug3vIJfT6xiyhs7Q9aAU21yN3EV0jd64cFDep6lBnP7M+COpNpjodAk8HVB6qXOirZJEOVp/z2vuP7WSLI2diS60aed6I8aEm+eRiFTn37S3F07mqBV0JdAciTYHdcMXFf0WNYlM+xdUt8Q3S9ynYiUyn5bBE5GChsH9jmF2E7tVq8c25as6wSjuTeVSaB9yKQX5vJov2pNPxbse81PmawMiJgmojztu708svItqEh1iL76T7Ld9MaGVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:30 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:30 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 09/11] usb: phy: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 31 Jul 2026 11:54:43 +0800
Message-Id: <20260731035448.252289-10-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 36aec78c-145c-44e1-dcc6-08deeeb7903e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m15vAw5fBuTAHMlmflOTLoDjl4e2ueSVmt31an5yMZnodtkoXMcg2B5msrCJf58gYTM9LxxSfUiTozb4wLJIyWXEtD8bPb1ALbrQ7reUS4WT165aewdxTWOuLTcszE5THv2UgRscRBs3QUNqbkoZjZQ4sz+FL2zdlKXoP76wQw7E8dkVXWAi2Q7QyooRrYWRh/8u0ERUfow4KnPGk8F/0gXkdfkuT5W+GbG6ALgYVaTCvd52qS41dB4f37kUe/gN05ixzQBLrWq+KAwaJ84xQJRF1eQm7ZZfMfU2Td+ERkiL+6xvR1nYOAR3HmhW+4ZuoXUViXiOkKUCE2YsgCjcEjcvywPpbEzMRsXrvrbQxQa1UVlxzc+FznWyDlloyajFtnbS2YI3fiKh6elgK84NPDptL7jZWC/BnjT/AdF9ciPDJJ38/krFzEIEIL+WEQhE4m7ME+sCBGHEZxkc2CHRQF8GkxY8OWKiFZeorHLS0Rv9+qj8iDdrjS4RRoay8LZDX0ZHEyhW5VZ0DktL+PaqcdqE1VOkeuPxZbzI1PlkKQ7lNMXWTvKbEagbkHsyznWpySGLNJ8yL2Ep7gmtSAqyFl4YAZc/jX5eu+n/JVXSKmVHMk1pfvuIaUgHPkcx/W9I1qbiATDlTmD/zUuoj+IO70QEIVdi9spTrJs2fH/OjH9q9rc6icgK1FQ21Mr4Nnss1Qcd6hWIvEc8ZsaShEQu8VjM4UfZBV6/dYPeWcVhVzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WsR4AH5vzPUMTqOI687+ZBFWe2mZ3i+Es/WmxWHo5I21vyFHUnp1KFo33qsZ?=
 =?us-ascii?Q?zafElYv0y10Dg/FHEbr1vEoLVu9tD67vs8Yf/1LC8fVykxmteN9u6zn+0M2I?=
 =?us-ascii?Q?L6bSmXfNiiRE1RKPz6wPeUzXXrqoFwkocvbpZAqpRM7gu/Sf1PRS7TNwyeTz?=
 =?us-ascii?Q?Bj1SD7c5ClZvPUkraVyIY+BBD6bjzD+ZauA93PqDH8j4Rg0rGY9ERco7Rx8N?=
 =?us-ascii?Q?o7qPU+pHGZ/ptah/PY8mSxgTNNQBoOmEaQjs8IhZSEpsYMG7hptp6AXXl8+R?=
 =?us-ascii?Q?xQPb03nVLNSG+1KN61s1SJIvIICB8Fs/GUMfCEnO5PyijM12LJJ6K/dee3Ci?=
 =?us-ascii?Q?u60alMobzyvkeckPUEI0i6MszhwFb6Bu8aOCeNcbiDr8PTUMqbUjtMqgBlLi?=
 =?us-ascii?Q?3GWsFAmMkUoXAwAGwPpx3MB/eFqGn+iUrMKU0c4mqvucZfJu6powIRb259kg?=
 =?us-ascii?Q?uyWATm3dU3qy3XQlpBEUPAh+j0wjQbjuSyd1Ob0IlKQJWL9S0IULUVqGRxVd?=
 =?us-ascii?Q?24luFL7Zwv4FBlr8OE3XwQFfLljQbKiqYldp+bie4diyxuEI6ojJTMUQq8oO?=
 =?us-ascii?Q?YsW9ln9of9C5etyZRssLLSsldNV/CwT1nJSdvRxjQWRRKWbNOOsjjlcjA6cD?=
 =?us-ascii?Q?hNEhJtpiO7hTGLdUy/eZGYrI7Sq0uX1nP5gLo8BivOVppBGOtmln6edfKlZb?=
 =?us-ascii?Q?a9SPRmxzQqJXo5qzFIm/RL11Dhc+0sYCh667crlMgw/B+1AvjYmPfZKqAsnb?=
 =?us-ascii?Q?Nt2Lq/fhcfIJ1jxa6CO+NuxZCfUZSfL3MY7MMw78a3TEIrjQQ8P2SWN33Abj?=
 =?us-ascii?Q?4hdQtk+ZPlgtCTCTaOdf9bxClMePERqm1lJNfCyyy6t8jbnHkaC8/6c7KXMf?=
 =?us-ascii?Q?vrmFJuO3iCKLqF7yTUEAzTMSDKvoRgep1JjzNS64ArlQzlruSn4xFwZLsrti?=
 =?us-ascii?Q?2e1a8AnnJMzlVxJb+bCLcJSdsmJE0txtjhFj5OVm/SZhgWWbKSs0OYb7Z6hX?=
 =?us-ascii?Q?wI+B2KEx7klGVa8oc61kue1ktRsQUUS1pVhpgQRDn+rmiZl1elsJvCylGziG?=
 =?us-ascii?Q?ZX9Wg4BdADP22Njkb58ROurOefdFoMOTpF6pkAnQ9vXv6nJVEJjgDRNc3J8H?=
 =?us-ascii?Q?aqdbREd25z8JvakW3+YmOmTbzgZB4WhIR/S0/flACdi5YA0/KTrlWB2OKOJv?=
 =?us-ascii?Q?89qbq27FIr9lit956PGTDOmirJ9W1NtDBgKg9oa5646ImjiMZ7rSa4jkIe6+?=
 =?us-ascii?Q?l9zLcxySTgG3a6OMpUSrrmBXsuNYhHJbwqNcdT6tlXwsz1SQrgEa8q5t9ppA?=
 =?us-ascii?Q?L6ZwTXc4O3aD6AOELzn2UmCNXYuijnpa+BdA95xCNVSyYTDe/NeJKz8q9Uqf?=
 =?us-ascii?Q?2Vhh30/J1AUGKbUFEbQ720UxLmHCcjosVjjEAS68v7wpkzPmKTzdBPBeYHzj?=
 =?us-ascii?Q?EbCR/k5rGWT5RJekONdu6SzJ7ayac2XNLe1ub0S8J04saEqoafFrenVP9Erd?=
 =?us-ascii?Q?UNZ4tkCecWLQNxy6Z/1kEuP9UHkV6SGJQF2p+Py7MRgIDHWV8TzGCoIqcQZL?=
 =?us-ascii?Q?C7BfRThMJFTX3wF7FlIcJUs+F+gs21uecKrORcVyGa0L6nff8wcdKk0VL62I?=
 =?us-ascii?Q?F90COFFP/tzq932abCOWY5FfLJvSCcSnKf+RtmZhkY6nz+f47qPev8h9JtGe?=
 =?us-ascii?Q?Rk4NLcganDsR7FVTBjFiOqUc51GSoVzVA08nVYfPxkhfYqmr4bHoZj+hQ6YU?=
 =?us-ascii?Q?IZY4LewCrQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36aec78c-145c-44e1-dcc6-08deeeb7903e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:30.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgSSyUBtVw+ibAAO5lXCi2YlJ/+BxlIWckXiL6FmNb/U4jkjZayNyjWNvbbyj9h3/xpgpxUV2Ig0RXwiFnC3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/phy/phy-ab8500-usb.c    | 12 +++---------
 drivers/usb/phy/phy-generic.c       |  3 +--
 drivers/usb/phy/phy-gpio-vbus-usb.c |  5 +----
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index 6a98aeeeae31..e2e06e57dced 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -748,10 +748,8 @@ static int ab8500_usb_irq_setup(struct platform_device *pdev,
 				ab8500_usb_link_status_irq,
 				IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
 				"usb-link-status", ab);
-		if (err < 0) {
-			dev_err(ab->dev, "request_irq failed for link status irq\n");
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (ab->flags & AB8500_USB_FLAG_USE_ID_WAKEUP_IRQ) {
@@ -762,10 +760,8 @@ static int ab8500_usb_irq_setup(struct platform_device *pdev,
 				ab8500_usb_disconnect_irq,
 				IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
 				"usb-id-fall", ab);
-		if (err < 0) {
-			dev_err(ab->dev, "request_irq failed for ID fall irq\n");
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (ab->flags & AB8500_USB_FLAG_USE_VBUS_DET_IRQ) {
@@ -776,10 +772,8 @@ static int ab8500_usb_irq_setup(struct platform_device *pdev,
 				ab8500_usb_disconnect_irq,
 				IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
 				"usb-vbus-fall", ab);
-		if (err < 0) {
-			dev_err(ab->dev, "request_irq failed for Vbus fall irq\n");
+		if (err < 0)
 			return err;
-		}
 	}
 
 	return 0;
diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index de26b302334d..a41671eda2a1 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -282,8 +282,7 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 						VBUS_IRQ_FLAGS, "vbus_detect",
 						nop);
 		if (err)
-			return dev_err_probe(dev, err, "can't request irq %i\n",
-					     gpiod_to_irq(nop->gpiod_vbus));
+			return err;
 
 		nop->phy.otg->state = gpiod_get_value(nop->gpiod_vbus) ?
 			OTG_STATE_B_PERIPHERAL : OTG_STATE_B_IDLE;
diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index ce09e789afd8..c0135a30cabd 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -297,11 +297,8 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, irq, gpio_vbus_irq, irqflags,
 			       "vbus_detect", pdev);
-	if (err) {
-		dev_err(&pdev->dev, "can't request irq %i, err: %d\n",
-			irq, err);
+	if (err)
 		return err;
-	}
 
 	INIT_DELAYED_WORK(&gpio_vbus->work, gpio_vbus_work);
 
-- 
2.34.1

