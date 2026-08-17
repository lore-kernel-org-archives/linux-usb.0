Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164E53DA5DA
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961629; cv=none; b=AcP8orF10z0BI3DOO4pG904UNolKXr3gpJPSLRxn34hRB75dP9Chx2Bki8i2CnGRZ/9Ah82hBuLlgItquHRBlwReXat6hkAa/I3eG7C+/1AWtuk3ED5EpGR1wXPAjXQj4QvmXTxieU2IcIzunIdbuXhh36K1Vtqp6/6ArmhKKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961629; c=relaxed/simple;
	bh=qm7h/cjcfAj5pMrU08l60eyqDdvbXcBYtEb/EBlaASc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kav6aPH6qtKtiXKnANVeklNasTenjhu1UNj1iYzdHajuMextCrO2nJ91eZq24toRU4EoZwhbMo080DrN1aKb5InSF/WHHwso3CfxPEEYDoBOBVCOZAB2o327LCzLFBWW8XVS9sLmTICzO/jWzMydVSWhpo9ufb+zRaTRC+OV8Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIlq7/PO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIlq7/PO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so40444075ad.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786961627; x=1787566427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG2XuUk72z58iBFG6BERHwYFHW3e/3vW2ebIonsj3J4=;
        b=BIlq7/POYgUxHpehtxJHTZ/8Qu/ChsuLBGLG4j9S4+5QiLxByNVxxN0UFrvRqcqzaA
         Gx09lZ95Tz2+9E7gi84CPCMSD9a2UQIcYcIHhh7AmqFEwOEV5jJRaH+pdK9Ak0s1Xa/i
         YwvQbfk7MM72daqa/lvg9nFhLTOgzWR6zeCrss/k6qushSoPD80kXUtak7tHIwG2ecq1
         cMb+rjdHma4hQ7P/EZC7luNvvEpW7G10SU5sYHT05rcJtrUbvL3HPsPPoSMU+nuK5sy/
         mM6fUxe6QtEnStJ3nwwK0AIThQr7Y95rT3dUAjsxuIBZ39cejymK1XHDm311iHDSct+b
         HepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961627; x=1787566427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG2XuUk72z58iBFG6BERHwYFHW3e/3vW2ebIonsj3J4=;
        b=nyBj00ZTInYYDNLF3hBo5g3MwI5Jj5zpiV9d2w0ROgKK79nJPG3Wh4KnvnCk8PuVma
         yBPLrTIKd7FIH0TwVhb26Q4MvRfXsX5h3GL2IbvSDMfn2xjmoaUkl53uNzHiUca08lZV
         OybIAzVOqpB0RuWcL1/oL7eYNWygj2HMk4tmLJTF5fEikWsGHpHqcAS89PICx8BlnFjY
         pxjq2orhbZjDaF08hkASizxB6DpQtMdlqAjsVxk3Hfatn62lJPRh2mpaWO67opg2OW0c
         XvZtzrYUSNp2xWvrUPeqy7VvTX9ECItwkOp5YoqZO3togTVeCYk/XrlKbQdQ2GI6Npm6
         czZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5z7Hj+p73o6Wb1Nh0HmhVCFkhXnAXBQP51BBmYMDA/0SWRmaCc5yzyKZKFkxwiL3jCaK3xzcaka4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye0Xsg77Qftu6ldKrWE8SY/7ukHGtd2jsQT3ff/6Pl/WDi7Os1
	inqgrcikC1aNVbE50nEf2EksSiTCom3JKm9pYiR4GZ+f/GR02ko8CXM=
X-Gm-Gg: AR+sD10UDUszLMstLalsrELWX9b3TN9mBH2NGyrHebtVQg5u0KhYMzCumS61d/dAg7t
	8fIFwXBuuXbhVBAXH175k6gR7RAV/0gcme+Znxzx7/OyrGjbFm8I/6RlPHrZmwTtkeRusfP+7Fe
	3qyBlnu+FKHsra+3aN6wbyhOuy0ZPwB8+16c9Rp5Oee2OQv8cHPqbZP9e61FtIYxzm08Tfig9w/
	dHq1BfC2u4cLxtiiO2vF8DoV1AO5c5cy4CXqupUh4fybF9hBMuk38Xntw/u/TD5fNSivwxnAO7X
	gV2VKT80+kEhxxoRLqCHW2DE2Dh1zfh1t2c3s1NFxkE563crpCfdkfQ86apbHqYkIbhhzd+a9/7
	ECa5gfsZK1hsKN62MP6Tjo7NGvxbNqr5XpjMxLgQ7i9lIeLvSacFClvqIEVuiipUGB4ex7UrK7+
	3kx3QLgzslTWpJMsvIOvwEwtLDwFmWI/jg/XDZQEsRFn/xNcXiVYUs8ugAI3mWuZf2o+o0ILtJY
	RT9Hf4SIKC9bNaSKqgYeg==
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr275991335ad.14.1786961627359;
        Mon, 17 Aug 2026 03:13:47 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.59.94.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326761d3539sm4864117eec.0.2026.08.17.03.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:13:46 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] Add Apple T2 NHI Device links
Date: Mon, 17 Aug 2026 06:13:21 -0400
Message-ID: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Device linking on Titan ridge, and
Icelake, which are used exclusively on Apple T2 machines.

Changes in v8:
- Shifted tb_apple_add_links to pci.c

Changes in v7:
- Used pci_lock_rescan_remove to prevent race conditons.
- Fixed patch format.

Changes in v6:
- Used for_each_pci_bridge in Icelake section
- Removed has_apple_t2_chip as its not required now

Changes in v5:
- Used Icelake root PCI IDs for detection of root ports instead of TRP

Changes in v4:
- Limited TRP check to T2 Icelake systems only
- Optimized has_apple_t2_chip check
- Included pci.h to drivers/thunderbolt/tb.c
- Used __free(pci_dev_put) to avoid label

Changes in v3:
- Fix build errors with non-x86 machines
- Used __initconst for apple_t2_devices
- Removed UEFI_QUIRK_SKIP_CERT as its unused now
- Used IS_ENABLED(CONFIG_ACPI) in tb_apple_add_links for the T2 part
- Removed !bid check to remove warning with -Waddress

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v7:
https://lore.kernel.org/all/20260812153717.1345-1-atharvatiwarilinuxdev@gmail.com/

Link to v6:
https://lore.kernel.org/all/20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com/

Link to v5:
https://lore.kernel.org/all/20260727211807.1223-1-atharvatiwarilinuxdev@gmail.com/

Link to v4:
https://lore.kernel.org/all/20260724164641.2239-1-atharvatiwarilinuxdev@gmail.com/

Link to v3:
https://lore.kernel.org/all/20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/


Atharva Tiwari (3):
  thunderbolt: Shift tb_apple_add_links to pci.c
  thunderbolt: Add device links for Apple machines with Titan Ridge
  thunderbolt: Add device links for Apple systems with Icelake
    thunderbolt

 drivers/thunderbolt/pci.c | 119 ++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c  |  72 +----------------------
 drivers/thunderbolt/tb.h  |   1 +
 3 files changed, 121 insertions(+), 71 deletions(-)

-- 
2.43.0

