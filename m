Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C03B2FD1
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 11:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076620; cv=none; b=I0vWklJkwq11SowP1mHV3V0OI1mRHzV7cXFbAEsrV5ir9YXV+nfqunucwn0msch+NqQ9fkCfrFo718/aO99zQxQfC2mGYw2beUc3HO+nh/Gp9/us4W6Pyjn6YVPFTC+fqqLil1WjjwbyoolHoahvIrPvm/5cMD/qIPAq1UvX9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076620; c=relaxed/simple;
	bh=ogikdSS5fM83wdUgSIeNaSuxlx1astWtdx5wvQV6XaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPOffi2jg0IY/G5Rhco5RVzBzxe1Hm92ek5abfqHWRToY3/DbG6/8haCKBv4R8UOLwk68LKSsgGmgQ9u7+aiT2xKyfrxeoFgWdbIiDa+EumH6O6nKRIpzueVpd527wX+L9a7DuXORjuNfwYbNkpZbW5k71lWdd7pq5nrda7Zjcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lj4Fc1UX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lj4Fc1UX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ca11143dbbso3575465ad.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076617; x=1783681417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqs/izjUXlQxLzNznfrFoz35GSBVfbHOxBq9DzMVAxY=;
        b=Lj4Fc1UXcZsNnouZKNz4bKaDbqFcV0qn6QPXZMZBUhOoK8fe/TjN4OH83yvYkFYKqM
         lLZrxRUtvhPl1pN151CDGuLpWonXJz/Ux8uFw8K2A28rYNPDyKDOFqmkl6XyU+Z9sEQb
         qvxvxr4A+/1WjNpOsEPgd1gwVE64bZnNE6cG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076617; x=1783681417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sqs/izjUXlQxLzNznfrFoz35GSBVfbHOxBq9DzMVAxY=;
        b=I1rl4P6fdadv0ujtvhBWQe+kw1C1BTpnRkY/NQOTaIQ5OgxWQtI/0JKVyCbgEN9Zv+
         A5/xCqGt4M0IsQ/y9UvN5VGvgvDasOB3FO40tIJBkSivj8hrbWDWzaXinK/mhkxZVThm
         53ac8xdgZndJ4U5N2n6xAB21zeUwkWGaJMSqI+Pwwc1W4rLCyKUdAWPcsMrvEmVqblwr
         7gDCZpPPSEKU8n8q0+KVlpdVclUUQsaoaxFD9l/AjNq2d8xO7jG5qWNoyqqLwarb14ze
         pSlK1q3bCoeOrjbTUFQ9g7PUYSXt6tPq0rOogwD7t8eRnRD2Yja5TbkkGabPQ2cx6Smv
         obxw==
X-Forwarded-Encrypted: i=1; AHgh+RrN+WHOcBBAbzFpLGulNhn0LsQoqeudno6uPO3zlmG8ZbjHHF+xhWLj7HKeFq2bbJE3AuWk5UOYFvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytcCEVlK6p309aVhqEL/eFy6SIbcvHRid5YUSgJ0xSWtTvlhFx
	Xw9vzq8kjxbGxvDVGP4IHVHVdsVIOFjAKsxMHKZMjvFU0+rzGkVRlEEsWCz0eLCNrA==
X-Gm-Gg: AfdE7clL4NkfhBORFggS0GnsUhru5IP/p06HBwd9DWtzkYaZ2546udVL6yxJUBy8roG
	f/A4qI1d6IY3+XTZ+39TJ9arTgfFQHZTNNRqklIgJNvIBarKBLtXDZBoKsB7yQp/1lB8orWsWle
	6LQ3vZIGh+9gS84GZ56KnOszE6I1gBd5ZeKVe6ZVxBO5ku1u4M2F4sfPboT99bH2tkYnkRYdCK+
	z7wJfEgKLNeXsyx2Sdeew/mFFGpl1cF9M0SSnqNypoG4lEcfP12etmGnxYmjN60334uQz10uoTC
	4sVIbz2wrXmK7pwAp1GphOdiNHf27Dt19fp8++YJKIBN01lSe2YPSDvvuHK4Ey7jCIJKG8680Bv
	gy+YjINEcT8/GJxA7Rh90NlEvGnmvk1v85CF/phI8vx7RzMtcjbkOjftIkqlx9lOP8Vxy0HnWmz
	B51gkW92IP0ZqZeZq+8XoMucqad+GShQSArw2PziifjwJiEwR3YATxIhJY2rLFFyx53Ca/aA==
X-Received: by 2002:a17:902:e54c:b0:2ca:d818:61e5 with SMTP id d9443c01a7336-2cad818638cmr21373785ad.26.1783076617402;
        Fri, 03 Jul 2026 04:03:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 00/13] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Fri,  3 Jul 2026 19:03:01 +0800
Message-ID: <20260703110317.1283411-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my attempt at integrating the power sequencing API into
the USB core to support the USB connection on M.2 E-key slots. M.2
E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].

Major changes since v2:
- Removed changes for MT8192 Asurada family: one of the device is
  shipped with RTL8822CE-VR, which is PCIe + UART and needs more work.
- Removed changes for USB A ports: VBUS one the type A ports on
  Chromebooks are not directly controllable from the OS and VBUS is
  modeled as always on. As such the changes I made don't actually
  change how the system works.
- Added new pwrseq_power_is_on() function
- Make new pwrseq integration effectively OF only by not assigning the
  port fwnode if the hub's fwnode is an ACPI node
- Added patch to convert remaining instances of directly setting/clearing
  USB_PORT_FEAT_POWER to usb_hub_set_port_power()
- Power sequencing state removed again in favor of state tracking by
  pwrseq subsystem
- Power sequencing descriptor again separately requested for HS and SS
  ports
- Dropped pwrseq_power_off() call before pwrseq_put(); the latter calls
  the former implicitly if the power state was left on
- Squashed DT binding revert and addition into one patch

- Link to v2:
  https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.org/


Major changes since v1:
- No longer adding the "index" parameter the power sequencing API
- Switched from OF graph to fwnode graph APIs
- Tie "port@" node to usb_port device, and use this device as consumer
  to acquire power sequencing descriptor
- Power sequencing descriptor now only tied to USB 2.0 port to avoid
  double reference
- Power sequencing state tracking added
- Link to v1
  https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.org/

The series is based on next-20260702.


Patch 1 and 2 add new fwnode graph helpers. These are used by the patch
5 and 8, respectively.

Patch 3 adds a new pwrseq_power_is_on() for a power sequencer consumer
to query the current request state. Note that this is not the _actual_
state.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER returned by pwrseq_get() in patch 9.

Patch 5 makes the USB port device associated with a "port@" fwnode if
available. This depends on patch 1.

Patch 6 changes usb_port_is_power_on() so that |struct usb_port*| is
passed in instead of |struct usb_hub*|. This patch does not change any
functionality.

Patch 8 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub. This depends on patch 2 and 3 for the new helpers.

Patch 9 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller and adds a proper representation.

Patch 10 adds matching pwrseq consumer by "port@" node to the M.2 slot
driver. This is only used for the USB target, but there is no attempt
to differentiate the connection type. The driver simply tries matching
the "port@" node first, then falling back to the port parent or device's
node.

Patch 11 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patches 12 and 13 enable the M.2 E-key slots (or slot-like integration)
found on MT8195 and MT8188 MediaTek-based Chromebooks. 


This series unfortunately spans multiple trees. The way I see it:

  - Patch 1 and 2 go through the driver core, and an immutable tag is
    provided to be merged together with the USB patches.

  - Patch 3 gets an ack from Bartosz, and goes through the USB tree.

  - Patch 4 through 9 (all the USB related ones) go through the USB
    tree, along with the dependencies above.

  - Patch 10 and 11 go through the power sequencing tree.

  - Patch 12 and 13 (device tree only) go through the soc tree via the
    mediatek tree.

Some of us discussed v1 at Embedded Recipes, and I believe Bartosz, Mani
and I agree on this approach. The debate is likely going to be on
whether this should be integrated into the USB core or not. I believe it
should, so that the power sequencing timing is tied to the USB port
being brought up. I do have a fallback option of just enabling the USB
power sequencing target inside the M.2 slot driver if a valid OF graph
connection is seen. But this is less desired for the reason given above.

Please have a look and share your thoughts.


Thanks
ChenYu


[1] https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/

Chen-Yu Tsai (13):
  device property: Add fwnode_graph_get_port_by_id()
  device property: Add fwnode_graph_get_next_port_endpoint()
  power: sequencing: Add pwrseq_power_is_on()
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Associate port@ fwnode with USB port device
  usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
  usb: hub: Use usb_hub_set_port_power() to control port power
    everywhere
  usb: hub: Power on connected M.2 E-key connectors with power
    sequencing API
  dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB
    connections
  power: sequencing: pcie-m2: support matching on remote "port" node
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       | 17 +++-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 ++++++++++++++-
 drivers/base/property.c                       | 47 ++++++++++
 drivers/power/sequencing/core.c               | 18 ++++
 drivers/power/sequencing/pwrseq-pcie-m2.c     | 52 ++++++++---
 drivers/usb/Kconfig                           |  1 +
 drivers/usb/core/hub.c                        | 78 +++++++++++-----
 drivers/usb/core/hub.h                        | 12 ++-
 drivers/usb/core/port.c                       | 62 ++++++++++++-
 include/linux/property.h                      |  3 +
 include/linux/pwrseq/consumer.h               |  1 +
 12 files changed, 401 insertions(+), 55 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

