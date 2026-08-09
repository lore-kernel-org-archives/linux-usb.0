Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021090.outbound.protection.outlook.com [40.107.130.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952E3BBFD3;
	Sun,  9 Aug 2026 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.90
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786266303; cv=fail; b=e0caBnPlWLmimP5zmMYs6fihmhgr4beGAm1xel/b3RRufrc3f+MOxc31dJKXZElEzCdkKR9LReLKtLIikpPMP+G1NUL61b+EwdvEq6dZTdQrytcDrvOafifrGv8FrNQUQ+7FDxi+fvF9ps1udsM8eSOs5BVnt15rM/4xkv1t1xg=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786266303; c=relaxed/simple;
	bh=y7o2w1yMSPBxOJljnW8lhrcqquuTpwCROHm5t4n4l64=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ea0wgITH5v65exii95sbnaebv/52cJhWuQh+t6LcoUKLGPmAtc+aQERi+dNpFVLwJ6HQ76Nczo7N4OZqeRSsYm4ZaVZ5krH5zc+o/sJK606bsOmT/Z+fBvHjyRI/h6onWBnmbkODO9XO2+pUP9uVDg+zf0a1atj9YMKuFi7KqZo=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=R/xZFfey; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=R/xZFfey; arc=fail smtp.client-ip=40.107.130.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="R/xZFfey";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="R/xZFfey"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oj75vmBhXlZwPkiGFljCAKlEkV1ChBjJwroa7kLi37HcmGvVTeD2/fFWvGH/NgEqX+Yst1J1gfdQ7q4Ptc7Ct9ONHTJ9ECh8EXIg6mVVw28xx/XH6wKlqDNNuSfUDNmrCn5PoHMV+s5HxVXQClt3AN7d9dzUYe8xYAWziPuvPReCw6/jfViU9gqShINIO+2evUTk2y16wKA4Eg6W67fCVT1Q65ach93WBcxp/f20cIor09yjPdDZJX32fK7Fwnvnvv/zfREqa73ijVg/Wc4/PoHpsydoGPsv1vLFuwB0gS2G6/o9+Z0We0MWHo038uUWGvV95log+ITKvDOtMfyeKA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=ZQ+ohLeNo2VZxmWg7yzGK+QpZ0SlZPL6VUdtIYu37LEWuXMQX3jiGZt0VMAbMwqix7EGwoyZtACQLnSKR92K1asr0lr7qu2E14LTi81f8frh9fS+WME+6bwqup7oIkcVREl5IPLfMzf/5S4hwh+Ck78ArJdVDck23DYdC9WWZOsWoLsApY3LIv++BWA991teeljBPQX3L8CMt2rodXdbP+Pgmt5fRw5dhDAekML8qLikm2ShI+FeWHeUgHhh089nj2s6zjYMJ7e1tPFKYbD+vPEfdX7oW8vhEYwYlNTm7AuwQLYtNdVkNQFh95O7TgbpU5h1fDhnVuX7mec6qm7zzg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=R/xZFfeysKAS9BhqJsiJR3Fy9d9dtyAy8d+LpVUOMWthyvZEsHBaimHmuMMAxUaHVrtbBoOnivXnTULqbcoJZ1UkpZ08OBiChWfvepMGucwILKSZS2jL+iVvaJmDWGfsVshYnchUXKEexU0tkEpz9Xfv6t70mu+Y3TklLBS03RXigyzSRHS29Vm934xxe0mrR1bV6y6IGGL78XzYNORxARjh0/Yv71Ncn9CH3Sozu2aPvUYAm0Jf6lMzKAc6bHlBz7XKXQB/sJurVVSBPmyMK+VvP+IbmJRb29+ZsjaPYyiMo8GqSg3kVR2opuAgwZ8Wegh7wVAyEG+fnkFBB7vvPA==
Received: from AS9PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::13) by DU4PR04MB11790.eurprd04.prod.outlook.com
 (2603:10a6:10:625::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:55 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::35) by AS9PR0301CA0013.outlook.office365.com
 (2603:10a6:20b:468::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Sun, 9
 Aug 2026 09:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Sun, 9 Aug 2026 09:04:55 +0000
Received: from emails-8823644-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EAE587E906;
	Sun,  9 Aug 2026 09:04:54 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Aug  9 09:04:47 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786266294;
 b=Cw49vldqxnipDrzIzVAQFv56bIAl1tcm6LVLmwXXNivo1uX7dswAUZBmvnzWZtw0lqAEO
 kfPKJ6Wiql7rw8BR8N7kXmD/Lhc9DCqHGUOEaH2NT+xcdZkXmsxQ3hPJNTYhh2LUDWlERGX
 ERaqGOMTjGSxuR6RGABlRQTF6BY8PeE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786266294; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=IsCsN8vFtNn131n5AIINRgINIHC1cknIA+lECsNJAuIURt61zNgi4SAY6AChLKkcV5rqj
 Z7pU7JOUKIRMO1/f72Tr7lPzeYilRexQbzqjb9ldbnviP2e8naZF2ly81Ts+7FEmO5rYeth
 cFrTYkMlq0lme8jObVxZ3rTZWbRdlyo=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=R/xZFfeysKAS9BhqJsiJR3Fy9d9dtyAy8d+LpVUOMWthyvZEsHBaimHmuMMAxUaHVrtbBoOnivXnTULqbcoJZ1UkpZ08OBiChWfvepMGucwILKSZS2jL+iVvaJmDWGfsVshYnchUXKEexU0tkEpz9Xfv6t70mu+Y3TklLBS03RXigyzSRHS29Vm934xxe0mrR1bV6y6IGGL78XzYNORxARjh0/Yv71Ncn9CH3Sozu2aPvUYAm0Jf6lMzKAc6bHlBz7XKXQB/sJurVVSBPmyMK+VvP+IbmJRb29+ZsjaPYyiMo8GqSg3kVR2opuAgwZ8Wegh7wVAyEG+fnkFBB7vvPA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com (2603:10a6:208:132::21)
 by MRWPR04MB12072.eurprd04.prod.outlook.com (2603:10a6:501:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:42 +0000
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97]) by AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97%3]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 09:04:42 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 09 Aug 2026 12:04:25 +0300
Subject: [PATCH v5 4/5] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-rzg2-sr-boards-v5-4-19c662358e36@solid-run.com>
References: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
In-Reply-To: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>
Cc: Josua Mayer <josua@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To AM0PR04MB5796.eurprd04.prod.outlook.com
 (2603:10a6:208:132::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR04MB5796:EE_|MRWPR04MB12072:EE_|AMS1EPF00000092:EE_|DU4PR04MB11790:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6faaee-bfde-46ea-c9d3-08def5f547c3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|23010399003|376014|22082099003|18002099003|38350700014|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 hVbqo9ufR544aLrwOWpWv3TTApgfytHtV/JZJqi2Z8lmkdnGGBqhz9qHRP4y06DE8uBn91rpv/o1UtFWOK/e92rT99BWuUttG2UkxEd+ic0Rdzffcba5cdWVd0ec+NOEJbkkyMqFR/JncSxC8LoukhfPdth5NispR6S78rtQiCFZ3o+6jd5TzCXe4J5a0roc/Rthgo/d7OZek6b65BkHsO7+opXB8xSh7wBmNd5M0htgwC75xJSCIXPU35vdXcsKwkPpwIJqhHBXaZyqXyZ71wcrPPAYSNL/pVx0CzXDgJgvOiCOa/UwWUT5Bf0mkrmuvokOQQlND28xsTqKqgHR19VrkzlCOHCgHx7cfycH4OLiX/U7X2gKJyfUIdxuzMPRYqCLp6/rOXx6oTmI859wY65sR4MCRrgNVh6DOGDUeA/iag5xfiWOUd+WcUDF8Dv3XDYSlivk37NU8+DCG+9wIw0YIVBaYJDAhG7C+IiGnj1pyHFg2ULSXoML8R/ptXGVQk1YJAjwB7eifkMZXgqTXENNEIgq8F5ccy8kHt50JdKJAUsEGSoXJyWtzbRRayIvNnyAbV40xXc7oP9iSp0GKKKIp8vUhfHLrC1u3odCCY5MTyvIVkPxn895w9QtwP460ld8n3Cp/GK35PaTvx4YGb3mwZZPovkaePYauo/HXddzri08gLpZL22cWYMqcdOMFXmMRgIlqhvP7mF3a8j+IuRzeacgkva0yTfFPkHlfPk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5796.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(23010399003)(376014)(22082099003)(18002099003)(38350700014)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 IQjF2uleutwN3fsSfuHJcVCxnIDoknqQjNwnS9gbiz71iFM7uMB893C5n5kTnxek6Yosjgvh1AzPMN3iQrvJcT2bfYOv8CxX5Vk2H/h9XV9s3YRAnKJ+oehTJ7rke+a9j837qVr395VLpysW4sloOYvWQFJSLgmnrxCvwSIHOKSLI1Bm9MoxoKYCAn83KS2xn5IVZTikPgalDosh5lPu7mXL7eX0HNqnMTQwym4A0cTEReV55SqYwxaUDPJ+kGXuEVpd2YYccXgKE6SmPYPPRaajw1U0QXsJRzLClBqZcmr6bN03OxwQFrVJdxaCbjObBDUMRf7Tm/h3SMOmw/8Unw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12072
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f548ff056c224e59a3b42f58da0299ed:solidrun,office365_emails,sent,inline:47401ce07148f66409882c1c73d510ac
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdW+5Yq17z+XURYWGohWLOhgFjLUXsc1MKdwe8nZow/Y7zfZ/XO/tcpRnMSGezrXKzWldLMNXJnryA2cSN0XD7+q3LIB76aoG4AQmXNSgnaPgibnBuY+/lCbrJcxxxBMs1LxjT17k8go65KU7RLY8iumV31wFlXHBYSOXukImx7+5KEwL3KBoLHC3TnP7+J4TxIwQ7wIsGOI4oxRpDcjtIOWv9MKB5B0QhIdidE4/P7w+uJRiWTin5o4PC6Ub8zJhWj+5ercJXlsxFMVpKdAU/xnP/bGPwm85Grci1w1iF5gSpT15VsfAcoMtfLj9NuOw/g5SDJsteVz3WmZfw+T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=KV41ovNvJL1ywNU2aM7Xjh3pOVzq13Nrf+PryUxcXImiIi3SXCrlHvpIjbCJ3q7qSwh3Ul9swmZ49vGYQ7ihkgVB5Mew9ONtSvGifqBUKKR1RHl43soguWw8yI0947ynYWZyEV5DWIEVic5KmXwmgzpCycX3e+pLhnq/DlvmgwEYhx+EZ9G5YmxGM+7Mry7IRkUu3UK7nQ8ZyT/UgMob5WzL2qsYI4ZJlK/TUh+v66JmLK09j+7ENlC79oZlrWzce0G4mb00sBLePi7o6Be5wQx4rHfHOWErnxtu+bnqgkE5OyV5asB3mMbJpmvbr8w3p8OOmSIRUcl3rcc39kcujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48714f6c-8ee2-49b6-d19f-08def5f53fdb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|14060799003|23010399003|376014|7416014|1800799024|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cITxszxObPF+8Bbs3Tb+MExWaSlqUOCbKPWzRz4wdAk/KtDcEtMoxMevqbbw82UvK0WhEUUVqV806XdRG+f7lxp++SHL6Wprj/S6cjnY4Y5r75AUaZToTB3H/CSWr12CVeqF9eD6vYhuERzO8Ra8Xqs7E+QiVdAuisdfZoqdhgFLWEixzqnrH8UVRaqfqa0BNApAPrzKn59ApV4etpnFmUK1NDtyL/+KblM+ULA/vFs5p70X5sKLO46nnF+iqIrmlqduYQ4r7+hOV8rJePUYQJWRhKBoPTdL8l62b/9ehUhZePKJGhgUECVvWZEz1K/UELqQuo91zNypCkt17mwja5pvyVm6wnHtXwtXYM8qTe0XU1HlAuSkFKA5F2JoszNqmtwFu7XLgaZF/AKIQQf1gn0gpcAkmgSLRAGv3+K5JVZ8W9vS97vxLDL5sJQAHOjACVRb4lnVIgJEGL8y9gTegZ8DwGzyMjzYiRv+fB+uSdgr4qAaabc780rjc2WxXDjVjH4XM+SsJRZRO+y6QXuATDQTQS1nSlUvVJUxnGEMH5nTt3qFs3MojpBR1Pr6kw1x6xLb8dAIMK44sQJntyJqoMdItioh3YLJb/y7d/KdZEEik0LNz06Lla73EQfETs2BK2PQp0tb0NvroTtRhZNFgzMpVDaxcxhROEwVgxIvn0JdP8Rp2WsLjy3DfVoQyc7uVHrNJMFJGptYpcTL/sFvwQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(23010399003)(376014)(7416014)(1800799024)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i/np16QNt4W5HM5ncgzcMElocrEVpz3f8QvJ3AfhHGxjG+bpCFEK95wRTCTDSQTf9P90soClN380N+9iBj9F63xdA2Y/q3LDcHXJO/9XPq21OeTTUiFxLI4O8q1szrlqJ8657KYOlgPY9sEMqdQmkmG66YCrLiRwd5+iQTu+R7/hMDVgXmTEG+zfyudfUUysghcv7MJwZLf1ts329QQbhjPGPwAWcTu2nBAo6yjA9IMuwcqXD6nsyycju/o2eZD24X8JH9jS2PKi1nJ3isRHhcQor/DN/pS5gMSKyBdru4R/l6yLA4vtaMZD3GFubPfiGitZeZQaDl+au3Qn7MrR9fI7+aRr7ysoi7IzrcYVDJ5BM9nJzavYVegDx7icbn8dTBEh60/5BT1RCuI/C7jvWmTxYkvlAPbmt5sHLsL+hgp/0j+ByyWYaqxmX+SkXxti
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 09:04:55.2174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6faaee-bfde-46ea-c9d3-08def5f547c3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11790

Add support for the SolidRun RZ/V2L [1] SoM on Hummingboard IIoT [2].

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

The RZ-V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     | 13 +++++++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e2af196e18bf..4a0cde8cc3b7 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -189,6 +189,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-sr-som-emmc.dtbo
+r9a07g054l2-hummingboard-iiot-emmc-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
+r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
new file mode 100644
index 000000000000..d77a6ff163be
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-iiot", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard IIoT";
+};

-- 
2.43.0

