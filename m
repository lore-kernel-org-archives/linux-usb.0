Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606613D9547;
	Wed, 26 Aug 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742320; cv=none; b=sfIZvsoGkTQ9xtXAs8dVbngwq/daA6QcKU/9Z5/1wakMCeBfJ4cf/WQ4iqoMWCuWQOWopGr+nNEQO6lVTk5iqJ7yWkXR039ASSytl6QSxrMvT6jb/AphCAR6kURjUfhhGgG7qcFDAG6g9rNv1MpUfh9FCGk/8+UELsxDPw4cr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742320; c=relaxed/simple;
	bh=ath9Jm1YRPO/g0bQeyyBHD15dlZjl85r4pPQ2cZox74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVyPqluxlbwQB8ybVkod0HevGJDB0Jtc/GYYE8lvLolVzGArujKwJKVinylyqZFpd785xOmPyUBa1hl4QiUOmqci8ZV+R6fHtHiBoiUMyzmwXN6VrPqOrGH5Td+OvV4hgcnljGqVBI1V80ODYmmvhjM+Yl/akEdAKsFBECH3LU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmvwsHVl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmvwsHVl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A27EC2BCFA;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787742318;
	bh=ath9Jm1YRPO/g0bQeyyBHD15dlZjl85r4pPQ2cZox74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RmvwsHVlztiw+PIRSKGJR1U7AoAVVLhE1J2m1vTB46jM+/aWQJgl+ZNXmD4Jxkp//
	 Gsmebc7GXkoegCBABZn9RgVkm32bytJl3WrEsSBlCQ42jdjT9thnoeA0Y4szHhCwA5
	 A3JqaxRfZzVyXyrz6ZBCetrt8V3M2vChiXsD1V948XbRaaJUWYzMZX2lVRg+se1Ckq
	 UQZn77ae7AljvZKwRAqafpfiZuS0Z6FMlMkIZLaqqB5EXT31qKkQXcO9TcH0VK+ZjZ
	 YyeIUnPHcCG2s7wuB7FDagdSfs5zZrpcg3cvxqR524fjD9NY6O38DBOTEl9O06H3RY
	 4Ru13pQ3j+Q8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAB9C61DBE;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Wed, 26 Aug 2026 13:24:38 +0200
Subject: [PATCH v2 3/3] usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet
 capability
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2v2-packet-size-v2-3-950f19f38ef0@cadence.com>
References: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
In-Reply-To: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787743495; l=4597;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=fzuaIRwsep0I/yQ38o8xT1m/qQPyfCzKgU+SbDae//E=;
 b=/emCebuQHyWB8uZXci9RNMGI7SUDsVxo/gcDTeOPbeayDCSjkfPSsqe7gc/1VP6NFAywCFebt
 /LGbesGa6tuBAXTpbSV+l1Pe1UT15J2yaG+1Xqs/EFk2EWgkGEERd/w
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

From: Pawel Laszczak <pawell@cadence.com>

Implement peripheral-side changes in the Cadence (cdnsp) driver
to support eUSB2v2 1024-byte Bulk MaxPacketSize.

Check the HCC2_E2V2C bit in HCCPARAMS2 during setup and set
'pdev->gadget.is_eusb2v2 = 1' if supported. Update cdnsp_endpoint_init()
to allow internal max_packet size allocation up to 1024 bytes for HS
Bulk endpoints, and delegate the incoming update setup request from
ep0 to the composite layer.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Changes in v2:
- cdnsp-mem.c: simplified HS bulk clamp logic to: if (max_packet != 1024)
  max_packet = 512, consistent with xhci-mem.c.
---
 drivers/usb/cdns3/cdnsp-ep0.c    |  2 ++
 drivers/usb/cdns3/cdnsp-gadget.c |  4 ++++
 drivers/usb/cdns3/cdnsp-gadget.h |  8 ++++++++
 drivers/usb/cdns3/cdnsp-mem.c    | 10 ++++++++--
 drivers/usb/common/debug.c       |  2 ++
 5 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
index 5cd9b898ce97..090d20b307ee 100644
--- a/drivers/usb/cdns3/cdnsp-ep0.c
+++ b/drivers/usb/cdns3/cdnsp-ep0.c
@@ -253,6 +253,8 @@ static int cdnsp_ep0_handle_feature_device(struct cdnsp_device *pdev,
 		 */
 		cdnsp_enter_test_mode(pdev);
 		break;
+	case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
+		return cdnsp_ep0_delegate_req(pdev, ctrl);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index a5275c2fb43b..ac1dde43ce1d 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1853,6 +1853,10 @@ static int cdnsp_gen_setup(struct cdnsp_device *pdev)
 	pdev->hcc_params = readl(&pdev->cap_regs->hc_capbase);
 	pdev->hci_version = HC_VERSION(pdev->hcc_params);
 	pdev->hcc_params = readl(&pdev->cap_regs->hcc_params);
+	pdev->hcc_params2 = readl(&pdev->cap_regs->hcc_params2);
+
+	if (pdev->hcc_params2 & HCC2_E2V2C)
+		pdev->gadget.is_eusb2v2 = 1;
 
 	/*
 	 * Override the APB timeout value to give the controller more time for
diff --git a/drivers/usb/cdns3/cdnsp-gadget.h b/drivers/usb/cdns3/cdnsp-gadget.h
index c44bca348a41..75bc3f15bde5 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.h
+++ b/drivers/usb/cdns3/cdnsp-gadget.h
@@ -89,6 +89,12 @@ struct cdnsp_cap_regs {
 
 #define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
 
+/* HCCPARAMS2 - hcc_params2 - bitmasks */
+/* bit 11 - DC support Double BW on a eUSB2 HS ISOC EP */
+#define HCC2_EUSB2_DIC		BIT(11)
+/* bit 12 - DC support eUSB2V2 capability */
+#define HCC2_E2V2C		BIT(12)
+
 /* db_off bitmask - bits 0:1 reserved. */
 #define DBOFF_MASK	GENMASK(31, 2)
 
@@ -1370,6 +1376,7 @@ struct cdnsp_port {
  * @rev_cap: Controller Capabilities Registers.
  * @hcs_params1: Cached register copies of read-only HCSPARAMS1
  * @hcc_params: Cached register copies of read-only HCCPARAMS1
+ * @hcc_params2: Cached register copies of read-only HCCPARAMS2
  * @rtl_revision: Cached controller rtl revision.
  * @setup: Temporary buffer for setup packet.
  * @ep0_preq: Internal allocated request used during enumeration.
@@ -1425,6 +1432,7 @@ struct cdnsp_device {
 	__u32 hcs_params1;
 	__u32 hcs_params3;
 	__u32 hcc_params;
+	__u32 hcc_params2;
 	#define RTL_REVISION_NEW_LPM 0x2700
 	__u32 rtl_revision;
 	/* Lock used in interrupt thread context. */
diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 5d8cdc91927d..e9f205cb1dac 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -978,8 +978,14 @@ int cdnsp_endpoint_init(struct cdnsp_device *pdev,
 	if (!usb_endpoint_xfer_isoc(pep->endpoint.desc))
 		err_count = 3;
 	if (usb_endpoint_xfer_bulk(pep->endpoint.desc) &&
-	    pdev->gadget.speed == USB_SPEED_HIGH)
-		max_packet = 512;
+	    pdev->gadget.speed == USB_SPEED_HIGH) {
+		if (!pdev->gadget.is_eusb2v2)
+			max_packet = 512;
+		else
+			if (max_packet != 1024)
+				max_packet = 512;
+	}
+
 	/* Controller spec indicates that ctrl ep avg TRB Length should be 8. */
 	if (usb_endpoint_xfer_control(pep->endpoint.desc))
 		avg_trb_len = 8;
diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index f204cec8d380..b9696fae7ef5 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -46,6 +46,8 @@ static const char *usb_decode_device_feature(u16 wValue)
 		return "U2 Enable";
 	case USB_DEVICE_LTM_ENABLE:
 		return "LTM Enable";
+	case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
+		return "Bulk mps update";
 	default:
 		return "UNKNOWN";
 	}

-- 
2.43.0


