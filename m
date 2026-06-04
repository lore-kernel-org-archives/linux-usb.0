Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F758BE9
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 00:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531503; cv=none; b=LisQLrFACiR3SfAOcpR5w4azShADWIYJLkeAL2ZsQKHT+nrzxzOoBU8a4g49DtQN+xOZpgVG+LIRgg3Wm9CAWVs+yUNZzPJi+lnjSsJjwIuKqIrocv/FPAQBpVKSpaM4EQOyUxLOzqjqA31Fc2MqVar1iPneisOpT3JnV1V+ZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531503; c=relaxed/simple;
	bh=A5sjZm/+iNIPbsHVbsa3bc3uIBfDVxFWB+j6LzmX1ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEKdP9IyYJZC6XWP8ibUVziEAAWrgP2aE1s+LSQaT5w+kzMpE/VtmF8JZW2Ig54JLhTe4d/lRn0jQiSMhGrOEOkMKVj6/rtWJUzfszGyzGWiFeVJcLWOKYvRhO50DYt1R+Xc2eZOXIIv8KO5QpaYcft8+iw5uFb0Efowgd2y1Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrK+9am3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrK+9am3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so685435ad.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 17:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780531500; x=1781136300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LOOUy/xtI7eFKizuj0bbZPLYK8VSyJoltCOp/sHNFR0=;
        b=KrK+9am3PGxKW8bHOK6s6+nm3HIWcE3Qy5KrZJDPG6UQxZG7ym+1uxUW8qs1ApouCI
         p+WKJErc0biStyiXXwv3hdL5BdkG+PYQWtDDgBvu7f3ClZGB9WUD4DSwgFP7HPYCnh1K
         cYH74GZAhqC0ZQze4htL4MdyuV25XWqg2JQ18tZEkgi1ZFM5kKT486OXrOn0nw3LTs2A
         uOq04Pm9YAppnperOgwd/AhS/C2pz6wvOWEJtgZ7MYhWhL99zfA6yhh8VEk/RmxMeUQ6
         IDC78B9ABqjw16OqXHT0bjag9vTcCeEFrdOYVuFyJjbYGz884Av0pgX84UQMo/OGclMn
         aGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531500; x=1781136300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOOUy/xtI7eFKizuj0bbZPLYK8VSyJoltCOp/sHNFR0=;
        b=qioxwTni/t3vnvAF2F8JDz6H+oYjZj4HEAIu9QY0NA7dRc4SyU709uIQdJ2mya/25L
         94saP642U9zcSScBX9+H0uuUtJTWRag9+dJetyJUoHKwQY8eZVoTNSf9W4BvPjTH9m01
         07st5UJVIntP6TgY9SPKzP1pDUthWQqgIeCnw4xSMjaoAvd2nduOHbP+PkxPM7vgW2lC
         FTmpWi2DnkMm/i6KR86hDmGI5DetABOtSVv8GTOv5eHqUMBGhgCpNfH3ZZ7lvSwTcM5n
         azlI0AW5rGc0/WGAS2YJD+uPjrCRmtd/jYUNUmJuDas4rKPyvoiXZgvbBZBnI5qAdRJJ
         rRpg==
X-Gm-Message-State: AOJu0YxWkWXNT0boIm8AQDcGgExegeGlTKgGNP1wzAQAPJ54VUumNeHS
	vogfulIoJ2ovOQm4wMX+EM0EP2tzUUQ049l7u6mFkF9OH/IRxpcdAkJ/LBWic1ZN
X-Gm-Gg: Acq92OHXdwzGykNrgYq/XaXXYqdX6UjVKPnawADqcorTMhjo/NZPGye3TAkCyfVC8Wb
	4X9eMADakNq4LfIo2QodwcSOTMvtW3c+ySFFA1lizcPyp+Yg5N4AsTgHeePd9XmeQgFXOaxdmXw
	DeRLBeqEMxrzlsBLPz+pyxzikmtLpN7X2Q6audHoOCpp6Wfi+smjDH3l1plwIXbpS5CwGOgPFna
	/8As+N9tNzD96YXE9sN03KgIfoOAXzBeixmJWL0o8m5ep7Cpao7a7GS/PxOu6i2QsBBDRAshMdC
	00pl4jMv1BJWlAeICywR0O3inWtKT2grS3cRz4Z0b0eeL7wNLpDBEl6KIKwQXDOl6J5HPymGC1z
	Y2LkA0zLRUwe3W09driBkjI8AoI4Piv9eHpl1i7URr+vnymCMtrVW+2mvca/HbxFGtXSztfVCh1
	hI7WcDRrQFN3y05Txh/nAwqvbKHTOy0+o6yzDOSo7kiMnrcRupHlYSKM+EDnoHJVVA5H2wcRtbc
	AnFgcPhco9ZjvDI7pKO3r3KRyyRRgwC8jsQP/UbLwDuLw==
X-Received: by 2002:a17:903:3887:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2c1644b829bmr55155425ad.34.1780531500475;
        Wed, 03 Jun 2026 17:05:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa404fsm38852435ad.37.2026.06.03.17.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:04:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: xhci: sideband: add missing kernel-doc parameters
Date: Wed,  3 Jun 2026 17:04:42 -0700
Message-ID: <20260604000442.15679-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add @imod_interval and @intr_num to
xhci_sideband_create_interrupter(), and @type and @notify_client
to xhci_sideband_register().

Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/xhci-sideband.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 23153e136d4b..d892567079b7 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -308,6 +308,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
  * @sb: sideband instance for this usb device
  * @num_seg: number of event ring segments to allocate
  * @ip_autoclear: IP autoclearing support such as MSI implemented
+ * @imod_interval: interrupt moderation interval
+ * @intr_num: interrupter number
  *
  * Sets up a xhci interrupter that can be used for this sideband accessed usb
  * device. Transfer events for this device can be routed to this interrupters
@@ -389,6 +391,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
 /**
  * xhci_sideband_register - register a sideband for a usb device
  * @intf: usb interface associated with the sideband device
+ * @type: sideband type
+ * @notify_client: callback for notifying the client of events
  *
  * Allows for clients to utilize XHCI interrupters and fetch transfer and event
  * ring parameters for executing data transfers.
-- 
2.54.0

