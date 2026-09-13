Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F192232E73E
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339072; cv=none; b=noUB04/p1PMGUDV+BHz4hslMRh68vX3vL6dK4tRSzyhv9Gj1FcZPylSVdFnqjSLbxcVdGuaPMnHfwUe7k7qUuU8tjlIROdbRmgog1+X878qYcowhBBY2QOMCcp9nmsGh9UVYraDcdghZje1mOpZzhZ1D/KZBJvVJaDZ8tfpJpiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339072; c=relaxed/simple;
	bh=J+u0KgMKJB3iK7Bi+salQZRzsKk6olKpGA7HZ0p8BHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebmgvQcaxe6xCf6AvquzMQ5mDaT32RNo0Op2Tihz2J8TqjPRoiPtuUHkNUYr5WW+F4XH2RXIzlryJO4V/8waWVzzSunFM8HNfuyg4eVqPHuEjq7CKwjb08EGNBEVQb1hssvtShDj2FenifTgMwHptFNUayW10m0vvmyZ/XMkr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTeytXvb; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTeytXvb"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so19252196d6.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339070; x=1789943870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H08np1NCezknf+a6xR3bQgIb7oIFYvO24eBWSQtgT+s=;
        b=kTeytXvb1Hlu6Pz/znp6Zm4imEXo2EvlPeYvmgDG+2KVdCiLhHatytCAQ2OSdO+ybp
         5SswEJcVLSu+S8N6E8frRm/1rFB+I0B+SKJoGzwmDNjeJSAewTyoUXIC7Te0nlme6gdY
         YCF0WbEj3WpN9wp4wqpZizl+9tV0g3hNdIxgW7k7ypSEqIBFe1gDlvkdGkl+VQvjsiwU
         ySkYTmy4+gRKA9lm0PcWYOs8P3o2aTAo4CTCmSc3amT8kmu8g0CL0V4pjJ0WXy/sh2m/
         jB+h7PiBRDBJzlic2vFxJQPoKjPzhht7bvXbCPxKWR2N+7O/zV8vSAIo/B+aqDjtPs/V
         RnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339070; x=1789943870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H08np1NCezknf+a6xR3bQgIb7oIFYvO24eBWSQtgT+s=;
        b=IYU1djS6l1tkdlBeomEp2U+dBfEY79nBgiS3crKsRqQhFmwPPNfseuzpwQdudj04oQ
         k4gGp+5whEZypYLTvAsCR8aa0A3v9KAyqHEZjhBGER6dtWaiipytFPcFnWTF39YP8hyT
         V+M6tn5eVxjtcDWWnCBB1RxwSRVeuCRx8FnoJ4nykYGCCcwCkkUIG9HcoFb9qo5SzhJT
         p1sOncZ1rXuh9Yvux9IcKpTiW4O4kTxwichunpU3sFw48iZqVrYBNg2m75Bui02EegRO
         b4QXnmkVd6+loRbrwnKyYlv/id5drp0tVUty9xa60N3KIeKRgdWCN+hUpgIXJEYmvW6b
         B1yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeY90Cerlv9IzCMqV2kTYYbdaGjbLI9k7t3WMvvNY0esMze5f/M8mCS2U63PoseASPp0/CrlR03q0=@vger.kernel.org
X-Gm-Message-State: AFuF++nCqk6RMoa9BLyZVmsUbR5zyLJWqxeC4gCQaMOcRNf6lKF9lQ2H
	qkhwclOHmbrh9c38u0OwIkEJlH00RTACiIPSDhEsD4RTzSc26YJKSSxHT4YXT1vvl0Oh
X-Gm-Gg: AYBFou1QBTi/17wZ6UyPWTI0acYAqX9+jjatNQmrLtC1z0dFh/m2eSYf8VjgGMgtxae
	jzry4CH1Lqq6BOIpo8pxq2q7x0h/EJgSGFw6Yf1iXwNyFJvtxxxn2MHIOCntTaLtim8+VxxZa3g
	UOKysLM7iAB2KbnJqUgW+6ZS4Ixa9ZWFRawHMf5KDjQ4moZhNETiJz7ETsAAaZrqThQO7ZtwuyP
	sW+9c56QskoyyxshLTxSy5Askjx/sfVvSD3Mow6vjiA33yTkXLXnooKoFsK8S/oUgn+PM8DRipN
	GdMwShkBqcx9X/ugJ6AkACOu0p5qwxc52ylccsnqIAVSKpfb0kwZftcjthJmCgAs/Nq1jzQzwyA
	Tz+ovLpbeGUWkOUjxYSxxdDfx+98XFFTbkWFCDZ4cysoeasok3jEfBcZMDEXbalLPUtIpV0rY5Y
	cf+ddCbXTMAa/CcVnfagLKUdZbJZpkDfZuLNqlxXfnIyEvQjlk45eeeoQL3e4XVbxvGhYc0fr4i
	Q0AyRt//Lm4vFgLB80CjQ98BYdJKRjFmcUL7a9gu9jBP5WNIj0icdM1kd//kaEK0O6iUoFF3DT1
	4wiKZUzVNHLDdbFDIBTlEDn580bmWOfuMPO6kNGhpZ5E
X-Received: by 2002:a05:6214:1304:b0:90e:8a98:f218 with SMTP id 6a1803df08f44-9122e4e35b0mr2677096d6.9.1789339069896;
        Sun, 13 Sep 2026 15:37:49 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: ehci-platform: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:30 -0400
Message-ID: <20260913223732.92882-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913223732.92882-1-mhun512@gmail.com>
References: <20260913223732.92882-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On wakeup-capable ACPI controllers, a successful probe-time wakeup enable
leaves a source attached after driver unbind: usb_remove_hcd() does not
disable controller wakeup.

Disable it after usb_remove_hcd() to balance the enable.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 776c15d0ad0c ("USB: ehci-platform: Add ACPI bindings for the EHCI platform driver.")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ehci-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index f61f095..b749de0 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -420,6 +420,7 @@ static void ehci_platform_remove(struct platform_device *dev)
 		quirk_poll_end(priv);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);
