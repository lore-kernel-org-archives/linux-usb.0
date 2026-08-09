Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023125.outbound.protection.outlook.com [52.101.83.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2C3BCD1A;
	Sun,  9 Aug 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.125
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786266301; cv=fail; b=REmtXcu+4+O4zRAADzz8Kf11N2gkiK554QFMJOCJppaAqlutl2w2tc2dodhTUioHj42K9YjaGiKahaO5Vq6QwMIyuauBwXWLGYNufe0YyiYrINlgNo5SuTMHEUz0hsKIUp6QgUAGEbYsqpDIcxWeExf/VXZy+eUhGPmG8l1Uzwk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786266301; c=relaxed/simple;
	bh=fpT5wUXnacyQbUG4KBu11ktP7Qewj1aFOKzEY/e3doY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ac3bQMykcxHNNdpAj5Gi/4gX/M9Ez5WmpvvT+jq4u5Cw3vjsNQf3CrRHBVTFqH1hWrWtaO3XGZY/LOyO6AMFcA2uSsEG+CaK3nbvlr4ypDTLJyqhKQF4FTi1u0s+/bnvwI/BcY1GT8g5L0zo//6hj2LFb/zkmDIL8CsIgy7FZYA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DGpSJ4tD; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DGpSJ4tD; arc=fail smtp.client-ip=52.101.83.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DGpSJ4tD";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DGpSJ4tD"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qu79H0qAV40ks/z5In6qIDy3Q9eN2TMp+xCvAhyWmcjpww9TO9g65IYPqmcw56BTD1K413aDcHOMPM/LSzWnOXhdVoETBV+hrh7oCywACi7cyusPqQlpjLeeWekXUo5QiK56NlR+4KY5Q3cRoGf4OPRPWQPiVqMkA/912nfvyEvHQo9CpRguje/54vdKWQPiXLjVLUyv0o7gODVZrNI2HNxAIsyRu7ILJOGJTkUTd54Gd0541/9XJTM3xE2nWbgfdjb1wriH1fwyBgIsL6Kldtbc5UkJx9+5JP8ManXPdGtIHhM5/z8tVpJL2hFht1vtGd8XoybXCVITsOnHCadiRQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=HTwd4n4h+jXbnQGbQnldbhb9sa5Y/mPtJFx56bdxdi+r7loin1Ba7amM58QeESDRA37zysY3JE+KvTJjd2YYMzWPUdyV7Vb13zE8k1sOve44QIuw9morydntodwYBwam0namc47BKtzDbCk4wJoNRUXTKdYr9GmXD8sRs6cspKq9PJfDrGbzeC9QUnWZgE0lrshECSDEYcL4B9ywHQpVz8KwClQKMZJ9M4rTtM6kAN4X+YuidSMwc95UKS0mDkSP5pdtySjEvgAuWA8zSOVby9L/pFwQYYYOETj7NzuxgtWx+VC/Dyoy9eW8lE77t4rK+1MWkw9089INA025HAP3Aw==
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
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=DGpSJ4tD+bDcAK2vI1tVObB/ly/7mjOlezYHL3ZwSp2foC2Rtgx/rMUdrwILald39Alc4LPmUikuVBFk2ldhDKJdELHog8SqTShqfk4jZcT+AK4KEsJT9JPG5xA5107ybkCXNdfYi+jjVdAiU3I1DSubBIZO8ZK8s3zDR/hs8A4+L6kVuexBiWEpPFseb1PQQ/T3IXvBUV/oN9zGGBjJE6QAlcnLYqBAK0AesOQgOzDFTbFgQbkd8WOkixF0tWUMoE7/W9lvQduUWW1Skq6pJWxm3+GPtsfTis1P9esEUtYGVtFZRDDfAyr8AcD34abeWhLI75qpYNhlhZiUZ6an+A==
Received: from AM8P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::19)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:54 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::2b) by AM8P190CA0014.outlook.office365.com
 (2603:10a6:20b:219::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Sun, 9
 Aug 2026 09:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Sun, 9 Aug 2026 09:04:54 +0000
Received: from emails-8823644-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C84D27E906;
	Sun,  9 Aug 2026 09:04:53 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Aug  9 09:04:46 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786266293;
 b=faur1BTQDD7owA7hKr3E0FjStatGm9ODWpWZ1BL99M86ZwZ8hjGPTCLC636DtWBOI6SN/
 X9NzBkXWEFMmssm/yrchUMHbKUV/w4brpmpVfpkHtYPEuSe91iJ8gjrSwEA/ltYDzJzx5ma
 vSQa020A1vAcBwDiCLPTDw7a8VTVJ/M=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786266293; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=VwavIFLdn1rYWCyOd9Em6pSu4Mrre1s2YPBUATOQUhpqRiLsBqdolCM6fu7AbkKsoc5w/
 BkcVmvJ96cXE4vZQZi1mJlyUBG6OFHdyQ1H7RRdLZsaU+FEK9o75QIleALS6pyQkesB5d02
 JxKSGZFyC6Dreu0zaJlJFDFW5RIN8e0=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=DGpSJ4tD+bDcAK2vI1tVObB/ly/7mjOlezYHL3ZwSp2foC2Rtgx/rMUdrwILald39Alc4LPmUikuVBFk2ldhDKJdELHog8SqTShqfk4jZcT+AK4KEsJT9JPG5xA5107ybkCXNdfYi+jjVdAiU3I1DSubBIZO8ZK8s3zDR/hs8A4+L6kVuexBiWEpPFseb1PQQ/T3IXvBUV/oN9zGGBjJE6QAlcnLYqBAK0AesOQgOzDFTbFgQbkd8WOkixF0tWUMoE7/W9lvQduUWW1Skq6pJWxm3+GPtsfTis1P9esEUtYGVtFZRDDfAyr8AcD34abeWhLI75qpYNhlhZiUZ6an+A==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com (2603:10a6:208:132::21)
 by MRWPR04MB12072.eurprd04.prod.outlook.com (2603:10a6:501:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:39 +0000
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97]) by AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97%3]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 09:04:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 09 Aug 2026 12:04:23 +0300
Subject: [PATCH v5 2/5] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-rzg2-sr-boards-v5-2-19c662358e36@solid-run.com>
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
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	AM0PR04MB5796:EE_|MRWPR04MB12072:EE_|AMS0EPF00000199:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2bafce-bd69-4917-e437-08def5f5471b
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|23010399003|376014|22082099003|18002099003|38350700014|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 u50KiWOh8y6M1xsyWgI6fN5La19Rnb7BMBK3FpEymdIuoYUHF207oA3X6j0769gqg40/GcRQSMWdFwgTVu0EMWGKpbWdqoOpWtyZ2sdYIHhrc6unEjfexuqxW+Gjew4z3Xmu/EMIw0N3ncNq8Snjw0VKn6ezcfV4R4iXBzClEL6/4Fc70jYxelssw3S8UCmHCB5nngmol7DbqHRiaWNsadpyqC5V9R3F3H1FqgcwsuUXWhs+Qr1ziftlCYXFn3gORdMRMC01DfXKkDT/Ljv87amqd3vTJiLisTwKaxK78B/0QwpRE7/UglZqcHTK438B3AtHUMjDDEXZePiNATHBnYLSt6e2409F24DrT5RoKRkd8sgY7PfynCEn3TiGQvaOz99p9UkDrNVWxYNeqQ/2VuCdiuWY0rNh5yb/+yriRCz3iYyfFH9pVbP7FW7TIVKqFIog0jVIwm/5qYbDwVwE3b0POAuWnK83XSAQjW5Ce/tNf0mJqG5aumyMVQ4Qry2Ii7gTIGLsrbgVgnOk21SXeBd83GUrZehJTtUo+mRvExHk2ZUVhsNWtN/FczqIpnUs9N+5ton/Z8rDLwlfW/UDbPGccE1AiDtHbhFaF5YnKcz6QLuE41dVTUbv0gc7M7yt9fpMbH/iG/Oxn79Vdnv5yoU9LffJvR5zjv/8fSgv6DIfdrHWjBA+3iSH5UcjWl3M4rq0v2DwaPDxMj+0J20G3POOZNz6cyZG7U2zfs0EQPM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5796.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(23010399003)(376014)(22082099003)(18002099003)(38350700014)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 W/jfU64nwhJEjZN5AlQVhxZEEz1WhcisWBYpH2TsZOUYe9iPjjbKTcjHDo9Q5qrg0grD8Hm2jQnN0JEw8IiuuWL+0cyoHjDPBxWAAHCi51pWrZdq69AFbc9a7kU3ZZ0xi7DTSrpX4hwjPZd/ooFLZt168ZSbfWh8Yso8kVNJIafVKZAYVRunKsH9i9UC3yWVdTcFUr5XLGSAoJ3NAAIq16msz33FM6NKWemDnaq67kg4fRAtkKT8xZNmeqadgObS2LGxuxvId1enHnwKH1woJZH83F238FuUJrqZotRg/OYifGmUVAD5AkYPYxZP06QtonIUwLbst2CTEcp+CJzp2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12072
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 22044545bf304190adf9eab4d65d9a9a:solidrun,office365_emails,sent,inline:ecefdd91e86fc2644e99f85d076d2372
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7p9WokT0xrxSe9xlAV0BEfu7fd44V85VPB5Nmca5whWA2tflKpGj1dvDuQZbXdYqRDLITCeaSjN3Qbhq9/+gzd0HSu1ax1zfRk93hYwOXg7nurje+EjnnIdJAyA39UcgXtQ3ZH0dOclBdE1ebOVagZTw5oJqa4U/uGHXNSxJHmfNIXx6R3+pZ6in13afBhA3esSmNDpFNtkt4JvfhlRMTILoMyoyKfnGyTsahSs1b6kPvh6enS1q9IP5KfIjfHHeqzl89u44JiPokjmguGaMAhMHWJxCU3wo2+k490UdNUE7jZxmWDfaXZpAl9btdRPx1Xt2+MZKVDuw+7Mc7/tRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=o1CHCOL8ORiFgg7xgpdQYRf6CrGm/EuSNLCC3/+Xp4yLW9j0L2dcm4b6ylyd1Kwc6tQTuH4xnwe4bISxTP9BenMV3W/qE3iVDXTpvgvnvESnZMgysJ7MCLi5oettky7PRacXIrESGBLHdQmgcS2AoDFRfkiEQHoVqdkWjdj8fFbhDGHwZVsmyRTLQFoq050emfkaCeobmdair2xksenmKakMFjtFoJZKHgcOynryjiB9wNRJNId6eM/7MiEj5smvvSULb+gG3K/bslN7Qnnl71XDJ4C1K9pwCWvmlESL3OaWGstOXvPy7Ew1dRGQm4qASStbu0tLDFQ+dHVDusudDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53b7f7b1-fb1f-4d84-064f-08def5f53e31
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|35042699022|7416014|1800799024|36860700016|82310400026|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Nec2Gka1kULjs55xU47dIoHUM/IedaTIgIXBMdIczQlkjZ+8q0JPGERTaa+ned226H9X5srJ8EeUjCngwbsjkbLrIBlCtIc+aBtYDBq3zNCjTxQ6NDn+x9WuydYHu/8vTOT4pU3n3ATQcm3wvfjZiXKjJifsh83bcK+kLMH39M00hofMJWgSxf4XTwwFp9+UOeilET0yMnodGLEgOEe+K7TzgMGWK0AI+3sGcOIa/jrQY8oMPou7UTNBVgiU3AY2Xh2/9bWEJtnM+s2RxADNsHPdmf6lxHdXdY5xASPDctiJL3qV5zxZGnf6yihShlMS0qO5tFFondCGpCKdLIPbCUISLhhHlBKMi6JJEwvdQTD13sYjMmsqLOjVv+6yXUZjMa37kivMQr5WxlS8YTzoRGmNTRdnu46rXCANC+BZ3sQ5vCeFEDZxqZhJeYIu4oGgyI0leu32VsTRU1SlnY9dMo7NXujwIfUpZkrxyZcJkRaG6EsFGo5l2wXAnOuv3qvxidjcM2LPbR3FodIxR8r7NNxZ8SFqZBxZQNoadBx3saRdsaKp1JpTACXN9kjGC0d8e+GYw/HDuJYATE2B6ocYAxwkrCKvb0tdTBw4lVer7QznuTm1qYG31rywwnOm8Wci2DqyFVPLkPXbtn/jzeC9vuoLrXZBTQZOXo2TPwGHNTySG8GF/8ZB68KiYsgByk5MZfQd5E7ggNRQa0cnmL6IOA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	emL5eb/+S4wpOq2l561LqtDNHiQgtwzv//mZFWe9eeBuP+iOkvM28T4YiUkDe5svp2ppUd15EIIDiR0MlFUV5H4vral1PW55YQMDqcs8TD7dHr4yVkdGmducQvUZKvqag33cM8iYn+kAQpjNm3504WyS+zvgzFg4VrqQmvb6LlC4MlTkY2g1f5XBYEbTX1KRsYSPMz0tqiokvqJVsyiehLPTLGOcqU/uDMKt6sSSkTYqLMyQ8guo3C+Ek+RhQdHlz7IaFKldacE+tnWpUA41RPHRGdYxvjUXgyzs3x8u9G/vXPcKXfVF09C8mQyLkwJMweipU4bKBTFcvkRAz6pw2tgqHyAWSxSfmz2McVQL6Vx82iQmz80xbJ1JPwgx96BqJGm+WREm1z4RJKR4x6cCezlpgNcsapZqdNbaLjrTn8GXfS/vSUZYCJ6rgDoMe4t9
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 09:04:54.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2bafce-bd69-4917-e437-08def5f5471b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
described by one node per speed and linked by peer-hub property.

It is however possible to install this Hub to a USB-2.0-only host, in
which case the USB-3.0 peer has no place in device-tree.

Remove peer-hub from required properties.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index d6eac1213228..aca2fe796240 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -53,7 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - peer-hub
   - vdd-supply
   - vdd2-supply
 

-- 
2.43.0

