Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022109.outbound.protection.outlook.com [40.107.75.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C839EF30;
	Mon, 22 Jun 2026 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121448; cv=fail; b=GPK7dE/uxhMK/LFo5sK/ekituvwNPrzmoMc2MvQ3mWaMl0xOYym2YjOyBMAIJeBizKEVpPvjHXQHsuhJ1r6w5T4XKvJIqkkOQmT9Kk/t0SAW9QDUvMjbiGy/hqENfrnvqRF1Vdgxv7py70LZFo1xW4Mvdu+/TdsVAelc+9oIaSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121448; c=relaxed/simple;
	bh=k7gC3gjoFpHyIer8Dx8UCMiwfzCJnnbGuDb6boSe1x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HB68Wril4YfqYv6ruQU9VmNurGcY+sfxl48aSN6DPqqMH/4HcijMk25YpdThEfUj5lxkXTYk67pgOURTXHSl/R/S6t2yTvsFKaLk7bzfzpR6V7PhToYURWknZCrYhK0YhQ4eUjWS9uhT5UKSY/CpDSARMKYF1W5sldiEVyVsf6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=mvxAapp4; arc=fail smtp.client-ip=40.107.75.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="mvxAapp4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZj+L+QabQ0Z0nw/fkK+1bZUDendvfyINMb6vEJQtwFKm6DKExYtDyVf+4CtSq8WSoJjGLDGozV11sui+uP9bMK9GKA1ojkUwdD4cAcf9HKP5wxjDT4WWqWh9BIo1njHlXwIlwDxUURlBD7VQYGLdSxLz5w4JPqMpK9C61nX6uzcRB3J1v7LBPQO/nONdRvB3oYS5MqIv0GiZG9PeLLSxZasECHLHj27Xt5zrzIod0AHklCtOMDrsyebcEuSr8e0Ox2oNaDIEW6upcf1xEYfSSBIILdfyNjQhQ+V2Zp7UglVbiK4VWk628ZAvCNd07AZNYbJJY+yzjNt+x9b2m3TNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxDwWO1RaeTxfNUBE1pGQcdX5SSJVLzGZoG+dmhUnvc=;
 b=LXj9AmjnCzrPEaeBTlSQQTmbkppDWXGGmV2z+eVm7nEiTPfJZr7MSf5SFK1K0f+ImsX7/VlohdkJwnUbz10+OlyBNZ17Emburw2MHobK7nGxgD6rb47EPf9byrki5tEl+2h8zXWKApzQDnxW49xQkzxa3h6UTeKXiNdvt+OKZUgaCB4l2SRO+bJ3KrRht3+szwD75PCIiosLxZVJVtsC5TIonOvFs+OaDL17/bV0ECwWn2GKljf2FhMGadmFzQ8EkCZybV/3dtpyHtpsPiPQx/8Y1QklePJ5661fXIFAT+BQ7GLifnxTrn2ix41NPPbiI9XVrRdNn5PSZPK2U+he9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxDwWO1RaeTxfNUBE1pGQcdX5SSJVLzGZoG+dmhUnvc=;
 b=mvxAapp4TqV0r9qoVZeRsNtLtKhezHRyv1R6eKIWd+FsRrDK5QOeGWSEWHmcDyqHveEZVBiB34l171mgPK8UPvAh3zMitjrX2O8lO9hwow+LlVLftyR9QJD9CEVRl3u2Yc4lUb8bqT+0tBUqm8o1VcvwcwbWfXfN4fu8ahOjFzPJHJVpT8hx8Q5yiwJbQ6sTtR9EH6guSmYGnddA4bXekQVjo7VmbzryE4moJaIqpAeZqao/ciBY1c7wys++c57+FA6d/OE8Kz+8VricAg2WM3dBoMEizlYGN/W1FKJw+Psi3Dr1648S8EMcfPPwhfyLp+HhjlyEtwxoBMKJCzYH8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SI4PR01MB8053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:29c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 09:44:04 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:44:03 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH v2 0/2] USB: serial: ftdi_sio: latency_timer reliability fixes
Date: Mon, 22 Jun 2026 17:43:38 +0800
Message-ID: <cover.1782121274.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781744946.git.naveen.reddy@ftdichip.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|SI4PR01MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 2646d103-8879-477d-17c6-08ded042cb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hgT9WFD7UYSE39WHOCSLOTNIBlUn2cOSN0RZyIjxr86NsftqOGHXGKdSfwhlbC2WWDVZBLj2nv3gO+tQKCAx2ohUvTfhcRy/Fy1SaMMlVK5u14QN2qFE8pTDvhQxzEk4UK9oGfNfoUIVq+fF7sHLjtDL9OKLEXNZw97iUBKRPD9LuQOOyP6WQVK9feXZK3qEXJhJTRDQ8Osqiftp+r9roXn1324AadTrtypPdk13BkUD4VN7TSxBmIRX6jNcr0xoG091AGlaeTFpIBKRaWk+RCKWrCjiGft+sWepA/wXZhvLmHSwVoiHdErQ5BHVaUfzeu9rOAV1hLpUDQBUcdydpFZl8U3cgXvSMX1mHWPpfTfohMbeoG8TM1FAaiuTCnphG979oLLX8uVYUh+jtBCObcDvcun3BKV39M5sIgfk/zRfXE9JjIEBDKGECLz44x/ATByhx8Hh1x3ujDGYKKVyrmfuZLWUBH/d4SvB/ixIf7t2+fj2/HEKBf7M7PYOeH/QiouIxATCOa6OUrlMqBygRnAKl1KC87tmMCWdJR1rAAPZhN3XcEbpgMj7Ddd1uU+lDRh40E1EUz/iaIk/NTXMZP9CE4eS0Fu/F9GVCCHIpOXaMVab4fEinctXGT/g6WMNkCiZYd2Cy1D6KSizDh0E/s/sFouINjDH6wzJXvHJFrnEFt7lI+kZn6V+TnwqfT9OsBVwwSAh8j9LYIjXpW7NHqhhJxWwfoqzJHT0gMxl2aY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BfKGiQN+4gmMDv9NtaJevl5zx/a106s2uqIRkyW/OVGmJJKQTwSecZIOwk+p?=
 =?us-ascii?Q?LlxcnvLxvkXDeH6iV8hzxPU1YIv/e750LpdZ+2o8IQVIUIurreEe1OOZ00+L?=
 =?us-ascii?Q?91yyeRGOZeJFAlguTxa7cX6MAXpRKqeN3dkCBtq58+vFueHmNQXDzjOwMnSX?=
 =?us-ascii?Q?5cwgk6Fy9JhY9my81bi4AXXZr/1MVAs7Vw1kN9gBuUYet/l/+tlHXprF7bPp?=
 =?us-ascii?Q?sfc1zw6t4krXyQ3SCAeO2LerZdk4ufSBfYZ+0Es2DUVvp4xAN9Q9Axedbg3y?=
 =?us-ascii?Q?gonBEhIeWZfGuL8wojTjHE2jlP19M1zoXjkXDTQQOMbXrawgzH6WE55Lw/kI?=
 =?us-ascii?Q?OHkqegpVYbe9geVFI5Z1irUjzW/rZBxSz8Ik03QLwsr5lhTQZEHTgiJS/MoQ?=
 =?us-ascii?Q?mOgcCKaaPpapfOcsMdBpDQ6FfV+qE4edKDf2HhXEfZJ0cLe8pdgOYTM/3IC+?=
 =?us-ascii?Q?z03fhHqzIYLNeQ3E4Ko6ty49ImOySlrq85xcuxCnHqH0E2MSFGsoZTCbtA0G?=
 =?us-ascii?Q?FRbdndnTXDzNIWcrzdUa0ETVZjXWAlmJH/+Y1YMJaWKKWPWcnF1S3wgT8/eE?=
 =?us-ascii?Q?k2S49hEXjgEkmnvAQV0UOXh0cBaYAjlSOUVOx1dAAlREYbnb5Qe5+HFqgMxJ?=
 =?us-ascii?Q?Fv2sMw1jHWa0E546/kEqGUSckVXQHq/lMbGmMd0fjnw7g1bqIAMR+YDsrK96?=
 =?us-ascii?Q?cLNHkkU+OGDmaMF6XDtDBvDVOXySJKbxYklx8Dj15Hcf/t8zd2nsx0tXt2Jz?=
 =?us-ascii?Q?68JRqSvhuYUb9mkf6RWCZwJ+HP/SQpllSut16nRsAPFHnZWkf6d/pR7uA05U?=
 =?us-ascii?Q?l5yBGpVuAY7gSQJttkWHUaaxzh2tMwvXjopVr7JiwV5dxOmsyje839q+OKi8?=
 =?us-ascii?Q?85PH2AaUfbLwaRfzulKqq+CELpsYcDfmGVTOUd+TOKUL0Lw5opoQ28EVgQAq?=
 =?us-ascii?Q?9QWpOVa0we0ejXXkvguQlkM2EeKrsDvAMel0V51V+PwM3x8mBsN5xcPqTHa7?=
 =?us-ascii?Q?jH8MwWtyhxT15GhucNzqLsD3lL1KXaN2SwS/W893hB2Ebyjx8JzM4UDUkFPk?=
 =?us-ascii?Q?f1/Qm2kNv7aUNHpybtF61DG7D/dW5JJcVJZ0DBAVoGKOsPZoYBSlbFowlIX9?=
 =?us-ascii?Q?8fXJqJj8SlSMTCef292SX3jApG9yRhckqO62zHicZqPrB55U+iVmf0BplPfA?=
 =?us-ascii?Q?iMWvK/blp/cdMRBNpSf3L1MjLRU+M0U/zEmSayqNdbqPoimhxlg1a2E0H4g3?=
 =?us-ascii?Q?PztAWL7xmMGLVkbxzJzue7JdRNEmGPdU3ixOQdsqvQuQ7tnCQJfsHOJdKsho?=
 =?us-ascii?Q?8PfRg7ukOHl3U8b4NFMSelpqz31iEPlmbcvSx1/HDnWNfeUucL36NDzps7zw?=
 =?us-ascii?Q?Jwdal7Kjl30b0+ZCVfQtHw82561OmKlC+rY1iAqKdVSU4IW/9RBjgRIqj8ts?=
 =?us-ascii?Q?m6nqmlfawjF0jIYMMOsCzTnQfMKViHc2qsn7lpciABBA4q9vFTYl7RSoQxbg?=
 =?us-ascii?Q?M/OuwCFNUxS0HCywDGKm9ROdozbYA8OIZPQyS8dq9Eoi23MKkd5sn/lV+Qnp?=
 =?us-ascii?Q?Ppm1e4m5PDW1+i4eaqtebk+lOUeEeagOmfAIqrr4zZFanTi+nkc5a+jFSPkx?=
 =?us-ascii?Q?r4FbU8Go17yxMwLaZAUB0Sl1234hmNy3e3VPFS8QyQiDtComFBx9V7fUC+Rs?=
 =?us-ascii?Q?+9+aUxCcyVkp+0uxVOuzLaJRaEXn8+6t63FDT3w2f3/a7+S9oSnIRhFQfaRZ?=
 =?us-ascii?Q?kDd9oVJywyBT5nDj/xQgPwAmBENRYz0=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2646d103-8879-477d-17c6-08ded042cb6c
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:44:03.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/h7tzV4FoZ+7F8HMxPLk503t/BzIn2HGecmuSYxoCSpG2d0qOlBPjggq1hiu3AKoWQp8MZkXnL1Bw+OvsJoGzbHG5Uls9p0S2aIJZNp55M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR01MB8053

v2: Drop patches 1, 4, 5, 6 from v1 per Greg Kroah-Hartman's review.

Patches 1 and 6 used module parameters (urb_defer_timer_ns and
low_latency_defer_ns) to address DMA-channel starvation on a host
controller that does not enforce DMA-channel fairness.  Greg correctly
pointed out that the host controller driver is the right place to fix
that, and that ftdi_sio should not carry per-driver workarounds for an
out-of-tree host controller deficiency.  Those patches are dropped.

Patches 4 and 5 (per-port low_latency sysfs attribute and its
serialisation fix) depended on the hrtimer infrastructure introduced
by the dropped patch 1 and have no standalone purpose without it.
They are dropped too.

This v2 contains only the two patches that are independent correctness
fixes for ftdi_sio itself:

  1. Retry transient errors (-ETIMEDOUT / -EPIPE / -EPROTO) on
     chip-side control transfers so that a single transient USB hiccup
     under bus load does not fail an otherwise-healthy one-shot
     configuration (e.g. a latency_timer sysfs write) back to
     userspace as -EIO.

  2. Make an explicit sysfs write to latency_timer authoritative so
     that a userspace write is not silently clamped to 1 by the
     ASYNC_LOW_LATENCY tty flag left set by an earlier TIOCSSERIAL
     (setserial(8), libftdi, certain tcsetattr paths).

Chinna Mopurigari Naveen Kumar Reddy (2):
  USB: serial: ftdi_sio: retry transient errors on chip-side control
    transfers
  USB: serial: ftdi_sio: make explicit latency_timer sysfs write
    authoritative

 drivers/usb/serial/ftdi_sio.c | 65 +++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 7 deletions(-)


base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
-- 
2.43.0

