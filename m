Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE20D386567
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597006; cv=none; b=rlvIqjOqFPtUYpqh6bSNMMR7BLpMiLj2FMm7JpKzUz9axHlP1M7b6oWtWA4P3scecB/QGHidhGPLQUaZSBYozi0dFQsc5aYOLqU7rmITn6xYMzvIhHkJ7uDwS6xINv8MebNnfhGiM2TW4L+zgFWK+L1lXKkZoBxIrQyYhApbvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597006; c=relaxed/simple;
	bh=Jjn49MVgkVZQtNZyAk8KQfh8AN+0tORsUuirZS8x84Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1B+IBw6MBUDNPvSkx+rko4QJGq5CiezVAqql12z27DkJe+0UVFj/kWosTT7t0/f5whlhJRLNgyyQEASpe9aaT8tHfLDVhk3cLvYXWjLapkRfYzM0LaiPL7oJo/hac/wajR1SfEx1P9WEmc23Rt/vJNcd0yQd2rYK6CF0q0WO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2eSgwde; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2eSgwde"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so3146488a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787597004; x=1788201804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q3mXjnoAYv3tu0zNFgCgqf0gJDcbOMHx5KmUPbNZglA=;
        b=G2eSgwdeUoFN5HQN2RJwEnyv5fXH9yiWq9wWRwkhQKZiuRCIdotdUGySZh2LYixfJm
         9yPbrEHPbYNF4NNskgkhvaKqLtnYr6gK/obQnqaEOr+ZrOoFuDvsExRzrXP2neR87JTj
         VsM8/1skvpBSbDuVFBeM8l941YJSBLLwlbR38dvzSPUNN4EnmhiRS1HmbRe12zK2Pmg+
         ZrMP+V9GpIPZa8IrHx5fJGxtSa8bzE8oYGVDGAWy5RCEpkaYGnAZxZJhZCzimfLs3m6b
         vpwE4FV/pe42kqYb6di1H1E/tl87saTy2diGTmB0rXBT9yhnINiz9n+8QMsCnVzenSlc
         yT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787597004; x=1788201804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3mXjnoAYv3tu0zNFgCgqf0gJDcbOMHx5KmUPbNZglA=;
        b=Q+krVtXDUsLYHhKdvFXNBored4WFCEUe0uQF/7Gai0m/7bClshQyV209hxGt/u1c5h
         ctaNvDfaAp2jiAo3qOCCUMQhY6DVN4+WJnXA1b9USrOY2+auDoYoVA1MRwF7LgKRi21U
         MDoRseerY5aSb92E/6dFV5z5BflQrq1nqJ//g5Q82g2vvIKW7f+Bx6rF1p0isBcnRNMS
         QGtygrCA8nTc9UJbPZmoPo0KjFF2M3EZdfqj80bwZrxqbgHrn9XJh90Z/pzbKqopI2NL
         oEFYH0J+eUnA3t/b/Tjmo4sBgCwmRgQNJXYCWegUwmsGZ3P+V8ClRlwBvJkTh9oHgI72
         OF5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq95Hhml/nAonFMkusz4CzL2dg+oS88usCKnPjxaV2OrSPx5coFiIACswdMSWvL3ImAtlrdPzodNoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lv98lRjwnR4u52MrFfSuW4gW0uKPlyhi7Zlh/+PeoVLXxz/HB2
	D3onE9O7awi2NXj84LkXblZiRr7hEqRUeeKP0Aj4vHZE25i8np3QfVw=
X-Gm-Gg: AR+sD10ZwprzmuvII4n2knWYe4cb78N9IByINzBAjvyKWW65YYzptIgJtep4fr9FHjy
	0R6otu/Vblgr5To+qVj8Oy85D4NFg9b2x2mMug2ctRWVQ8joo/KM6XHuZlr5PHDCJATEg1eS1GT
	2eEWZQPi9wwHLzq5TCFsQA1lEnUt4+siQAoos7hmWpAYdXBWHnCrjFmUBZ9AftGU7QhLp+Du1L4
	L2nCHLl67dDlNw4DkwiM9G7O639cxlsQWepDVDjYwibCZZt7PVPizTu++cVMGbeog9FcdZvo+RY
	7x0VD2t2b3bY3gsGmw2xQAX+DAqwcyZ6/cbge+RCxHciTwBTl6seiHEPG/50SWuehVqp4OXcfQZ
	fBYC5KxRqnWLJJKFOJYgJYoWXY4yCOnJnyy86D7w+27w5bwfqfKCf5ayAoy1Pd3Eu3NWvKlaDuz
	yT44UtPHP3k2c3Zg/r23MT4c22MC68ON5X2zw4AL8vzUDbK1XrIQmm31mj1He6qaqCocs8JCNiS
	8vxFzpJrPlFSlvUbWApAnNv
X-Received: by 2002:a05:6a20:2d13:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3cd4bbf3a81mr40108408637.13.1787597004122;
        Mon, 24 Aug 2026 11:43:24 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([223.228.8.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29781367eec.17.2026.08.24.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:43:23 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v9 0/3] Add Apple T2 NHI Device links
Date: Mon, 24 Aug 2026 14:42:53 -0400
Message-ID: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
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

Changes in v9:
- Removed pci_lock_rescan_remove and pci_unlock_rescan_remove

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

Link to v8:
https://lore.kernel.org/all/20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com/

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

 drivers/thunderbolt/pci.c | 115 ++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c  |  72 +-----------------------
 drivers/thunderbolt/tb.h  |   1 +
 3 files changed, 117 insertions(+), 71 deletions(-)

-- 
2.43.0

