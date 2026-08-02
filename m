Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26933093DD;
	Sun,  2 Aug 2026 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713544; cv=none; b=EGWmHHsV5fqUrCFn0g/tX5VTnExiQa2tIS9XKPAIMzh5Tg54n3iSyTeRXWsXJS8qbJ2ivfk8n6uTbbmZLKrdkLz4JA4+E9M+CszLaTwF+x/XSIaWonUiFHDNEXMPDtBsp8hLiroONyDyb5s5YQ5XDP4y5iO/V5WcxOkbEOq4hDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713544; c=relaxed/simple;
	bh=sVqRYc/NUfzZHpqpYSwRCb3Heqaej9CUYm63eMqaHE4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n5YlvcMYTaZTgXGsKUgw32PLP3+u8iysoeEyGxPN+p/5mKqQ2UoFBOv0hedCz/nVIv6wu58reW2/Bkg8eggkAjuUEQWb4TPUmLFOLSS0U5H64p5Sp07SxWetzWpzTgOgBPAU7v0YKhaGS7PxzeyrcK7w4ApiaCyAA6zy9SJXPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=iaeMYgA6; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="iaeMYgA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1785713542; x=1817249542;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+DD75BBqjpoe2XmCo+ung75C84ysrY/ThJyWC00zfLc=;
  b=iaeMYgA67ArnhWGUAGPYx9+oDPBS36BgpVROd9aSMNGo+VlULytq2Oq4
   nsoTXQSDEg/nsl1MD0vds5Y1KrOw+pfxBhbcKAj7hI7tPzc/ynPPIbssw
   xKjcfgaREHdlg3KzwE61WxHMuI5U9yZAdx437woVPe1SHSarasam1RB82
   p3v/+9u9Dh0yNiSRwowMVb0B7M8RMBUAmNjpriTzy5OCGxwD/RkejgKzk
   63fkANY7xEVOVbQgqcre2fNBVoG3zq7jK5ZTOSeiLE8bF+zJIcKEUjxtr
   C3NEkMAZtVK8yKBvY9ApWnBnY7jYwq/Bc72MH5Jm/IJ/PEfyQu5pvGZ4G
   g==;
X-CSE-ConnectionGUID: 3uHEfVXNQYGZdHK0W2M7Fg==
X-CSE-MsgGUID: x6PDrMRdSpqvDtdUEwleLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="117645077"
X-IronPort-AV: E=Sophos;i="6.25,201,1779163200"; 
   d="scan'208";a="117645077"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa5.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 19:31:13 -0400
Received: from INMDWSHYB10.ad.harman.com (10.92.6.249) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 3 Aug 2026 05:01:10 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB10.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 3 Aug 2026 05:01:10 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id B9AD680059; Sun,  2 Aug 2026 23:31:10 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v6 0/3] driver core: add enumeration failure uevent helper
Date: Sun, 2 Aug 2026 23:31:05 +0000
Message-ID: <20260802233108.70950-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hotpluggable buses can detect that a device is physically present, but 
enumeration may still fail early due to protocol-level errors. Today,
such failures are only reported via kernel log messages, with no
structured userspace notification.
 
This series adds a small generic helper in the driver core that emits a
KOBJ_CHANGE uevent when enumeration fails, and wires it into the USB hub 
enumeration failure path as an initial user.
 
On emitting the event from the port device itself: I tried adding
usb_port to usb_bus_type and hit an oops in driver_sysfs_add(), seen on
an OTG host-mode switch. usb_port_driver is assigned directly to
port_dev->dev.driver but never registered through driver_register(), so
drv->p is NULL by the time the driver core creates the "driver" symlink.

Putting ports on the bus also exposes them to udev rules matching
SUBSYSTEM=="usb" on every system, which I would prefer to send
separately where it can get the review it deserves. 
 
This version therefore emits from the hub interface with the port named
in the payload, which is tested and working.

---
Changes in v6:
- Split helper into (dev, failed_id) arguments
- Return kobject_uevent_env() error to caller
- Reject NULL or empty failed_id
- Update ABI doc (date, DEVPATH, wording, newline at EOF)
- usb: hub: log warning if uevent fails

Changes in v5: 
- Update ABI doc (date, version)

Changes in v4:
- Remove duplicate kerneldoc from device.h; keep only in core.c
- Clarify @dev description
- Update ABI doc (date)

Changes in v3:
- Rename 'parent' to 'dev'
- Remove 'id_name'; derive identifier via dev_name()
- Improve comments and commit messages
- Add kernel-doc in device.h
- Update ABI doc (date, version, example)
- usb: hub: pass &port_dev->dev directly

Changes in v2:
- Move helper from USB-specific code into driver core
- Add ABI documentation
- Split into a 3-patch series

v5: https://lore.kernel.org/all/20260715114028.3627807-1-Akshay.Gujar@harman.com/
v4: https://lore.kernel.org/all/2026071012-hesitancy-doornail-3dab@gregkh/
v3: https://lore.kernel.org/all/0b39693a-d8b0-4c95-97ee-07b3882c4b6a@rowland.harvard.edu/
v2: https://lore.kernel.org/all/2026010726-grimy-variably-b10e@gregkh/
v1: https://lore.kernel.org/all/2025022131-silo-impeach-3f24@gregkh/

Akshay Gujar (3):
  driver core: add device_enumeration_failure_notify() helper
  Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
  usb: hub: send enumeration failure uevent

 Documentation/ABI/testing/sysfs-uevent | 37 ++++++++++++++++++++++++++
 drivers/base/core.c                    | 35 ++++++++++++++++++++++++
 drivers/usb/core/hub.c                 | 14 +++++++++-
 include/linux/device.h                 |  2 ++
 4 files changed, 87 insertions(+), 1 deletion(-)

base-commit: 02dc699f83d04069fdabc996fc22d47cda47a4a9
-- 
2.19.0

