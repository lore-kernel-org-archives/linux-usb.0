Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021101.outbound.protection.outlook.com [52.101.65.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D639E17C;
	Mon, 10 Aug 2026 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.101
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345943; cv=fail; b=udTqqVnTtaR6Mlc9TPiQFLjA/NJ2LzNErt6N4hRiyX4RMutHCDDDTwK8uJx6fvhc6Vkb/7rLh1bz7fVXHqEU8C8N0GP5Jc4OBFUxLyeviXgMO68h8wojgUiCw5MewrC29c+R/wGk0FsThxOvO67AFtIJlKtEBJdwtuo/Y+UG3iQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345943; c=relaxed/simple;
	bh=fpT5wUXnacyQbUG4KBu11ktP7Qewj1aFOKzEY/e3doY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q548Q786xSbmsxCE6pzax8S71M6PW0iNVCLDWgN72F+xh/3Hchy8ZqyCWyYGSxZjKvNdec0rpFpew4gsKfdHaBii4EIr189CJxRBaPpWbTp4QWqgdUPlNzDbaNgIkTqLHvj9gt1bHpfYtZRT+xSS5aOyP847b5WKyqsh10nRnMM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=paQEMjua; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=paQEMjua; arc=fail smtp.client-ip=52.101.65.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="paQEMjua";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="paQEMjua"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LVIPsBIS72S/MsbDfb+mzXN18FZM/NGrGhsvFVuzAUse1eCMvwutLqf0Cc7mBv2h2VQpZKVar6FF6CkvchgH5QQOE7U+rfa6sW+Hq79sfCuW+PoETc3T3sBGzTCy9CbCbAG8qRcs/WCoU7lZxtJwwZ7CrpiSnJYMLKkB4AK3C+nRfhuUHJEkb+VY5tm3gMs9jKrogSV00JRGYTFN1m9LMsNj8sb9ST6ny1q8eWt7j036yLHjeYHplBQo6mFeUs0ShtJGncsR2q/F5w+FRLgIKU4Zt5DEXT7fnrPlkBoRQwmw8T+iCGNTTriuvz2/cmFvCjD+7jyAQzFtCBpbs6JyWg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=ByBK+BhzHRHL4Z+kUEVTlgsMZ5HrPphut9G+AZgf0mjV9hruov/AzcSMW/rwBL76HYvsFB1ExF3QTWk5ZNZ0xUHUCAvuagScWmxY/GRNeYuG/UIk/sJQVqDAO0HOKTF2Hr/J+tqFlYWWTEkVyV4/gJoXFEJhxEE2r/o6wjF/x/izMUZ3O8UdebGfVuQsiv66rhwc93/h9NF2EsFA1p0MUee3gl2Ng2IiS4iNyYd/vXeVMi/aYOHX1K9xcEwIXwsvFjSJFZskBfe+3cUh5nQKuRWrivPTrMKt7vbD/PrI+tla4laByZXPRcvRLGtF7W40gVJAh83b6qEXHBso3l67Bw==
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
 b=paQEMjuaYyvRKf68N1vEEa23sZD5IG0he6gM73pTmUrHcnj/cQYnlDFGfSYUc/kunAdzJO7lG0WyF5w/FQg0+sPzWTTVf7GcqQL2pRYVKES7QmRUZC/bTuqPQX9HaqUMqh39hntZocPeW671JP720fvXkLVp6+pzERFDXF+ld31eYfcHQbmYmaUnDp+GxBlkx74Pc+sQMAyR3yCXMfedpIXK+b2iR+V+hGiS30ejDNy5uSamZVDgJ0sJi552Toj0BKvRquF07POyT9e4obFQlEJg2O/X6B9UpHBWxasrXwdbt49nxZVohX72nf5ZAU6U20DtuYh8a+YRMEKs9xfjIw==
Received: from AS8PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:311::10)
 by GV4PR04MB11356.eurprd04.prod.outlook.com (2603:10a6:150:298::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:15 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:311:cafe::4b) by AS8PR05CA0005.outlook.office365.com
 (2603:10a6:20b:311::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 07:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 07:12:14 +0000
Received: from emails-2457762-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-60.eu-west-1.compute.internal [10.20.6.60])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8F6FF7EBD7;
	Mon, 10 Aug 2026 07:12:14 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Aug 10 07:12:07 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786345934;
 b=KEnlcj4C035GkRdS4zlwR49ETW4RVvqWX6ICI3JCAWXCU7lMa5pfSPqxX/LUqdQv6UuT5
 bp82Tr2lxy2aTCV7oclEqZE2snA3gVFosl/1sijxXaBqRpZ9TT2bhfJse00VLrYh/BOTRh6
 pXEXsg/Hd3MM6wBlFcmaXGzafyk19xM=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786345934; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=qQyZIy3Ct5NoQRRD1SU/vrgslv87/VetJcC3cQls1woMjW9EPssiOPEKTXSV3yjGJKfUE
 ErmvJW57piRfsoMYGQekaqWX9oUjTMXgy2KFhHCc+JB/7y1UX0LB4iOMfqdoHC3oqMdPP7Y
 pK+X60Udm9tRMoExaUplwwAgHWU7MmM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=paQEMjuaYyvRKf68N1vEEa23sZD5IG0he6gM73pTmUrHcnj/cQYnlDFGfSYUc/kunAdzJO7lG0WyF5w/FQg0+sPzWTTVf7GcqQL2pRYVKES7QmRUZC/bTuqPQX9HaqUMqh39hntZocPeW671JP720fvXkLVp6+pzERFDXF+ld31eYfcHQbmYmaUnDp+GxBlkx74Pc+sQMAyR3yCXMfedpIXK+b2iR+V+hGiS30ejDNy5uSamZVDgJ0sJi552Toj0BKvRquF07POyT9e4obFQlEJg2O/X6B9UpHBWxasrXwdbt49nxZVohX72nf5ZAU6U20DtuYh8a+YRMEKs9xfjIw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:01 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:12:01 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 10 Aug 2026 10:11:51 +0300
Subject: [PATCH v6 2/5] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rzg2-sr-boards-v6-2-41faa32cdafb@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
In-Reply-To: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
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
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB9688:EE_|AM3PEPF0000A794:EE_|GV4PR04MB11356:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0be285-224a-49df-e03b-08def6aeb4a6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|23010399003|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 z867yxv3pyeAZgoOlkDcsoe8fm1atzIjfwW2Mq/m83CYfd4Bef8gUIDJQiX05q4//DKZvQ1+weQuovRFudh4XFFNLcU9cq0TUnddGEnQ6TlclN3EBoqAHRlk7lhnRMQJaYtiawK+VO3ZgXdDtkkwu/Ed1Cj9Qk71wSoLHgtkkmz9+xYAlmhBr0AD3r2drrOvaYyj5eZ1snqKlOy1zS03PR+Z5boH+uMIrs0AEgV+N/xYAyrw7LyV2uJKrpobCI/YUkMJ+KODfDOqXs0pVv4GPgFb/nRu16vxu1LLbShb6+sI4LW+afkFwftiQWZfvOe8CZ5OdEx27puvZRtaYFyFIBwM9dQOxEtXGyiyZZ0zZFoGtd4wcITvPB0MA+docNBwzvEOnTsEpJNJn77XHR7tB8eAdANxHbkVZLZEXvnk+635LZNRyn1W0+JDYffn9ksvNTpn8wyZvQ9nPz2zmtlRXwDh5b34C94VJS/m8hUkVGJWDk3OqKorYhXNFFjNFT5VvE3aBzXAWVqTr2GqJk0SDYDy7sooJKwVhFQ+hsOJgozZVLGcZPnG5e1fsW6cU7QuSUHKYFaR8aBl1fKsQoWIwq8RuL4rfomVeeMVPilR4rUt4bJtRX7BBljpNFq5bqLjX9hgNk+KTcQf2xvksq5c4wuK+42SLBxP2RQWk8NIMD6nPP943byfqirPZhTHzDZytrQrcdsKYf9EPzWNul70yv/0abDAI2wWEJLdJ0Q8JJY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 oMaGWrFsBiLGnhwB0SF/Lr4NqiU2nyQTQ+ee2RLWKCK1sgze7s13JE7ZItZNlYPtFhdQVeOsk+nzhKILuCxXRPrVSm8j7El997AuG7Ebt+CTKR/iTeRwgsh5Isl6XMxAhsE56DHAqA08WQKQPqDQqFyMAYp7uw+xSV1lY4bG8HihImKb0dXaOI7NLaVZKXVgMDJmh4fg213f3y3TRDKpE1fPwW4ZpRnOkw9LntNu5XNS5jg0oHF50tvVvsyO3eF+dnfDmD4zi2vQN0LZqp38RJxR7CPXWarJhpyFNVr/r0LkT4fCoKV+kTAaz0ainK/V4a+jTaJ7Sfq7zoP1CX9Xwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ff0f1f52321a489c8792f073cfcb3224:solidrun,office365_emails,sent,inline:e0ab5be3280b9878355cfd3f18581985
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieZkU2thdWaSgoAeTD5PYkTZddoKJCvTkDHyU7Vc2QMRHB5g7EOVJSr1B2rC5nh8Xre4B0qOtEI8FySXsb4Om9PoW4qu+1xnNxdnpLT2s/xzOjCLficxI5QSQ4tdmRf74Cr0zRDf1S6THECEdSf8uvHGObMaMEKGjo8frCw6mpV5wVv0wsFrJSrBy+xOm3cEwkAzY6kDdCpIWlT3bPa5QVkivkjy4wpzi4Hm6ymEaZ/LcBXhEEuACM8TtiZoEwYewOdJUQNeVSTNLb32UZkSNJ8YIRjtg1G1Q3nleWc3osfi4Xq/NbACsSCVwpJxse9bZ8clh8MZMSnQM3uUEgczTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJpZ5YtKLBOF9spI2ILIv74iRta8ajdpFFdtBGRQktQ=;
 b=qQYzFuBzKufYM988F8iHDoggrn1otYMTPBoZZjBoYexPVXFoYjWV8fvKNjpqxbDX5V3+C2aQg1tjJAPVmPW9gWnsM2vlWoRQiZsqlSsCSR+Bd444jFPbB0kqMeJE7cCzHXLlmUepkpOdtkiPgfswl1ypSDkXJtzBri/Nk6MSaaNklI/MkmBIYu637gu9hJSc2ckbBqFREWkJ7OG+kK0aHTtF8j0H5XfC09bsLH2afXazuSkAbqTX7S2MSgyvJLOthwPr/FSg1NKCipbqQn6XVakjw1wumra8ncN5tRH1jQXsv2/CZke1AHDvXmTn0I4H6fstaGgJThwEdpvGQz4a/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5753c6ee-b816-4fdb-f811-08def6aeaca9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|35042699022|14060799003|36860700016|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gz2eSiD/ATsQMIlh6xBbPwHzE/VvfHyeUlX1km54kXIjLYU/SNFHZwwM8Mz/uVHTL+q8qn5U2TmarOXxHMFJv3Y+GgENgIvJNYyIGZ1DOJcoapYi7A7gHGfbEEtQuRQ673E3CSkh4SqyxwNdZ0AFTXT2Eaf5zo27PMIZL9xCwUFuSP/qAsC4rNXM0lPwWVgI/TcuyygUeDKt5fX0T/B35yytorVkzvWXGvnur9sKah9ZPv1hdE7n9qqJ6mrrldvW6289wDaK89ZIqt4FmUBtheiexH0JnLiqdipILvpcFGbJZMysjbIZRoW1b0vvsMriTqZJxuuZZsKB/m68+MBbJBWID2OEDCfRINFhDXrXlCmOfrvFgx7K4Lus8WGufDt4tU0jf9P38QAxspNPGfPXc+5XocXV/1Ljb64dIDTVOahEXf5yOiMWzWnXZUahb3k8xmwZwVIdCTonQI4MOJz5vauPpPGlSPq75E06jI8N0juO/ePDAWoRmz/k3UiriuyfEvSq1PsZBMlR0CFisP2zOZDdaCqy81PCyKNXfyigmFmaPkD5QX7+C3tc7RcPb5+oPhcwz5Lm28lIlIv1wRFxo8CuI1OEjafghEORnYuBY6JiBFocEiRRJbBJ97h5oURj8YepYaumbX0oOE+Y4E7EK3/NyBQ1y6QmiNfeMG+w2FRpYYLu1dPYCUy7O7lJOKcuzePdpcOpq575iIkqUQz2CQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(35042699022)(14060799003)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AwFT1Q2/0zbp2zzclxuhfOuL8LJ2Y/ZgalUODLG+uOw2zQ6AU+uUiGkAxD5dD4FgpF77aTw9Y3Xc2auDEfRcVIvrbvC68UVRvZEbbBB0vmmhuHw6XS3U5Uajt+jRvVXW50oscvmwk5pE2kEr6VYQtEJNkiy2/XS1qJute/gdPFxMfE3blz9h4hWJwS00KGSXGDcdVq7GR6S0ZbfQYYbLvLRBElyspN2L3YjtVhV40PLAWCdLphh+1SA3NczZlhadzj+ig/fFCq6JoAn5UUeae9UBpIs1N7GPkVH7ESvZg9IAf8eSYi8ee/JGHzTzwGDbm56w8bGOSUXjXBdp6DJcmjpAi148NC/CMUYgMqHZk+sEo2f6a1TnkPVofVyjedIY+VCfqvmYAZG6zoItzD/vbjev70DoWOLPzJuKl4X9t33YYUV41xH6whcZRh/YTKTi
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:12:14.7914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0be285-224a-49df-e03b-08def6aeb4a6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11356

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

