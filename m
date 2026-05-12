Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9443CE48F;
	Tue, 12 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585395; cv=none; b=ieVmLS3iTTHgfKWbC9fY+l+RcKSfj87Nzlat+Ake5SMAlcDC/kojs9L300k0l2YwVkRqKEXTgAH9a0ULsTMlflIzRVXdTFXfBG7zK9HAKurynIegW/Wtl67iA0mEdqWmhcyRFbpsAeqLgOMnP8lDgD0bjyMUq7snCgvGT1EU9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585395; c=relaxed/simple;
	bh=Ap2n3+be6TwO7fDuUNeJi0Sg+7nDWteXGcPxj6IU1bk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fsc35aBgrnQSRDEsYeZ9Y7BTymPcBEUwkneDlPfWNq7pZxzRfv36p9XI+ow7vNvvoAnwTh9jZdfuK2Oy/tn/UucMGAjgLqtUzirErMgM2DTVd8YoK5YdJFG18OXqSsHdLCIcNz55LCgdW6e6/gIKD8AJSikHyk52hfJuIbqnvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pAPfOp0/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pAPfOp0/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF867C2BCB0;
	Tue, 12 May 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585394;
	bh=Ap2n3+be6TwO7fDuUNeJi0Sg+7nDWteXGcPxj6IU1bk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pAPfOp0/0CMw+6CTxAGEQMOMut6HpStYRwEPhD2EGmjyJ9Xw4F+ar72Adov+Avpsv
	 GHicqUhB0YUWnvuQhe81jt8PjJ/niA2ZTDOyDOEfNEri7qYsIw8D92LT7KP9sz12au
	 tyPdjIqGWZIqUdB2a+QGbcYRTNqDKAwa1JwZIH5IZ6sJRFsajNDLCVONggq/A5/xqi
	 LUnufj5LsIRLFp3Ma7c+ibwWt4CcTHoF13HY9X9HiHeYbBuj4ywUak9cCP6hbCQP9a
	 7TH27LTZ45wtXfByAFiCpx1o6443elFF6RyNxO9/bAsy/RowXOH3BDXKPqN9oU1yFL
	 EXmfe2Q+W4P/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9CACD4F21;
	Tue, 12 May 2026 11:29:54 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v4 0/2] usb: cdns3: support configurations without DRD
 block
Date: Tue, 12 May 2026 13:44:23 +0200
Message-Id: <20260512-b4-no_drd_config-v4-0-7b4e5dc96f81@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcSA2oC/yXMzQqFIBBA4VeJWV9B7Ye4rxKXKJ2puQsNrQikd
 89q+S3OSRAxMEb4FgkC7hzZu4zqU4CZBzehYJsNWupG1kqLsRLO9zbY3nhHPAmqS0mKVGPbAXK
 2BCQ+nmX3ex238Y9mvT9wnhcpbZYHdAAAAA==
X-Change-ID: 20260512-b4-no_drd_config-f530f1f16d8a
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
 Bjorn Helgaas <bhelgaas@google.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778586339; l=2828;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=Ap2n3+be6TwO7fDuUNeJi0Sg+7nDWteXGcPxj6IU1bk=;
 b=T4/RaDtfS5lY0xDKNmKMfmLQh0IHs7fuKR/oNyggrCGl1HyFrqnDv5Bv+qzz+J1XUjg8a2M3V
 ybp0J2CuM5yDMrksT2ekwXaHbLd22jTZrh/t66Cdl7TSfVxasSuQ06z
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

usb: cdns3: support configurations without DRD block

This series adds support for Cadence USBSSP controllers in hardware
layouts where the Dual-Role Device (DRD) register block is either
missing or inaccessible.

In such configurations, the controller is hardwired to a single role
(either host or device) and the driver must skip all OTG/DRD register
accesses to avoid bus errors or incorrect role detection.

The solution introduces a new 'no_drd' property that can be passed
via DT or software nodes. When set, the driver:
1. Skips DRD register mapping and IRQ requests.
2. Uses a different BAR indexing logic for PCI-based configurations
   (32-bit addressing layout).
3. Hardwires the role based on 'dr_mode'.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Note: This series is based on current linux-next. I am aware of Peter
Chen's recent refactoring series ("usb: cdns3: plat: Expose platform
core driver as library"). Although there is a minor conflict in
cdns3-plat.c, Peter has already provided an Acked-by for this version.
I am happy to provide a rebased v5 as soon as Peter's changes land in
linux-next if required.
---
v4:
  - Added DT binding documentation for the 'no_drd' property.
  - Relaxed 'reg' and 'interrupts' requirements in the DT schema (minItems 2)
    to allow configurations where the OTG/DRD register block is missing,
  - Moved PCI_DEVICE_ID_CDNS_UDC_USBSSP from pci_ids.h to cdnsp-pci.c
    to keep the global PCI ID list clean.

v3:
  - Improved descriptions and comments for better clarity.
  - Introduced the 'no_drd' property to indicate missing DRD register block.
  - Added support for fixed host-only and device-only configurations.
  - Ensured cdns_otg_disable_irq is called only when no_drd is false.
  - Updated cdns_drd_gadget_on/off to ensure PHY mode is correctly
    handled even if DRD is disabled.

v2:
  - Changed otg_irq to be optionali.
  - Added cdns->no_drd check in cdns_power_is_lost.
  - Added cdns->no_drd check in cdns_get_id.

---
Pawel Laszczak (2):
      dt-bindings: usb: cdns3: Add no_drd property
      usb: cdnsp: Add support for device-only configuration

 .../devicetree/bindings/usb/cdns,usb3.yaml         | 13 +++++-
 drivers/usb/cdns3/cdns3-plat.c                     | 26 +++++++-----
 drivers/usb/cdns3/cdnsp-pci.c                      | 47 +++++++++++++++++-----
 drivers/usb/cdns3/core.c                           |  3 +-
 drivers/usb/cdns3/core.h                           |  4 ++
 drivers/usb/cdns3/drd.c                            | 44 +++++++++++++++++++-
 6 files changed, 112 insertions(+), 25 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-b4-no_drd_config-f530f1f16d8a

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>


