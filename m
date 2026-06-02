Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596C2765DF
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433142; cv=none; b=hZgn0DnebGCt5AY/2FPOMDP7FOnnFrxtYEeR4D8ywwyfpbHQSphoew+ff+UF0qNqhOhjtpsXgIhnqrfE+AJXtWhZ39H0FkhUSXWMZUHYqw46u2/CI8er1ItlWyZDhS7MLF7Jih2OiIdChlPxk3vD9lcA5uJBE5zcQsgy7lrCSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433142; c=relaxed/simple;
	bh=wClLYuUGri5iXNd48EDjMfeUnOwYhJnSAc6eGu+Qe7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqbHlRIplSRHXNCfH4z+7rbdtDuKofmSUNeRQr9EHyIY46AExFcJ2+HBUv+g0vsUfgZUl3/oLDXOTzBWs6XivP65UY8+blYQOUmw1ACI2Zt+IJ1qw65xN1HNLOiZKHwWNpjU91ba0rDxH+X00mqsB8oyzt9e76Vsffpxsuy0xKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPXQ0wX6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPXQ0wX6"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43b53f048beso8996836fac.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433141; x=1781037941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVHd7PYyJM4fCDZAfkCSR0NCftGsQElbGYgwaw/WOPw=;
        b=pPXQ0wX6kVDf+usFDVJuqqfh3kDGvElN8xi433EAQnjypEdujCo7x54jFCFKFIEVcK
         eXImmvGqdbAlLI/mUxwyxE5g4G+Za3bPymU4K8+vl68iMqg6XRhl9yQLYata08qtduWl
         jMnzwcDpc6gMJYMwMZ762sLw2PpLxX8gxcYELXNkYA7j5IPnoHKJh/VGSFw6erGqVTZW
         RFqQ21bd/kqh6CxLndDoh8haZtCO1Sj3sNwU+Ubn/qnxTrXwqbraT5HmlQazY+jc1A3P
         +ertQ5PLS3OgyN8kC1bEXwo/qOkClpswzBgRoWBNHXcMVHWZkOZG2hX+9bcGkJtBNlJU
         3sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433141; x=1781037941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVHd7PYyJM4fCDZAfkCSR0NCftGsQElbGYgwaw/WOPw=;
        b=IdBCXwSlGWDFwMtuf3Muzv4DdW5Yc1VoopxLKOj2AFRzU2X4lvly9ixdfJZgeru/u+
         ZgYehdQt/cIpjdrEV+Cp6xKhee0ExCtQP2+K7zKlk2xs5u+I/QGcBQ6nE/RhxS/EJptz
         dDT8G9TYmS4pYU3ykoGnqq4uNtRbSQ40KEdoBa6bKdrVQzcEgQ8ZgDxauWoejOtLDDJv
         JdZ7rpi6m1pqEWcc7bZOy4wrq1CYD0v2VMUHWl/w6cH9jUFmGWzpGA4vjuJMg99FsR6m
         fNlJvKU2iHaJCb4WkdQd+SyUB/sHVNe8mYS5CI7dfCVZ3AxSeJDUYeklMX8g4npJsO15
         WHmA==
X-Gm-Message-State: AOJu0Yy3skHc8o1BvnSLO8yNo//aAJMPBaByqI7d/07xS0K5hz2vnOBD
	39av6sKCnZLNnk8raoUySNHrlUQ17Q5hPBeE5qN/YBaSbIEX5xNJwFVc
X-Gm-Gg: Acq92OGbpJF58128hVZW3Qx5pwW3OyHnDSFNAGHm0QRutN7VPWO6Se4/kjGaYDv3zpV
	A48oFeoIjguRzZRqQi+PzhEvWNPGwYu6Bpx4S1NDsoEEeCbrzPGTrzIylXRI7UTTSnUPyB4WxA6
	1PlSe0V1L+HFc7IlDQ3/suRZ1OUDvEENLJk436M95/0tnvyuoXLykpnIk+4NYavPx6/LxqcrMAE
	hwvOv1wwGX3npXJVARVFYlkZqm4pXMGf6fkgivQLLLdxHqzFn4TBCzVvSg1mZuHjGdbpHhlSTc4
	RMb/A3RJ+0n3gA81tPjcLdhmgpkRlIF4fFHB7fMPOXU58KxQjnYbF7U8KLdbZIsKhb4405AHOv2
	jh5ol6n9vIcMblSGttoy5br7DkHjWqESsKqmJlujDrDslGBalsbfT/2dYH/GYU/qe1Ejfd86ABS
	fq5DXKUJNUVk+jR8uCkkOlqreMNDF56rYCOakA0qBR
X-Received: by 2002:a05:6870:9728:b0:43b:891d:7c89 with SMTP id 586e51a60fabf-440ddd91edamr172119fac.11.1780433140611;
        Tue, 02 Jun 2026 13:45:40 -0700 (PDT)
Received: from af-fff5r54.. ([50.169.220.58])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7b79ad4sm780168fac.4.2026.06.02.13.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:45:40 -0700 (PDT)
From: "Erich E. Hoover" <erich.e.hoover@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	"Erich E. Hoover" <erich.e.hoover@gmail.com>
Subject: [PATCH] USB: quirks: add NO_LPM for the Samsung T5 EVO Portable SSD
Date: Tue,  2 Jun 2026 14:45:08 -0600
Message-ID: <20260602204508.48856-1-erich.e.hoover@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung T5 EVO Portable SSD (04e8:6200) exhibit two forms of
link instability when USB Link Power Management is enabled:

  1. The units fail to initialize properly on first detection,
  resulting in a lockup in the drive where it must be power cycled
  or the kernel will not recognize the presence of the device.

  2. If used for sustained operations (small amounts of continuous
  data are transferred to the unit) then the unit will "hiccup"
  after roughly 8 hours of use and will disconnect and reconnect.
  This has a certain probability of triggering the first issue,
  but also causes mount points to become invalid since the device
  gets issued a new letter.

Signed-off-by: Erich E. Hoover <erich.e.hoover@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87810eff974e..80b61a799e8b 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -296,6 +296,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* CarrolTouch 4500U */
 	{ USB_DEVICE(0x04e7, 0x0030), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* Samsung T5 EVO Portable SSD */
+	{ USB_DEVICE(0x04e8, 0x6200), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* Samsung Android phone modem - ID conflict with SPH-I500 */
 	{ USB_DEVICE(0x04e8, 0x6601), .driver_info =
 			USB_QUIRK_CONFIG_INTF_STRINGS },
-- 
2.43.0

