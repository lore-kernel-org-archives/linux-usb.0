Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381F3EC699;
	Fri, 17 Jul 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284016; cv=none; b=lC+4ZngO9x3rWNqZHZfnd9BMf+mBAyjigwMYIWrBTQ6qdUdGX829YnybTcs0HXoc9A2p87Ie9/3iAWhvhFIPpp5N7YsdriiDXLB6QQ6phafv+VYn9uy2wL7AmZYOKv4zzW+kae8BxwlB+ehNwI/8TcvNiG0PCfQTp8Kh/d5ylPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284016; c=relaxed/simple;
	bh=rLEkL3EcByR228mYan/o1Uzk5w8n5u6hAly7AYf2xsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1SfistYkJDQ1ja5V8LvbCYr+esUIbKTVEOiVbzYl8T8TtcsXd3DO9LftXAPClgmOS6kREx77jnbxooueggPU24tWiuncV5DJIfkbwA1S7bykRjIZe+Bm26S/D/HkRGfrcvUgG+I6wlJG0/hwfJy6z6PgOcKXrTqzF9twKcGHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSIfz5Ty; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSIfz5Ty"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 076F2C2BCF5;
	Fri, 17 Jul 2026 10:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784284014;
	bh=rLEkL3EcByR228mYan/o1Uzk5w8n5u6hAly7AYf2xsA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hSIfz5Ty3LJ59j85GjIZMD5H/NXAMGJF4jBL7eVp1YdAYdIPTPkAY1J52gBvACJCD
	 1QNd6SpBP29BOW6N5yrpCUt+a+G2v0a3NX1UgA71SUf3W75KPW6qLIdzp6zlODiQZx
	 Af89/d76uD/85wLCDaW3gqNMitUy7DkQoMKKflrZisj8jjc/7JnqyD+PCSCWls8xvm
	 hVrr8tlgrGZ88792IrM3f6vnuJrEu/TAwDeu/yFD/Da4CSlZ3rXZfXcBWwvzJDrePz
	 tUsvRNQNTUS/gSpY1CLPFz2trCz0EhdsHPgqn6e4aT6CYIPDDgGVZJlZ7tiCoZgiCM
	 OcvmuV3bPzt/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2188C4451C;
	Fri, 17 Jul 2026 10:26:53 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Fri, 17 Jul 2026 12:44:16 +0200
Subject: [PATCH 3/3] usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet
 capability
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-eusb2v2-packet-size-v1-3-67c611bd0c5b@cadence.com>
References: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
In-Reply-To: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784285103; l=4516;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=/nqvh7s4hA7WGTq4/MDkceuMr0OxBcKZnhuFXpnPw1k=;
 b=8CRIH2rocJ7CrYtr2uTT6D1ZlYCkgb6OO2jludSh85R9iU79rTwEuwxuwWvf2MMT73ezlqIaR
 5E8FTKcTJiEDRVcFTlUilAfW/NppPIAKqfBvelQRsG7ia9AAiXLQYPa
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
 drivers/usb/cdns3/cdnsp-ep0.c    |  2 ++
 drivers/usb/cdns3/cdnsp-gadget.c |  4 ++++
 drivers/usb/cdns3/cdnsp-gadget.h |  8 ++++++++
 drivers/usb/cdns3/cdnsp-mem.c    | 11 +++++++++--
 drivers/usb/common/debug.c       |  2 ++
 5 files changed, 25 insertions(+), 2 deletions(-)

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
index 5d8cdc91927d..62e496e5225e 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -978,8 +978,15 @@ int cdnsp_endpoint_init(struct cdnsp_device *pdev,
 	if (!usb_endpoint_xfer_isoc(pep->endpoint.desc))
 		err_count = 3;
 	if (usb_endpoint_xfer_bulk(pep->endpoint.desc) &&
-	    pdev->gadget.speed == USB_SPEED_HIGH)
-		max_packet = 512;
+	    pdev->gadget.speed == USB_SPEED_HIGH) {
+		if (!pdev->gadget.is_eusb2v2) {
+			max_packet = 512;
+		} else {
+			max_packet = rounddown_pow_of_two(max_packet);
+			max_packet = clamp_val(max_packet, 512, 1024);
+		}
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


