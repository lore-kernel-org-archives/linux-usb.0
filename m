Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595876;
	b=snr0AjLXTZHDu37fCA2DzuN7B3FeqxQAe25SJ7vPGYIV5fAHbr8OIwJPZhUY7vgB+LJP
	 mJefwZOSuJ/xHN7DyY39SLk3wDu2JqmvSF28cG+r6MXQN4GHBKJ24aZQqZjaSxIlcklfh
	 2O/EldSZcaQj2EEBrz9BwsZkybQ/ssbIczL9h7j3kWWruwgibGNrAeWVNczQBObDZnkBm
	 Cq7ZtNCM3Thw+GKKphRBcpGHIqtjFT9OndLVEjRND1z34gwvGZOC+jqmSAcpUPwN/HUSB
	 0aqEwKmmuR4tJAniPfhpmP2AWOwsesjg+a3r+R0NcgNpJfyzVW4kCZ5Jl1jwiYf8Y2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595876;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=Tfk5XBDh9v9X44KwuPapmNWutF2RTU2HcT2JHmwvJjI=;
	b=1aV9jKMypeC3c6GhGNuOus7sgg1sHjDJ4rSZDL/2QIt5RDFRXhlhhGeqx07RlG11GJxq
	 /u+mNRvp1dpz5+Uflb/MsoCtl92KXtSLVkpTh5DX0hBE7v+rJrmm8zi7C8Yw59pMzXQyv
	 GRvcvHQPU4dDOXtnAt/85ZCyohD1ojcGAy6lgAatXyXAMuf2Il6rZx9rHy7XWz2WcWLT0
	 z5/k7ATG5+H/tRNfdt/iLkRD9y+3KbTRaWakG+m3hhwVW2NmeVsc7ZQd36oBOvOr1ttn2
	 ACB+zwXv8WeNA4elKEB+3oBJ/GSgStdIb376zbFctMOb8GLhBhbECUZnbQ1NRXym0FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.114
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9CC606A32D;
	Wed, 25 Nov 2026 08:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9CC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObtqYIyzjuGqphsZ1f3yXj0H73gtwfczvqVyAfDSEYsyM9TY6vXigUb9mIIXReAliTNEaoMNws3I+PphZBMUIZfooSB3Dnw3V/q/dz5/t+a/rI2RDRbhgyYLx/rbMHhdOuRa86N8asvbQeMrDrt7rN+gpTx1mrfa55v0qTDd21rRZ6E2xOexUVCG/97FU70WNmN5FNSC5Nq9NoTpx2PfaZOEJkeJUOODVQ9YLa2Z3IjK58FflkJZRDwFIi3ggsQAEGD2yB+4p/Z+6QKK6/cbIGpIUXd6gj9EVdXVNBG/jhjj6Me7QGfZhcgSVVDDhaZaLNHxg4xu80NUh3UL3AhDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tfk5XBDh9v9X44KwuPapmNWutF2RTU2HcT2JHmwvJjI=;
 b=BvgggngYYqIch6erNzAj8Ot9ffhhh4mMYzWpmuOpD9R7RKPHz1JgNV9rzXTg48qfYE31COIJX0Lq1GHVezjCD8HEj7q0o2ZXVyIvlWStcy8TEA78/zfAuMSxMmascblCyn9rTQ4P8MOlfleoNWcJbE6QSNAdbH69Oo0PrSruGHHKtvI+NF01/9kBjnHMxZGiCn7NUushMseeC/MAHAfDptWW9+BRBM2jtktLkw/IKuIAalS1nuBEIMPfGw/SjRNksAyzUbDRAPcW4vBRUlmbw7CzrWcMZC/WhiCURphFDbU8GhEHTsulRJO1shDK7ouS/vo6A79m6VssleAH7+GJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1048.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 08:37:44 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%4])
 with mapi id 15.21.0639.012; Wed, 25 Nov 2026 08:37:44 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v3 0/3] Add StarFive JHB100 host field USB device controller driver
Date: Wed, 25 Nov 2026 16:37:33 +0800
Message-Id: <20261125083736.50606-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::14) To ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7)
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
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB1048:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d31fc58-e81b-42d1-c4a1-08df4acf6060
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102130727099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5KVFtT29B3rS54Kip9cVR0RlK4vcU858zw3Y+nVeZY6GwTB/GCaP7soqvLa+03VukDj7EHGjz70dIKY4dq1I9URMfUT1XFM1qa/VidtcHRa6YU1YTfk8rxYmNpOIAfjvCKtu0vxhhicervPn6DpsKdFAkLjGfbNQWLuxoAC4ZEiDfqZLVb17Z4mFzyjpHGcmDksPL/svKrSBlxXmBCjYWKqDbw+bft18MLW3E/bgEjj6ZxwDduYSXu+/5tN6fGaB2LxdWBCD2zIw87GnoADmnQ8z6sPI94EjR9cuvDXsEZGFu+OoCxggkC18JeNxuQaLQ+9O0yXzT3uvIWOI0FOxxw0YAIg+KKzKiB2uDjgRNnRtOUggcO0EOGs1cRNbhrh7XSDrg0Sn6JkmtldNwyrFuMyePHK9KVEsOkK/BxLkVEKxwLLrMyFT8Ts1zJtMdaXFCa9bLVZS3iaoen97ff1zsdfB3t3i4xGkUbOHRRdLFQqWgShMMacIsuwsyBl+a/7vaUJutUFcmIEa+LHBRA+3waa/qKDQ9MN06tFUT69dmefFedecx44kibsxisDntToa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WgegN0AHzNCoU6FlYVqWtgNsVSIK4WvRh5HhzZx9Y3Dmrup5xP2kxgcdwoUx?=
 =?us-ascii?Q?Y03Ak3W5Fx02GmrFgQ+K5/Fd8mh/WHeFtAtpPprObdB6rnjM9FkNiv9fvkGT?=
 =?us-ascii?Q?LFakwWizzJCoPXxC5HCndgQ8nSZSmRijZBb9gZtETl7C9vwNoIXu/YuKjgGo?=
 =?us-ascii?Q?+MpNpNCYO21dG0PbW8ddDMvXdpan8htcdBYZ82Kc/aN1ZTnqI1bOmylpWUqM?=
 =?us-ascii?Q?4Cr9EfaJMxcc2u9aiIavcqJOOcZmiF4RVWmaWxbww2cxW4GCBJoB3HVdspi3?=
 =?us-ascii?Q?ydF5vB16iMgsk58SVr7QXNh3G+uC+B39dFLyYB3six4aB1ao8V7gManfBJWG?=
 =?us-ascii?Q?Qz/gz2a/41AnSa2cc5MzdviwOI0MjsQrnhUJ58bTd0WdgLTXunQ79wkYGnBF?=
 =?us-ascii?Q?uFKoRe7Em0FKtTc0dC0u9N50D2AKOUTETqHKfUpQed912I0HEhER0MvMvyqs?=
 =?us-ascii?Q?7pwUaXYN834ZA4a21z2zgUxVWjsDl7xn1gUxJ2H7qE3RICJOEb46FF/h6xxY?=
 =?us-ascii?Q?zgTAC/wq0qVYi528+ijxP/iMzeJMhYPFQsdMYY/p7Ubwzw5v+TcfR651521s?=
 =?us-ascii?Q?mPCPd4YOBku8PxC1Ma2FfHXOLVeDv50BmIxlvOGpe1koj4jwCkhmfVrjNMp8?=
 =?us-ascii?Q?ibG0iqCUFOv2dT44pT8YgOsnhOgXZS3lXTP7IfQY7DXEGTBp2xXewsGOxV3E?=
 =?us-ascii?Q?azQh1BkpMnUg4X1t1TQXgFuGpqJ6ABJfNbcX76jGE9rqUJF9feeDH8GGA2QK?=
 =?us-ascii?Q?orCPvBhYO/tGuAGcU7QjpLi+3nQ7ew5SQQjZt+Dz8bDX+7h+GUhUVutfkAyR?=
 =?us-ascii?Q?YYskjdir74zT8pDqUwu4Xy6p84d7suPoUCEAcElKNN3/w6ljd5pgSkLSTLNj?=
 =?us-ascii?Q?8uD+uDRj9jI1Hcj96gjAFxjQmOpnr1TEk7M/dCNparb6oE+wQK34Vatvnt05?=
 =?us-ascii?Q?vWJ5Eb4VltGoZxt4LWWtTFzliKUwFZxTkKGKFste7f/eFetbe4loLzraxSJi?=
 =?us-ascii?Q?a9UtzzdEQd8YsQv5StETuk6lnaPZdybeBuhyD0v8sAKCs40mO+cLWA9DVhL8?=
 =?us-ascii?Q?TBzLOt5DHd3ymCIGYlrZW+rYvkqwVT8Syom+vEUs6tMKZW6uKjlVRQYGKLC7?=
 =?us-ascii?Q?WJn0dXQJaAlJXVEh48kl2dUzZ9G4CP1MoZjqz/bAWjWpdk0libj+IxbejEsb?=
 =?us-ascii?Q?mSeQ0yOLmPVBgH6vBxTKNwfQNTeM0z3Mm1ZqnJceb0I40qkAs2IXRDV8NsoW?=
 =?us-ascii?Q?UGXbUrlRuhDt2FgCxLncUtlk39kYzSsAUoU3PNnK8q8EU72ON19eXE++XuOj?=
 =?us-ascii?Q?5YRAba8rp7qvQAtXJ0OxMz3ShUJbKV1vbVvloFliR0z+OVZTm6V/heTU0fzX?=
 =?us-ascii?Q?QnK6kkf+RYCqNOCnT523AkAiNBhPAVoW4SYZYA/2U9xmUantTRhHyvG9GGqv?=
 =?us-ascii?Q?/VsdqGvfvdb6k018yTenZS3uX+GaBiit6cdIMFAzxiDbinbqpQ2fUrHbGgxA?=
 =?us-ascii?Q?wTECR1tOt/W40l/XXLvPA5KgBBhMQfr1EQYP4jpI9mZcQIZbRy0k5HaCUevi?=
 =?us-ascii?Q?Mi8dTPhwaBZRSpftjs5aZZyU7Vo9aGxb5O4ZnHBZoM4Uapqre0maeThl51fN?=
 =?us-ascii?Q?ZRcRSpR2FXQvRdUozB+lCaeGF32DzpIJutempLyaF1PYqPN/72DGwuoYn6gl?=
 =?us-ascii?Q?w4MA7XB0uy9nu4w8SPCYOtnvzfKx8OAHoEzdG+KvKm8TmlL3bJYJpBivHjJz?=
 =?us-ascii?Q?6UYxF8Wl/Y2mu24iuAjCzaKY2N3v7BE=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d31fc58-e81b-42d1-c4a1-08df4acf6060
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:37:44.7112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbCEED4OXBNhv0J82UPBAlhFMBZDLM1cvZOQOFsvvbmf+Ld7iv2Kr1L3dYILvqmtMGxa7H+HeYZBdVABHfYoD778ukUEKFHqp5hkm5SYvho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1048

JHB100 is a Starfive new RISC-V SoC for datacenter BMC (BaseBoard
Managent Controller). Similar with Aspeed 27x0.

JHB100 BMC soc contains Synopsys dwc3 multi-port host controller.
And export its xhci controller to host server through PCIe. xhci
contains 8 ports and each connect with one dwc3 device controller
through an PHY adapter. Server host USB subsystem includes
one multi-port dwc3 USB host, multiple dwc3 device controllers
and their adapters.

The simple arch graph is below.
|-----------------------------------------
|Server PCIe field                       |
|(usb xhci working in server but it      |
| located in BMC soc)			 |
|   --------------------------------     |
|   |    multi-port xhci controller|     |
|   |       .....      port7 port8 |     |
|   --------------------^-----^-----     |
------------------------|-----|-----------
------------------------|-----|-----------
|        .....    --------- ---------    |
|                 |adapter| |adapter|    |
|                 -----^--- -----^---    |
|                      |         |       |
|               ------------ ------------|
|    ......     | device   | |device    ||
|               |controller| |controller||
|               ------------ ------------|
|   BMC field				 |
------------------------------------------

The patch base on kernel v7.4-rc1

previous verions link:
v1:
https://patchwork.kernel.org/project/linux-usb/patch/20260918071103.24482-2-minda.chen@starfivetech.com/
v2:
https://patchwork.kernel.org/project/linux-usb/cover/20261103064836.71059-1-minda.chen@starfivetech.com/

changes:
v1:
patch1 and patch2: Correct the title and add more descriptions.
patch3: Correct the get iomem code and follow the comments by Thinh
v2:
All modify commit message.
patch1: Add new descriptions and add new property branch
patch2: Add new usb device-only dts example. 

Minda Chen (3):
  dt-bindings: usb: starfive,jhb100-dwc3: Add adapter register region
  dt-bindings: usb: starfive,jhb100-dwc3: Add clock number limit
  usb: dwc3: starfive: Add JHB100 USB device adapter port enable quirk

 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 59 ++++++++++++++++++-
 drivers/usb/dwc3/dwc3-generic-plat.c          | 48 ++++++++++++++-
 2 files changed, 104 insertions(+), 3 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.17.1

