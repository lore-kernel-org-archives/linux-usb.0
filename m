Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DF31E84E
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215874; cv=none; b=nWIn/OwY+TffiOCVQYxV+cQIVy3+ps3fnyNpLSIz+DToB+3ZmAxGFGzxQzKJVQEJwgvhDPQsTUxnq62/h1bdl6fZ/F/BBCXHVhCNB6jrjLw31Px4EhYWonuU3tu9hDDtMRpUez5tITBCDjEje4JqN3wZ249gF1gTrxweoHOMcrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215874; c=relaxed/simple;
	bh=Db/rTwmKYyYUA2cN2B39+KKMbD3gbRUp99qdLPL5iGk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mO1TfBMiYcLnOCGfvqTh1OR9NFcTZbo87B+2j+motuy95qgTDLYFWpGNnHOtKABqFkUkNDZtpp6fTesxg4vjUYWw64KR9CjSHgpSLhbytt7BVw/KjivvbDw9fGPd/lOTu7bei1+IDO1W9zF1sNUpUTwW+6F0kOotTV6Cz3CKqXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ynm95NYE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ynm95NYE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so512966a12.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781215872; x=1781820672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoGMK7meFyOS/hZmcq5bwaafn9mYtDLX/gGPDytRZwo=;
        b=Ynm95NYEzbhXkw/IRoWriZ23CXBd/S0RwIdhR/G0N0LwHGYdciiAqxsasqgFKQuwil
         AxY3s35uN01powLCbmAxtlL8/iNwOo3UdHC2O2a7u32WwEuSRKVj4VfQlBpwvYV6eRLb
         /KUeVoJU5Mr4MHUIP9gIj858YTbTW3v9fmksOZDtmjSvSPiRFjREBDqXvn06/q4oE8lE
         Q80Yh6+9yvpPFy0KGSQuPxmN3xdMdsHv0fgp+FmgZkaocQ1nMNRJBXvwsFWIu4XspYue
         9VdF+36SP4gAM9iqTJQNmOYBmsWZeEyOBfYPAPw/OrEbJtDVdgTnzHaGwQXnhXqJjAWS
         3M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781215872; x=1781820672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoGMK7meFyOS/hZmcq5bwaafn9mYtDLX/gGPDytRZwo=;
        b=d4rrxMigS4tghxyvhVpl4r56UnNnxRimEofleV4lPcurLG+0qhycQfoGkJqmarbE39
         nnqP1Sz07Mb4UO6ufbhu/9sDI4Ju9moSzEcCkOZGTvfb+TI1/vGrDBI4z8ihLc9rpN4B
         68xcD9WVBKjsTW60J62Aw7gH2H+9VZE2AtM2u9S5K/HJf5NvNYK6Lj5Q9QEc+xzgxp1y
         qTK7x6sPzGYNbUsL8aQVf4r4lX8ikr3T9Ddok66/MN/LjBgx8UymJOQpK4legO9ewQcQ
         GS1IrpAciKPUie8Q0fxD3hUEzdQk1hq1RIJ/X+JFwpJCI0dE2tmefWySu+NN+ODbXmFo
         ePnA==
X-Gm-Message-State: AOJu0YxSwovSHMYG1GIU4gMGILPfDvM7gndbTm1M1M8DZNbIe064ffGM
	bIdqQjd4GijzIqixzmRc3gD9lVsGdcRtnFjmLR5WDOSx5rAHQR6J+NVE
X-Gm-Gg: Acq92OEjzNT7AY/WKBdvC5c+G93gK9eNOihJtDtJvf3Hx9QeDsDAzwGZ6F2c4GcGiF1
	8CZpUdKuLKdX0pb9+SzmMQF+c5Xinyn6C0pIerkyRhVHLBol3wDuERjAM1vMEAUI7ihYHpN171S
	eNhNFOnQGfdlvLs/qL6dc6mEoS4bC/qV0f4y0CnRluKc/bVA//zlTHZgL+Hlas9zQuPV2PVt04o
	jHbya0eK/CqYAE4j8y9crnisFIh8qGexzdL1cgMjy9o7Usf0yJLqqR7LRI2xT8oVZuGbqhdIbKx
	7xr0Gm6pvBwYUCUKlwXyixIXSKFG0MJiubQ+76BMUeKenaM61mQyCfX68XswU4Shx/goHvmg2rb
	wbHnPolG4H69sbyX8jzslwPnm5Dn4PDop6j2UD09V04YbpDETmtIpSiD1T4B1Tq8P85qRwOSegq
	yiymlq3Bi4SfTZrDDhC6RDYSu2FX49O5jRkyKcpCoIoje0wLGQ/hkNgi1n6noWfK2CGhH0jBsQY
	g5pc2EuDsY41kQR
X-Received: by 2002:a05:6402:4590:b0:693:1da1:7e1f with SMTP id 4fb4d7f45d1cf-69378a31fe8mr8529a12.17.1781215871846;
        Thu, 11 Jun 2026 15:11:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:2a40:17ee:2900:654c:3df2:2fd9:9b68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693751bac6esm41564a12.10.2026.06.11.15.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:11:10 -0700 (PDT)
From: Jakub Lecki <lec.jakub@gmail.com>
Subject: [PATCH 0/2] usbip: Cleanup of sysfs attributes.
Date: Fri, 12 Jun 2026 00:10:57 +0200
Message-Id: <20260612-usbip-attribute-cleanup-v1-0-8de3aa76867e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqAIBBA0V+JWTeQgr1+JVpojTUQJj4iiP49a
 XkW9z4QKTBFGKsHAl0c+XQFoq5g2bXbCHktBtnItmmFwBwNe9QpBTY5ES4HaZc9dkooM1gr+05
 CqX0gy/d/nub3/QDBMDY7aQAAAA==
X-Change-ID: 20260611-usbip-attribute-cleanup-7515b9ff2872
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Lecki <lec.jakub@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=lec.jakub@gmail.com;
 h=from:subject:message-id; bh=Db/rTwmKYyYUA2cN2B39+KKMbD3gbRUp99qdLPL5iGk=;
 b=owEBbQKS/ZANAwAKAXFnMxNuLeadAcsmYgBqKzJ7MoOi+eT5Os9yBXuAlU2o0i2HnbhiHFDef
 44ArsU3vl+JAjMEAAEKAB0WIQTignGL6YrBw4GbwvJxZzMTbi3mnQUCaisyewAKCRBxZzMTbi3m
 nWC9D/4vrXcNjhsp1rfOqOYCbpHRZ8GD7bq5YevKB+OfsVRQMkCdY9ayD9tLf8VG0GveRrz8SZg
 2fJuOX3IlOUfuHl98cdGQwxg/AGWhRrFjm20d1bZs8vCDdU291taQQgtqTFo5sRTk68CVO5YeEg
 FTUybi8fcWwMuujJdMCrG4h26E9emYzUXshBEliDtu2MJglqOE/08LPOqpJMfmb3i/X2GtI6Ku0
 bUtVyV07dwoZGvfBInbyVcB6/2zFxxNj9hjeJ9tBwirO8mZHHL1W7H5QlyoV3c/YMKlibkpE7fh
 gg1rrpk/bFRExj29HTO8Us3VclZNPfq+4r/N6VjZ7HFKPfx2CQ59oEKTLNHDBkQEJugP967sQr1
 EeFCNl+ENfSw/9UebqSN1sEAiHdV+dWSit9tb/kxNT4C41MnXwY/Yqiyr7XsQCe1L1af5g7Eyhl
 /shWPch6gReUTKdpjMLkbPL7He+Le3JcxHebBvF5KLhcG4eS1sv5hFFC6uyZnI+LHJ5e1du+TVH
 FiXYz/UEuX3zXWg9f1pT2J6RbqRJbYagLSrG8YCKXe0s9EEWlWPUI87IdsxhnThqv0LwILDt/aj
 UoHB7SNiiWc7ISBHX/nSvihbyj3XuHyvvrg6EbPkUNw3r9ZvZNyTh6gfQ9MMYYOg4VcBmbWHQzN
 XekAmePsmaCwlsg==
X-Developer-Key: i=lec.jakub@gmail.com; a=openpgp;
 fpr=E282718BE98AC1C3819BC2F2716733136E2DE69D

Hi!

This patchset is a prerequisite and a follow-up to my previous proposal
to parameterize the number of vhci controllers and the number of ports
[1], where Greg suggested that new parameters should be implemented in
sysfs/configfs.

Before doing that though, existing sysfs attributes must be cleaned up
as it's very unintuitive in present form.

First commit aims to align `usbip_debug` attribute that is shared
between drivers, to the expected usage. It controls the global debug
flag, therefore creating multiple instances of it in all of the driver's
devices makes no sense. At the same time it also allows to get rid of
manual attributes creation in vhci_hcd drivers in the next commit.

The second commit segregates the existing vhci_hcd sysfs attributes.
Before it, the first vhci device was used as an 'user interface' to the
driver. That required recognition of the first device and custom
handling in usb controller start function. With this change, the
driver-level attributes for attaching/detaching and getting number of
ports are defined as driver_attribute, and `status` attribute is
automatically created for each of vhci devices.

Thanks to that, future implementation of parametrized num_controllers
and ports will be much simpler as the fist device doesn't need to be
specially handled and doesn't control other devices which are now
handled by the driver.

[1] https://lore.kernel.org/linux-usb/20251104113248.223594-1-lec.jakub@gmail.com/

Signed-off-by: Jakub Lecki <lec.jakub@gmail.com>
---
Jakub Lecki (2):
      usbip: Convert usbip_debug to driver attribute.
      usbip: Cleanup of vhci_hcd attributes.

 drivers/usb/usbip/stub_dev.c          |  10 ++-
 drivers/usb/usbip/usbip_common.c      |  14 ++--
 drivers/usb/usbip/usbip_common.h      |   2 +-
 drivers/usb/usbip/vhci.h              |   6 +-
 drivers/usb/usbip/vhci_hcd.c          |  71 ++++++------------
 drivers/usb/usbip/vhci_sysfs.c        | 132 +++++-----------------------------
 tools/usb/usbip/libsrc/sysfs_utils.c  |  23 ++++++
 tools/usb/usbip/libsrc/sysfs_utils.h  |   1 +
 tools/usb/usbip/libsrc/usbip_common.h |   2 +
 tools/usb/usbip/libsrc/vhci_driver.c  |  61 ++++++++++------
 10 files changed, 126 insertions(+), 196 deletions(-)
---
base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
change-id: 20260611-usbip-attribute-cleanup-7515b9ff2872

Best regards,
-- 
Jakub Lecki <lec.jakub@gmail.com>

