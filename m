Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D13F210B;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742319; cv=none; b=MEb/7PTCOuNpfyDV/MW6kuvF1Yg3AxlIEnVNg4es1gSJll4YV3J1s8docPoXNTcGFviay+Lsj1x30WbaIRbv2xaGdwgYXzj7MqbiG+18+r6056gwB+/GWFXEfuepJYu5z9RyxwCLtmU4+xikI2/jf8UuH56nLiBsyB4bIBF1rb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742319; c=relaxed/simple;
	bh=pyBYq9Ksma4oIKXXWfQ0yls+NEk/x0cerzcg+XpOnL0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CMNl5//3Ue07KPzggdi3jo9EcGlnvnmm6STzI33mz2UMigGrTDSY7SL7qXampPuacMkwYjpxb8w0sHCgv4M22LYjtha4xdIojJIFFcieo9XtyH6rHDHloHGM44RAMEGEgWQ2KPpEuLfILZF7f34HxNt3JXZ1IO55KLGoTTXHp7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvKcF/ul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvKcF/ul"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28853C2BCFB;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787742318;
	bh=pyBYq9Ksma4oIKXXWfQ0yls+NEk/x0cerzcg+XpOnL0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HvKcF/ulH2+9I7oLOmTrj/60GoyXg+/n2tPkYsZ0TxtQ0Mbh5G2FzQsmXn+FGYwPe
	 4p0zwpTJTH9ilLECAbSp2UUqxQqD1Tf/okpoYvyiMVnZREuTO1Ou5aJBkKIbcJlVjf
	 mDr19IsAuD+5PswwcEjuqSMOaGGGBCjGOsvDsFLZUL8W3pmpvDnv98Chk4aVZHf3Fn
	 hGkN7v8jyFChXY9lH1mn/1dpj5vkDMEl3BwYvqwURg2hLwriN1Bcrm6SmjL9Se+yWt
	 +PVaQWZfJNrZBTrBQMsRt9b+pCHA1jv7g4AeweQkWr/xIzR1J7xrNfC70YTlwYEue5
	 8EQENnD46Lshw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0398C61DBD;
	Wed, 26 Aug 2026 11:05:17 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v2 0/3] usb: Add support for eUSB2v2 1024-byte Bulk
 MaxPacketSize
Date: Wed, 26 Aug 2026 13:24:35 +0200
Message-Id: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPPMjmoC/22Nyw6CMBBFf8XM2jFtQ4u68j8MCzqMUo1AOtCoh
 H+Xx9blSe49ZwThGFjgvBshcgoS2mYGs98B1WVzZwzVzGCUccqpE/Ig3iSDXUlP7lHClzEj79w
 xszZzFuZnF/kW3qv1Wmwsg38w9YtqWdRB+jZ+1mzSy24r5Dr/W0gaFbqcnNa+UmT9hcqKG+IDt
 S8opmn6Adhg+M/KAAAA
X-Change-ID: 20260609-eusb2v2-packet-size-4cb668455465
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787743495; l=4489;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=pyBYq9Ksma4oIKXXWfQ0yls+NEk/x0cerzcg+XpOnL0=;
 b=GNTT9IDt7bXiz9WlFiDOQM2L7PMqUAgmR8DU8kZVxEkK3Gv4/LgMsqsp1ZyeBJs1VN8XKR0Eu
 VVp6ACNgMz6DirT4bkgdyqk42o4pB0KtA/oDr6qvmTukkZsSIguLTo0
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

The Embedded USB2 (eUSB2) v2 specification (bcdUSB 0x0230) introduces a
mechanism that allows High-Speed Bulk endpoints to support a maximum packet
size (MPS) of 1024 bytes, expanding it from the traditional 512-byte limit
defined in the standard USB 2.0 specification. This capability is highly
beneficial for Mass Storage Class (MSC) devices, significantly improving
overall throughput.

Per the eUSB2v2 specification, a peripheral device will revert its internal
Bulk MPS back to 512 bytes after major bus events, including a bus reset,
disconnect, or deconfiguration. To establish and maintain the 1024-byte mode,
the host controller must explicitly issue a device-recipient SET_FEATURE
request called USB_DEVICE_BULK_MAX_PACKET_UPDATE. This must occur after the
device enters the ADDRESSED state, but strictly *before* it transitions to the
CONFIGURED state.

This patch series implements the required infrastructure on both the host and
gadget sides, and enables it for the Cadence (cdnsp) controller.

Structure of the series:
- Patch 1: Introduces host-side core support in usb_set_configuration() to
  detect eUSB2v2 devices and issue the SET_FEATURE update request prior to
  activating the device configuration. Adds eusb2v2_mps_active flag to
  struct usb_device to track negotiation state. Extends hub.c to re-issue
  SET_FEATURE after bus reset in usb_reset_and_verify_device(); on failure
  triggers re-enumeration to prevent driver from operating with inconsistent
  MPS state. Also updates xHCI endpoint initialization to allow 1024-byte
  packets for High-Speed Bulk endpoints when HCC2_E2V2C is present.

- Patch 2: Extends the USB Gadget Composite framework to advertise bcdUSB
  0x0230 when eUSB2v2 is supported, intercept the incoming feature request,
  and dynamically update the wMaxPacketSize fields across all High-Speed
  Bulk descriptors before configuration is completed.
  
- Patch 3: Implements peripheral-specific handling in the Cadence (cdnsp)
  driver, reading HCCPARAMS2 to discover the hardware capability and adapting
  cdnsp_endpoint_init() boundaries to allow for the larger packet size.

Testing:
The flow has been validated using the Cadence eUSB2v2 Host and Device
controllers, ensuring seamless transition to 1024-byte mode during early
enumeration stages and successful verification under USB-IF Compliance
Verification (CV) tooling.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Changes in v2:
- Removed config.c change: per eUSB2v2 spec section 5.2, conformant devices
  always report wMaxPacketSize=512 in their descriptor regardless of operating
  mode, so the warning suppression was unnecessary.
- eusb_update_max_packet(): changed from void to int; added error propagation
  and eusb2v2_mps_active state tracking.
- Added hub.c handling to restore 1KB mode after bus reset, with re-enumeration
  on failure (addresses Oliver Neukum's review comments).
- xhci-mem.c: simplified HS bulk clamp logic.
- xhci.c: moved is_eusb2v2 assignment into xhci_hcd_init_usb2_data().
- composite.c: stall CLEAR_FEATURE(BULK_MAX_PACKET_UPDATE) as it is not
  defined by the eUSB2v2 spec.
- cdnsp-mem.c: simplified HS bulk clamp logic, consistent with xhci-mem.c.
- Link to v1: https://patch.msgid.link/20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com

---
Pawel Laszczak (3):
      usb: xhci: Add support for eUSB2v2 1024-byte bulk packet size
      usb: gadget: composite: Support eUSB2v2 bulk MPS update request
      usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet capability

 drivers/usb/cdns3/cdnsp-ep0.c    |  2 ++
 drivers/usb/cdns3/cdnsp-gadget.c |  4 +++
 drivers/usb/cdns3/cdnsp-gadget.h |  8 +++++
 drivers/usb/cdns3/cdnsp-mem.c    | 10 ++++--
 drivers/usb/common/debug.c       |  2 ++
 drivers/usb/core/hub.c           | 16 +++++++++
 drivers/usb/core/message.c       | 74 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/core/usb.h           |  2 ++
 drivers/usb/gadget/composite.c   | 68 ++++++++++++++++++++++++++++++++----
 drivers/usb/host/xhci-mem.c      | 18 ++++++++--
 drivers/usb/host/xhci.c          |  4 +++
 include/linux/usb.h              |  7 ++++
 include/linux/usb/gadget.h       |  2 ++
 13 files changed, 205 insertions(+), 12 deletions(-)
---
base-commit: 1d52b92ce8748624f84eca7eaea3ac31ed7b09a5
change-id: 20260609-eusb2v2-packet-size-4cb668455465

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>


