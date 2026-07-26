Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1637B016
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 17:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785086076; cv=none; b=TST6kr5Nw8Op7d2TdPTKkYN02I72I2Iq01EXpmlvxNfd4Y8P0TFuQeVdw6BMHnxU5vWkRVo3nZNS3eiTTSf0o6NQM+J3KM38CwbUi7P7dg5o8Th8MBJdzYB5HMvdHXQ6SoSTeV2PsUqIpf8KRm2AoFvhW6n7jxJzAYsmx7MfQhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785086076; c=relaxed/simple;
	bh=N4ilfGpEIWfZuiEpdiFqrKZTcnC1n1DX9UxVNMrCido=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J7gi5M7e57ZYrqN3JiwcI5gtEq/a7FsiN25RNBwZUEPOcfB8C/Pibf5jCLLMcJvn4mfnAvcb5d8UwuQa+KM8SVDZ67oslnjkE1kE0uwL5Oarkek7V7rL4ywGQVBQo0heV2Z3MjGXzbdhk0Jo1yAFoJNKXfeRjnQ7Dp1uyOm4SYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2XH3ZBg; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2XH3ZBg"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1436645a12.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785086074; x=1785690874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+l1oHvEL8EeGFQML18VSIhQ+OjSLbj+kI4tF/jsj1o=;
        b=Q2XH3ZBgbQ6x/dB/HBCVS74/m56DHINiRyGKv9j1buSiP1J0gGQkZDw9oj4mHLUeVJ
         icj0UfBd4mkAV/ldu2+SiV+X9qiCgyw+1RqQhOJDoZzV/7CV+agb0SpCqxeFAuxHDw8I
         EyxpwECbsXHCk/h8Hxjhs67VNXUnKIhEzk7SFfVP8mTZGzrSzN4Bp97Mim2TTodKFfQz
         nyBlK87bs59g55z14jcHnttv09JI0DHx9DAE/YnKB71zJ/Mn6kT/jvlP+Iwu1Aziwupt
         F9G9DrTwfddcBte7XuTAEt4iZlYu6KTB+faZWZ0Co+uIMxUlrTiBiRCbTDgijY+xdUEl
         y/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785086074; x=1785690874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+l1oHvEL8EeGFQML18VSIhQ+OjSLbj+kI4tF/jsj1o=;
        b=kPsZS0/pnGXhuCKnAEJEw9eT0iRNkVPALk/kl/J4zS1848X+Ngc5w8fzn4V21o/XdS
         IOz3iuc+SuhPGdzcBM4bL2d54PkDaDgUC5fdoh0eH3X6Zr/j8sj1k7/cXCxaAM93QTDr
         HuP5r9eTREnYG3O27NJoyuqWyw/CCGtfNZtFOTeSNKLnD1wGSldHM2kBKaJaxOjEVasL
         c73Z1lKQLXFGT32MvYdcMYlsuUoigXWHtTN2LsOoyxLf0Iu9cDbJ6liRmkaK/Zgbf/M8
         aSQI3LCqKIM73Osu29/R12Q5VlEBPXmojWfNw4VWld7NIQU11lfA3LRKGv2GwMA9FYcs
         38ig==
X-Gm-Message-State: AOJu0Yx6fpu8ZKNW7XzMK4DMCI8dfkIrWlprnQKG1ya7fMjJ8U3WVMO7
	tDQREV/qus9996xid1PEGnfTZxuE8sKqrWZFWVehp1qQViHXmuGDzeN2NGmPqY9hZj0=
X-Gm-Gg: AR+sD13uZ0hs/SvQ1EIV/o98ww4cyIltDkD0YR08YD+YrNhVrZFSZwJjqAOgKgfGno3
	fxW+Cdr3g6325L1H1PRIzdn70w/2v4WmLbWcdgS4AfWP3zBUO2B+2qLi+OLtIE+mzTZ97X6zM+j
	aOOAJvl7q7eTpC+CIn08s8/X62BYXHpZmMu6wpesbUre4PdsZcCUs0KlgSvLW4v75SAAUruTklE
	T64rBN2cE7YJQW+xw2ct4RM/C7fxJGZUKprwFw6x8CnvS8I67U2o0nlLbu4CjaORYtvgg6OWOoP
	9cczXSW4MSOrAuupDvNUVQt647KmA+tY1eW/aYymaUhT6j+JjZrKX8mmQcYXu0wsGC57UA8+fAY
	rIoKI2FlqRQ7DgfaJ/ZFQnThTlgYP6jGUNyP5CbND4wwE8L2XtuBl4rpkUXLV+dNObXCZgdRmav
	gzjLl+zyw0qqiAtQ==
X-Received: by 2002:a05:6a20:9397:b0:3c0:9c19:65ab with SMTP id adf61e73a8af0-3c67e164003mr5742495637.67.1785086074213;
        Sun, 26 Jul 2026 10:14:34 -0700 (PDT)
Received: from Linux.bbrouter ([115.96.218.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d6ba579c3sm17823450c88.8.2026.07.26.10.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:14:33 -0700 (PDT)
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	nikhilsolanke5@gmail.com,
	Ishaan Dandekar <ishaan.dandekar@gmail.com>
Subject: [PATCH v2 0/2] Fix initialization for Generic Clone X-Input Gamepads
Date: Sun, 26 Jul 2026 22:44:21 +0530
Message-Id: <20260726171423.42850-1-ishaan.dandekar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a hardware panic preventing certain generic X-Input
clone controllers (specifically 0283:0001) from functioning correctly
in Linux. 

When the controller is plugged in, the USB core requests its configuration 
using a 9-byte request. The controller's firmware fails, disconnects, and 
shape-shifts into a fallback Android mode, completely losing its X-Input 
capabilities and haptic feedback (rumble).

Patch 1 (by Nikhil Solanke) builds the underlying core logic to allow 
a 255-byte config request (mimicking Windows behavior).
Patch 2 adds this specific controller's hardware ID to the new quirk list, 
preventing the crash and locking it in X-Input mode.

Note: While these USB patches keep the device stable in X-Input mode, a 
companion patch is being submitted separately to the linux-input subsystem 
(drivers/input/joystick/xpad.c) to ensure the device is routed correctly 
and retains full haptic feedback and functionality.

Changes in v2:
- Added missing Signed-off-by from transmitter to Patch 1.
- Wrapped commit message in Patch 2 to 72 columns.
- Removed trailing whitespace in Patch 2.
- Dropped the Input/xpad routing patch (sent separately to linux-input)

Ishaan Dandekar (1):
  usb: quirks: Add ShanWan gamepad to quirk list

Nikhil Solanke (1):
  usbcore: Add quirk for 255-bytes initial config read

 .../admin-guide/kernel-parameters.txt         | 10 +++++
 drivers/usb/core/config.c                     | 39 +++++++++++++++----
 drivers/usb/core/quirks.c                     |  7 ++++
 include/linux/usb/quirks.h                    |  3 ++
 4 files changed, 52 insertions(+), 7 deletions(-)

-- 
2.34.1
