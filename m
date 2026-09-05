Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E94392837
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611715; cv=none; b=Zmq3G/zYzsa9eCBIX5+x/9ZNP8vbeCunFDfwAhvvnitsdNWQ4IwfsMo1O0pjVXjJ/0FBo3ziU25rkWXKF7LsGqzCS5LRUlWb033XAZJRLZDzIfNiwxIcKKsPnHMUSo4vyDWQ2D2+wPbqhcEdMBfBDoBrm+7y9XnWB+6YTGrZzAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611715; c=relaxed/simple;
	bh=CDc8iv3xO2yb3QRs4UBg+fRGQ+exHYaq7TEdw+PFbAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pzx1dKD1H1rRSTqUk233rzO8wm6vxKkgqoBM0s1VBxv2kZqgeHref1vWwHcwRV628OWoRrUubOVV/R9IFBncRdLGH0u8Kfd7rNO9gzokM87+KPzK2B64ZMntDxMTFNuB6k0T+mW2FlMCrb255NCxAfwecsOnBZmkssXri3kZvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfCLUkdJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfCLUkdJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2271639a91.1
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611707; x=1789216507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwS1+ZQASkkZc6q/VkRjvmZ2IJRnJAnF0FNGgw9Ylew=;
        b=CfCLUkdJYecY5H0injO+7/4K1O6jKJo9Y9d1oUEAHYsoV90Gl6zAvj+ADV1+NC5A/a
         2wjmOn7BKoZzOF5uz0MfmxUT2Ib3F+0a3MQNus4tgknGnEuq6RU+F1WfNXvRMoDmU9+0
         oQTR19iO4kFFMC8tqcfXVN43vdIsMI49oqwUS0QPEdPW8Z1KEzYrlztinI/qO+7Hevdl
         gjsNpVA3nn+ULoxEhaVuVS19vPhzXGNnGX3J5TrXwZLJVZ44zn82U0x3DDDAjsZ8Qf8a
         a9yyBPKROqMOVI+HAZBuFIHIlgl3dEVdcaipmEPjUmGGJbPEhIZ5nZKuhFepc61mkD/+
         dMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611707; x=1789216507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwS1+ZQASkkZc6q/VkRjvmZ2IJRnJAnF0FNGgw9Ylew=;
        b=suknU9A+Ct95ML+sR+z9Ana1ujTKFYmJqQ07OwR/OW1sLUji7qeIwmlAYWD+GwoNCK
         FzFPj1mz008gIzMZ35+/HWnAd1NYpATq6axW51fnMdV+sz8NMh3QzUeEaX48951iVlzc
         N1j0s95+jQEc8GQX/g9gszDS0ChWqJa4/zqiJMpcz7+vahg4O2qaIYcVBG+q9Q7HXNxN
         O+MkajWOuVK/7ulF31ojrdh9m0J2OOw9mVeTKBGWwRYmxNtS6GzEBmeBMEHwi1Hai/6+
         FODFx61DWyJc3fzIF2cOhCXX13nL6v9ZnULPVYoWlnf2M/mEOOqo2QIGGvtUlweOVdmY
         sBsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD6m1H80XsdPznG0qCktdj67ZZTG50m+8Z03BbO45/TkYAIXn6njJQTkHgQoZByeXkskuPZ8cnVXw=@vger.kernel.org
X-Gm-Message-State: AFuF++k4VkYGaqdQ+gwRSko5FOvn4Gz8TZJpUfJGgl0UOtRopPTflO4J
	LvdBAtNE9LUMA2NA3gxySOeVai5SV+Ha17bKvX4dE8sP2jtkkygV7yts
X-Gm-Gg: AYBFou3DEUj/lR9Hdy7ZIwS1eP+CwI1cDAdr4h0iF7AbusdQGoUiLqCwfyvrtmt+Lk3
	6IF1FPQSbO2f6p4NAGMy3XMSGd0oyYuHSNb9DG5IVkJkowmW45ZoQDgTwz9fdoAWj7oAC7RZwnZ
	ArMkZ7fDDWhn5jRI2xQkjzcZhO/TE+iOxGmKGODD+ycURFDU1nIA9gsDwiuCWHNLO2X7TsVTw9Z
	JfQT8Ym6n8BFWfwgjnHIAUxs/OjJUgWyRnBWyMksUye0BRK/NXCyrv8q95CttwA0P4rGB+rFeZW
	84EBGIKewhZKwgiomPxxbGX+qwXGcznNqBt57q7BY4VRcVeKyeAE7bZVowUK49AzpI8WkCtPRih
	+llda0rRfywgPM+/mRiJYCyvW0kcpgE+XUi0EU9r7/fLAFX6JVlgUIsHv6D4S9PYsnrJqSQNXpJ
	XlRsf7itiB9lZjcYML8QrFB/GQ6sPWhxQ9/bAN+EmnYucSjQT3wZyUF4B4QxqK/dBu7wgT8TVp3
	A+MYI7QebV0wKiy65kshtWJg6+23bfX
X-Received: by 2002:a17:90b:55c6:b0:398:9be5:b41d with SMTP id 98e67ed59e1d1-39b26299670mr18568039a91.24.1788611707293;
        Sat, 05 Sep 2026 05:35:07 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:35:06 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 4/4] tree-wide: purge verified remaining legacy ghost options
Date: Sat,  5 Sep 2026 09:34:50 -0300
Message-ID: <20260905123450.5620-4-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the remaining dead Kconfig weight from the tree that gates no
active driver code, and remove the dangling comment inside drivers/leds/Kconfig.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/clk/sunxi/Kconfig        | 7 -------
 drivers/leds/Kconfig             | 1 -
 drivers/media/platform/Kconfig   | 6 ------
 drivers/pci/pwrctrl/Kconfig      | 9 ---------
 drivers/video/fbdev/core/Kconfig | 6 ------
 security/apparmor/Kconfig        | 9 ---------
 6 files changed, 38 deletions(-)

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 5e2f92bfe..3ba500b9d 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -32,11 +32,4 @@ config CLK_SUNXI_PRCM_SUN8I
 	  Those are usually needed for the PMIC communication,
 	  mostly.
 
-config CLK_SUNXI_PRCM_SUN9I
-	bool "Legacy A80 PRCM driver"
-	default ARCH_SUNXI
-	help
-	  Legacy clock driver for the A80 PRCM clocks. Those are
-	  usually needed for the PMIC communication, mostly.
-
 endif
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d318223..800fbd560 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -873,7 +873,6 @@ config LEDS_UPBOARD
 	  This driver can also be built as a module. If so the module will be
 	  called leds-upboard.
 
-comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
 	tristate "LED support for the BlinkM I2C RGB LED"
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 2c7699b66..dbef2275f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -22,12 +22,6 @@ config SDR_PLATFORM_DRIVERS
 	help
 	  Say Y here to enable support for platform-specific SDR Drivers.
 
-config DVB_PLATFORM_DRIVERS
-	bool "DVB platform devices"
-	depends on MEDIA_DIGITAL_TV_SUPPORT
-	help
-	  Say Y here to enable support for platform-specific Digital TV drivers.
-
 config V4L_MEM2MEM_DRIVERS
 	bool "Memory-to-memory multimedia devices"
 	depends on VIDEO_DEV
diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 9eec767cd..853dd16b0 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -39,12 +39,3 @@ config PCI_PWRCTRL_TC9563
 	  MAC is connected as endpoint device. Other two downstream ports are
 	  supposed to connect to external device.
 
-# deprecated
-config HAVE_PWRCTL
-	bool
-	select HAVE_PWRCTRL
-
-# deprecated
-config PCI_PWRCTL_PWRSEQ
-	tristate
-	select PCI_PWRCTRL_PWRSEQ
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 8d1993e0b..14860a1ae 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -155,12 +155,6 @@ config FB_IOMEM_HELPERS
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
 
-config FB_IOMEM_HELPERS_DEFERRED
-	bool
-	depends on FB_CORE
-	select FB_DEFERRED_IO
-	select FB_IOMEM_HELPERS
-
 config FB_SYSMEM_HELPERS
 	bool
 	depends on FB_CORE
diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index a1f3749bd..508fd7f02 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -35,15 +35,6 @@ config SECURITY_APPARMOR_DEBUG_ASSERTS
 	  points. If the assert is triggered it will trigger a WARN
 	  message.
 
-config SECURITY_APPARMOR_DEBUG_MESSAGES
-	bool "Debug messages enabled by default"
-	depends on SECURITY_APPARMOR_DEBUG
-	default n
-	help
-	  Set the default value of the apparmor.debug kernel parameter.
-	  When enabled, various debug messages will be logged to
-	  the kernel message buffer.
-
 config SECURITY_APPARMOR_INTROSPECT_POLICY
 	bool "Allow loaded policy to be introspected"
 	depends on SECURITY_APPARMOR
-- 
2.43.0

