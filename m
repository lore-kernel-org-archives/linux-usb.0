Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B545FFD7
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929946; cv=none; b=hNUL5LZR9DMwgdE8bcYG1wkXj9xE2+czOkujo0mkEGuTFGaQVTaHCtPw7cW2Avz8oOi3tqGXyLfz0y79UDCzoC3rc0M+V6njcDdHmwRzQRQnom76bVC4RIftnlXh3fRPwFEKHXVtHmBUh/R6J3cyX1mdBgNUrnwu3VW6/5rBfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929946; c=relaxed/simple;
	bh=rm25fPbnkxJO7HK0YmIVPZ5xoj6VizjjzCiLuZ4wrBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m56DHqRvtkIJ1fkq9xZ685lKE5Dg3aQuZufTkm3pWYR/EOeNoXx2WXVOy9rnlXYyDLpZeETbQ0hjxyBGS+Z3ERYK1s+JKb92EdF1qOhCYFlpxQBEZGbVnu2Ty4gdWqTjZXw9KFHhAlEzfH3iF5fdY/7pCjOKJCmEaL7+B0NjQgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gOM8/Y/X; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gOM8/Y/X"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so55586455e9.3
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790929941; x=1791534741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bn76FEyPAPXjCUYSZydeUnbTPozt7o+Jc45Ge3nFyQ=;
        b=gOM8/Y/X8QSRBJid0XZciWOdROVf+RMhL25AJV8yolknw87gSL5S/vwYMGFwT7H5hA
         qXGE9lSVooIes0Vc4UgAG3LG/BZ9xd4DNEI8yalLTbWdnK7zo9E3qC4sQh/WZsg4g+ew
         TG7vz7RjF0PXObU4LdFW+flyGSQAjElyrsiKimXf/Q7jeIyF6NdrWu8uAkgciAuvZWUo
         OBv+8tLd9uDIxz+IKaeOrk3a4nX0buiJNmpeFmfK40wb3okDczzjrmsX/z5dAlEIMczF
         Kckecudd1heVZnr6LXfMIgW2ybIFHdyDhajsaW9wnpYlPuRYwPKB9CVqflmDPXEMfUBh
         lKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929941; x=1791534741;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bn76FEyPAPXjCUYSZydeUnbTPozt7o+Jc45Ge3nFyQ=;
        b=t09hJk1dGIlIHC3U8kA5DgRTX02qnJO1EwyxbkaYe8POKDNyaDBA7/0xus/DlcqtVE
         J0pMdTTcIJUluTJ18RwZ+4yqnKBdriNS+O1meDBL9aSDmxTH3y5kiBTL1r77vMsbRMOD
         yGImp5cO+MJuzVYdNPmJ8Fo8j36T/PSYDyd+EMjnctX6hhPk4yYCH3n0qATCKFu4wbBD
         SAIM/85nE6AYK/1w5w4J1xPL+r9DP48xaO0/hl4Ozp5EKCOebnHB58733qDtrFeKKIlw
         /q7ZTkxqMeItNBwiYS3MxCTDdq4Wgn26KNybpaKbBRxDc/CB+/87Ca5wgezdLryUnvbP
         ZxmA==
X-Forwarded-Encrypted: i=1; AKwUvBz+rEMn5iBiDL7gythpNN16sB51KhX+rXt0uInbvaLrzcfoApOTxG5IfT/4qtW6qz3MK4j6siiSI4g=@vger.kernel.org
X-Gm-Message-State: AFuF++k39uJJSz9Mju8iRTJ4BAfyd7JvafseIx4WcsWA/I037/nnnH6I
	gie+bH6FKlLCo+4bx5jyUginkjK0HHv09Ck/jeXB0VYPJYLm9JGBzEWrGjCSsHziYJo=
X-Gm-Gg: AYBFou2PU3Z8Ben8NhZM1N/NL235A5ZQaPNBuxGU0bAlTofVflJmukLlQZ2rhJzOCx1
	8ILqP5duV59+AbIKDahBOut6MVTLkqVBpLZwxnnR4XMCV+a33KAB5QQiF6C4WlWCX/oaUO6NFmG
	YXTMQPt5pYpc+Qi2AGJAVvUY+4YN4A7S+rmLtyh/tM3YTx27TsaBX6IA+bA93b48NSGqarwrR56
	ezxAHsLrJP1ClhrIABIaey1uCNvGGSKxaHgBlL9hTNLVFLSOuw97/0vJnQ/zyovb2gDLsyF5cmN
	DVcNQEJSIK02Zfqns/pmBTTB4/hJGGD+tMyz+kI02nLQLiS5ENlX/4oLtAa2EkV7pEuOrqrcqSo
	BEKz2vDeMT6gL8Eh4pX4R7Z4Wemjm1RdMYQn1qZrV1/QCnmBlnteIFuGUvvS7CtWN0qYEDnR2ht
	xucDrt0aPDUps2C2A8WqqRLKiYtWv14sXEwiPcvrI1Ilx6Xo9Hp+wBVaTQelOiT5LUTQ==
X-Received: by 2002:a05:600c:4e41:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-4a0274f9bfbmr42577955e9.3.1790929940907;
        Fri, 02 Oct 2026 01:32:20 -0700 (PDT)
Received: from zovi.suse.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm42507905e9.4.2026.10.02.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:32:20 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rudolf Marek <r.marek@assembler.cz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Remove obsolete __MODULE_STRING()
Date: Fri,  2 Oct 2026 10:31:00 +0200
Message-ID: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260919-module-string-d64816f203d9
Content-Transfer-Encoding: 8bit

__MODULE_STRING() has been an alias for __stringify() since "[PATCH]
MODULE_PARM support for older modules" [1] in 2002-12. That change also
moved it to the graveyard section at the end of linux/module.h

Replace the remaining uses of __MODULE_STRING() with __stringify() and
remove the macro.

Apologies for the wide distribution. Acked-bys are appreciated.

[1] https://git.kernel.org/tglx/history/c/136839a1b4

---
Changes in v2:
- Rebase on top of next-20260930.
- Drop 'watchdog: Replace __MODULE_STRING() with __stringify()' since it
  has already been queued on watchdog-next.
- Split the hwmon changes into a separate patch.
- Link to v1: https://patch.msgid.link/20260922-module-string-v1-0-c18766690185@suse.com

---
Petr Pavlu (3):
      hwmon: Replace __MODULE_STRING() with __stringify()
      drivers: Replace __MODULE_STRING() with __stringify()
      module: Remove obsolete __MODULE_STRING()

 drivers/comedi/comedi_fops.c                          |  5 +++--
 drivers/gpu/drm/drm_fb_helper.c                       |  3 ++-
 drivers/hwmon/fschmd.c                                |  3 ++-
 drivers/hwmon/nct7904.c                               |  5 +++--
 drivers/hwmon/sch56xx-common.c                        |  3 ++-
 drivers/hwmon/w83793.c                                |  5 +++--
 drivers/i2c/busses/i2c-kempld.c                       |  3 ++-
 drivers/net/ethernet/atheros/atl1e/atl1e_param.c      |  9 +++++----
 drivers/net/ethernet/atheros/atlx/atl1.c              |  3 ++-
 drivers/net/ethernet/atheros/atlx/atl2.c              | 11 ++++++-----
 drivers/net/ethernet/intel/e1000/e1000_param.c        | 15 ++++++++-------
 drivers/net/ethernet/intel/e1000e/param.c             | 16 ++++++----------
 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c |  7 ++++---
 drivers/platform/cznic/turris-omnia-mcu-watchdog.c    |  3 ++-
 drivers/rtc/rtc-ds1374.c                              |  3 ++-
 drivers/thunderbolt/tb.c                              |  3 ++-
 drivers/thunderbolt/tunnel.c                          |  5 +++--
 drivers/tty/serial/8250/8250_platform.c               |  3 ++-
 drivers/usb/atm/speedtch.c                            | 15 ++++++++-------
 drivers/usb/atm/usbatm.c                              | 17 +++++++++--------
 include/linux/module.h                                |  4 ----
 21 files changed, 76 insertions(+), 65 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260919-module-string-d64816f203d9
