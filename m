Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376610;
	b=WZOothvGWmPW50/V6cvvp1nOjw1v4nBksTNTJQhan4Wgl0T937Q4xVSHY40v46XRYcj1
	 1bTMcCO/V8ezad1n3a/Lt1F7Y+Pr80CPLJAF8/dRxVxMw6amxQZ2a3fnGtSH0F5NVp2Ns
	 9u2/VDLhgii7RbaH9bt/WR9ysiQr/rqqL/pB0NaDarNIcoc/FugDprKzrMfzee9iGhg0y
	 095gwm0FFBIac4JXvUheRxpz1yYrlSfMBzC5k2rOk2P34iLdJFDZI9oIapD7uLZY9AF4J
	 DsubOqpqhJlWa6GuSJtvgyUK/VhW+kie/SE2FN9+sjacC+1+M4++nBY42wNBHd4XNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VMys8McNjnWrl5YPrlDdndx3edldCiGJ31ibT5uzN+8=;
	b=vfGLjul1zYKpBmedSNXUpmiDXLCpg3tJ0GeFRsDOvoJxLmMacx1fwcLKP+Nq4s+aKT+b
	 3NYna1uz8teSIOwpxBkscnI62L3+gJvgbrWxg3ZLDy7SGoA1SOzO3q6rwFEIofRag/HMy
	 N57hdEZPFdPQEAWDXuERxLT+RU/0d5++RLOudYVn7GItebI29/OCjoKIIjAA3pM6pdbpx
	 bbzxWHofV/TN4wxoCduiEMTrkDkrq0zOjxb7chArWJoM0VaHaNwWBWgFxcgelGfN6Wite
	 SfiR0u7c5AL0GadZNrf/CUCL8hNrKyPgFUdQJWbhkQVwGyvx/rFc7TJOMsyTOkBKVWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBOXRgdj;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE3606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 05:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBOXRgdj
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2120398a91.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 21:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376609; x=1794981409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMys8McNjnWrl5YPrlDdndx3edldCiGJ31ibT5uzN+8=;
        b=EBOXRgdj64jVioki41kXMa8iPyDDnNbvmbuRYDycw2WGk0xUwNCa99nZe40gqj22bP
         9zmCauJUUmVprBFZHWKJJ2dCZKZ9afrDkqRgUoODnpJG9+IDJ3ookVxLo6T6rvhN3F9L
         eJmAnYb8acScgTZur6wL2dfjEAD6ifDirP3gfZ4idc+S1XONmo4hkXB4w6a8cKvrHd3k
         kbPuSjDunLDLpnCTF08Eab9TKKO/6OehHyWyZIhks8fp2Nrkd4+MK8llEHqd1sXOrk9L
         mdZ6Tw+IGZVHDbjUiUGtvg6ZsbJIp39gvoYS8z58Xqa+jzppIvGgsoYxNzrYCgDIgHmb
         pfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376609; x=1794981409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMys8McNjnWrl5YPrlDdndx3edldCiGJ31ibT5uzN+8=;
        b=AJThGBFjVo6EcmHn5sv0YfueCVde36L+Y5ISJ4SLoDY3To9KYv1BCpQqdUGVMCNC0V
         g4TEfHw3m5CgWwElXWsdSL2RBydr8Nhxzdy12x3vlXRfe/aSLzKoKV+SK+Fvv9EbIYZL
         MqeuTRTtitSkTZpg70XzYWVSbUM8OmPu1NI5oSn40dj0Ik6rnaV2xlEzvGIqTGM0wP0q
         fo5rTLI2EnFM8r1TyYFddR0J7oHRosMDtZsN3lLY3vjydlqkx72cr+MsMASoSneWDXnI
         8AxY0rroO/vba/l9H5R/crdYsX75zaHNh3Dn8HuyFll2d+wEBX2CLFIwUG5UluJZTb8D
         bvZQ==
X-Forwarded-Encrypted: i=1; AL+hErFCLbKJQEN2TFJ90jTr7MHedWJg5smMHwA6sVBu4r6qNjYZZTy5GuyPVdSx+K3DBnSLP+8M4SjoAZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yg6+KpFbnUJEE3beuYiKpGrwJyamEBDp3pHA8EHvir9+auLaC
	ANj+c4MtNicEfGIu/2Sodb8tFUWUVEoVR3AVOsyMVoexr9yA0C+l4uzK
X-Gm-Gg: AYBFou1G1CQt2rEsCnNBl7jlcBbyEGt7Hj5dZuPMvuLOEVw9la5GrFwwlF95BEiBlH+
	Mqgxp0vKqKr6LzWAF23tDs3BQLH5YXned6xwvOm9wn6lEu6E32oc+zTNpzOwGh6nDl6Qf8qfpLD
	5alL+Dy4DnE8fytH4cTwDAH8RoJwGoG++mFLRs44R3hy6cVs8+pkPrtif/4KIa7XlJ35DxzZKvV
	n8eTVqxtYE6no/CuQZbVYqoDOQcBHZ4baZ39WLKQtNcDOkNgItqMWhgUyMn3vBfLyQaSzFnF2p3
	TGkn5fXb+2/dhCBzeL07xO/AMLAYwKYKNRWO/opl3n34GNG3s6px5xIfui0XfqKWpw0fGbaHE8C
	pKLttJiLQKeYSkIC0GvC29CQRfRe0TxdeHFA24zAijSYli/UmvfcKhFBpbrareHUYkZNLtD8SWN
	uUeeI4ucF6tlfyuxyhjH2i8gZcpcK51jG2oIVl9c6eoPcILmmtgmw0g72RMRcySgWAdDaYth8WA
	H+DO49TkeX3pCFA2Lg9H20b8VHu6MyBXJZHdiBQms3yOa1cM/GcPPKNzbm6IOBCk8w0zjVnaHAs
	1ty2ZpukZPfPl/pX1+JiiP+Qels=
X-Received: by 2002:a17:90b:17c8:b0:3ac:3e42:60a2 with SMTP id 98e67ed59e1d1-3b182edc9d1mr1477647a91.33.1794376609372;
        Tue, 10 Nov 2026 21:56:49 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b18142fa70sm2449126a91.16.2026.11.10.21.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Wed, 11 Nov 2026 13:56:15 +0800
Message-ID: <20261111055628.183891-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Changed from v1:
- https://lore.kernel.org/linux-usb/20261110070627.217946-1-inochiama@gmail.com
1. the DTS patch is dropped and will be sent separately.
patch 2:
1. fix wrong is_host check in dwc2_drd_init()
2. remove unnecessary role check before setting phy mode in
   dwc2_drd_role_sw_set()


Inochi Amaoto (3):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC

 drivers/usb/dwc2/core.h     |  5 ++-
 drivers/usb/dwc2/drd.c      | 75 ++++++++++++++++++++++++++++---------
 drivers/usb/dwc2/gadget.c   |  3 +-
 drivers/usb/dwc2/params.c   |  1 +
 drivers/usb/dwc2/platform.c |  4 +-
 5 files changed, 68 insertions(+), 20 deletions(-)

--
2.56.0

