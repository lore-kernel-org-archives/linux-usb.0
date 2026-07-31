Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED68352C3F;
	Fri, 31 Jul 2026 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470128; cv=fail; b=uxs6/epGzTZeKTSLBSAmHwMfY5YpPeh8wr2vzdIxwfvQLZ3IcSjg5XVtbxAosUkg46rs2RpBy2IgCVTCd5NQKbki3BMUXC6QfluJES5O+oXUVa+B550vrfVXG3we5RRYdY5Oxr8vbzhBtkUeXjmy8QlKuYsWwFA3N6ATNvFLbtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470128; c=relaxed/simple;
	bh=OAXDnqzWRFC8hV2gkydvFSmJsZLf9z8imCam3TeLkFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b/1q7wRP1hU/X12NExw6GI3UzvKSESSSFgky4jHD4VYdpdGxBIAiJxs3Nvnev++qaM0dko3ez7A9NXXLdioGTzQMqNKAMZO/KOFlbp2I8NguykIoYau78/2Usoo0cmnWnKmhJ1/JYz3qIJ/xVqBjhKDSEmN2Jd3fHPSAJDmH66w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=pC1vjVkp; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="pC1vjVkp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bytYw6NLLFhiJyPALsbSuKzxDLeYZhJH5/AkSIeRgE9UN/AwSsQQuvlnMyN5bISavg5qJDoa+E1Er/UgYKMq2Qd84eXwAgSd4j6gDASnocCQ/77yXpvnnPWwYe37cRYMeCK3vYbLId0hazzkN+0Dec2uG6254P5OimE9Z1fAPGLU8KGFUbWHBxwkpmhzmbMAcTpdlBDbaCus5A2H1vFkWwjNqjoLMocZOqhSaeQlW+h26yEE8TMjZEt5YqQE1D8uYvAc26jTmMzIQQ6VuV1nJ2DdAMsMttvUDf+yPojJR5LzWwE047iDCJEB/CB8AlrGILMgXyV/zNa1UNHFj+nX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZ33tsQq5O/PXOyDY1JfAcKRHEBfh/dGYaJ49H8S7lU=;
 b=HUohR4pVahzgsvxrCVBqh/wtcuAvWgVYUp5a669xWcyKc00J64ZQuUJbRmVsuDHHUIjiANUviggFzMNUDCeD4UvVk0dXRtzf42tLtbicfQB+SMmyNorbPGY52jYY65ngrL6cizq7OSCER0M16ZiBZq/mCfdgHqniSgruzwptYO89NBQvtOane8kMe91ZSsam8DnJFsvF8+pBGjN6H8fom8lOPKc4gHtr1yknAmwI9DQgM4J93Sc44Q8r26SGX/14ALhsLw0K3l2IeHfkPg5Ew3lqoo2u+20T4lCoAsH++XKSpdOtcmo2zhhhb//SKmCLr4CRESBGdmAecZpoCTbfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZ33tsQq5O/PXOyDY1JfAcKRHEBfh/dGYaJ49H8S7lU=;
 b=pC1vjVkp8trVEi2SRQDvu6XixSmNEUrGp/nJKxTWUr73vRz2JVsnpRT71ERPscd5VpG879+t8+weQp9hBMPR86umNGIY7UKnfRNZSYoneoA2ehHZnnXtPWI3H9Xf7CvshoqUAc2LnBIK5d8gE1LaAbhPyokDdZ3+avRRNjmXrg7qAJXCNsmvSadk8FxX4pfIbLWDWC143dAiJG+dRb83CZelvWBnqGBZ9frIsv3tZRN7r83ai1ws0MpMyefvDXcqGgp7rnHwGE0HasmJq0w5hhGH8MzHyO2J+axX31cugLzZc7QOF0lF7xyCy0UzorS0YDlMWjXyFzPHW9U7Bn42og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:19 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:19 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:DESIGNWARE USB2 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 03/11] usb: dwc2: gadget: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:37 +0800
Message-Id: <20260731035448.252289-4-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7e08b7c2-4e8e-4ad9-9df7-08deeeb7899b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TNP4g5hVUSVIjJL26NUIqlveqFPdrOoA+n689YHrMDQzP6T8DcuFln+M47Dl1ZA5/KMURu7Ple3a8OYQi4NB3Fno6Pf9XvJ46WW5G5SJhDmB/Dd4rWT4uodBVV4dURNQxnEa7tPwSWF24AXkjuLZUKYBo6vgYVbF2hTjVeuzZrldCh3LJ9jWsbvagi8H4stn817xstQO6etyHaZrbWoWQ0spAJZEGNbCFR+ZlgLlnpIk9GG2S92y5eTwSV/IAwf7j1+El/Xy1iRVJd2PI4zba8NeaGgG1+/rUu50h0pdP7qi3SsB2xr75Qxy7P3tQWFsXxt01W3z3q9XzS/M9PL3YdmDrH+EuBs61VbQGcjpMhK4u+kL3DG2DAHPyapBOSUw9ZXudyiW2tcV+81swrDFHEXodAxNaeziNRMuMRiqckzzdkbC6CAH6NrJxHouao/Ma81NN8lk6NLDxg8rwtijc0mD9YKas/XOHDgUMy1+ASJTCTKKwmfusHFl8p12DWzJxgHk1qsshww4R4uxRXAXSBRFtASgiEDwKHQkKqNR3u6EB1N6ylVZU6vF2Yr29ObGNbFQ29k4Bx/ZqSzd2sOOxXopP6UT1XygxG00acuuaL/4LZXFhkxRPoDpA7peMDxfbvH3MHW9Rwr64o0TLkHGDtO77mJIKSKfeLVOuIvZuk6E+dTE0Lx6mPdrbn4iDILW0rpj17w/VJto5j25RFPmUJhokNirMXVARrVfzpy0hxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kSUaNTDQfNiKkzqTod5+bkHdGOYGUchyhCz9RmEjrwSLTqXr6OqS40AYaQkA?=
 =?us-ascii?Q?H/GlZNQq2AoEPmMsPR5miKZf1yXj6yTmevoxzi7tRbHFko+QwR5ScabsDAWn?=
 =?us-ascii?Q?+Fc4f9C6WrEqF3p77jCyeRBtU9hYcnJnir2K1AIjh8zUsGQM5py75APOur/t?=
 =?us-ascii?Q?SJM8+sUEiqCtV95nSElWQHsYbpZLG58mL0aVTPT/HOaAwRAHCU2vdlD4+D21?=
 =?us-ascii?Q?bgYNcWac7dfD0OWA40iaWV6dd07tomG9kGhf9Z5nPg9gLKUPi7jSkPMgXWWO?=
 =?us-ascii?Q?h/h3oYqkmZDpvObcLtAPRXicBfhE7m48H0wj2pO00JO1UvnC/bP3V6cPUOx/?=
 =?us-ascii?Q?MX7gqMXK4xTcxRGj55Bd9B+JNDqSZNMeQx/UcBi1fRdIHm8hvIFKKd2c36je?=
 =?us-ascii?Q?iedlYNmFO0QZpWkWJSgPyZ+Z4F4LyrEMJTi6rtreZaxgEpWrFNPtk5wQA//r?=
 =?us-ascii?Q?sV+JS7QF6qypuKmpwsyf6EskTSOqhZo0+QN3R2mlgDEK0j5S7sh0sRnOjWpz?=
 =?us-ascii?Q?BxBMiNlllcHkiMGxyPPBAF/D4zuxBK4Z8kXBWOnsat8CKDCCrpKhQ8rdQprd?=
 =?us-ascii?Q?juBakBsi3uqsNmQmLLhM86bujwuTOay5Z868PxgadblDgv5fYb0GUmAgdwfX?=
 =?us-ascii?Q?N2l7O18/54gh2F+XOHNZRYu6OhUAa/7z9NBHLt+tr7WXdIkpiyrMQa7tQ23a?=
 =?us-ascii?Q?8wefZFXWHdI4tFzk332ZYBFKp4tPl6ms8cEZ95VuCgKnYFqeSW77PPhU4O18?=
 =?us-ascii?Q?LBxhnm9eOtiGFcu8s3hl6gDnn0uGjSei8wk6o8DtUMuqpiuR8g2SLhuLhtai?=
 =?us-ascii?Q?kylEYjYyOYSD12cF4Z5lMcMfso+V2/BXzc4JSAfI1Ap0nE7LerkMV/ZgtkkR?=
 =?us-ascii?Q?Vkqz3YUpmwunTGW0UFMLsV8zbe3Kq1DoeBP4VgPdl1uX02ebL602ekHmqFNZ?=
 =?us-ascii?Q?28VHSa06hvzgvtiDuyUxZhxnlByn1req5PY1gnTmuUa3JMh7GKpUiJVGGqqr?=
 =?us-ascii?Q?WW+Kt6kJyUKQ3mAu0ZkAxFt8KNzY/12nvAVdC7tyWY4isBejLBYs/VJnP221?=
 =?us-ascii?Q?8Wg9bY7Qeer63pkPIUrrIJzz061exXcqpn4HNh5c+uFuHHTK9qreVpkzsVo0?=
 =?us-ascii?Q?9igDFKL6uZ048kuDVPKz1GTgCPi430crN0Eo+IKsEiEWVuppP84Km91mBXGw?=
 =?us-ascii?Q?VLhW0G4yNljIBKunA6pRDxbG91MgpUlzq6PJiZPqOhqJ9afpwpSPGR9tLKun?=
 =?us-ascii?Q?TjbK0ZJG54w8GiiWkZMwNiXq+yk8vUL4OVhMsh3YcjfauRPigk+ULazjjvRE?=
 =?us-ascii?Q?FIL4kWsj85bZqVNVVulovCLx+NbIXCIbcLOX+RtG2x6/chJge2kqajNrd9Nf?=
 =?us-ascii?Q?AMstmN0iqDUgMZ16jRCjTnyfVkOUoB9aCuwCV1mcmwEoxHCOoAaBnaPAld8F?=
 =?us-ascii?Q?GmF/lxey1HOE1KtrcOBOuKHjnbGFrJwShIgO5/6fqmX56E2yRlv0Kg0aK+vE?=
 =?us-ascii?Q?UOJFlCXk8S7DNFwJdHDn3Df+/anzFDheB7qoH8FFpZepthovS2qPqn/nwQwS?=
 =?us-ascii?Q?/0z368/rlXWD5hZhoe27PburvFAQ341eiuMoreK4heE7h5MaW69TgNDlS3rb?=
 =?us-ascii?Q?vRotEz0WaDuJsBWCFpLq7KGb75loWqSgk0fpsK46Me5MGpBFl5vbT70RU2T+?=
 =?us-ascii?Q?52A9azaUDMjTGfekwI6VzRAb8deVp/bT/i1/p8Dpe5jp1nRNLZTBSuP4yrQ9?=
 =?us-ascii?Q?cYYv+IArkw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e08b7c2-4e8e-4ad9-9df7-08deeeb7899b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:19.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG7qIzKQzU5LXQkWmGWqBN1k7q5VD1X+MTaLMcfkBdPuHwYgoct8ig+B3BkQwTo24/LTfnlWG/LM4Wuf1hLRzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/dwc2/gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c8b02c27d27d..dcc9ec65a474 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5044,10 +5044,8 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg)
 
 	ret = devm_request_irq(hsotg->dev, hsotg->irq, dwc2_hsotg_irq,
 			       IRQF_SHARED, dev_name(hsotg->dev), hsotg);
-	if (ret < 0) {
-		dev_err(dev, "cannot claim IRQ for gadget\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	/* hsotg->num_of_eps holds number of EPs other than ep0 */
 
-- 
2.34.1

