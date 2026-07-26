Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EB31F9B4
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785072209; cv=none; b=j7w77DHUdeRl96FYSvb/WW8mRcrYH8TBF1ZtDQRWY159cBnQaS3iGJsGGnm4VwB2H85lzhUN2aI7ViI+6oZMBaXfz4GBiTfnoIWgXFz3Rlhc0O7f00XFnNVotPOmKFgTEE6Frmrc5YdoDfSOQHgNUeu0B+aDSpJOQBvlFbhkrKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785072209; c=relaxed/simple;
	bh=rwEk9DOaoOH/aePz8XHcDqDAJcyl6iNdVIQDLbimJ4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kv/MH/90URQDMru6ONXRMbOZaU1ylOFpjg0Z6BnhB1pOeBDJ48L5f8jcMfsP143Ca6aKGRYj2vmo6kHxzwsCIuSPSKtbgvFN8J0LL/nTq6RozuPKv7jy/DMcWBwOZgYlpHMn8fZPMo7oUrz7hBA8GBT04M+5a2MsepVhBZfaj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbrkLqbB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbrkLqbB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce98cb8165so21178515ad.1
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785072206; x=1785677006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fObd6HBzZug5ha7KKMXaZQiE1Nwuc1RsD0ttGJHVYJg=;
        b=TbrkLqbBtjpS3TegGMqkEKtiGJ5f57WM9jgJZjw7M6kXOqOZL5qn8HgeteA+kd1m3F
         3bnA/y+YTsCDnD4HjKGC83vu39NTX/F75SkWZFxTcczz4tkZLMsDY6R1uwou5qBk3rid
         XJRqnxbP3e6lga84oOwWTRZdAuFnXUnyN991UhJ34g7vADvxQP8Z1xPGr0o9RnO0CI6i
         /sRk4/fywgn8SjDtePWms04UhEfhUYn5f6XXwsGAa5Yv6UNJ0/2ytcIzXqME/cEDAty2
         Ap7C2kaIZBR62ZbTBY2oVk7ZePBLNUkXBOguHpMoySPDK+86ZfUVia0llXmfHgo6NtnQ
         Rm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785072206; x=1785677006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fObd6HBzZug5ha7KKMXaZQiE1Nwuc1RsD0ttGJHVYJg=;
        b=Kth4+thtyWQrIBC+v/vPac9/rLssz7diIG6YpWzeu8j6ELTBME5ou2MKL70LYIlxDk
         d9hOzKF9K58/iIgStjkIIc3e8I/LvZGAgagnJgCweSzIcN7SHh4a4/HiHSxIefJLRj4g
         JhYGesZlYnZ67rFiCDpNj1x8cc3HZxqenMs27gT279f6U6628DRlxDaFAa1TFrCVk438
         Sqm6gCMMuCyyegyMNHKj+eFGNOuLDf2gVvDY3UlXhcNepG9Y0wx50DMrq9ry8deUTiCl
         8VVf+N5W7DwRlScy6/wpRzhUpkD2JFh/c/6owN5u2zniKVAxLUD8oGB6HIrTyNEfH9UW
         NXLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1t7sm3Azsirb9ofGlM1KQp1ok+iXEMxciykq3BJXTrOM6fUPTLUO96y4EcyBGhN/okkZ09pTWKOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBIN20wweZPwOxXn94Kq2AV5Fa1nCypugMDd2skcRDCmYc7Pu
	iCAvo3QPvHNn9tAjOlb/ZUkWNxQ/L8wF2ZKq4KOZD69H5r2K71huR/0n
X-Gm-Gg: AR+sD13CLqxm9NzhC6J1lIG08uLnDHxN1JR53y9XiSAkwbT22BAzQFeM3gsQXmys5+m
	7MkHb0sST8ShIpfmMpuyh7nZYnsndM/HhpClOdSArGf5pXZRtNYN4+ps5UxKlr4C1/Xd9jFwrZp
	SaR007M3zCKTARn8G1ZjDomx9pObzGqmbNmJFgeBf2mv4f2F+mU8NhQHbRkMpKDBglo9FpcB6+l
	OBaOCFENFyVw/Kdm9x0Xe8rbQHClmEvDdnk3dOwwLO3ReCbBI5aNSfsF5DVLckpOPpJ1bqAYAnF
	P11Zwh3W0sfQXbgFBc/wAUj1MXuAuXRRlp7O4JCB8HgI/gU1+o5sc5THsBc4bn9XtnxM/bxvzgp
	LTJ8O90jPGrERz0Blo0tmiMQxOlpZgXhHuNWhg2CvGbG1dez79hLdUdJ6/L1+vsnV+NzDaKr+yE
	fNSMXSfbqMgKbmVA==
X-Received: by 2002:a17:902:f709:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2cfd72a4d0bmr70134335ad.25.1785072206402;
        Sun, 26 Jul 2026 06:23:26 -0700 (PDT)
Received: from Linux.bbrouter ([115.96.217.226])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm20784436eec.11.2026.07.26.06.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 06:23:25 -0700 (PDT)
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	nikhilsolanke5@gmail.com,
	Ishaan Dandekar <ishaan.dandekar@gmail.com>
Subject: [PATCH 0/3] Fix initialization and routing for Generic Clone X-Input Gamepads
Date: Sun, 26 Jul 2026 18:50:37 +0530
Message-Id: <20260726132039.28330-1-ishaan.dandekar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a two-stage failure preventing certain generic X-Input clone controllers (specifically 0283:0001) from functioning  correctly in Linux. The primary motivation for this series is to restore full device functionality, specifically haptic feedback (rumble), which is entirely lost when the device falls back to its limited Android mode.

Phase 1: The Hardware Panic (USB Core layer)
When the controller is plugged in, the USB core requests its configuration using a 9-byte request. The controller's firmware fails, disconnects, and shape-shifts into a fallback Android mode, completely losing its X-Input capabilities.
Patch 1 (by Nikhil Solanke) builds the underlying core logic to allow a 255-byte config request (mimicking Windows behavior).
Patch 2 (my contribution) adds this specific controller's hardware ID to Nikhil's new quirk list, preventing the crash and locking it in X-Input mode.

Phase 2: The Software Blind Spot (Input/xpad layer)
Because Phase 1 succeeds, the controller stays in X-Input mode and presents the hardware ID 0283:0001. However, the xpad driver lacked this ID in its internal device tables. Because it wasn't recognized as an official Xbox controller, the kernel handed it to hid-generic, which only initialized the keyboard interface, resulting in ignored gamepad inputs and total loss of rumble.
Patch 3 explicitly adds 0283:0001 to the xpad routing filters so it initializes as a proper gamepad with full haptic support.

I initially attempted to send just the quirk patch, but realized the device remained non-functional as a gamepad without the xpad routing fix. This series unites both fixes to ensure the hardware is actually usable out of the box.

(Note: My previous single-patch submission was corrupted by my email client's formatting; this series replaces it and is being submitted via git send-email).

Ishaan Dandekar (2):
  usb: quirks: Add ShanWan gamepad to quirk list
  Input: xpad - add support for generic clone X-Input gamepads

Nikhil Solanke (1):
  usbcore: Add quirk for 255-bytes initial config read

 .../admin-guide/kernel-parameters.txt         | 10 +++++
 drivers/input/joystick/xpad.c                 |  2 +
 drivers/usb/core/config.c                     | 39 +++++++++++++++----
 drivers/usb/core/quirks.c                     |  7 ++++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 54 insertions(+), 7 deletions(-)

-- 
2.34.1

