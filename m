Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA53E00B4;
	Fri, 17 Jul 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284015; cv=none; b=d04acJdDcpwVbiNE/ETyGzIOyiiO5ueiRJiQ6AywezR63lhN0z6BKTITSRiJm3Vja20oCNCZ6EK48OMqdzX2+fGcEZxedmz3aln4z9+WOFyv3xWf7EbxjGgVeiU3vYhJYaxbpdWzDft3fByay5moL3uQklNfS5GffEs2XNjhhkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284015; c=relaxed/simple;
	bh=jlGRCyOVWPqpkZ0E8atWDoSwsOLVumKM1U4k22v6y58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RPZGV6alFyeAUCDhV6SBAeicqgZxwG2i01bERhZodjg5N7FfmYe2hfPrGU6KHBhBZGTmLeFANt1+86bwCSy/DwX6ejdNc7j4Z/tg+T0qjudDnaoRv8N8jtxYtDKsyfvL0tSJmu0nNGpHmRuJGoOSFN8n3/X/iYhevQfwzpEul/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3fZjXki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3fZjXki"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E107CC2BCB9;
	Fri, 17 Jul 2026 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784284013;
	bh=jlGRCyOVWPqpkZ0E8atWDoSwsOLVumKM1U4k22v6y58=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=S3fZjXkizYEcY/JO90ZopKdUaDvFXz4pTQLhWEGf3lCvoJmd9Tr/If7abBXg8d6o3
	 +AbyLTcmceLGTDSLojpwlHhVfBqYPsx8JZOAXPEUVu/OAY5RK3oOTf/ZPmx+8zEySs
	 SRXWAw46M8es9Vn+EkZ2KrHY2vtrQMhNe4R9+Q9IB6BGxD4T2oSj76kECZFPXwPdxb
	 Ai3pKj95+/jI9gWD7gx+fg6JVemIuA2wv72F6eUZhMWycaCxNRU8oUtMW5ESSy+/br
	 1vErFqJT7fM3/iSAYCaQTNwsnBUrw2DLVXmZLaUqC3h/xPDtS8ZejWGjrj96HP3jT0
	 umZ+NNn8Wu0gA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC449C44514;
	Fri, 17 Jul 2026 10:26:53 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH 0/3] usb: Add support for eUSB2v2 1024-byte Bulk
 MaxPacketSize
Date: Fri, 17 Jul 2026 12:44:13 +0200
Message-Id: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0HWmoC/yXMQQrCMBBG4auUWTsQQzKoVxEXTfzVUagl0xax9
 O6mdvkt3pvJUBRGp2amgklN313FftdQfrTdHazXavLOixN3ZIyW/OS5b/MLA5t+wSEnkUOIMUi
 kWvYFN/38r+fLZhvTE3lYV7QsPwXVaO13AAAA
X-Change-ID: 20260609-eusb2v2-packet-size-4cb668455465
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784285103; l=3316;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=jlGRCyOVWPqpkZ0E8atWDoSwsOLVumKM1U4k22v6y58=;
 b=7rcyvpbhamKiRTFKuhr5kraG1B06AHnGBNeC6VigOpCk4FyaI9Uzybo1aI3MDWaf7LG8wcIor
 EuJdytKIQGpAEILJUjIjnswtqbBLZZPcPytOUovKsXgAtqDU1G7WPlr
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
  activating the device configuration. It also updates xHCI endpoint
  initialization routines to allow 1024-byte packets for High-Speed Bulk
  endpoints when the host capability bit HCC2_E2V2C is present.
  
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
Pawel Laszczak (3):
      usb: xhci: Add support for eUSB2v2 1024-byte bulk packet size
      usb: gadget: composite: Support eUSB2v2 bulk MPS update request
      usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet capability

 drivers/usb/cdns3/cdnsp-ep0.c    |  2 ++
 drivers/usb/cdns3/cdnsp-gadget.c |  4 +++
 drivers/usb/cdns3/cdnsp-gadget.h |  8 +++++
 drivers/usb/cdns3/cdnsp-mem.c    | 11 +++++--
 drivers/usb/common/debug.c       |  2 ++
 drivers/usb/core/config.c        |  4 ++-
 drivers/usb/core/message.c       | 65 +++++++++++++++++++++++++++++++++++++-
 drivers/usb/gadget/composite.c   | 67 ++++++++++++++++++++++++++++++++++++----
 drivers/usb/host/xhci-mem.c      | 18 +++++++++--
 drivers/usb/host/xhci.c          |  3 ++
 include/linux/usb.h              |  4 +++
 include/linux/usb/gadget.h       |  2 ++
 12 files changed, 177 insertions(+), 13 deletions(-)
---
base-commit: 1d52b92ce8748624f84eca7eaea3ac31ed7b09a5
change-id: 20260609-eusb2v2-packet-size-4cb668455465

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>


