Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA664499B0;
	Thu,  9 Jul 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630423; cv=fail; b=rubX9GPp/ZhTHoivH9+A2t42GUM0xwt0kZ6Dj/Jcu+dpo2e9kTtbsoHeD6Yb+fUxutMKRP+OAlG84YWbiQE+ekzy0pSeNNUoiHdc++lihdxcaUvu2DNv9C6CQyn8ddTtEkBfZH+7FtWZwvFjR7aLY14szHwtmlSO0II25R2afuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630423; c=relaxed/simple;
	bh=U0jEj8mRNxNrsbSf9W6vbsf9YSVF/M8IY+ctG+4NvbU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=F+wmyAvolFUFJQBS0hy1Rz5AOrsKAFbpsbwdf2rEosD5IQeVS2f1dARE4ZUtj4iJ5WQqmEOR2CNnErR1CVCIjdZ/JzyCKSanaDOpqSKNPJfsz4sxdJnMw9hHP4x7C1cKqQi2QqvGCxZmFfosZWNuKnRINo7Xe2PsESf/LUcXPBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AYwO+L/2; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AYwO+L/2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWURINYU/a/KYOgdiJvAGhStH0PBw2HIHVknGBalWzV9UZR8OiZI0YFJLyFlWc7JPSbWTyl/RqtIp6NHDGCXtMLQz8YVJqHD6LhP/FJleGI4tWbyFevmTE6ftyYc2I9H6zdzpAeVCz0afOg0ASDNBwCREIIBn/5lZMh6NFcDGuEe07GEokkjkQYC+Q7OVsCFmZmJHYf/I42dmZNWPb1t+5xDtDL1Q3qPwJj/6/EFDdrRUwKpyhMbHsGWKZcy/VuZYIdyCZ6UQovqVanRxs0p9WLOmseRYG5OA6d7pAZzz+d0v47jUORpdwr5qFnnWuDZJ44IupfKXhw+h6B7OhFi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L0k5jb6GIDrMfgjDBIKG03t9dXY2nr5u55XktXtM38=;
 b=QIGoSG6BrqcB2qAJWjIZ1kyj7BRmdnvn1WCe7Vqt4AujR2Sck/WcvXqlqFyjVUp6IuTZcrhvy8wlveqyxc2ildiZiMIpRluOTidOMZWOb0D+rMEIBQR8+Tszn3ZZJChL88bKqp0E9WyRA8YhETPCJ84SInv1MBWovY6y9V/clDm+LL/EY+vIuLmiGDZGGx6XP3qViFGzO/WMlTjkUL/kE6Zin9FjZ25FaCdZZo7E8dp5aZSnXZimNT+tIyUySe1VLn6+aG0M11N3vNPrgNiW/CwIkUSTVzYqO1qj4cGXhul6bAMWEkDPPCgW1gkwtQ2cHCZ+ZmGNGHIpnVuhEiQF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L0k5jb6GIDrMfgjDBIKG03t9dXY2nr5u55XktXtM38=;
 b=AYwO+L/2mp+uqRV3x+K698/DmLuO64Lv4B9eb+2tiUNal1okvJ8TinFqagvZc1UOrdIvSmBTrmgTlMnRNf8j4foaG4KJ0GLJEG8zWGrxOv/GxOiNBPnDjrsaoybQ3GUshu0vCBpbbotr8A1J9nqLe9j2gRMJnPWHb+HdbtEccuJncWtz1wMHashi42l95lCRueYZx+uRIhYduC7JmuB+ybKXc4/bAHH6MRACxvCR+pe/tzyw05sfvGoh9kAJjE7BLFv01MD12RUZEONEZ9tIpY+/XHEAEcRxCdl9V70O5rl7z1T33X6uJkhlJoZ+yRhXAlYe/BSBUeHMYCfrRDNjQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9857.eurprd04.prod.outlook.com (2603:10a6:800:1d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 20:53:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 20:53:37 +0000
From: Frank.Li@oss.nxp.com
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org (open list:CADENCE USB3 DRD IP DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dt-bindings: usb: cdns3: allow iommus property
Date: Thu,  9 Jul 2026 16:53:30 -0400
Message-ID: <20260709205331.636449-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: 3405c90b-77df-47d9-5d28-08deddfc2632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|18002099003|56012099006|11063799006|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	hKlsJ6nV58QREFJyj51WY7CvOU0oIitnN6tu7rH6ZdYXDautqHtlriGgTQxxzH9JaX2MTO1rkMttcgiUMtJ0/K055q/XjAf8p0xKch6F8uqlQvF8c3leGLfGD3YdHvchCp4lyPaz3MHKYFqA/3PN/pngRFxDEV1x2G+P1u2S2nfW0/FaBqTKIvWmahQr0b0fvOfsWhhCOhFVHCLtJkULC8ogxuQi6KnhrZu+fNXIrJqcLmKDFb3vD7RQ/kgxbd7kzGpANg4FC7DsXl4xaeLr7ZVzYqcw2hVzNDwVaodqLcdJeZvJu9NlSiNjchF4Z9DPTUo/uaV16JXiZifB6AwXER5rAImnN/RJ3/gmgk3x8YYDd4rndwD8A1UW3i/3MwjxIkoF0Csg7lu46lOOeyFekormJiTe/pUvyLbEOPXa9p/LQFKEWxxPPRljgjYRaFzePHFu3a40Dg41EkxGBPtx2htBUTUaJa/7oImpVdsKC/hxkPz5rXrAJVBxcpQ7fumgSJ/ywpg+E71CaLdfe4onP8xpzmqXTQIQAjOuUIRU/RCvhBGHcnnh/DF0HObWe3gX/Kie/2tEGW5tuTYbgM9h4VZTQlRdr3pM53/aNY5iZctYijLLtVJZ31N+Bfy6i3aa4qZjWWGFX7dD0mE23M3vopxm6AaI3y/e6gNYvfP8Wmqlzh35XtkqJd4JrMTL6vpygSMFFP1kLrgitqrqHTyNXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(18002099003)(56012099006)(11063799006)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GlmXBAVsuPOS5pSn+qe8+kVjwmXGDwZ6ZWTrnZiB9QjyesvKawPY1LnlgP3D?=
 =?us-ascii?Q?qjW7Fq+sTH3X/8a1RFb2OCTwQyqKpDwqwve87Xznr4a3i+CnWV/ANKsLzfC/?=
 =?us-ascii?Q?4VeUywCW+ZnL1XcMgBTGgpVI7G3jxH6lwekH3vSU3wa2fjnh/pP71hX1uOiA?=
 =?us-ascii?Q?uBV5NxBvq56oZ64qirDnT/QiMU2LS6sbkCj3GIvmyXCW8V4b0WhAgHdmaZWq?=
 =?us-ascii?Q?Bk6JnRgaRNu9tzoxliRkDJ9P9tQbu5kNAYuAaVB9PmBMN5aXT7rBSvMrOLPz?=
 =?us-ascii?Q?0fdLDXgwY57d1v/X3UjLgBV0916jM8ShCS8ianIGCzmgrHrcUUb+X+/ajzrb?=
 =?us-ascii?Q?pMo6RNqz2ErjIeEu7OyHLqcfaoqXKkl0qemvdn+noGz7bNUbvwjlIybpVIiq?=
 =?us-ascii?Q?GS1wY90Kd8KdHZMJQUQDFsI23Df8aqt5aKAHPxC66r2wSqQou//PrTLiyuMg?=
 =?us-ascii?Q?Ghhnz1W+Z4FcGBwHiKsyYhWlHph+IOVdE87n7W7NUXQK88y8OLyjtwqI1y+i?=
 =?us-ascii?Q?nhJAuZo7ZfSvR9PCMfa5BzmO0rXRXZsJMVO0HvOGlZ++GeON6iNydUEojSTv?=
 =?us-ascii?Q?Ey9PwlwfANojmVuK9XsNkgNYevirZSpePCqQiqhkns9e+219VrriPv2NPSEL?=
 =?us-ascii?Q?laNRMevXhCAuAkbRANg0bpnpizlZS8hg+1YOI2k8eMlYk+AxYwn5d1Fc/cr+?=
 =?us-ascii?Q?oaavurHLytSoV0CLiAG/KBE366eLNFIC9vpmIRyCxSM2VL+bRGPOHGfyOn+O?=
 =?us-ascii?Q?VJIX+Tf9nbd+cy8Mq1VJoRhfHU0k2lSShrVKoSGzI3agkOQNjwN+I8VPSZL7?=
 =?us-ascii?Q?HkjEfh940tLT+UVF2y52lacxS8WVJpLsfJJ6g7NaWv9uso9icDmCX9wcezsn?=
 =?us-ascii?Q?8g2EcZ7f1wzFbU8xJupeoV7sdtUSsCKI6/o8P8gzgkueBKKY46MUZXKFgYpu?=
 =?us-ascii?Q?HrAUwxzHtnVwsaZZpSB00HxZTiLOW+wfx5hP3ScLCrh+I6TDX7R1k/s+fT7o?=
 =?us-ascii?Q?YvFAmQPcgYRgVlHa5a+ORlPc651sHiZjW34bgkO4yZ2NqRrxvhEgnDXcTXwj?=
 =?us-ascii?Q?xOyM1wbBGZ7qU74BC53o/YmDNEnZCw6eBvcYm23b0/Y+9e6xXFjoZpr1dz1E?=
 =?us-ascii?Q?/f/JwPCYx3jYQLfCbpRu9bEcds9txaMVY1RnYD+Ady+WdlXIDOp3fEa8nU9c?=
 =?us-ascii?Q?iAlztutCHDWVQ+Psj1Vg2zbYVFFp4R65Z9e7R90vtmmQnnwYLpiHp9q6dXP4?=
 =?us-ascii?Q?5ngjpW+tnDa9ReNeSoaQAuX3nlF7CnfBy+u/409gJGn6LfGop56S+KzdOe+v?=
 =?us-ascii?Q?cxLBMV3brza5+qv7XQzBP/gGYrc79nZUZTZgstjl5ZCa1gQjiCvMEaLh+zJh?=
 =?us-ascii?Q?F2nM5sQPOIMmqfVQOkH17UK52t0qzFWaC/snHrawJkJ2FaWv5ODdFDRgJspX?=
 =?us-ascii?Q?n7eu16Fq6tyvnL+Z1lKDuRWBeICpGnkrstqtO/lLhn5jAqLI3ZCbIRbQquD5?=
 =?us-ascii?Q?hm6OE+fwpqw8GJiLnaGgh6Ox6GlMYltojnShKjLHfT4Lx1WnDXgU+whNJ6A+?=
 =?us-ascii?Q?9ys7unx0405QIipIJ/O1spi+fkRNZroewN1caHWZR9lmvEwKfiMjwrhhJQqh?=
 =?us-ascii?Q?on3fPpsU3RkcePg6Gneit2i2Txfo67DxqVqcQKc+x/xmV6CZzAqXGukTvP+T?=
 =?us-ascii?Q?/MkN+YZgw2JI2acaVWx8jiqq/6nm0jqwx76WyitCIK0P+x/QpBCCU8Eq9nCk?=
 =?us-ascii?Q?805aEdEg8vI4Q2dRb52f6d3zUw1fX0ahRGQbl4WNfB6uu3r4tN6T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3405c90b-77df-47d9-5d28-08deddfc2632
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:53:37.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrEYsG85kxqlm1u8MrBFRzlGrjZANgWpezm6feEZuDucf1pQif66ZwJIThxn0nYzOSh+hOaLDBQ8/FD7W3Z+JCDGaEKBJpGSc0i0Q8dJz6XkMIgxufNCM31pLWgfzl4h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9857

From: Frank Li <Frank.Li@nxp.com>

Some SoC such as i.MX8QM have iommu support. Add optional property iommus.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index e8082c5c05a25..c14a88aad31e7 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -50,6 +50,9 @@ properties:
       - const: otg
       - const: wakeup
 
+  iommus:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
-- 
2.43.0

