Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609030;
	b=2VJz23lMTTo/+kUyYPXUShUBYcp050YJ1WRPB9+3AWpFSrFi9XmAB4r4YgF3XPFkX5Mk
	 izRQqaxMtgu6YcgaTmCGvoorEY2m0o2+iF/MFh93ZZm/HoteVmUogE66Kz25lDz4QIsmB
	 eitbEF/u1yIKbR0Q0YQMvolQmlvqk3DyHpJl4ZA8fJweh5bl0r4xSKoUkt+s2GBmivvfq
	 g1njSRWcvx2qAzNvMm1yGMwPM4rBIdWH0Ha+JRTKOYq/ll/VJqQwVTQa+8Pu8wo7ueOZX
	 +IPlq0Dghe5ljLdIAtlWEpuG9CVGvLEXqy5ONIgSHjnEEnEnJTKgWjIV3aFHfsrZDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0HU6I5cV1alAqBz4EUOEAXse6J/R1fjd0fGE1Ycjrz8=;
	b=IXHJNAANBQ3y6+L4rRwqeIbDQ1B467jaXsEnTe6K7g32kfRfqw1627Y0jzb2w5kanj4q
	 dItPViBvRlbLlNPJ5YdYFN8w5kkg2MjNRo7BFy74HU8Tzbdk94hhtySfZhbjsBzPpcn8Z
	 kEgOY/x1Y+gYVzK5MASxiXKdGrX9bltsGs57KMRLIMaBKfrvpbHohx+l7YJbPgZjxcljc
	 +MNZRMpdIZaVTSs99CjDIfJlGB+O/M+VvH13YGZI4LOLSHw1dzuHyS188H02aDbq6whxk
	 QQPGsg8/tFHdPV7Voj6MruNa3M4IbITsedJtjgj8tsw/zzra+p/6UlZrclMiHEKYouQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OZNBaBDl;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55AE606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A55AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OZNBaBDl
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1228119566b.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795609028; x=1796213828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0HU6I5cV1alAqBz4EUOEAXse6J/R1fjd0fGE1Ycjrz8=;
        b=OZNBaBDl77pnrud2wYW7YE3duGQ9qkFNHj/97b+3rn/VRTxh0R6zJu2JYjB0CASBz0
         doSMWT1d2HpwCvbVyJgSsvzzpRbTJJRaVom0kGwAVkbpisjUGTEbn1Rk+/8YntogF4P9
         rGOWB4cEGmu2/q7eUyM6f+aCOEGx2PY3pKGnWbaf3pKVIPghpsEI8NUAT/Eugh1On8BI
         TAzueZE9HEoDyuiNi85m2a0kUk7othdMg6kGCZg4lSOVBtQ8rr/odvHpqQXdodEPCOwW
         AHzqLcsovlgY5Qo2skyeh0BKAo5xSIOPR09ZT0jFLfZAMLQKki6ynkB0CibdPU93WFyR
         2CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609028; x=1796213828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0HU6I5cV1alAqBz4EUOEAXse6J/R1fjd0fGE1Ycjrz8=;
        b=VjftxFHfvMtTKjGobdYUt8SLjWgryTq1UX1f2cvYnd3OEVAE/dUmSRSfMRDWmzzWz+
         BbCu8cNsXLL7syXbKzNc6dvY/0QGHxO1hHLDPuRZmpNNKFPXM4VtIVbS9FUheAEvWZPH
         an3eV5/LxSIcUkHyEHztno+POe7yi2QD4JkeOxL6zd6gQMKB25BBMkIDdDT5ZZ9brlrl
         kMsoxQanG0ekBsBTsDM01GoG9LGdFDray3prkbJNn/RT0E7IE2eunBBn1Vwv6WaW4a/U
         ptOJSTQd43U2S5KlEosAhc26lWHMizVnKHdQBxJ6Tp19XOv+JK/Ctk9ENSQHhVssc0wS
         SnnA==
X-Forwarded-Encrypted: i=1; AL+hErFDRcuT/GVJ6vAJE2pKR8eDrBIOhlxin4OwjQ6bh/9x/PpOh11cuHfNMutJ9jiQ/UaczpvOqz8atVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/giVoV7ANebLI+vzavAtghfNZ8s/XYoik0mEkpc0Zk33D+U2ba
	yw0QGUeiKO8EvanT8LrUj0nmzBWLS3VnW7zjCxbM6wK6uSKKcFXEaQLnUlNToy0qI1c=
X-Gm-Gg: AZFdTZd2h0sWJibRBQOuZewY4jMdKvAE/yvqlCp1lqNnGi68E4IhfurFNUDGGriOZAb
	m6QvLEFIDqAnM3i0XP2A1YVe8TqPdYJq2XZzCNzsTFcc2hI8b/iOZz2TtkB879hxh6z0aet7zUz
	ly+516XCmjspaHE9/iBYWHlr3NMLF1iz+6iw6kYSA7tsf7Hb0+iq4ctxnCox4yL7DWFVly9JZil
	xqxJsx3iEr2w79Txap5/DGU+ZQqR0K4UNFKT5scLX4DB+rpkazdHkJdeR5LqJTZWvV1/61G2j5e
	KjJdqGXGgCyWYeY+rc1M6FumQ3lf98qyrBzJp6ZV6NMkyq5Z/1LeyU2P/pPwdbJVP69Vxf/5UKe
	+kXw3IlRdEolRIo4tPIS3qr5yVOyRUYMtg0HEYbNPdMkwauC1uqFWPHCGcNyDqTGk05e5Q2yWAm
	I9sO6QpBMExZMPDPT/jdGKFRxh1Woyaso9fj6b0KTcxKprEU+yN3TWJQpPZig4CPL3RNbJRDm1m
	VCh6w1HPCQyUUUM5AEGtwXUXzyyD1vv1tQKvk1fMi3GxiyIQac3wq+WRwUCrKA838f8Yy4Wy3S0
	x0LUJnnVLnM1WqMHKXSg1ZLTOGpJPUtCFPb1QHrTgyGSXEbbCoawLZ4XSvm42cdAC96TRKJexNI
	OCQ03I6Qe/OxWkiHqFA==
X-Received: by 2002:a17:907:ec09:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c513a816ce5mr1420780966b.11.1795609027961;
        Wed, 25 Nov 2026 04:17:07 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm650611966b.3.2026.11.25.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:17:07 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/4] usb: typec: tcpm/tcpci_maxim: lockdep, wakeup and
 vbus regulator fixes
Date: Wed, 25 Nov 2026 12:16:54 +0000
Message-Id: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALbRBmsC/3XMQQ6DIBCF4auYWZeGQZDYVe/RuEAFnaQVA4baG
 O5e6r7L/yXvOyDaQDbCrTog2ESR/FJCXCoYZrNMltFYGgQXDaKo2cvsWmvVsrehjSFvtXRyqFG
 MUD5rsI7203t0pWeKmw+fk0/4W/9JCRlnjTNKGq2w7/X9SYsJ/urDBF3O+QuicADZqwAAAA==
X-Change-ID: 20261123-max77759-wait-10974f4c312d
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Hi,

These four patches fix a lockdep invalid wait context splat, a
probe/unbind wakeup-event race, and two vbus regulator lifetime and
logging bugs in the Maxim 77759 TCPCI driver:

- Call pm_wakeup_event() from the threaded IRQ handler instead of the
  hard IRQ handler (the driver uses IRQF_ONESHOT, so the primary handler
  runs in hard IRQ context even on PREEMPT_RT).
- Initialise device wakeup before requesting the IRQ, so a pending alert
  or an interrupt during unbind cannot miss recording a wakeup event.
- Fix a vbus regulator use-after-free on driver unbind.
- Drop an irrelevant error message when VBUS sourcing is not requested.

Tested on Pixel 6 (Oriole) with CONFIG_PROVE_RAW_LOCK_NESTING=y enabled,
including tcpci_maxim module unload and reload cycles.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- add patches for two more issues, a UAF and a spurious irrelevant
  warning
- collect Heikki's Acked-by on patches 1 and 2.
- rebase onto next-20261123.
- Link to v1: https://lore.kernel.org/r/20261123-max77759-wait-v1-0-6fa54a751bb7@linaro.org

---
André Draszik (4):
      usb: typec: tcpm/tcpci_maxim: fix invalid wait context
      usb: typec: tcpm/tcpci_maxim: init wakeup before irq
      usb: typec: tcpm/tcpci_maxim: fix vbus regulator UAF on unbind
      usb: typec: tcpm/tcpci_maxim: only complain about vbus when sourcing

 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 62 +++++++++++++++++--------------
 1 file changed, 35 insertions(+), 27 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261123-max77759-wait-10974f4c312d

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

