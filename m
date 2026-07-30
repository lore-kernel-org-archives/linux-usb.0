Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023079.outbound.protection.outlook.com [52.101.72.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1719400DF9;
	Thu, 30 Jul 2026 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.79
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407944; cv=fail; b=caD/qCZYicr4hkWdx5mYE8erbh66G4xZDWDgx+0Bbhrh2I47S8ZPUAR9siaL54OdNim5C2OHMNgLXmF2r8UbaZu3UwLjphAWZBAvOqxTr2CCazonmo5KuS9+75Aqe/y2YgIWvZzB5fsAeW4gNlFfMneudrMEWgsgLjQtlX438T8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407944; c=relaxed/simple;
	bh=b/tKKvM2jJE0LZTZgyiX+DtXMWWPk0yt6CAPS2X4LF4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LbaPPzGHtGKs+Het46mWKL3c3F2cFnHzSP1vDuRtvXy+IP7wwswY/nCyumX0ZZbEn94VXb76rSRgp21KR70DCNQgPUTEtInqMq8Lnm9lu5jQmpvEf0mZpgE6WDO0jPdUTN4j+lf0hofUXd4oF7lJSmDQ9hZJb3/n4w50SKHVWx8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=M7XyIDFJ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=M7XyIDFJ; arc=fail smtp.client-ip=52.101.72.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="M7XyIDFJ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="M7XyIDFJ"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YP4Vx86oweli31iiiyPAg2nneJ+lrIl0hYaAIE33KB+Zxlnzk7lbh906TquMvzk80+DIzCTheFRT6yRX6OmtjpOfXmWJPeUCYHfZmIRiyVBqpG2grRy9gRKkMGxrhamu484b65J4EGQl/+DhtPXTB8nhPkrwMu5p8BwyK/OYjz1dC/C1tyxVbxpW1opoqhPad3Cc0mUUk3czgBO+Wj+TtfvZ7XI58EAwk4qmeB2szCONxDiAqR6BM09SQ/l2F+/rtPos2zy745ZFInEAZf19hqOuhiw/YRdmxWuTB1aECVTR7dGOnZhz/B03DTn+B+abrx8zFDDdRZpx5yk+uRdhvg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=h4EEwKTG+cAmcv/4jnbl2XtFg0bszGn+7zJaQ6Sml1VYdbNn8l1NTG2EM6UDqnyoUuP6Lz3hjZfuX0GpIV7jd6YUSwSLSbXChac475otfnfPvJu1WameHQ8udxtLTDFIDMfqhNXAuGJT7VxxDvqqEKdHbAAeFpU/Kuw4VOq0YOonEd/PYQITDF5hAERWxtU6pDo//B8qJlTXt893UhHgQsv2weBhPvyFk2yXCHBs0uadWGQFWeWMDPJYwWCiQ0fm0FtRLDYvCj1uw6TmrzfQgu4P0iTFJBoJmf66uRBMgYxjSkqFekiPFl4RZLKwnK4ccMmPjNdafdV03wurLlYxcg==
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
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=M7XyIDFJrI9mpMJ5SXwvlcJh3Hb+CQtJIfgP9PIpFAnZhGqfJxbaxLHWprlaTGTTLOjfhfhoXulwYjIEq8os3BcFAfFPpPbU7ULI5J+cadOq1XFQujYd7Lyl5DCxwOEMN6qJD0+9hs6FrhUPA3vANLlj/j5SUAzqASApcb40jNPsvt/RK/QuKJYmgJeTK9DpsOz4SSiHq4/yqHwgXUFm6eFrZ3mdWDd9PyhVBAa52HvJJFptoaA44szc5ODJ7olrjzksMjVZyL8GXdi20tj1jjO7RW4vycSG6Dhp5dyz2XKGWsg/9gCDvbZYOqQC6OVVhta2I+KCJA9kVCyiaUCBJg==
Received: from AS9PR06CA0363.eurprd06.prod.outlook.com (2603:10a6:20b:460::23)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:56 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:460:cafe::69) by AS9PR06CA0363.outlook.office365.com
 (2603:10a6:20b:460::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 10:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:38:56 +0000
Received: from emails-8633122-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-206.eu-west-1.compute.internal [10.20.6.206])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 4523881230;
	Thu, 30 Jul 2026 10:38:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Jul 30 10:38:48 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1785407936;
 b=qq1Ep+zKRsf1C0ifaO+RIkmcEovIYW9+yXWlGUzgBALgXw7PWLL07ZyLz0fSzyEm39o1V
 GKccUpA9MJWnKpJ70R7V2Rs9JFIyb7SR06+utqDKHEK2EWrJYk72ZoQaqqsbxiW8gtnBbzQ
 +evplugIfk2gK0hakcMbYi4icWJmGgg=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1785407936; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=KUTi6dtolpxK0pTWA3D2dBpagH0HhjxFna0Rk/q3gD0zA4evIhPKuykiiwQdmg781gLjn
 8o1rPxNH9rVjAX8D6eLa+nu5Ng8hVhMhwLswrYBm7vzWYsiJOKshf3M4vv31CccsMKTGjD1
 +BviGD2CG7hrSC9maZ4RhGKm2l+qaMQ=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=M7XyIDFJrI9mpMJ5SXwvlcJh3Hb+CQtJIfgP9PIpFAnZhGqfJxbaxLHWprlaTGTTLOjfhfhoXulwYjIEq8os3BcFAfFPpPbU7ULI5J+cadOq1XFQujYd7Lyl5DCxwOEMN6qJD0+9hs6FrhUPA3vANLlj/j5SUAzqASApcb40jNPsvt/RK/QuKJYmgJeTK9DpsOz4SSiHq4/yqHwgXUFm6eFrZ3mdWDd9PyhVBAa52HvJJFptoaA44szc5ODJ7olrjzksMjVZyL8GXdi20tj1jjO7RW4vycSG6Dhp5dyz2XKGWsg/9gCDvbZYOqQC6OVVhta2I+KCJA9kVCyiaUCBJg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:44 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:38:44 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 30 Jul 2026 13:38:32 +0300
Subject: [PATCH v4 1/5] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rzg2-sr-boards-v4-1-08bc459578dc@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
In-Reply-To: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8813.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::24)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8813:EE_|PAXPR04MB8974:EE_|AMS0EPF0000019A:EE_|PR3PR04MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: bee6a53e-59cd-4cf3-3502-08deee26c21d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 ANxVspHklFgveLZ+26rcMcYGPGMuB+uP5dJqH+hCuC4UfuYU3KD2y1pq9OhiNpAJz7NoLrL6arpDcynBH+5RMTre4J7HS/aAhjGiL7rgdyQbIVEExbc7oQeutgLEK2xwvHp2ru6CvPtXM3eqdk8pLTXjmUtzi/F/5Lw5+FYfmVtucnP/LwialTYZwzIPH7phhYdjnV1pIIGB00tdWqrdeSDcCDv+jxDo5WT6P7kbiZfHw4GBKby4Ms8a/cbhRBomNFwWSwDBpoz0A1a4pS5nFxG+fIiHeYeOzdYhjvuJNqAf09DA4+byOnVQpHIZLG+Jsgf/mpB1WKw96jocFACc76tRLAyUEpmSL2sy7cB0BRoikelVikXY5ik+dX+V9akBi7MmKc0/O1T3GNdULxfl5Y6H4AJMKz0Yt+n/YvG5nBJ83FpVKjZuWkvwekuWEdtyqEAfX+cDOwWMkjjHUnLMFVdlTDtH64ffOGDqYt27qihs/He23RA5BmPZw6kKbGjDgPBgJf2VzD4HZ1KXnjef6haU64gvdm0hdDScQ7T5O/3lTfGyy50AIq94NnG2SdPtzRi04qGZg8auFaeqy394AdjA/Tqe8guFVj6SVQl8juHVnw0l4LOJWNdUe0q/zATMm9eGt44NKvT+94iGXb+Z5RclLhV7XWvjK7s413EGu7A0AVprnQFQw9hhmXmmpIcm8Rp4oaEkOJMkoetww7dLXV+e3ExQlvMlVgbL6kFdKdc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 iYarRTEqesrUna/MIDh5EducWBQt0d+Z0zRraB7WOBjK9Ia+jaSVOBByuREgj+p+AsGkp2Ie2WeJcC46ws50XVB6Ot5FqRWiDhWFKNQSbyu7viHgfMayK/ttcFKd42O4bhzmPIWuJc+5e7Ucn4B05OdwYQG0TXo0Du+3AFtty7XSz5+B0lx+UuQPq6DWS3DY15+J3f8dRpQtnClueJvjHcnIAUSS53f40fLLUq9Wm6F0YUcsp0T9NQFiSxV/bouIvA00g3i8cSjLKZlZNfTPJwPN6KqWRAXtTbQWXKRomi/ImzYDHKFNaFzYMYx5YFyPh3dqMrFoXHW5b/Z78K2VeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0a20faada3624be680bf898339f5484b:solidrun,office365_emails,sent,inline:5f0ad432bf879533a30be2dc15704e07
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdAjE31/q1yACv8tbYdyljwWNcd6UxcBzBCSyqfjytfYJ//ltxPqJEG4TTsMT8uNfMVpKnErCpbtp20rsgR3sxS0xLzxPe7f7qe9mV9inMN/beA3775kr7s0eKO5XBTanRzbdWJTclJll1FZTEOVEaQNvsJG9rEktK6/iBVpJGqQFZIksLTnYIjF+j3/+L+iFYR2ZFv/UuClDaJB6bJjrCnkYiTJ9ZFhUbzGZLhw3OjbM9Dh8f30atMjshERf94HL2dytHUrOjKXJ75S8xsUWl6xeUXmDoAU1D0AX0wL5oi3cBeiCHOIPPPDl2Km2KiHbNOKgFqp03yW125H45vm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=SbrlTx311SetRqUNpSVrWwlZPkZc/QXQSg49z5EOI2iq9QLIFg0QnWgQi1TfwbT/Fz+NYBgZ+35FPnZhbDXyixqDIkoie17z4j8m9Njk11pj+Preap3BTg0gtG2zbKIG8lzmKNTmYgzeO1HbSFY0MrojofBMm8TYnBEsWjS9KLQXG9A5lfk8CRkbVbrvXdiSGPM/T0BODXpcFjJMJ+Vz19tBs89PVsWHhRsFKAQ5kl0gI13EHQGpEYiyTnd6oo5+fuYL0PkSvo5qm6JLLsNWvROuWJ7X1YjxzbKCTT9AfHhJaW34l8Bu9RZP9dWBma2M+3t1OD9ZqD2dkN8StrqkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d0c1b03-1a88-4f51-c579-08deee26baae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|14060799003|1800799024|35042699022|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oD9alvTKAHjd3ChWBrmjftzmJPtSY+s9hbTZvu9YoMsjbK3TzGEro7ftu6dCTP/P7813DHHMi2GIzvbUbL22w2SMwe29BtGa/dMcwyi7nfwHF2PmtOmWOZqDc/WHoEKuDodJPyLJze0WhS26KSYxr/bZMrJ+IEt/IEZfdEjIolkkgUE6oAQXE3R1iOIb1/AAhimOlHNwuRbmc1MpUw475SNMmt/if9RSeYL1ml80rU0CQPbA5cLq9ExXPF51UFoBsZMU//NXjBBx9K2cIhYA+Vv6pHphwJ3Gg+5N2L1JQ9yalOxa2MmCuN8uP0+lHFsN9l588UMuhK8Gpyoke9sUZA0yBzlazog/d+9L72m/uv85CCdvwU0uWjCL4AAahOVf/65a7iUL6FqP/IOKWnIZeOMFlWOlcPuD+keroHPiCqx9ShLposdSwQ5JR5qRbLjaJk7nLTgKGQvbQLTgmQbQhM5AFBAHk0tfoZatFvNsR7R/W/B1loEvo+UqxP9Kjk7T6zkDcUbSxRS+DXffXIs6pK4CNzgU6O4ipL4mg905xf6dpHdO10l0U55metJvWOwzfp98pfzmt121P295buRA6+wtoG2zG29KclNgcW16Vpp+u6cjRmFUJZ7xhc/XWZvuBsq3jln2xuEvht4eHRokpvviSAdQu4b24WR7jQMEFuV62T8ZfIGTi0O5NSQV5tMBoXVPrvoh7qZG/Pv3+gozTw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(14060799003)(1800799024)(35042699022)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TljO3kQnAJ4hr0i47ND5N02XOL8KOu9huMKM2GoLeI91xVm2O3brQUyahbXK8zY1tjZdiXlyVScVBwg4eJ5lO0cUeZU3xbEXTxJqtkrWrhfPULfkweZUQfsOeg1Pk+OZcU1nKrRclbH/Lsb4kK++iecY6onoWt3jDrR4+bnVG7tN2G62OqNxOEL7772+hAGoTf4UtkpKxCG49blXWdtGqHfDLPV7i3SQ7/2B1kJW1+3CVKW0BowHto1vlrf62my0E+hXEDrbAVeOl8kROFHwDiF27T3ojA4hYS+93iBurvyqEphq4kDDBwNpWqyCIvJGiOeGPODhhtN9hB/ad6990mnzpQmygN7pMbtd7T0iRQr7ASgwKpSNHJAOyI0DG75wI7VyyHuOgfB3T92tVwPmeFGVi7jbFRDk1LYwj4GQub8Z9Od1wW36eyLv9si0bxpz
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:38:56.4940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee6a53e-59cd-4cf3-3502-08deee26c21d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index eeef34e3d7d0..1673005a3d93 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -508,6 +508,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -519,6 +527,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -535,6 +562,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.43.0

