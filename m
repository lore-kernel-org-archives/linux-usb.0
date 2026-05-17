Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DC37BE93
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023070; cv=none; b=qqZO+AQulYJV/rfK47AYjBIoJEFfbRcSYlLWAb4s0HawdjUS5PCtT3/54Mg3lUf5TzpEKNGj1cO3M9pg1GikUsb+bcIgnujQQ40lZ0abAVq0y9BJrZqRlwi8KHp60GAmmcKG+yapfxoG7fPCWxAmlwlLoN7IklCDyIZ8H9iuyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023070; c=relaxed/simple;
	bh=LeWHHqCWtRB6/iOFzUEGlxNN/mbW1NUBtdf1HtpuOvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NO76gLoF+MTL1bBfwxn73oBceT2zjpiZQsq0a0kc/enuvwv94H1tOWnEzCYVsCW+yIuOK+pq3RdE2PczdTHYby28xZiPicG94GNWxhXH/oqW3xs81mu6nROvItWzm2Rp/lK+V5U3qaKAnya062q38DMkUwuL5suTNBFU8PdJYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI3IXRyF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI3IXRyF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8028fa6039so894762a12.2
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779023062; x=1779627862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmrD4XCw/ddiD1eD+XE4KxmCSjyDbYSOCXwkAExthfA=;
        b=KI3IXRyFIToM1BOabyqiJXZANtjQirFVaVz9VJPHyxWo6dBbqtfnNR78d7kmpz45Wa
         mobSq+A+ZwugG184a5IK6RoJ+T18iNaEvnOWcB5JJ9XJ8mJGG+gEvpXHZET1oA8uaiUM
         Ktxt57oqZp8kBCDkS5w7wke+34eC77LMIoDvmXUVxMaP6ONZRA9CxCXopZO+RUCSSYNN
         YleCpuRh5Bo0L8e0NH4w2dEg+y3h7ixHKfDkolY0rVAFv2em3nWHPm5LMf4FzjOuLs9p
         QqLKpXdfAMO56q9c7yRfpry+APnNq0xnhAz3C5+ZBLRJdqS8IKhuEwx8XFVqRafxVt5K
         +jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779023062; x=1779627862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmrD4XCw/ddiD1eD+XE4KxmCSjyDbYSOCXwkAExthfA=;
        b=GcIL9KOxdi6WqrFsaW2ic1Y24lJc4l2dkEr8dtvMKmLfyiULbe+ln5pF9pO0rS9/+o
         FFrN38NjStfE68wIQjrHm6fpWTfuO/Ybfzj+1z4r8RdH6B2uRf0tkwxQim/J6FDyVMZm
         N/ErxdehOwqMJCM9puQTFTziuULUiDCCKYFvv52caeZqsc7aqa024AH82KkwSqBImz6+
         l1IjT8qS/7MdIb/EQq/3johavgBIdqBjjAdhBGMa6PSdAHzP+CMnEhwv7cMY/WAuIP0D
         2SOIfM2f6Ul73JkKDcj/KZA4bvMhOxWtIgA6+lm2si0Zi5CjYZMHUFGwISk2EBS58BaR
         Fv0w==
X-Forwarded-Encrypted: i=1; AFNElJ/VJ5iMlLnGHpOxysxVW7sK4chpTHDeBpv7luxQGLV+Ft5Bix3jwiT0vy8Fe7nRXuD8kzya8iu3+jU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoVNjhrG+ysZsc7ph35BUcQ3jrz8qYikGu3eAsHfAyqB6lSE/k
	uGOqlTnm/+JZ+jlNZmINE4MaHzU4bbLGZOAk2cqkzVEEl5ynsCY93IjL
X-Gm-Gg: Acq92OEn3XHIhf5mgYyRaO9nQ2ncbeRhc3pNCzha0LL4RBRCrWNVTl75wboBaiH133m
	UkH+K91LHHyjiEJQu53XKGN4ux2CA0FMKgtHCfCTfsiVMPjTvvt+3b9mcIr80ILjRmFCg1aUH3r
	LQLbdsymywSrra+uc7vrs/RN26CT5ZiD+OSb9cRi/c/l0QR8TJiip0dCotgm9+5SJHp9G7KgX8O
	3T3Iu3j2PRr525cP9HNfLJq819tEDDtxcGLx5SjrEBmxYCMC/8k7pDYPCN9YTSOJGTmF1QHQhhu
	NcD8ZrZMKZCPOzAy6GMPQXIBou+hoxjPJ2V9LOKwzt7ixxrGMbIYKjw/NuXYixjNUQLzzSi+/bD
	RbZwhC0B+K3cUPy1YHgvOvAL4LiL2nDT2OR7Fyz7nT9wBBGIBBlW4LjnasZGH15u8Ffgx6xJXV6
	oxzL64GSZYkWsdHwbdPEtSgw==
X-Received: by 2002:a05:6a21:3386:b0:39f:794f:94d8 with SMTP id adf61e73a8af0-3b22ec9aecemr12673319637.29.1779023062153;
        Sun, 17 May 2026 06:04:22 -0700 (PDT)
Received: from mincom1 ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm11712607b3a.41.2026.05.17.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:04:21 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v6 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Sun, 17 May 2026 22:04:05 +0900
Message-ID: <20260517130407.795157-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds temperature monitoring for AMD Promontory 21 (PROM21)
xHCI PCI functions.

Patch 1 adds a small PROM21-specific xHCI PCI glue driver. USB host
operation is delegated to the common xhci-pci code, while the PROM21 glue
publishes an auxiliary device for optional sensor support.

Patch 2 adds an auxiliary-bus hwmon driver that binds to that auxiliary
device and exposes the PROM21 xHCI temperature value as temp1_input.

The hwmon driver reads the sensor through a vendor index/data register pair
in the xHCI PCI MMIO BAR. It does not wake the parent PCI device for hwmon
reads; if the parent is suspended, the read returns -ENODATA.

Changes in v6:
- Make USB_XHCI_PCI_PROM21 a hidden tristate that follows USB_XHCI_PCI,
  so the PROM21 PCI glue is built in with a built-in xhci-pci core and
  built as a module with a modular xhci-pci core.
- Use an IDA-allocated auxiliary device id instead of encoding the PCI
  domain/BDF into the auxiliary id.
- Use a 32-bit read for the PROM21 vendor data register and mask the low
  byte instead of using readb().

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 239 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   7 +
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 136 ++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 532 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

-- 
2.53.0
