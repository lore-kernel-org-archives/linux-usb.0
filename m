Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D44A3840
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104997; cv=none; b=IuHmc6qgH2/xbozHU6wABDQ3QD/XfizwguwTP1ztqOEag7d06+j2lLF4gSBLn4xRPidtxWxY1GjNrwAj3/RtcrbMfujUMtSvh+bblO5K9RpyyF07WEKgrpme3FLxegcZdBOW1IDGKZDMktkKwvMMfbEw5/a1N4zQ7zHSjSbyBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104997; c=relaxed/simple;
	bh=GCrd6HP1YqVVD2Shlp0bMzCJrut+8ZJ/wxofmulhorQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXdX2nXcn8qN1dYoOhz1QYdNrgpmueJj0T4kuzDhemHd52nCw/lFOGOAAaJxP0DH6KvzEltq/UvUObPg0iIiUcyC425uk4+S0bZxpLlkjHCZZOiFu0UcDaU7DnmdM4aWo67+4Xk35CyR9YFyVt5rbNyiTQFE9iQ16IzqYDkcs1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT7LlU0G; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT7LlU0G"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso174859fac.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104993; x=1790709793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vP5cScwKB/SRV52FulCQsVGt9v1UGZg+U5ZCK2dz35Y=;
        b=lT7LlU0GJs5rAhItnoiXp5A8VTWVWXW7zjKXD60XtirridtazMHxS7a5uWHpH0LkS4
         qbpDSlpg2MT7E+qkxMUFkMQ6QH2TcJTY0OSgxsjIhvq7riTbEMVC6xw3677qs+3n6ptq
         YqGxUL0GgvXZ9zfDX6ggTrTJAKJs4v52Lup93UJ/SSeVOsVvCU3C+i+c2HSsB8v7uxWI
         vvUTAuqi2yi3dhwEdXkMEMyRkIs0CUxjvYey0wNpaI8E8cRTTpU3+ThhWALPAVPnCTsv
         dXWg4Dk6hfsdeCpT4d9AOmPXBdQRJmOLTKlD8j9+xrYg0n50oyVmgtG07kGmeB+hQQNp
         k15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104993; x=1790709793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP5cScwKB/SRV52FulCQsVGt9v1UGZg+U5ZCK2dz35Y=;
        b=tNW7AS+Z4fw9yIIIaSuEq5sDEku1nsjD5dLqVpkRpp4u9OC0oUlF5C4fzTx9Or4UTA
         Kco3G8yev8cJ8cyOvm1MeJm2u9GO8d2doTverpNaWa55wLJRGWyXIjd8bsPW/h8GHm7A
         DxPzILLcIxREFmrR/eLLiZgT1m0sVizBsSvK16LEYsOLX9MIKlE4HPiTI77s0fTF2ma+
         PzxBEfEvyiKshgLnxV7YOLWPIe655NCfd5zxpP4Wj7FroNruzAKfVh0wAbHWHplxA9Mj
         uP/X/CeE0jF3bcDiBTbFR8uviGWiZi+CC31nfnfetvoS2XNJD0Nx4pmjawAQwOorsrKR
         up1w==
X-Gm-Message-State: AFuF++nqmFxqkEgsJ6wfqRaKkacPQ2rJbOfJ8WhMv+lDp4A4grImDzLU
	ob4f27y49nqKQOTYsHrpqKI87PrFm8Wv0JMgJKq93BjsE8RCUl4dF07JIbCMdOPq6wg=
X-Gm-Gg: AYBFou16hhQwqsKvyUUL6JNy94rBVY2OXo1BbRdi8bmyGjvc3tcNL+HYstwTRIXJf6I
	rklTVgfgjuapqwpZYUwcT8UUm1VVgm+jm4dHfQDABUL5IUItcVFTN1nkj5lreVgZaqMpbISLY7z
	zcHw0OMz58/1LiH44wijmAh1uBBmUZM1xUzAnAdxhsg7A48LOD7pIs3EtBGjQP4ieCtlNV4T3tC
	dCG5f/TWFivtKuPzPX2XmLGt/OjoxOlnzm6LHVBIWbNJtHkahwPigZdvTVyuDvtY7y/hcOZu26L
	hc8ZLU/DjV2gcPiFsJ8mTLmN3lj9utjYA3U1n86FvsPUJ4/0Kn3dQCLfWgYsuaMLWtF/AC04IBm
	859mINESfQlbblOXRZlA+f8tgzN/+OHoPoiqq22DzFT6po03J4IvY5FN9eVg3Ph4CVVx0JK264k
	QkrnGrQ4KX/u6ILUd0of7ZPXan3k4KG/mNruTrZm4Wz5Ka6i2ysk35WQy2Peo/tokVPwuXwTIFW
	7bnnrGzcGUhXOs8ZBxTrSmGROIT
X-Received: by 2002:a05:6870:392c:b0:475:a1ec:9613 with SMTP id 586e51a60fabf-49089d46c42mr664002fac.21.1790104993400;
        Tue, 22 Sep 2026 12:23:13 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908e66112asm489416fac.9.2026.09.22.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:23:12 -0700 (PDT)
From: sjunhyuk1@gmail.com
To: linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on 65W USB-C charger is non-deterministic across sessions (25W vs ~65W)
Date: Tue, 22 Sep 2026 15:23:12 -0400
Message-ID: <20260922192312.40607-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting a non-deterministic GPU power ceiling on a 65W USB-C charger,
in case it's useful alongside other recent reports of EC/PD-controller
firmware state issues (Legion Pro 7 16IAX10H, ASUS Vivobook K3605ZV).
I'm not certain this belongs to USB Type-C / UCSI rather than hp-wmi,
so I've sent it to both lists; happy to be redirected.

System
------
Model:  HP OMEN Transcend Gaming Laptop 14-fb1013dx (B94GQUA#ABA)
Board:  8E41
BIOS:   F.05 (confirmed latest via fwupd/LVFS)
GPU:    NVIDIA GeForce RTX 5060 Laptop GPU, VBIOS 98.06.2A.80.62
Driver: NVIDIA Open 610.57.04
Kernel: 7.2.5-3 (Arch, Omarchy)

Symptom
-------
On the OEM-rated 65W USB-C charger, nvidia-smi's "Current Power Limit"
lands on either 25.00W or ~60-65W depending on the boot/reconnect
session, and stays fixed at whichever value for the rest of that
session. A 140W charger reliably gives 50W (VBIOS default TGP);
battery-only reliably gives 40W. Confirmed under gpu_burn 100% load in
both 65W-charger outcomes:

  25W outcome:  24.7-25.5W draw, clock unstable 200-500MHz
  65W outcome:  59.4-64.9W draw, clock stable 1630-1860MHz

Which outcome a given session lands on appears session-scoped, not a
fixed hardware fault: the same physical charger, same port, same
cable produces either result depending on boot/reconnect history.

Ruled out
---------
- Kernel version: same kernel (7.2.5-3-omarchy) produced both the 25W
  and 65W outcomes on different boots.
- Battery charge state: tested 0%, 79%, 98%, 100% within one boot
  session, all still 25W.
- BIOS setting/update: F.05 confirmed latest via fwupd/LVFS; no
  relevant USB-C/adapter option in BIOS setup.
- ucsi_acpi driver presence: blacklisted it entirely, then re-ran the
  known-bad trigger (hot-swap the charger while powered on) - still
  landed on 25W. So the driver being loaded/unloaded is not itself
  the deciding factor.
- HP WMI GPU boost flags (commandtype 0x21/0x22 under command
  HPWMI_GM in hp-wmi.c, the CTGP/PPAB fields of struct
  victus_gpu_power_modes): wrote a read-only probe module issuing
  only the 0x21 GET across all four power states (battery/25W/65W/
  140W-triggered-50W). Raw response was byte-identical (00 01 01 57)
  in every state.
- HP WMI legacy "Smart Adapter" query (commandtype 0x0F under command
  HPWMI_READ; not defined in mainline hp-wmi.c's enum
  hp_wmi_commandtype, but present in a third-party Windows tool as a
  "smart power adapter status" query): also GET-only, also
  byte-identical (05 1c 1c 0d) between the 25W and 65W states.

Workarounds found
------------------
1. Full poweroff, physically unplug/replug the charger, then power
   on. Reliably restores ~65W in testing so far (recovers even from a
   25W-clamped state). An OS reboot alone, with the charger left
   connected, does not help; nor does hot-swapping the charger while
   powered on (that's actually the known trigger for landing on 25W).

2. Live driver reload with no reboot:
       sudo modprobe -r ucsi_acpi && sudo modprobe ucsi_acpi
   From a ~50W "in-between" state reached via a hot-swap, this
   recovered to 65W in 2/2 attempts within a few seconds. From the
   classic 25.00W clamp, it did not help in 2/2 attempts. A
   battery-only control (40W, no charger) showed no change either
   way, suggesting the effect is specific to USB-C PD renegotiation
   rather than a general power-limit reset - but it is clearly not a
   general substitute for (1).

Separately, this board also reproduces the NPCF ACPI-binding issue
described in NVIDIA/open-gpu-kernel-modules#1162 (Power Management
Object stays N/A, Dynamic Boost above the 50W base TGP never
activates) - confirmed via acpidump/iasl decompile, same topology and
field structure as reported there for board 8D40. That explains why
>50W boost never works here, but Power Management Object reads N/A in
both the 25W and 65W states, so it doesn't explain this particular
25W/65W split.

Full write-up with raw capture data:
https://claude.ai/artifact/WDAN76AWk1JpW49ZSGc2Cr

Happy to gather more diagnostics (EC register snapshots, more repro
counts, anything else useful) if that would help narrow this down.
