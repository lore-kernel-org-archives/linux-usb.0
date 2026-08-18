Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022076.outbound.protection.outlook.com [52.101.53.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1518B0A;
	Tue, 18 Aug 2026 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032659; cv=fail; b=kWQBDKe3voBKRX8tesPNcFKcC+9ZTlQr3lzltpOBs/X2Q15y4cPMd2EEmkMAofSQg7CTyrqbOBLlwuoRnfKRPnqIIxZNm+MV6uGzLMrCdaDJ7HYRS20gmOibwnRPr3Iwg8YQ9CJHVim8qzAR7SpEWN65ZbKQNHoqkdKOG0RR2XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032659; c=relaxed/simple;
	bh=G38TuLd/fQ5NtjS/eTnrSI30hzrdndZMxe8/kDFmYQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZTeC9qetAl67ENqzInl8NFTWKBVSSmb92izdaF1xSEdSIZqlQh4FmL488IRE9F5xGITImquOpdC90Hn8HDLVFBZgslR5cp3wiKSm24ShhMG6Rr1EM8SSP8a+KHupg8Y7zqqkXM45arQJocRsXvrh9GS17nrE9AwTUw9TM4XcS+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=gi+xoK8f; arc=fail smtp.client-ip=52.101.53.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="gi+xoK8f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAFiELvKZgGZ/M2KDTsFkgWtiOmSKyWzJ8PblQ/c5MKyE3VVnTMHMvAlIi0A6a2VWNghHEfpxUo14PdEqgDXpuQHUuiVk9Rn8nWENgfSgofF3PYWp80VGqyucJLvYUwJA9iAz/95SvvOGRXA/8AbUZnMJJ0/TZK70/EMZ49qvQxE6b+U0992rpoKUdCddpsvsiKj342jAkbuRM9AGxs/lVDpXfueZtgffoH16/xfMs+vHhs2yq3jZiAelEDqxwc8Q6TmUAyWC4LvDkbQXaBVjvs+Eks1Q/pu41va5mkyIqLtZ9Oq7bAOVhMO43cknwAa+7shudqyjVlwpPjjYcUAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DwHuN9XlTnITw3KD4/rP+8gnA/ArBGB53y63PJC+4E=;
 b=i9liL+kyjqonxRKlH3qiWSBkXN4k7rD/T3m49YVi6SeqBjV4fSeKYGyEeNSgB3ZghzVkrvlJifi/2iPN03rTnkzvf+ISArwd5MEhv/J6bTjKAfvqVMFhlkLCpuYRCKzl3qSEtoVGYrAE15UqdVh9ncK2fSRbGSCG62HzycZ7ykrpsPKlU7Gl47gKghlrS54F8PM9q3kLimo9kcZkemOFPpdsjQhlvjtlfu9DuCgUP5JTlXcY4nRNntYmf4NO+35QPHrY4aO5tu/PKCnLqb8u6WbHVNWyOLXlSXvugPaifE/QmU174P+Eys0l9arOEofA3Z6yKEgWvM9jyXZqa9u86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DwHuN9XlTnITw3KD4/rP+8gnA/ArBGB53y63PJC+4E=;
 b=gi+xoK8fJ/Bkg7Y8lXFQ710SYE7VNxu4+Uas+LI/j+9OkOIE+eg6aQxzbfKkvEyYnAiUPez3ogPVhVqACQmPeMf5NOopKL9Myf9EPT7gCy7nzDFJyFs0BiYGz8gv+spr6qRdI1bZWcskkaCHjGDtiFMOL4uhYgkPB6T18wxjVzSVATS4dFkYE/ClOUi0y8/SK5w9WLGTgQ7OM6oAxuEPS2eXwwYJdqpNN3RhvTnBazdgyC+UiD3XnnDo6kHR3ufjN62agWr3HER5lQ380ayLBw/VoWOcwNHia3no39aPAVa+xSXPlRDG9N6vec+7SuOGAkT4hYrllY33OR2Hnayoag==
Received: from CH2PR14CA0040.namprd14.prod.outlook.com (2603:10b6:610:56::20)
 by LV8PR18MB6060.namprd18.prod.outlook.com (2603:10b6:408:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Tue, 18 Aug
 2026 05:57:32 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4e) by CH2PR14CA0040.outlook.office365.com
 (2603:10b6:610:56::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 05:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 05:57:31 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 1D44E4186B53;
	Mon, 17 Aug 2026 22:57:31 -0700 (PDT)
From: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Subject: [PATCH v2 0/2] Axiado AX3000 and AX3005 USB Device Controller
 (UDC)
Date: Mon, 17 Aug 2026 22:57:12 -0700
Message-Id: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADn0g2oC/42NTQ6CMBCFr0K6dsy0/ARdeQ/DorSDTILUtEgwh
 Ls7wgXczOR7yfveqhJFpqSu2aoizZw4jALmlCnX2/FBwF5YGTQValODXdj6IC9HRHinFrzUHIE
 L4xTDMFAEXVY+73RdoLsoMb0idbzsK/dGuOc0hfjZR2f9Sw+/nL/8swaEonSEtm5RF93taJ1de
 Kpm27YviGdyotcAAAA=
X-Change-ID: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9
To: Krutik Shah <krutikshah@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039;
 i=rbnaveenkumar@axiado.com; h=from:subject:message-id;
 bh=G38TuLd/fQ5NtjS/eTnrSI30hzrdndZMxe8/kDFmYQM=;
 b=owEB7QES/pANAwAKAbh/+EWc+O2/AcsmYgBqg/RKxC9RlL0OcUz4oAUqvnaD/W0x+s2Cy+TDO
 o/yKerNLqyJAbMEAAEKAB0WIQRgwxMPfi/g+F4zFkC4f/hFnPjtvwUCaoP0SgAKCRC4f/hFnPjt
 vyjhC/94oBJ6NUvw9jtSHLH5Vy/FwXv5nPfGG91dklSMa7eTLordC7JYgTGxIv7OvkX5ZIRZbdw
 7q6R5GB2ovLywde0/DG6xNyGbFeHhwuIZA2hh1y6fuUfyk/mqBrCTFhddyJWlHlctAnh2xymMe0
 YBEcwSmelFxn7ii9FpCwebxIq6HNCzPpuC8MZ0/AKogs24pA7vIY9EkhfkisTC+PO8pqB9Ez62K
 Leqlcuy0P682skcgCCP1KVw0C7PXd5GEp/Wm8kWFuBwusz76uRVqV6BS0fdE+XzAutS3UpG+qu8
 3xXlF9OZkCFCaoGrbmWUWca0iB5R2aDrYf9TfO1CPWFABC8uGOkXJ/Mh1XOA+CFTxx9SCSqcTgl
 px9es6qjXRTh+dxCyLbLv9WIM+Ql0/DyRq239IqbvFPaDhtrS9tGVUaf4B4kkThLRbUGRP0ToQA
 YlUd5D5UO1ham9ZDEqbaoEo3/neqrGjf18gFt6O/7W/UcCo9Bd1nIM7+rq+gX8awAie6I=
X-Developer-Key: i=rbnaveenkumar@axiado.com; a=openpgp;
 fpr=60C3130F7E2FE0F85E331640B87FF8459CF8EDBF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|LV8PR18MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7d9c4c-d362-4ed9-df5a-08defced97ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|376014|82310400026|23010399003|18002099003|56012099006|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	/Zz6Pd1pe34K1M/4LTkAK6B9q7vXMIUoI4/xM8EUYpEnDcZE9ezTJUgq3ECLpZsPf1tkajnsrAEJqkVmke4lr+fXPmKFx7In4C4PHmaqA5hr4xpu111KcmtCyfh9zD8V7tasFTrQgCcPmL4wPlsYHtXGhY/MSmCCC3gy3Z97JxUkREpnGf03yH5l7IBEsz4TNr9th0B9yevZMIkNkZJLy8f7cSRkMl6mEZrsDWfKidHm8PzeAjgonrF33i2wCKDX9F5PI54/VmiWdeZUT+gM2XOKiP40DMNcW285JE5IxMIOnniSLjEpRYJ7AC41nFx7mob5zzelwdLocmJ7Lcr5NGp0axHHxSAzTBuCeoFRG4bXRCIfyfaZgCjOFpdicz8W7PM34v+hSPOhhxdL1+GUYyDrXP9eh4EaW1Vp58QzJs+Q/Nr5fgkrbhewkQ96llEU/hbkNh5PKVnM/Kkjvq2u+Egh9f7jOivlaLqDginAINy0Lf9mekVAoFi7I9ir2fB6kmMxsVm6aArEfzQsnrQI91B/A4RM4Ic2Uiq0hmtjxGvxsNNWqyF4duZDgpdOl5qeRoMgHaA8iRelybCxCK3WXQWEoVs1GjAarkusnRNy9GxHFOsGdnYl4FFEo8z+42vJFUZTGvNpvKc/U/RFcE7F1gEX1yQ/iE4Wu5f+jXlTq7Bf/LWOPzL/4cIOAuSML+oi9DEEf9WicXhxpb7EBZymiQ==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(18002099003)(56012099006)(10067099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zjgy3jV3IZ6TNTNKQ9gvj57W4tqnOZr6D70/JZ8IoxB05B4McTugLfKoImVBkUGgRgOIQIfgZCQUN6wHgy1AhBlLg1JPTKLIQPq1HOqkAkQQ3oHtPTQiO8xGX72CSsssf2zFwSdUj8p2zX4agXVmr6HXUtMu6+xipxmw3JO+hdEtGGyGrOj08NZn1ZQd3Kr9/GP7Fxv3jc47JvzfaJD/NsagQU0cO6LwdeSHQen3y5oXbu3qXsQVrXKnKSrq6WkyL5BOGHWjW5xE5ORsk47/Xa21wUPkRH4DwNyGwRAIcVjVizlvr2wz2aG8KtC7xg86EIXB11Kkro9SAwaN0aCNqzumUlnvDwnHDRH/wREpE14RExItgZYPDY2vQNZ+S3LU65lIObMaRqLv1zfFV+8Uv0mu34jIvQp/5j1tEjBV694Zd1RjaEl0aAZy5Wk3HoQe
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 05:57:31.7724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7d9c4c-d362-4ed9-df5a-08defced97ed
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6060

Dear maintainers,

This series adds support for the USB device controller (UDC) integrated
into the Axiado AX3000 and AX3005 SoCs.

The controller is based on the Corigine USB 3.1 device IP core and uses an
xHCI-like programming model with a command ring, an event ring, and
per-endpoint transfer rings composed of Transfer Request Blocks (TRBs).

The driver integrates with the USB gadget framework and supports
High-Speed and SuperSpeed operation. It supports control, bulk, interrupt,
and isochronous transfers, including scatter-gather requests. It also
implements endpoint enable and disable, request queuing and dequeuing,
halt and wedge handling, and standard endpoint 0 control requests.

The standard |maximum-speed| Devicetree property can be used to limit the
controller to High-Speed operation. When the property is absent, the
driver defaults to SuperSpeed.

The driver was tested on AX3000 and AX3005 boards.

Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
---
Changes in v2:
- Drop the dual (GPL-2.0+ OR MIT) license; the driver and header are now
  GPL-2.0+ only.
- Register via module_platform_driver() and add MODULE_AUTHOR/MODULE_ALIAS
  instead of the hand-written module_init/module_exit pair.
- Acquire clock, reset and PHY through the driver model
  (devm_clk_get_optional, devm_reset_control_get_optional_exclusive,
  devm_phy_optional_get), with teardown wired up via
  devm_add_action_or_reset.
- Switch to devm_request_irq() and drop the manual free_irq() paths.
- Support multiple instances using an IDA (DEFINE_IDA/ida_alloc/ida_free)
  instead of a file-static device counter.
- Read match data with device_get_match_data() and move the former
  compile-time feature switches to DT properties (dis-u1u2-entry-quirk,
  dis-u1u2-initiation-quirk, reinit-ep0-on-bus-reset).
- Set the DMA mask via dma_set_mask_and_coherent() with a 32-bit fallback,
  and convert PM to SIMPLE_DEV_PM_OPS.
- Fix endianness handling for TRBs, events and endpoint contexts using
  cpu_to_le32()/le32_to_cpu(), and decode setup packets without casting.
- Locking: pass the caller's IRQ flags through the completion paths so the
  interrupt state is correctly restored across the unlock/lock window around
  gadget callbacks.
- Properly free all coherent DMA allocations and add
  dma_mapping_error() checks after dma_map_single()
- Fix DMA directions on the GET_STATUS/SET_SEL control transfers.
- Replace open-coded register busy-wait loops with
  readl_poll_timeout_atomic() so they time out instead of spinning forever,
  and return proper errnos (-EBUSY/-ETIMEDOUT/-EIO) instead of -1.
- Replace the custom SETF_VAR/GETF/MAKEF_VAR shift-and-mask macros with
  FIELD_PREP/FIELD_GET (include linux/bitfield.h), and use BIT()/GENMASK()
  and dma_wmb()/dma_rmb().
- Use DMA_MAPPING_ERROR instead of a private DMA_ADDR_INVALID.
- Remove the U-Boot-derived VBUS cable-detect routine, the VBUS-detect
  kthread and its wait queue, dead defines and struct fields, the unused
  interrupt-register-array macros, the mdelay()-based reset delays and the
  bulk of the dev_dbg() tracing.
- Implement the pullup(is_on == 0) path and route suspend/shutdown through
  pullup(0); mark crg_udc_ep_ops const and return IRQ_NONE from the shared
  IRQ handler when the interrupt is not ours.
- Use dev_err_probe() with structured goto-based unwinding in probe.
- Reword the Kconfig help text for USB_CRG_UDC to name the crg_udc module.
- Link to v1: https://lore.kernel.org/r/20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com

To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
To: Krutik Shah <krutikshah@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
To: Karthikeyan Mitran <kmitran@axiado.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Naveen Kumar Rajgiri Bassappa (2):
      dt-bindings: usb: gadget: udc: add Axiado AX3000 and AX3005 UDC
      usb: gadget: udc: add Axiado AX3000 and AX3005 UDC driver

 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml |   72 +
 MAINTAINERS                                        |   10 +
 drivers/usb/gadget/udc/Kconfig                     |   14 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/crg_udc.c                   | 4491 ++++++++++++++++++++
 drivers/usb/gadget/udc/crg_udc.h                   |  355 ++
 6 files changed, 4943 insertions(+)
---
base-commit: 7bf68027b97bc94f6121448cb5a02ed9d04187c4
change-id: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9

Best regards,
--  
Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>

