Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021140.outbound.protection.outlook.com [40.107.39.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EBD33FE15;
	Mon, 24 Aug 2026 02:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787539947; cv=fail; b=bHeOYEsp2hu1b6d07pE7UfL1A5xegOOfgAvUR5rG4MhdYTMVQx8Bzt/IP01jH1UKmCyM6TdAljbYKLqXelbNRaJGX5ACEjMjKh2WVyCl3JlsdWW7r32NIcA8L9IKWK2jGrwcSsI6Rf3AqP2GZKvOIg/1QOguOs7COQjRoH7S5rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787539947; c=relaxed/simple;
	bh=MRsdAqyYRfZBGYHzyNzvAX1pXZ7kILdyY+fok1CxoMM=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iSUlQBhVdGoqQ1ZTciGo48FxJC1gKRcr9WY8KlnJIOqXadfmzf6mJ2sf8HKWq+3e0dUoiQXoqDsQ4rsJT5DjF2hMaSjAFu66Kz4OaElX3Mi+xieQC6hpX2UGFh5XHDGkYEYEBZjJlcAxoNR4OyzUy54huHK8a6PHtbpZBjiHeGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=hvnEovih; arc=fail smtp.client-ip=40.107.39.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="hvnEovih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVAhMkHuvpiHSJ2GiG7jcLoyw6KCBgE114EtpXGXIEqNjTyMH7olVUYFEZLNwkw1tDutVk+ABAtE4ROEE0GmY8n7TXgkUDrvdnXyOgDL1o0E5+DRkvxDkYlElNk/tGQoa1FjS5NA5qMSe42+OgckmayCLjNbH9y0awOQDmVWM0dHN1rDYfTxGmfugGDqrEhdvdKIEPH3LaK06s0qheh7xK+Od/8lcMqG7dfmZrk+PLHIGftnLvTAkUsSX3rHBZbgN1L93l+kKHODJs6hxln2Ei54FwzkH+kIzaBtrjQ0eJSHpd9sHG3McSGKC+A/Vyu/kZNtkwZ+NkrvzHm+SyixWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty1dFSmK9iDqtrDTj5CGrLjcwyllpR5d9hg9DhTllUo=;
 b=QQEBPypbrKRo5oyPgTdbTY/SxPeNyEJuCHZWtEbBLqH1HyE0ps58I/icGHgQyjjFuTn3TlO2ii2dwBqJ0wFPL/WnYLtv2jCTHbjrb/Sk/FtbrlbyJG+tlN3eTP92F/Oa6HVBxHNLO35ui09ZGj1beIX0pKStSJFSyy/DOwGa8UAfkbXQZ89wHyesm7s2sMmOkcSUPoHsjcB4HdZ/qKfC7vFQ2wlYeZvCqXZHzaY8Jp6OCWLd78U24Gfa/XvaHXJZ/pB0Oc2GTaG1HQ1woKxHETKSTCsiZututh7UyhTGsGG6fiMtQbBuH9brBAvCTN67K786Dy3meSzSIZUdcQx30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty1dFSmK9iDqtrDTj5CGrLjcwyllpR5d9hg9DhTllUo=;
 b=hvnEovihfuGBqteyRo0hA+l67PeEMLuREFln6OOIFY4UeUqQDkrC0JxkU048H2G536Izr9v30np3HwEavfcARZMWuqMEuJJxhD29SDFA7lio643X62wH8XmysfJ1ehgi76siOQSegHK9c/LHhWoHLBQDN7iyjCuoirYJVHNf5PJCTHO8x4VdKjjkeLbK5DtaeBoaIo0YqdlVmXRlkWtCEl6mecrzIT2NP+Aj/r7gRv+InR5+vdxX7P9EkuffUyKdi2Rnt+QIskfB/go+lUyIqTPQbe36wuZ4E14GRmMvQSv3R9rVTvdTrQyrsajZrmq488m2bRiX5nNkfZIDWNbvPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYYP282MB1167.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Mon, 24 Aug 2026 02:52:19 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:52:19 +0000
Date: Mon, 24 Aug 2026 02:52:02 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Message-ID: <aouw7rH6FZxscUTO@0d3a7a881997>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEWP282CA0215.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1ec::20) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYYP282MB1167:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cfef0c-f7fb-4c3b-5775-08df018ab6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	aeJ1u2afrLjXKtXnkJDw1M7fxIYPM2GrddxHirzpIb4Y7P8sdBIjAYXyH5bPt8s7dHfwPDOc0gq66fZMECa0DCFyJK5AKa5qWy0wba0iEDYy+uKlr8BeViomB7WhP+rAIOek0tD58+qJHVOYWArN1Kfsws/EeCdsz609Rm1kdF4da9wAADYTUPbqFNtM0IBv4/LvDM6Gw3Wrs6BHudfUhx6WXq5erAz2MaGBjfVy92hW6N2xHE7amvoZVJKIcYnZE6qdUBVbO5PsOhBwwWeabIR/6myNvUIe3MKVkIdjeYQyLkNOR6qGqRQ2RUFKeS7lkFDCtiLVFEAT+NhsfeDIPhGPlHYhg0yUv2YchvP5aPV6r3DwDOUYwp/TlUqvktfVKyg1lorH0r44UUexQCT3cGd7JxgR9SMHEOXnPvF/MduJ54jAjJa3miEmUEssmzOz63S0C4ZwCm2mm4wG65M0QYXOKZtSKmddaRn5quDVlsob5ojIhTCX1hYL8JPEqRnNCuR3zFBMud2ftB2646LGnOiscsuXzK6K2+DQJQeY6KKJEygcTENKWk35raESrqx/LqPFjv8LHjeAa0UWFPFJdu67vHEKm7ogq3rBH4c34qaA0aLDepHr1PxOuCPzroCQgC246EkyOS0p8dZSrAZBvTiGIMA45/9SMZaPHdD64Pk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1AkQ3irEDhOLoLfLPcy8ycmCdviIKX/M01KsjAO4sV+XUnoHiumzq+oCQdxz?=
 =?us-ascii?Q?1C/WHfBRtWdAqYMln07tSXrYKm5uMHf0kZDX3pZKpw3bOixSCxSJwTdtNRLr?=
 =?us-ascii?Q?Yf48IyinzJ1hc65AhDQ50yJWhhXax1yjEtRGgDQPvnQw5G9tpy2imJyhhROq?=
 =?us-ascii?Q?+PLilanV+66nR60oUVQmjEcpmc9bgSV+YFpa2E4a9+VpOfyml+NqMgevr6Wa?=
 =?us-ascii?Q?cHE7zF99LG5MDkxAGuaPGzyRJiZV4cVUN5QEz4bUkqYA2OXjNuJ7ShQhYwUy?=
 =?us-ascii?Q?a4/ncfVfzUmCGn2orNUWsYoXLqHBHpM7GvLag+A6Ru4Urk66E6s3uf9YAhEv?=
 =?us-ascii?Q?6Iw5rEiywW+onTD3TH5iY31TN9y2qgdWDskGND62LRmfXTpgKMHKPTdxAEUe?=
 =?us-ascii?Q?EEpxRrEMVE1opRZm7slP77waQP36Vnf2vcasUT3+lNMgB5ZeF0iefAXnH7gi?=
 =?us-ascii?Q?o5LccIdEuxnuM0IArGJ9DEa7OrUW4P7qfEqmdWde8TMuteVMOm8Rw9bPewki?=
 =?us-ascii?Q?puOTm7TufXlnea7mlbJwKAI3nkOIprIKaPlWnzINTweqdhB1h6rOgVh3nZse?=
 =?us-ascii?Q?nCDu/tQntiFZZ/huKd52NJKaj9+jJI5RetHFzviYdJ4hOvvQCu66ZIPaveYz?=
 =?us-ascii?Q?rt4LcFyvU6aSIAfg/w2jv1U6upwKH/1Rg3xw2m/gvn0M+25aYxcD6FFw4G3h?=
 =?us-ascii?Q?ACRVP2saAepppyIss5ChdLL62cfNeqOzDOIrQCOziw3o1gLilK/6z2ytCz5w?=
 =?us-ascii?Q?q3BpqlgElacuObWu3XUUGwtQmbYqPOQnhzF/XaT6+HrfCJrLXtb4mAi6V/kI?=
 =?us-ascii?Q?v8mGkHzlQ4qQP8SueQWkridoFa4X8DW2EQ4npkY3AVkua1XU0SQZQ4ig98jg?=
 =?us-ascii?Q?asMz8tICZd9n5lZvN0hGWRlKMHRvM3vD5kdotn6sQdVWRfiS5Vp0MxJSHSnr?=
 =?us-ascii?Q?GnBtM3OH5frnBv6JnTuhLesFCwttfDV8ynj4Zaqu57lEYYrWm8ulCGXQJikv?=
 =?us-ascii?Q?L8+oryRYEuNtDNGopHpR5GBQFPqKa6fJKuJfS3vKhvRSIM4Zx/sBVG9/Y0SK?=
 =?us-ascii?Q?RUXF6QSZs34gSJ66j6x9TAgBnb4WjjfILZuesr3kVbToFgwWPG6ge+Vo+Y6m?=
 =?us-ascii?Q?tIKKH3hZayAMrIKMb2zL71uUkHx1j1x+cbeQexnN8yngRTELFhSR6F0pfmrI?=
 =?us-ascii?Q?fXvyPFDIBccBnX6qJsnRFavx9txjt4SdOJ7LV8b16XdHUJiWt7jzfapUqxS1?=
 =?us-ascii?Q?q/pPGsbsUT5Jbt5HZ4UBuxERFSmrtZDt+6RQMEySGckADlR7FFnQnSwIZ2aT?=
 =?us-ascii?Q?laJv/oWg3R8pkLnASd7wvH8ZaBfAbK2EnFdxXQo5RA2DMzBAOt0nTcL1KHaZ?=
 =?us-ascii?Q?ZsDkdSk5yCXHnGYiJ+ba5bPFqqzuQZbs8EdApmiiAy0UA3CNVLBJGpDBqaY8?=
 =?us-ascii?Q?4VRYl2LzjTbSqWUW08iEuzPNWrnO88YzlrbTADkzZkSYEv5jTMOoMCTzVn3h?=
 =?us-ascii?Q?2oTzL0diEiEJ1zNPHGRYylFvMdXn3DoJ/vooRoVEGXSjRkqcPDtlP4bUdGwK?=
 =?us-ascii?Q?TI3Tx0bbjbpO/EkPEdaD7+4bxbd/ip+PDvr+meGeS94gULolCF/DjNJHRhRY?=
 =?us-ascii?Q?3TUXSaIi+PMQjVwekOvCEhaQZJErrF9JutfktobSdKpExRDysmwuamSHAto6?=
 =?us-ascii?Q?FDcnn5m2P6CMW11ty1FDMvdORciqcwxpCigX/YWhPRPvq2ju?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cfef0c-f7fb-4c3b-5775-08df018ab6fa
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:52:19.7956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfrEVvf08ElYS0Lq5R2x9jXJDCiYa9YCns6xDZsk6rSY1nTRkwmx/jwQt3F3ji8bE09YixRIFXZRgkAn4LGnKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB1167

The rk1808 is the npu die in an rk3399pro package. It is wired to one
of the usb3 controllers rather than to an external port, and it needs
its reference clock running before it will boot, which is exactly what
this driver exists to do for onboard devices.

It takes no supply from the driver: the rails are sequenced elsewhere.
Only the clock matters here, and that is already optional and handled
generically.

Two ids, because the die changes identity as it boots: 180a while it is
in maskrom and then in the rockusb loader, 1808 once it is running.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a149..e07f509ac751 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -134,6 +134,12 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata rockchip_rk1808_data = {
+	.reset_us = 0,
+	.num_supplies = 0,
+	.is_hub = false,
+};
+
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb-a-connector", .data = &usb_a_conn_data, },
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
@@ -167,6 +173,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb2207,1808", .data = &rockchip_rk1808_data, },
+	{ .compatible = "usb2207,180a", .data = &rockchip_rk1808_data, },
 	{ .compatible = "usb3431,6241", .data = &corechips_sl6341_data, },
 	{ .compatible = "usb3431,6341", .data = &corechips_sl6341_data, },
 	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
-- 
2.53.0

