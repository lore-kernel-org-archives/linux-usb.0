Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526096;
	b=kOQpZroLI6gVTMNPkAsuS30ZS8XarLn1v2DSMXl3JMSgQiIrSQIEffPwNgsmbh2F4FCU
	 GKoBmmiJGQTMBIEePvzcTpaKoCLL+yo0fOmMmEYshNZYsQvAzSn5h+4jHDG5vcrJ7LGGY
	 4xkSSvc5/RgL0mP0Fte7ByTqnKbIxuvxg8+EWRct0pz9S1erF3Rey8FVe613jKdU5QZWP
	 FbEr72IclZPbfdHoZOHKsGmPbbA2Wc/H9oUk54wHcVu79+Mf4oBa/rB0pGORPSSnGf3+s
	 ygcaV3Nav5b2r2KQ+zQt4EzWMTKoGzwIW8tFbQ9EhGGHkhnP6AmLsYYlOOEw+xbixmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526096;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=n6Z8Usp62rLv+AmWdElHGG20mNVxIH6vA+N8kabqNPQ=;
	b=LK8WUGgqshaYilhTE53TOi8cjL4YsGtx8FseHFBTdYRicxWqGfwabBc5kzWKPkRXkcV/
	 K2nLL2qZmp4ghsdQ5AzreWTos10TbrwL5dyEqeyikoLRyX6q6uV5GM1HGkQEUFg7JZ6l2
	 AhJSeyGPrcfk0kIJ71kZ9jH3BncDf9Kfh2PNLGsy9jKW67VVkajk2aE2fh9Z7rlWbzPZG
	 vsVpSKu3BBL2+ayz+qDP8YteEFSgzhwSIRp383gITSEYiQvV/gVrwnl6zD1wEYc5bv2k/
	 jJi96jAK+tElE7qpuMPrLpL6H/wBnD/Ozt2g3UjxxpI0eEAeF9BGWmWTj0NSQ0l5B4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=xmPq+D4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.81
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020081.outbound.protection.outlook.com [40.93.198.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FAD606A321;
	Tue, 24 Nov 2026 13:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03FAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=xmPq+D4b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw3CVPC3SzqKnCX2fCfjQcLYj9x5YcTOXBrr0JLcGL1uYEVI1P6gF3qOBemw19OLOsKzXKIPL3TWI9kM2jXbb5UXbCqeJ5z96dISst1Sf9BtDSh51nqZ0bEBghD3PJOiBWUPO2iK6aj83O9iIHPxTgqDLngk7113kcFQp/HjG0QmArd/is9b9tuwUe8/hswBCilFBGbR3Cq6UpRgnj28o1rTtRnmihx+/0/JADzum1Yrq9eTiwAm0oNnOVWwBCOdJwF8H9q08PmuT2yh7M1vdLMT1EYbAm9jtVpWCM4iQKXhW1vhFzst41lx9inBvs0fEBrgsaFiQ2O4zHQQrGnaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6Z8Usp62rLv+AmWdElHGG20mNVxIH6vA+N8kabqNPQ=;
 b=y1X2cxtRZ142Qoqxt2k3jIR8V7+0LMj3PhEEoyEc22LguqV0aAhhhY/+eN5xAbkq2JL8Oh4CXKMpu9NYLOdG9BsM/wpTQlWXlJrDjnFYUhCMSbty4sKf9f005e42Ae71m55u/SUjHkYTRVtBnnNQkQQDwBCXpW8axM62aPaoRfx3yHf//89bCCqxGxCa3ApvVRcpzNg1Rm60A3jL20RE2iMh2HqO0W2hOafnW+pm1eC6CvfNiKUwvq1ChCkQewGDfyyazLqsoKq+/gl9gjht71hCrvnmBTvbGdjYbL5JVkw7CHi95i1gAA2DTxM7QbYhcjyXJ2iwikxVp/1nmxJlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Z8Usp62rLv+AmWdElHGG20mNVxIH6vA+N8kabqNPQ=;
 b=xmPq+D4bmudFWP4GyXR1D3vvk0ysxH1LSFFFc/5uftR+EljUQ+YGphH8RnzVklfLXmiDQPcjx1CCSeGlvmvbInpjfaWcJxOKgGDC0iUFOa0ou/3eVZmqVUB/pQ0Mb9+siyKdWHaux5AqAIt21TNuA0CKUr1aYxs8f229qBS+ej09YhDY67+d1sszl80vFYfI6hy1jbf1WwWnoef4DdvWhTYm62MtlE6Pjp4Ot+UeTa8/iBmE/7+55T2rCORN/VVL7idAPXN5Tku39mW4IWdYxGf82rltYgzTELUFdwHaWk/QIVmNtPoawAOx99Uy7h6CJbpiSvKOhYYtqkIa90/QOA==
Received: from SJ0PR05CA0197.namprd05.prod.outlook.com (2603:10b6:a03:330::22)
 by SA3PR18MB5345.namprd18.prod.outlook.com (2603:10b6:806:2fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 13:14:45 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::71) by SJ0PR05CA0197.outlook.office365.com
 (2603:10b6:a03:330::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 24
 Nov 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 13:14:44 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 6A6F440BFE0E;
	Tue, 24 Nov 2026 05:14:44 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 24 Nov 2026 05:14:37 -0800
Subject: [PATCH v6 4/6] usb: gadget: udc: crg: Add endpoint 0 handling
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-axiado-ax3000-usb-device-controller-v6-4-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795526083; l=41632;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=d4nmExZAFyTn9lHfQpnnrl9++/aLO0/G1jj36WVSGjM=;
 b=qEGbYf8XIPCT4hLCZThVFVrb/fOYJNMfAaoI+Bs6uCwNyDqOTqDmw3fhQhpb94H3kRiUDZpEg
 wZv+5Icx677A5PM+MnI+4GdVrlVyoiNXvaTykzaLPmwfSTu2MtJQVKd
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|SA3PR18MB5345:EE_
X-MS-Office365-Filtering-Correlation-Id: 0092efc9-25a1-44bc-50e9-08df4a2ce883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|23010399003|1800799024|18002099003|6133799003|22082099003|3023799007|56012099006|5023799004|261102123227099003|261028144727099003|261022075727099003|261021121427099003|261026140227099003|261021123027099003|261022113327099003|261009220027099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261026121527099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	v2pfN5+JJrMgdXk5HCRDY45DDtjtDIKis6eofuKo9iTNe7EFNGGq6p9XQz4H2srixmLan9s6vZE0/lotunk8sUofA4Ymm/OZ47VOYZTOSOoWRJe5MtNclsWGT3HFiOUKAQUbezxgS8O1ZX+l1C7wZBMtEwShKGT20BagzebWR5Ch4KN9osOOHgDV2AfROGxpe68w/YBEY04YruSpRTHOVg4lnIqdWi14Se7jA9JBa9KxqdGgH1DOrPel97UImOJ2IdN6gERE5SO0qVI2F+SHbtjBmNUUHvP4ZbANoGEWGLaRfglXbhmSt9ZIysvLygqVqfkXj+b6flOVD07L6sgOaBZp5wDP8PYv3Uo+6U4mfZ9CY4HsALbTCvk62gn6wpZfgVMLLlF6OHM7MD/yB8/ikEdXwtS/KOzJlovfJk+SkOLKRMjctrDslIapEE8Rcr5qsxCXkGgFTwT4vJFkmslDmIXmSx2vGQqE1KWeQqu98rT+/lWVTB8715ZefLb35TazNsa6JFuFFTr9Ci2WruEo+Z8KF8ML7j7dQEAXKyRA87K70nS7mE6NoKFwMp6gzlI5TbiSK8/I6m3NKtJ1U9Uk6/qaxmK1GWJrCJWAc5I0CaVJBvpaPRTtOOTqK/Z5GNa+jGavQb054duZny6pj6edA88IvafoILHHZPC0uk6nEDx1oeYUPQkLywr84uQRIiifLrrbSBHIaQoUYtuRJ+QCYA==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(22082099003)(3023799007)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026140227099003)(261021123027099003)(261022113327099003)(261009220027099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261026121527099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bCqJa7GdlLDSZTnTK6GTdATUIdik39rc/zO7X8Rpnmt/jTXdhznQ8Hhq1iOSKqAFSKS4Gp4yYgZIz9wfu146ElwS6x0e0qJGqT5ABa1TztmJ5qQ26DKFopuqCzupkWIcdgPpdjlfjlrAHXly4d3mheza9nmVoRHa1Wteii6rIR2f++DY14HiORun11uGgmBlR+DRSrrZQyifLvGlj2KXE+iVdE6dxKzA2FFPelbQqTg9zHD9q0NSCqt+j8+yCO9is2OxwCD0xZCzbv8dv8zOi/cxdsf7NP/A4+V8SI3tymg69XJgd80A9bfBQuN4z6DgK/hKjqv1AMhnRRSLGfbWP8G2k/yWVsT9RRcZF/bjZJUbtux8YwOFX//gVLOSCf1S+G/C1P6GOx9fZ8+552rRrRdeLAzYABrh505AH9hbLfEaXYJr3F5sbfYjXY0S7P/0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:14:44.9184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0092efc9-25a1-44bc-50e9-08df4a2ce883
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR18MB5345

This patch adds the endpoint 0 setup packet, status, and control
transfer handling for the Axiado AX3000/AX3005 UDC.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/crg/crg-udc-ep0.c | 1273 ++++++++++++++++++++++++++++++
 1 file changed, 1273 insertions(+)

diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ep0.c b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c
new file mode 100644
index 000000000000..626f39f22b6d
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c
@@ -0,0 +1,1273 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/iopoll.h>
+
+#include "crg-udc.h"
+#include "crg-udc-trace.h"
+
+static void enable_setup_event(struct crg_gadget_dev *crg_udc);
+
+static bool crg_udc_ep0_port_change_pending(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->port_reset_pending || crg_udc->portsc_on_reconnecting)
+		return true;
+
+	/*
+	 * Hardware can start a reset before the IRQ thread records it.
+	 * Leave PRC for the port event handler to preserve SETUP ordering.
+	 */
+	return readl(&crg_udc->uccr->portsc) &
+	       (CRG_U3DC_PORTSC_PR | CRG_U3DC_PORTSC_PRC);
+}
+
+static int crg_udc_ep0_check_state(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->ep0_state != EP0_STATE_IDLE || crg_udc->udc_ep[0].nuking ||
+	    crg_udc->pending_setup_valid)
+		return -ECONNRESET;
+	if (!crg_udc_gadget_ready(crg_udc) || crg_udc->bus_reset_pending ||
+	    crg_udc->device_state == USB_STATE_RECONNECTING ||
+	    crg_udc_ep0_port_change_pending(crg_udc))
+		return -ESHUTDOWN;
+	return 0;
+}
+
+int crg_udc_build_ep0_status(struct crg_udc_ep *udc_ep_ptr, bool default_value,
+			      u32 status, struct crg_udc_request *udc_req_ptr,
+			      u8 set_addr, u8 stall)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct crg_transfer_trb *enq_pt = udc_ep_ptr->enq_pt;
+	int ret;
+
+	/* Internal status requests bypass usb_ep_queue(), so they must also
+	 * respect a teardown that is giving back the old EP0 queue.
+	 */
+	ret = crg_udc_ep0_check_state(crg_udc);
+	if (ret)
+		return ret;
+	if (crg_udc->setup_status != STATUS_STAGE_XFER &&
+	    crg_udc->setup_status != STATUS_STAGE_RECV)
+		return -EINVAL;
+
+	/* Reserve a free transfer-ring slot before touching request state or
+	 * publishing the STATUS TRB. crg_udc_room_on_ring() treats equal
+	 * pointers as empty, so check tran_ring_full separately.
+	 */
+	if (!udc_ep_ptr->first_trb || !udc_ep_ptr->last_trb ||
+	    !udc_ep_ptr->enq_pt || !udc_ep_ptr->deq_pt)
+		return -ENODEV;
+	if (udc_ep_ptr->ep_state != EP_STATE_RUNNING)
+		return -ESHUTDOWN;
+	if (enq_pt < udc_ep_ptr->first_trb ||
+	    enq_pt >= udc_ep_ptr->last_trb ||
+	    udc_ep_ptr->deq_pt < udc_ep_ptr->first_trb ||
+	    udc_ep_ptr->deq_pt >= udc_ep_ptr->last_trb)
+		return -EIO;
+	if (udc_ep_ptr->tran_ring_full ||
+	    !crg_udc_room_on_ring(crg_udc, CRG_UDC_CONTROL_EP_TD_RING_SIZE,
+				 udc_ep_ptr->first_trb, enq_pt,
+				 udc_ep_ptr->deq_pt))
+		return -ENOSPC;
+
+	if (default_value) {
+		udc_req_ptr = crg_udc->status_req;
+		/* The shared request may still be in its data-stage callback. */
+		if (!udc_req_ptr || crg_udc->status_req_callback_pending ||
+		    !list_empty(&udc_req_ptr->queue)) {
+			dev_err(crg_udc->dev, "EP0 status request unavailable\n");
+			crg_udc->ep0_state = EP0_STATE_ERROR;
+			return udc_req_ptr ? -EBUSY : -ENODEV;
+		}
+		udc_req_ptr->usb_req.length = 0;
+		udc_req_ptr->usb_req.status = status;
+		udc_req_ptr->usb_req.actual = 0;
+		udc_req_ptr->usb_req.complete = NULL;
+	} else {
+		if (!udc_req_ptr) {
+			crg_udc->ep0_state = EP0_STATE_ERROR;
+			return -EINVAL;
+		}
+		udc_req_ptr->usb_req.status = status;
+		udc_req_ptr->usb_req.actual = 0;
+	}
+
+	crg_udc_setup_status_trb(crg_udc, enq_pt, &udc_req_ptr->usb_req,
+				 udc_ep_ptr->pcs, set_addr, stall);
+
+	/* STATUS requests must be matched against their own TRB too. */
+	udc_req_ptr->first_trb = enq_pt;
+	udc_req_ptr->last_trb = enq_pt;
+
+	enq_pt++;
+
+	/* check if we are at end of trb segment.  If so, update
+	 * pcs and enq for next segment
+	 */
+	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(enq_pt->dw3)) ==
+	    TRB_TYPE_LINK) {
+		if (FIELD_GET(TRB_LINK_TOGGLE_CYCLE_MASK,
+			      le32_to_cpu(enq_pt->dw3))) {
+			dma_wmb();
+			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
+					   TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->pcs ^= 0x1;
+		}
+		enq_pt = udc_ep_ptr->first_trb;
+	}
+	udc_ep_ptr->enq_pt = enq_pt;
+
+	crg_udc_knock_doorbell(crg_udc, 0);
+
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+	return 0;
+}
+
+/* Report status-stage publication errors consistently to all callers. */
+static void crg_udc_submit_ep0_status(struct crg_gadget_dev *crg_udc,
+				     int status, u8 set_addr)
+{
+	int ret;
+
+	ret = crg_udc_build_ep0_status(&crg_udc->udc_ep[0], true,
+				       status, NULL, set_addr, 0);
+	if (ret && ret != -ESHUTDOWN && ret != -ECONNRESET) {
+		/* A new SETUP must stop and reset EP0 before reuse. */
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		crg_udc->setup_fn_call_back = NULL;
+		dev_err(crg_udc->dev,
+			"failed to queue EP0 status stage: %d\n", ret);
+	}
+}
+
+/*
+ * Abort the current EP0 control transfer when a new SETUP packet arrives.
+ *
+ * A SETUP packet is allowed to abort any in-progress control transfer. Do
+ * not defer the new SETUP until the old transfer completes: doing so leaves
+ * the old request on the EP0 software queue and subsequent gadget requests
+ * are rejected as "queue not empty".
+ *
+ * The controller's EP0 ring is reinitialized at the ring start, making all
+ * TRBs belonging to the aborted control transfer stale. The new SETUP is
+ * then handled immediately with a fresh setup tag.
+ */
+int crg_udc_abort_ep0_for_setup(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep0 = &crg_udc->udc_ep[0];
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+	u32 cmd_param1;
+	u32 generation;
+	u32 tmp;
+	int ret;
+
+	/* A disconnect has stopped RUN. Reconnection rebuilds EP0 first. */
+	if (!crg_udc_session_ready(crg_udc))
+		return -ESHUTDOWN;
+	if (crg_udc_ep0_port_change_pending(crg_udc))
+		return -ECONNRESET;
+
+	/*
+	 * A new SETUP is allowed to abort the current control transfer.
+	 * Keep EP0 in ABORTING for the complete stop/nuke/reinitialize
+	 * sequence. crg_udc_req_done() drops udc_lock while invoking the gadget
+	 * callback, so the callback may re-enter the UDC during the nuke.
+	 */
+	udc_ep0->generation++;
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->ep0_state = EP0_STATE_ABORTING;
+
+	/*
+	 * Stop EP0 before touching the transfer ring. The controller may still
+	 * own the old TRBs even when no EP0 request is running from the gadget's
+	 * point of view. Do not clear the DMA-visible ring until the hardware
+	 * reports that EP0 is no longer running.
+	 */
+	ret = crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP, BIT(0), 0);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"failed to stop EP0 for SETUP abort: %d\n", ret);
+		goto recover;
+	}
+
+	ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp, !(tmp & BIT(0)),
+					10, 10000);
+	if (ret) {
+		dev_err(crg_udc->dev, "timeout stopping EP0 for SETUP abort\n");
+		goto recover;
+	}
+
+	udc_ep0->ep_state = EP_STATE_STOPPED;
+	/* Complete requests belonging to the aborted control transfer. */
+	generation = udc_ep0->generation;
+	crg_udc_ep_nuke(udc_ep0, -ECONNRESET);
+	/*
+	 * Giveback drops udc_lock. A port change can be recorded before
+	 * the endpoint generation changes.
+	 */
+	if (!crg_udc_gadget_ready(crg_udc) ||
+	    generation != udc_ep0->generation ||
+	    crg_udc_ep0_port_change_pending(crg_udc))
+		return -ECONNRESET;
+
+	if (!udc_ep0->first_trb || !udc_ep0->tran_ring_info.cpu_addr) {
+		ret = -ENODEV;
+		goto recover;
+	}
+
+	/*
+	 * The controller has stopped consuming EP0 TRBs. It is now safe to
+	 * discard the old transfer descriptors and restart the ring from its
+	 * beginning. No ring memory is freed here.
+	 */
+	memset(udc_ep0->first_trb, 0, udc_ep0->tran_ring_info.len);
+	udc_ep0->enq_pt = udc_ep0->first_trb;
+	udc_ep0->deq_pt = udc_ep0->first_trb;
+	udc_ep0->pcs = 1;
+	udc_ep0->tran_ring_full = false;
+	crg_udc_setup_link_trb(udc_ep0->last_trb, true,
+			       udc_ep0->tran_ring_info.dma_addr);
+
+	/* Make the new ring contents visible before handing the ring to HW. */
+	dma_wmb();
+
+	dqptaddr = crg_udc_tran_trb_virt_to_dma(udc_ep0, udc_ep0->first_trb);
+	if (dma_mapping_error(crg_udc->dev, dqptaddr)) {
+		ret = -EIO;
+		goto recover;
+	}
+
+	cmd_param0 = (lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
+		     FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0->pcs);
+	cmd_param1 = upper_32_bits(dqptaddr);
+
+	ret = crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
+				    cmd_param1);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"failed to reinitialize EP0 for SETUP: %d\n", ret);
+		goto recover;
+	}
+
+	udc_ep0->ep_state = EP_STATE_RUNNING;
+	crg_udc->ep0_state = EP0_STATE_IDLE;
+	return 0;
+
+recover:
+	crg_udc->ep0_state = EP0_STATE_ERROR;
+	crg_udc_schedule_endpoint_recovery(crg_udc);
+	return ret;
+}
+
+int crg_udc_enable_setup(struct crg_gadget_dev *crg_udc)
+{
+	enable_setup_event(crg_udc);
+	crg_udc->device_state = USB_STATE_DEFAULT;
+	usb_gadget_set_state(&crg_udc->gadget, USB_STATE_DEFAULT);
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+
+	return 0;
+}
+
+static void enable_setup_event(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	val = readl(&uccr->config1);
+	val |= CRG_U3DC_CFG1_SETUP_EVENT_EN;
+	writel(val, &uccr->config1);
+}
+
+void crg_udc_ep0_req_complete(struct crg_udc_ep *udc_ep_ptr,
+			      unsigned long *flags)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+
+	if (crg_udc_ep0_port_change_pending(crg_udc))
+		return;
+
+	switch (crg_udc->setup_status) {
+	case DATA_STAGE_XFER:
+		crg_udc->setup_status = STATUS_STAGE_RECV;
+		crg_udc_submit_ep0_status(crg_udc, -EINPROGRESS, 0);
+		break;
+	case DATA_STAGE_RECV:
+		crg_udc->setup_status = STATUS_STAGE_XFER;
+		crg_udc_submit_ep0_status(crg_udc, -EINPROGRESS, 0);
+		break;
+	default:
+		if (crg_udc->setup_fn_call_back) {
+			crg_udc->setup_fn_call_back(crg_udc);
+			crg_udc->setup_fn_call_back = NULL;
+		}
+		crg_udc->setup_status = WAIT_FOR_SETUP;
+		break;
+	}
+}
+
+static void get_status_cmpl(struct usb_ep *ep, struct usb_request *req)
+{
+	struct crg_udc_ep *udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	unsigned long flags;
+	void *buf;
+
+	/* The data-stage completion handler queues the status stage. */
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	buf = req->buf;
+	req->buf = NULL;
+	crg_udc->status_req_callback_pending = false;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	kfree(buf);
+}
+
+static bool getstatusrequest(struct crg_gadget_dev *crg_udc, u8 request_type,
+			     u16 value, u16 index, u16 length)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	struct crg_udc_request *udc_req_ptr = crg_udc->status_req;
+	u16 status_val = 0;
+	u32 dci;
+	int ret;
+
+	if (value || length != sizeof(u16))
+		goto invalid;
+
+	switch (request_type & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		if (index)
+			goto invalid;
+		if (crg_udc->gadget.speed == USB_SPEED_HIGH ||
+		    crg_udc->gadget.speed == USB_SPEED_FULL) {
+			if (crg_udc->u2_rwe)
+				status_val |= BIT(USB_DEVICE_REMOTE_WAKEUP);
+		} else if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+			if (crg_udc->feature_u1_enable)
+				status_val |= BIT(USB_DEV_STAT_U1_ENABLED);
+			if (crg_udc->feature_u2_enable)
+				status_val |= BIT(USB_DEV_STAT_U2_ENABLED);
+		}
+		if (crg_udc->gadget.is_selfpowered)
+			status_val |= BIT(USB_DEVICE_SELF_POWERED);
+		break;
+
+	case USB_RECIP_INTERFACE:
+		if (crg_udc->device_state != USB_STATE_CONFIGURED ||
+		    (index & 0xff00))
+			goto invalid;
+
+		/* The gadget driver owns SuperSpeed function wakeup state. */
+		if (crg_udc->gadget.speed >= USB_SPEED_SUPER)
+			return false;
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		if (index & ~(USB_ENDPOINT_NUMBER_MASK | USB_DIR_IN))
+			goto invalid;
+		dci = crg_udc_index2dci(index);
+		if (dci == 1 || dci >= CRG_NUM_EP_CX)
+			goto invalid;
+		if (crg_udc->device_state < USB_STATE_ADDRESS && dci != 0)
+			goto invalid;
+		if (crg_udc->device_state == USB_STATE_ADDRESS && dci != 0)
+			goto invalid;
+		if (crg_udc->device_state == USB_STATE_CONFIGURED &&
+		    crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+			goto invalid;
+		if (crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_HALTED)
+			status_val = BIT(USB_ENDPOINT_HALT);
+		break;
+
+	default:
+		goto invalid;
+	}
+
+	if (!udc_req_ptr || crg_udc->status_req_callback_pending ||
+	    !list_empty(&udc_req_ptr->queue))
+		goto invalid;
+
+	kfree(udc_req_ptr->usb_req.buf);
+
+	udc_req_ptr->usb_req.buf = kzalloc_obj(status_val, GFP_ATOMIC);
+	if (!udc_req_ptr->usb_req.buf)
+		goto invalid;
+
+	*(__le16 *)udc_req_ptr->usb_req.buf = cpu_to_le16(status_val);
+	udc_req_ptr->usb_req.length = sizeof(status_val);
+	udc_req_ptr->usb_req.status = -EINPROGRESS;
+	udc_req_ptr->usb_req.actual = 0;
+	udc_req_ptr->usb_req.complete = get_status_cmpl;
+	crg_udc->status_req_callback_pending = true;
+
+	ret = crg_udc_bounce_map_request(udc_ep_ptr, udc_req_ptr,
+					 DMA_TO_DEVICE, GFP_ATOMIC);
+	if (ret) {
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc->status_req_callback_pending = false;
+		goto invalid;
+	}
+
+	crg_udc->setup_status = DATA_STAGE_XFER;
+
+	ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	if (ret) {
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr, 0);
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc->status_req_callback_pending = false;
+		goto invalid;
+	}
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+	return true;
+
+invalid:
+	crg_udc_set_ep0_halt(crg_udc);
+	return true;
+}
+
+int crg_udc_prepare_for_setup(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep0_ptr;
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+	u32 cmd_param1;
+	int ret;
+
+	if (!crg_udc_gadget_ready(crg_udc))
+		return -ESHUTDOWN;
+
+	if (!crg_udc_is_event_rings_empty(crg_udc) ||
+	    crg_udc_ep0_port_change_pending(crg_udc))
+		return -EBUSY;
+
+	udc_ep0_ptr = &crg_udc->udc_ep[0];
+	udc_ep0_ptr->generation++;
+	/* If we reinit ep0 on bus reset, we just make ep0 dequeue pointer
+	 * align with enqueue pointer, all remaining xfer trbs became dumb once
+	 * which will not produce xfer event anymore.
+	 *
+	 * If we considering the opposite solution, we should wait all ep0 xfer
+	 * trbs be completed(with some err complete code)
+	 */
+	if (crg_udc->reinit_ep0_on_bus_reset) {
+		struct crg_uccr __iomem *uccr = crg_udc->uccr;
+		enum crg_ep_state ep0_ep_state;
+		u32 generation;
+		u32 running;
+
+		/* Block requeue from giveback callbacks, then quiesce DMA. */
+		crg_udc->ep0_state = EP0_STATE_ABORTING;
+		/* A HALTED EP0 may still own a queued STALL TRB. */
+		ep0_ep_state = crg_udc_get_ep_state(crg_udc, 0);
+		if (ep0_ep_state != EP_STATE_DISABLED &&
+		    ep0_ep_state != EP_STATE_STOPPED) {
+			ret = crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP,
+						    BIT(0), 0);
+			if (ret)
+				goto reset_error;
+
+			ret = readl_poll_timeout_atomic(&uccr->ep_running, running,
+							!(running & BIT(0)), 10, 10000);
+			if (ret)
+				goto reset_error;
+		}
+		udc_ep0_ptr->ep_state = EP_STATE_STOPPED;
+		generation = udc_ep0_ptr->generation;
+		crg_udc_ep_nuke(udc_ep0_ptr, -ESHUTDOWN);
+		/* Let port recovery handle any change recorded during giveback. */
+		if (!crg_udc_gadget_ready(crg_udc) ||
+		    generation != udc_ep0_ptr->generation ||
+		    crg_udc_ep0_port_change_pending(crg_udc))
+			return -ECONNRESET;
+
+		/* context related ops */
+		dqptaddr = crg_udc_tran_trb_virt_to_dma(udc_ep0_ptr,
+							udc_ep0_ptr->enq_pt);
+		if (dma_mapping_error(crg_udc->dev, dqptaddr)) {
+			ret = -EIO;
+			goto reset_error;
+		}
+		cmd_param0 =
+			(lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
+			FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0_ptr->pcs);
+		cmd_param1 = upper_32_bits(dqptaddr);
+		ret = crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0,
+						cmd_param0, cmd_param1);
+		if (ret)
+			goto reset_error;
+
+		udc_ep0_ptr->deq_pt = udc_ep0_ptr->enq_pt;
+		udc_ep0_ptr->tran_ring_full = false;
+		udc_ep0_ptr->ep_state = EP_STATE_RUNNING;
+		crg_udc->ep0_state = EP0_STATE_IDLE;
+	} else {
+		if (!list_empty(&udc_ep0_ptr->queue)) {
+			dev_err(crg_udc->dev,
+				"remaining ep0 xfer trbs on reset\n");
+			return -EBUSY;
+		}
+	}
+
+	crg_udc_enable_setup(crg_udc);
+
+	return 0;
+
+reset_error:
+	crg_udc->ep0_state = EP0_STATE_ERROR;
+	crg_udc_schedule_endpoint_recovery(crg_udc);
+	return ret;
+}
+
+static void set_address_cmpl(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->device_state == USB_STATE_DEFAULT &&
+	    crg_udc->dev_addr != 0) {
+		crg_udc->device_state = USB_STATE_ADDRESS;
+		usb_gadget_set_state(&crg_udc->gadget, USB_STATE_ADDRESS);
+	} else if (crg_udc->device_state == USB_STATE_ADDRESS) {
+		if (crg_udc->dev_addr == 0) {
+			crg_udc->device_state = USB_STATE_DEFAULT;
+			usb_gadget_set_state(&crg_udc->gadget,
+					     USB_STATE_DEFAULT);
+		}
+
+	}
+}
+
+int crg_udc_set_ep0_halt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	enum crg_setup_status setup_status = crg_udc->setup_status;
+	enum crg_ep_state ep_state;
+	int ret;
+
+	ret = crg_udc_ep0_check_state(crg_udc);
+	if (ret)
+		return ret;
+	if (crg_udc->setup_status == WAIT_FOR_SETUP)
+		return -EINVAL;
+
+	ep_state = crg_udc_get_ep_state(crg_udc, udc_ep_ptr->dci);
+	if (ep_state == EP_STATE_HALTED)
+		return 0;
+	if (ep_state != EP_STATE_RUNNING)
+		return -ESHUTDOWN;
+
+	/* STALL terminates the current DATA/STATUS sequence. */
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+
+	ret = crg_udc_build_ep0_status(udc_ep_ptr, true, -EINVAL,
+				       NULL, 0, 1);
+	if (ret == -ESHUTDOWN || ret == -ECONNRESET) {
+		crg_udc->setup_status = setup_status;
+		return ret;
+	}
+	crg_udc->setup_fn_call_back = NULL;
+	if (ret) {
+		/* A failed STALL publication leaves EP0 needing recovery. */
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	udc_ep_ptr->ep_state = EP_STATE_HALTED;
+
+	return 0;
+}
+
+static void set_sel_cmpl(struct usb_ep *ep, struct usb_request *req)
+{
+	struct crg_udc_ep *udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	const struct usb_set_sel_req *sel;
+	unsigned long flags;
+	void *buf;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	buf = req->buf;
+	if (buf && !req->status && req->actual >= sizeof(*sel)) {
+		sel = buf;
+		crg_udc->sel_value.u1_sel_value = sel->u1_sel;
+		crg_udc->sel_value.u1_pel_value = sel->u1_pel;
+		crg_udc->sel_value.u2_sel_value = le16_to_cpu(sel->u2_sel);
+		crg_udc->sel_value.u2_pel_value = le16_to_cpu(sel->u2_pel);
+	}
+	req->buf = NULL;
+	crg_udc->status_req_callback_pending = false;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	kfree(buf);
+}
+
+static void set_test_mode_cmpl(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->set_tm != 0) {
+		u32 tmp;
+		struct crg_uccr __iomem *uccr = crg_udc->uccr;
+
+		tmp = readl(&uccr->u2portpmsc);
+		FIELD_MODIFY(CRG_U3DC_U2PORTPM_TM_MASK, &tmp, crg_udc->set_tm);
+		writel(tmp, &uccr->u2portpmsc);
+
+		crg_udc->set_tm = 0;
+	}
+}
+
+static void setaddressrequest(struct crg_gadget_dev *crg_udc, u16 value,
+			      u16 index, u16 length)
+{
+	u32 param0;
+
+	if (value > 127 || index || length ||
+	    (crg_udc->device_state != USB_STATE_DEFAULT &&
+	     crg_udc->device_state != USB_STATE_ADDRESS))
+		goto invalid;
+
+	/* SET_ADDRESS(0) is legal in the Default state. */
+	param0 = FIELD_PREP(CRG_CMD2_0_DEV_ADDR_MASK, value);
+	if (crg_udc_issue_command(crg_udc, CRG_CMD_SET_ADDR, param0, 0))
+		goto invalid;
+
+	crg_udc->dev_addr = value;
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+	crg_udc->setup_fn_call_back = set_address_cmpl;
+	crg_udc_submit_ep0_status(crg_udc, -EINPROGRESS, 1);
+	return;
+
+invalid:
+	crg_udc->setup_fn_call_back = NULL;
+	crg_udc_set_ep0_halt(crg_udc);
+}
+
+static bool setfeaturesrequest(struct crg_gadget_dev *crg_udc, u8 request_type,
+			       u8 b_request, u16 value, u16 index, u16 length,
+			       unsigned long *flags)
+{
+	u32 tmp;
+	u32 set_feat = 0;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+
+	if (length || (request_type & USB_DIR_IN))
+		goto set_feature_error;
+
+	/* TEST_MODE is permitted in the Default state; other features aren't. */
+	if (crg_udc->device_state == USB_STATE_DEFAULT &&
+	    !((request_type & USB_RECIP_MASK) == USB_RECIP_DEVICE &&
+	      value == USB_DEVICE_TEST_MODE &&
+	      b_request == USB_REQ_SET_FEATURE))
+		goto set_feature_error;
+
+	set_feat = (b_request == USB_REQ_SET_FEATURE) ? 1 : 0;
+	if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+	    (USB_RECIP_ENDPOINT | USB_TYPE_STANDARD)) {
+		struct crg_udc_ep *ep0 = &crg_udc->udc_ep[0];
+		u32 ep0_generation = ep0->generation;
+		u32 event_generation = crg_udc->udc_event[0].generation;
+		u8 setup_tag = crg_udc->setup_tag;
+		u32 dci;
+		int ret;
+
+		if (value != USB_ENDPOINT_HALT || crg_udc->device_state != USB_STATE_CONFIGURED)
+			goto set_feature_error;
+
+		if (index & ~(USB_ENDPOINT_NUMBER_MASK | USB_DIR_IN))
+			goto set_feature_error;
+
+		dci = crg_udc_index2dci(index);
+		/* CRG only supports a protocol STALL on the default pipe. */
+		if (dci < 2 || dci >= CRG_NUM_EP_CX ||
+		    crg_udc_get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+			goto set_feature_error;
+
+		ret = crg_udc_ep_halt(&crg_udc->udc_ep[dci], set_feat, 0, flags);
+		/* Givebacks may drop udc_lock and replace the control transfer. */
+		if (crg_udc_ep0_check_state(crg_udc) ||
+		    ep0->generation != ep0_generation ||
+		    crg_udc->udc_event[0].generation != event_generation ||
+		    crg_udc->setup_tag != setup_tag ||
+		    crg_udc->setup_status != SETUP_PKT_PROCESS_IN_PROGRESS ||
+		    ep0->ep_state != EP_STATE_RUNNING)
+			return true;
+
+		if (ret)
+			goto set_feature_error;
+	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+		   (USB_RECIP_DEVICE | USB_TYPE_STANDARD)) {
+		switch (value) {
+		case USB_DEVICE_REMOTE_WAKEUP:
+			/* REMOTE_WAKEUP selector is not used by USB3.0 */
+			if (index ||
+			    crg_udc->device_state < USB_STATE_DEFAULT ||
+			    crg_udc->gadget.speed >= USB_SPEED_SUPER)
+				goto set_feature_error;
+
+			crg_udc->u2_rwe = set_feat;
+			crg_udc->gadget.wakeup_armed = set_feat;
+
+			break;
+		case USB_DEVICE_U1_ENABLE:
+		case USB_DEVICE_U2_ENABLE: {
+			u32 timeout_val;
+
+			if (crg_udc->device_state != USB_STATE_CONFIGURED) {
+				dev_err(crg_udc->dev,
+					"u12 enable fail, usb state=%d\n",
+					crg_udc->device_state);
+				goto set_feature_error;
+			}
+
+			if (index != 0 || crg_udc->gadget.speed < USB_SPEED_SUPER)
+				goto set_feature_error;
+
+			if (set_feat == 1 && crg_udc->u12_forbidden)
+				goto set_feature_error;
+
+			tmp = readl(&uccr->u3portpmsc);
+			if (value == USB_DEVICE_U1_ENABLE) {
+				if (!crg_udc->u12_initiate_forbidden) {
+					tmp &= (~CRG_U3DC_U3PORTPM_U1IEN);
+					tmp |= FIELD_PREP(
+						CRG_U3DC_U3PORTPM_U1IEN,
+						set_feat);
+				}
+				if (!crg_udc->u12_forbidden)
+					timeout_val =
+						set_feat ? CRG_UDC_U1_TIMEOUT_VAL : 0;
+				else
+					timeout_val = 0;
+
+				FIELD_MODIFY(CRG_U3DC_U3PORTPM_U1TMOUT_MASK,
+					     &tmp, timeout_val);
+
+				crg_udc->feature_u1_enable = set_feat;
+			}
+
+			if (value == USB_DEVICE_U2_ENABLE) {
+				if (!crg_udc->u12_initiate_forbidden) {
+					tmp &= (~CRG_U3DC_U3PORTPM_U2IEN);
+					tmp |= FIELD_PREP(
+						CRG_U3DC_U3PORTPM_U2IEN,
+						set_feat);
+				}
+				if (!crg_udc->u12_forbidden)
+					timeout_val =
+						set_feat ? CRG_UDC_U2_TIMEOUT_VAL : 0;
+				else
+					timeout_val = 0;
+
+				FIELD_MODIFY(CRG_U3DC_U3PORTPM_U2TMOUT_MASK,
+					     &tmp, timeout_val);
+
+				crg_udc->feature_u2_enable = set_feat;
+			}
+			writel(tmp, &uccr->u3portpmsc);
+
+			break;
+		}
+		case USB_DEVICE_TEST_MODE: {
+			u32 u_pattern;
+
+			if (b_request != USB_REQ_SET_FEATURE ||
+			    crg_udc->gadget.speed != USB_SPEED_HIGH ||
+			    crg_udc->device_state < USB_STATE_DEFAULT ||
+			    (index & 0xff) || (index >> 8) == 0 ||
+			    (index >> 8) > 6)
+				goto set_feature_error;
+			u_pattern = index >> 8;
+			crg_udc->set_tm = u_pattern;
+			crg_udc->setup_fn_call_back = &set_test_mode_cmpl;
+
+			break;
+		}
+
+		default:
+			goto set_feature_error;
+		}
+
+	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+		   (USB_RECIP_INTERFACE | USB_TYPE_STANDARD)) {
+		if (crg_udc->device_state != USB_STATE_CONFIGURED ||
+		    crg_udc->gadget.speed < USB_SPEED_SUPER)
+			goto set_feature_error;
+
+		/* Suspend Option */
+		if (value != USB_INTRF_FUNC_SUSPEND)
+			goto set_feature_error;
+
+		/* Both cleared LP/RW bits and either suspend option are valid. */
+		if (index & ~(0xff | USB_INTRF_FUNC_SUSPEND_LP |
+			      USB_INTRF_FUNC_SUSPEND_RW))
+			goto set_feature_error;
+
+		if (index & USB_INTRF_FUNC_SUSPEND_RW)
+			dev_dbg(crg_udc->dev, "Interface En Remote Wakeup\n");
+		else
+			dev_dbg(crg_udc->dev, "Interface Dis RemoteWakeup\n");
+
+		/* Do not need to return status stage here
+		 * Pass to composite gadget driver to process
+		 * the request
+		 */
+		return false;
+	} else {
+		/* Unknown recipient must not receive a successful status stage. */
+		goto set_feature_error;
+	}
+
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+	crg_udc_submit_ep0_status(crg_udc, -EINPROGRESS, 0);
+	return true;
+
+set_feature_error:
+	crg_udc_set_ep0_halt(crg_udc);
+	return true;
+}
+
+static void setselrequest(struct crg_gadget_dev *crg_udc, u16 value, u16 index,
+			  u16 length)
+{
+	struct crg_udc_request *udc_req_ptr = crg_udc->status_req;
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	struct usb_set_sel_req *sel;
+	int ret;
+
+	if (!udc_req_ptr || crg_udc->status_req_callback_pending ||
+	    !list_empty(&udc_req_ptr->queue) ||
+	    crg_udc->device_state == USB_STATE_DEFAULT || value || index ||
+	    length != sizeof(struct usb_set_sel_req)) {
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	kfree(udc_req_ptr->usb_req.buf);
+
+	udc_req_ptr->usb_req.buf = kzalloc_obj(*sel, GFP_ATOMIC);
+	if (!udc_req_ptr->usb_req.buf) {
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	sel = udc_req_ptr->usb_req.buf;
+	udc_req_ptr->usb_req.length = sizeof(*sel);
+	udc_req_ptr->usb_req.status = -EINPROGRESS;
+	udc_req_ptr->usb_req.actual = 0;
+	udc_req_ptr->usb_req.complete = set_sel_cmpl;
+	crg_udc->status_req_callback_pending = true;
+	ret = crg_udc_bounce_map_request(udc_ep_ptr, udc_req_ptr,
+					 DMA_FROM_DEVICE, GFP_ATOMIC);
+	if (ret) {
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc->status_req_callback_pending = false;
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	crg_udc->setup_status = DATA_STAGE_RECV;
+
+	ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	if (ret) {
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr, 0);
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		crg_udc->status_req_callback_pending = false;
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+}
+
+int crg_udc_update_ep0_maxpacketsize(struct crg_gadget_dev *crg_udc)
+{
+	u16 maxpacketsize = 0;
+	struct crg_udc_ep *udc_ep0 = &crg_udc->udc_ep[0];
+	u32 param0;
+
+	if (crg_udc->gadget.speed >= USB_SPEED_SUPER)
+		maxpacketsize = 512;
+	else
+		maxpacketsize = 64;
+
+	param0 = FIELD_PREP(CRG_CMD1_0_MPS_MASK, maxpacketsize);
+	if (crg_udc_issue_command(crg_udc, CRG_CMD_UPDATE_EP0_CFG, param0, 0))
+		return -EIO;
+
+	crg_udc->ep0_desc.wMaxPacketSize = cpu_to_le16(maxpacketsize);
+	udc_ep0->usb_ep.maxpacket = maxpacketsize;
+
+	return 0;
+}
+
+void crg_udc_handle_setup_pkt(struct crg_gadget_dev *crg_udc,
+			      struct usb_ctrlrequest *setup_pkt, u8 setup_tag,
+			      unsigned long *flags)
+{
+	u16 w_value = le16_to_cpu(setup_pkt->wValue);
+	u16 w_index = le16_to_cpu(setup_pkt->wIndex);
+	u16 w_length = le16_to_cpu(setup_pkt->wLength);
+	struct usb_gadget_driver *driver;
+	u32 ep0_generation, event_generation;
+	u8 active_setup_tag;
+	int setup_ret;
+	u32 tmp;
+
+	if (!crg_udc_gadget_ready(crg_udc) ||
+	    crg_udc->device_state == USB_STATE_RECONNECTING ||
+	    crg_udc->bus_reset_pending || crg_udc_ep0_port_change_pending(crg_udc) ||
+	    crg_udc->reset_callback_active || crg_udc->gadget_callbacks_active ||
+	    crg_udc->udc_ep[0].ep_state != EP_STATE_RUNNING ||
+	    crg_udc->ep0_state != EP0_STATE_IDLE)
+		return;
+
+	trace_crg_udc_ctrl_req(setup_pkt);
+
+	/* New SETUP supersedes any mapping of the previous transaction. */
+	crg_udc->udc_ep[0].generation++;
+	/* EP0 come backs to running when new setup packet comes */
+	crg_udc->udc_ep[0].ep_state = EP_STATE_RUNNING;
+
+	crg_udc->setup_tag = setup_tag;
+	crg_udc->setup_status = SETUP_PKT_PROCESS_IN_PROGRESS;
+	crg_udc->setup_fn_call_back = NULL;
+
+	if ((setup_pkt->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
+		switch (setup_pkt->bRequest) {
+		case USB_REQ_GET_STATUS:
+			if (setup_pkt->bRequestType !=
+				    (USB_DIR_IN | USB_RECIP_DEVICE |
+				     USB_TYPE_STANDARD) &&
+			    setup_pkt->bRequestType !=
+				    (USB_DIR_IN | USB_RECIP_INTERFACE |
+				     USB_TYPE_STANDARD) &&
+			    setup_pkt->bRequestType !=
+				    (USB_DIR_IN | USB_RECIP_ENDPOINT |
+				     USB_TYPE_STANDARD)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			if (getstatusrequest(crg_udc, setup_pkt->bRequestType,
+					     w_value, w_index, w_length))
+				return;
+			break;
+		case USB_REQ_SET_ADDRESS:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE |
+			     USB_TYPE_STANDARD)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			setaddressrequest(crg_udc, w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_SEL:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE |
+			     USB_TYPE_STANDARD)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+			crg_udc->setup_status = DATA_STAGE_RECV;
+			setselrequest(crg_udc, w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_ISOCH_DELAY:
+			if (setup_pkt->bRequestType !=
+				    (USB_DIR_OUT | USB_RECIP_DEVICE |
+				     USB_TYPE_STANDARD) ||
+			    w_index || w_length ||
+			    w_value >
+				    FIELD_MAX(
+					    CRG_U3DC_PTMCTRL_ISOCH_DELAY_MASK)) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			tmp = readl(&crg_udc->uccr->ptmctrl);
+			FIELD_MODIFY(CRG_U3DC_PTMCTRL_ISOCH_DELAY_MASK, &tmp,
+				     w_value);
+			writel(tmp, &crg_udc->uccr->ptmctrl);
+			crg_udc->setup_status = STATUS_STAGE_XFER;
+			crg_udc_submit_ep0_status(crg_udc, -EINPROGRESS, 0);
+			return;
+
+		case USB_REQ_CLEAR_FEATURE:
+		case USB_REQ_SET_FEATURE:
+			/* Need composite gadget driver
+			 * to process the function remote wakeup request
+			 */
+			if (setfeaturesrequest(crg_udc, setup_pkt->bRequestType,
+					       setup_pkt->bRequest, w_value,
+					       w_index, w_length, flags)) {
+				/* Get here if request has been processed.*/
+				return;
+			}
+			break;
+		case USB_REQ_SET_CONFIGURATION:
+			if (setup_pkt->bRequestType !=
+				    (USB_DIR_OUT | USB_RECIP_DEVICE |
+				     USB_TYPE_STANDARD) ||
+			    w_length || w_value > 0xff) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+			/* In theory we need to clear RUN bit before
+			 * status stage of deconfig request sent.
+			 * But seeing problem if we do it before all the
+			 * endpoints belonging to the configuration
+			 * disabled.
+			 */
+			if (crg_udc->device_state <= USB_STATE_DEFAULT) {
+				crg_udc_set_ep0_halt(crg_udc);
+				return;
+			}
+
+			break;
+		default:
+			dev_dbg(crg_udc->dev,
+				"USB_REQ default bRequest=%d, bRequestType=%d\n",
+				setup_pkt->bRequest, setup_pkt->bRequestType);
+		}
+	}
+
+	if (w_length) {
+		/* data phase from gadget like GET_CONFIGURATION
+		 * call the setup routine of gadget driver.
+		 * remember the request direction.
+		 */
+		crg_udc->setup_status = (setup_pkt->bRequestType & USB_DIR_IN) ?
+						DATA_STAGE_XFER :
+						DATA_STAGE_RECV;
+	}
+	/* The callback drops udc_lock; a newer SETUP or reset can supersede us. */
+	ep0_generation = crg_udc->udc_ep[0].generation;
+	event_generation = crg_udc->udc_event[0].generation;
+	active_setup_tag = crg_udc->setup_tag;
+	driver = crg_udc->async_callbacks ? crg_udc->gadget_driver : NULL;
+	crg_udc_callback_enter(crg_udc);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+
+	if (!driver || !READ_ONCE(crg_udc->async_callbacks) ||
+	    READ_ONCE(crg_udc->gadget_driver) != driver)
+		setup_ret = -ESHUTDOWN;
+	else
+		setup_ret = driver->setup(&crg_udc->gadget, setup_pkt);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	crg_udc_callback_exit(crg_udc);
+	/* Never STALL or update device state for an obsolete SETUP. */
+	if (!crg_udc_gadget_ready(crg_udc) ||
+	    crg_udc->bus_reset_pending || crg_udc_ep0_port_change_pending(crg_udc) ||
+	    crg_udc->device_state == USB_STATE_RECONNECTING ||
+	    !driver || crg_udc->gadget_driver != driver ||
+	    crg_udc->udc_ep[0].generation != ep0_generation ||
+	    crg_udc->udc_event[0].generation != event_generation ||
+	    crg_udc->setup_tag != active_setup_tag ||
+	    crg_udc->ep0_state != EP0_STATE_IDLE ||
+	    crg_udc->udc_ep[0].ep_state != EP_STATE_RUNNING)
+		return;
+
+	if (setup_ret < 0) {
+		crg_udc_set_ep0_halt(crg_udc);
+		return;
+	}
+
+	if (setup_pkt->bRequest == USB_REQ_SET_CONFIGURATION &&
+	    (setup_pkt->bRequestType & (USB_TYPE_MASK | USB_RECIP_MASK)) ==
+		    (USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
+		if (w_value) {
+			crg_udc->device_state = USB_STATE_CONFIGURED;
+			usb_gadget_set_state(&crg_udc->gadget,
+					     USB_STATE_CONFIGURED);
+		} else {
+			crg_udc_clear_portpm(crg_udc);
+			crg_udc->device_state = USB_STATE_ADDRESS;
+			usb_gadget_set_state(&crg_udc->gadget,
+					     USB_STATE_ADDRESS);
+		}
+	}
+}
+
+int crg_udc_init_ep0(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	u32 cmd_param0;
+	u32 cmd_param1;
+
+	if (!udc_ep_ptr->tran_ring_info.cpu_addr)
+		return -ENOMEM;
+
+	udc_ep_ptr->generation++;
+	udc_ep_ptr->first_trb = udc_ep_ptr->tran_ring_info.cpu_addr;
+	udc_ep_ptr->last_trb = udc_ep_ptr->first_trb +
+			       CRG_UDC_CONTROL_EP_TD_RING_SIZE - 1;
+	memset(udc_ep_ptr->first_trb, 0, udc_ep_ptr->tran_ring_info.len);
+	/* Ensure that transfer ring is updated */
+	dma_wmb();
+	udc_ep_ptr->enq_pt = udc_ep_ptr->first_trb;
+	udc_ep_ptr->deq_pt = udc_ep_ptr->first_trb;
+	udc_ep_ptr->pcs = 1;
+	udc_ep_ptr->tran_ring_full = false;
+
+	crg_udc_setup_link_trb(udc_ep_ptr->last_trb, true,
+			       udc_ep_ptr->tran_ring_info.dma_addr);
+
+	/* context related ops */
+	cmd_param0 = (lower_32_bits(udc_ep_ptr->tran_ring_info.dma_addr) &
+		      CRG_CMD0_0_DQPTRLO_MASK) |
+		     FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep_ptr->pcs);
+	cmd_param1 = upper_32_bits(udc_ep_ptr->tran_ring_info.dma_addr);
+
+	if (crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
+				  cmd_param1))
+		return -EIO;
+
+	udc_ep_ptr->desc = &crg_udc->ep0_desc;
+	udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+	udc_ep_ptr->pcs = 1;
+
+	return 0;
+}
+
+int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
+		       struct crg_udc_request *udc_req_ptr,
+		       u32 num_of_trbs_needed)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	enum crg_ep_state ep_state;
+	struct crg_transfer_trb *enq_pt = udc_ep_ptr->enq_pt;
+	struct crg_transfer_trb *dq_pt = udc_ep_ptr->deq_pt;
+	struct usb_request *usb_req = &udc_req_ptr->usb_req;
+	struct crg_transfer_trb *p_trb;
+	u32 transfer_length;
+	bool ioc;
+	bool azp;
+	int ret;
+	u8 dir;
+	u8 setup_tag = crg_udc->setup_tag;
+
+	/* A new SETUP aborts the previous EP0 transaction. The completion
+	 * callback of the aborted request is allowed to run, but it must not
+	 * requeue the old request before the new SETUP has been handed to the
+	 * gadget driver.
+	 */
+	ret = crg_udc_ep0_check_state(crg_udc);
+	if (ret)
+		return ret;
+	if (crg_udc->setup_status != DATA_STAGE_XFER &&
+	    crg_udc->setup_status != DATA_STAGE_RECV)
+		return -EINVAL;
+	dir = crg_udc->setup_status == DATA_STAGE_RECV;
+
+	ep_state = crg_udc_get_ep_state(crg_udc, 0);
+	/* Need to queue the request even ep is paused or halted */
+	if (ep_state != EP_STATE_RUNNING) {
+		dev_dbg(crg_udc->dev, "EP State = 0x%x\n", ep_state);
+		return -EINVAL;
+	}
+	if (list_empty(&udc_ep_ptr->queue)) {
+		/* For control endpoint, we can handle one setup request at a
+		 * time. so if there are TD pending in the transfer ring.
+		 * wait for the sequence number error event. Then put the new
+		 * request to transfer ring
+		 */
+		if (enq_pt == dq_pt && !udc_ep_ptr->tran_ring_full) {
+			u32 i, td_done = 0;
+			bool need_zlp = false;
+			struct crg_udc_bounce *bounce = udc_req_ptr->bounce;
+			dma_addr_t trb_dma = bounce ? bounce->dma : 0;
+			u64 remaining = usb_req->length;
+			/* Transfer ring is empty
+			 * setup data stage TRBs
+			 */
+			udc_req_ptr->first_trb = udc_ep_ptr->enq_pt;
+			if (!udc_ep_ptr->usb_ep.maxpacket)
+				return -EINVAL;
+			if (udc_req_ptr->usb_req.zero == 1 &&
+			    udc_req_ptr->usb_req.length != 0 &&
+			    ((udc_req_ptr->usb_req.length %
+			      udc_ep_ptr->usb_ep.maxpacket) == 0))
+				need_zlp = true; /* zero length packet */
+			if (num_of_trbs_needed > 32)
+				return -EMSGSIZE;
+
+			if (num_of_trbs_needed >
+			    crg_udc_room_on_ring(
+				    crg_udc, CRG_UDC_CONTROL_EP_TD_RING_SIZE,
+				    udc_ep_ptr->first_trb, enq_pt, dq_pt))
+				return -ENOSPC;
+
+			u8 original_pcs = udc_ep_ptr->pcs;
+
+			for (i = 0; i < num_of_trbs_needed; i++) {
+				p_trb = enq_pt;
+				transfer_length = crg_udc_trb_chunk_len(
+					trb_dma, remaining);
+				ioc = (i == num_of_trbs_needed - 1);
+				azp = ioc && need_zlp;
+				td_done += transfer_length;
+				crg_udc_setup_datastage_trb(
+					p_trb, trb_dma,
+					i == 0 ? (original_pcs ^ 1) :
+						 udc_ep_ptr->pcs,
+					transfer_length,
+					crg_udc_td_size(usb_req->length, td_done,
+						udc_ep_ptr->usb_ep.maxpacket, ioc),
+					ioc,
+					!ioc, azp, dir, setup_tag);
+				udc_req_ptr->all_trbs_queued = 1;
+				trb_dma += transfer_length;
+				remaining -= transfer_length;
+				enq_pt++;
+				if (FIELD_GET(TRB_TYPE_MASK,
+					      le32_to_cpu(enq_pt->dw3)) ==
+				    TRB_TYPE_LINK) {
+					if (FIELD_GET(
+						    TRB_LINK_TOGGLE_CYCLE_MASK,
+						    le32_to_cpu(enq_pt->dw3))) {
+						dma_wmb();
+						le32p_replace_bits(
+							&enq_pt->dw3,
+							udc_ep_ptr->pcs,
+							TRB_CYCLE_BIT_MASK);
+						udc_ep_ptr->pcs ^= 0x1;
+					}
+					enq_pt = udc_ep_ptr->first_trb;
+				}
+			}
+			dma_wmb();
+			le32p_replace_bits(&udc_req_ptr->first_trb->dw3,
+					   original_pcs, TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->enq_pt = enq_pt;
+			crg_udc_knock_doorbell(crg_udc, 0);
+			if (udc_ep_ptr->enq_pt == udc_ep_ptr->first_trb)
+				udc_req_ptr->last_trb =
+					udc_ep_ptr->last_trb - 1;
+			else
+				udc_req_ptr->last_trb = udc_ep_ptr->enq_pt - 1;
+		} else {
+			/* The SETUP handler normally flushes stale control TRBs.
+			 * Do not accept an unscheduled request if EP0 is still busy:
+			 * SETUP_TAG_MISMATCH events are intentionally ignored.
+			 */
+			dev_err(crg_udc->dev,
+				"ep0 ring not idle on new setup\n");
+			return -EBUSY;
+		}
+	} else {
+		dev_err(crg_udc->dev, "udc_ep_ptr->queue not empty\n");
+		/* New setup packet came
+		 * Drop this request.
+		 */
+		return -EINVAL;
+	}
+	return 0;
+}

-- 
2.34.1

