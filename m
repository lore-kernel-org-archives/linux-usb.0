Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21316447801
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046619; cv=none; b=mGKqCKHTEE+6CWb02u9CNHzdCOijBGfeHUmd3gkLAVER/8vXpinjlDd8IcApB+47BECABjk78q7KgRqDYmW0cSGbmcmZ9VrN3zM3Lk8osaXO6DjGPT0yMEMAOOCNrgOxFkfwa2ryFch7nW8OriIJ7RfZG4oo63k73VAj2Mmpe1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046619; c=relaxed/simple;
	bh=Jjn49MVgkVZQtNZyAk8KQfh8AN+0tORsUuirZS8x84Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZpjKmIh0HG6mm2bSYo0PY0ctdIExk5XIjYmL2Eest5Uq/o3SA8KtrTRWfGLPm8QvLOoJvnVnRy18otPabTL7uZaWhHVb4o4ZFSPIvjO+9hlzItuZD6VA77qfxerrKXjxHy1camkJup1czc6tMEpEO8I7wh0saFg9yQcA+W2fqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8N8uuE7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8N8uuE7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so2632992b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046617; x=1787651417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q3mXjnoAYv3tu0zNFgCgqf0gJDcbOMHx5KmUPbNZglA=;
        b=K8N8uuE7XMmAyRXRBEqXtmaxnvPG25akV43V0yG51COp6kM0/E//JxD4OtmjA8K84P
         1m1z7AyjEn2LYHzBtk02Gzu8jcjrvHtqJwXhpjYKrUwSm7dtfMM6oiAgZc1mnjGvEtaB
         fUHywoHcb/M7/ilOonp2ckmnPgsDTlqAaswoAmieDCRxyfCBndvqejosDbIRUjIBhgCY
         aIJbMmVQ3Xzvy2yNGs7JXP3wiXYpJ0Il1AFdql5+XZ0rqV0h8imODMf6y7YogOTL8QZh
         fR/Kpq/4Cqt3/9y5O8u/GGgg6qNE+Dx8ck/8HpZbyOGMGrKvmvvbXWz3v1PSnNFT72zc
         ahxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046617; x=1787651417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3mXjnoAYv3tu0zNFgCgqf0gJDcbOMHx5KmUPbNZglA=;
        b=Dm5P0yMZChmhRfQeBdToUmJsZmX+iC+X2J6sKkK9vQlEDXw9SGEoAUNToOg+cCnpjt
         TLMVo9cvjpfwDxc0YjKlYFLyciOTzMv8M8EH022bgD3Kn566uewCAoVD9bqqHPtJLBLE
         AXYIYxbUJFROX1BexcxIcwdOryjSM5Z0kFi+U/Gs/pZWWKzzf3Q3by8F5kMpjziwuUps
         NwXUHbpsCASFKPBtSHfOWYgsqpwlmFLJtUD2+PnULuPQrr1FvSlRXJfCdOLQ5yaP7yju
         KMxHlFe9H9HcNUy154jISWsoh5c/kwKN9MiNICAcDh2Y5CmroTG0s28uOk84xKFJHxWJ
         rP7w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+mBaYqvmrhgnc7LIxqehHFfkimZPjFQgcv6qQwJBgMOPOD1Ng+TrQPGtaB1UUCE48OSfS5yySn48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtXq0EpI2R5oQNiycoeNoZ6PqxbCf3zOcb8igXksC/6U9d3E7
	n8bGsc5OQv38aiLWfOmk/TwlQ7SVwY6fJLEUcU3jXSkfhQNPe4PLasc=
X-Gm-Gg: AR+sD10LxrTBeBXVB3i6oaq2WOnQ+PH763EVt2xawYYsWYuP6irD7wwyA4kWfMvEsb9
	WUvEnD4IiqAext044EUzkcgI1lTgl/2AsQticn9tGyc0OTEZf+juPfArahyjXRxOQh+QtyEczz0
	FS80r7xE/CoK5jgSYXTrsk1v/9pzqyCGnCE9zqmpTbN9Gh6IImpttUDdqQQsdrZkQ4SZFPYecie
	aYOUeEvWLY078maFwOtMPIfqmYDLcBDMOPeP4ybWhkP0K+3sDZFiAkQ/Lq8XGTZ5aKlxH4Tw86X
	AFp1nBD7wnRLrhI299KGrvT/RtdVFMxd5ldUNsNiM7pyWDKWXXmBxdfrNfpPuPv9lGTdE7p3ay9
	LdnR5ll1KNk+Pkf2yNhH4CKz/7gSc0kZI33yG2/kAIjKwZZMkhUW6+ULSI3cxnzKxXNpZEqagvv
	JMHkaoEzte213k3CSitzcxCtXNvED/glERQvC4CKsRd68BT43dETHsZitGJKYQ6UfsxqQ1X+bP7
	Cy5UFkGchyVIq0xuikmUlA=
X-Received: by 2002:a05:6a21:328b:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3ccda9e2767mr9331978637.12.1787046617203;
        Tue, 18 Aug 2026 02:50:17 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm18466759eec.13.2026.08.18.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:50:15 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/3] Add Apple T2 NHI Device links
Date: Tue, 18 Aug 2026 05:50:01 -0400
Message-ID: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
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

