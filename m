Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022108.outbound.protection.outlook.com [52.101.126.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4734B1B5E
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726726; cv=fail; b=pDXflsa5AZP3LiRCUaFpNNIkAU75fQ8slcSo16Jb/PFIH5h8mfke4bvK2tndMTi7fEpLTqAttlA/6cKq0l8FhL6+zrAqPKy2VWCGk2ZFOOfiKJn9auGq6Sp3lDPg+fvKkvJHYX0EUmRS0tMR4X9lbJln6Ua5666xhu9s2MZsgeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726726; c=relaxed/simple;
	bh=ZCQIgpDR+baR4xC6PpDoeVGccNGW5tygG/BmbjXkgpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RnMFbRmyrRgBWSwKuvFZx4EVyZOGJmSn4CYp7d0MLA/22bxzZcUClLvGlOUxVyXz8ZQRtbtI07Udguv6oSUeN+Rb0W/qeCHmeWdnf37E/gOvaLJ5swgwNuhO5E/ZpYbIl0rECKiM3fJt6quVGwpgwNq45FIdOMndyAQYfkLIS8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=anXC2ZFP; arc=fail smtp.client-ip=52.101.126.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="anXC2ZFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNXN6rZTD/tRqExdw4k/0NSITuxZi3uGIjyXC7Q9VRG+2s2xHVTJUz3OMg9OAmimOSo5SKycFOLzhpdDzYmMUlVCiSs2AdNkqD6+zMXuEYyIytkjEsMoqSmFBlxHQzYwsWvHNQAHitX2jhh3tiCkfIuUwHcD4Bz2aUXkYBaEqJePxEEw9NdMYJGt7K+VgpLR0ahGCoByXH3fEaVpVSadPR4h3NcTeUGqgoAWanweZclQ//vL4eNQJ/PcfCSyc69HIMbjneiA0nvKau/cU6KaGv2xp3mW8PhuT2DJw17DA7gbE4Z/YkA+5XahUuepOj77Ly09iooWNIn5Fp9tAdolgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ulBvZq78Fiq6haAmutBZb115XEeNL2JFcLEpgrmPX8=;
 b=pDpY2oOESSyxzyagYTEJCC9yG8byHxemVgzV5M55QUY//DxTQPsZ/KmOV3gWss1F+7HMeNp9eb3DQpG7bYlYJGL63fKxAryWzdgnKVcqtTxzp+/AYtLAMS82H+gKp/HQq/kfcCFW6BtxmQGPka6W5pGqItEEYv/DFchBLp9BuGaUSh5yabyvUaQkfWgr4TD57778wuOA02NZbrMYjFNvnB0LxkR7Tq/SJQdYDoUsnyAs3jtN66zDFvrVb+ZHLjJAELF7N1bEC1uOUjSENuNbSlbM/S2DCDEdR0O2FrQJ46WAVXtWV3TJ1W4Kl70g90CfK68jRk21oyC8suHGWcrrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ulBvZq78Fiq6haAmutBZb115XEeNL2JFcLEpgrmPX8=;
 b=anXC2ZFPNuPHFwhpM5b2m9ze3ZlLEO5v+tOq+2jzObIQ1Z07QL1/zYf3sTzwMu4UGlKUmoWHBsFkwsFueQ1Ve00Kdmam1KU/DygwsrDl9BE6urLTQQeU2xZobEHQ1yxnO6gSfvr5Dsmwd8Juo+6Chh/ZQl8OJkP2lCTm9ECA5nJpwe0oPJ7Ch4d5GLfI24q+NeO1loHuTXU09Hyg88wrBcq5y2P6rNxEMuC9nuMpchSggu86soQUzx7FKXUtJgeI/wuxLzCUb/s7MS5EXFyPttJOiK2FfbONV9eNnOYu60xrm4PBoKpdk0Hlg4P3ZvGyp5lp8QSOEKz1T9stNBpUfQ==
Received: from JH0PR03CA0008.apcprd03.prod.outlook.com (2603:1096:990:6::13)
 by SEZPR04MB6947.apcprd04.prod.outlook.com (2603:1096:101:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:18:20 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:990:6:cafe::1b) by JH0PR03CA0008.outlook.office365.com
 (2603:1096:990:6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.9 via Frontend Transport; Fri, 18
 Sep 2026 10:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 122.147.219.42)
 smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 10:18:20 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id 9C10C2F5;
	Fri, 18 Sep 2026 18:18:19 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] usb: xhci: return an error if the host is not halted
Date: Fri, 18 Sep 2026 18:17:54 +0800
Message-ID: <20260918101755.18141-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902101510.30246-1-henrytseng@qnap.com>
References: <20260902101510.30246-1-henrytseng@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|SEZPR04MB6947:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 92ea12c3-c5e6-4c54-e6c9-08df156e29de
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|10067099003|11063799006|18002099003|55112099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	H4OhNxdiXpYuiMmJc1XU2SyHj8dwgSZ5k8EA6aP6rccbA1Xc5PqlHy6U0MyiMcyKnvBfWeo7/dgxayX1WMm89OK0POIJiJShLZlutk7tupZ499K1qhdLOzH+FwLNLuwKJrQE4VVNm1NuY9wnkoMGEYuZK00HhWRi/BSvf1JMTYxOLbOTknwDx6xV8fRiiX7HmZCVsyZNGjhvOh2FGMDnV3imxPZRCWech5fah0vlthuqo1KeMPd0q7qXpIHF5563shFlERPekoSMPWJXflFTtLvcpZ1RfAiHULILdHrFNKzIV8P5ZELkN8PR+0UZ5WNiUkdQ5H/f93Wefayu+gzJ5qgDPvNV1XmDFqsdP39xdCvnmrXP/CyBJnNBYW+hHa2J0pehwlSWmOqFpGDagikl2iLVmvAoK2dlYBBAhW/CwWl57zgJ0aa6kTRRoxLwwr3TJZTif8L08bNkCp20eIt/VK+DUzG98UeWULBzYKdz+IvlbMENA8JWBiVaoR2URhrbmhGo5Cc6UcblYMcG9Ha82XrbF0cNtPUn45bZ7cix8mw73xTXTBIltj1C8/l1cET6B8o6m2PBH2kvOrmllLjBfaz8yIFVaP87ym3KCpVHEuse9HZCva5KHrslpAwHGtIb+QlFCG/my9Or0forYktHeK52CZ26WNkNWiDD7jmABtSywhmz1z+fdh1YL6Ke0FLRN5w0c4bYsQJxBdId88owXg==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(10067099003)(11063799006)(18002099003)(55112099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PpFUPLXFgl7V4X8g1WGCgSUoRUgzTjvNqAhOiqSeToERZ3cCl/yLfy6fzcGq7xojvZCrHkE8Ewdo0sb1I2gKqw4NvaFR23o5r9hb5QI6RfgwrczsS+UTuAxfvDLzcFRZkmJuWXswSFLk+6tc96prUpBlmp6wiVRNpdYdFD+cbL9gEYxRkrZLiYwoE0BbrW6dDkXOmZ1XJ0XC0zkv8ruhiNTo3u5xFOmDWdwZMtLmKlMvqYQiiJp5eo7xL3abDxnLQHV3yQUdRFsnxMfnx0/tuWTaI+ssT/KxJSaVFHvnlol2KuXv3uWKgGoEq9bK14f49FSRUt0svjwBlNJJqFOGzslD8oyVy0nThPFVZOHeq+jVvJv2mLzy/SAH/iOwPHrnS+ajlWyi2YXIGjmG7vDUL8WVMdFAJJwe64FEX5xN5jLi11Gftnidu/TD4m+IRypr
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:18:20.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ea12c3-c5e6-4c54-e6c9-08df156e29de
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6947

On Wed,  2 Sep 2026 18:15:10 +0800, Henry Tseng <henrytseng@qnap.com> wrote=
:=0D
> xhci_reset() returns 0 when the host is not halted, without ever writing=
=0D
> CMD_RESET. Every other path that fails to reset the host returns an=0D
> error, so callers that check the return value are told the reset=0D
> succeeded on the one path where it did not happen.=0D
> =0D
> Return -EBUSY when the reset is aborted because the host is not halted.=0D
> =0D
> Signed-off-by: Henry Tseng <henrytseng@qnap.com>=0D
> ---=0D
>  drivers/usb/host/xhci.c | 2 +-=0D
>  1 file changed, 1 insertion(+), 1 deletion(-)=0D
> =0D
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c=0D
> index a9e47e178c28..2af6a7b91e55 100644=0D
> --- a/drivers/usb/host/xhci.c=0D
> +++ b/drivers/usb/host/xhci.c=0D
> @@ -195,7 +195,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)=
=0D
>  =0D
>  	if ((state & STS_HALT) =3D=3D 0) {=0D
>  		xhci_warn(xhci, "Host controller not halted, aborting reset.\n");=0D
> -		return 0;=0D
> +		return -EBUSY;=0D
>  	}=0D
>  =0D
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Reset the HC");=0D
> -- =0D
> 2.43.0=0D
> =0D
> =0D
Hi Mathias,=0D
=0D
A gentle ping on this one. Please let me know if the approach needs any=0D
changes.=0D
=0D
Thanks,=0D
Henry=0D
