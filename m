Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00553489888
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672194; cv=none; b=kxt0wRxj46TSY3SO3+J8MSM/f+WFgGa9HSmAprXwH/s9P73p3ewXZxKD8sOgvv7PGX0mHCRjZG46JNCPUqkTY6w623AVhHpzR7g83aMkoG9JfipHO5M6yfaMMJg6Xa2ld/Uid+Y34Gn328JtUfkGKMXlW6gHFHtn2QNPUFERY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672194; c=relaxed/simple;
	bh=nODzfVIY+u+U0NxjaY5Q0k+xT6ktqGXokwVSi2oGxZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ho0W3rKVvebiBiFKoabcWreVDN3g65gtgXWmn7ToPXNmfo1hX2uaSvpNqQBxg8T4JmG5h9c46FgrGKIPrgU7cGdFo2F5cZFDG1awZHXbzsGBVpBjL4JXiqSEZ4n2cBgj53cNqozHAQFQlkGLyV3JQi2VC6+VNecLZV6Aq/Av/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHUFEzx+; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHUFEzx+"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca7c1176317so2201261a12.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672192; x=1786276992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4DPRLOqD5LujDLCSonnI5RwX6dJtVo8ngpLah2ku/I=;
        b=XHUFEzx+9vXGxmGjyHSeaRrU2hHHG9J8Ldj+VKgnxzliaPYnxHvpWIYTbRNm2qDgSd
         BmLPPwYDTOTNadIV08jESjXVRNQ7G29n/2ZMcxRrEY0bMmh5xlJiPC11YgPDciGjktXq
         nNUfhPk/0vuSid9eYsMnxyMmvvchGUznY63ziOn34KO997bMgKt2zza1210h90kGgfGb
         tHuXcV+2yqaLXgnvr4eio0aV4pLOEqByiEFnshDWiHxkCrDfsGzPEmTO+yfg9hCiH6dm
         2o8aF/io+vFvd/4zmUxWucPigMRmI+FL8n5O6cYUhvbDqPttrRM/I9+lyQP3Dhwhby0b
         erBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672192; x=1786276992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4DPRLOqD5LujDLCSonnI5RwX6dJtVo8ngpLah2ku/I=;
        b=OtDkpjZ+VHZVvqd7VV9fH6zQSaFiui5U4R+Dombi2lv3Nj2g4vp1cgGLFilarsFw2c
         nQ0as6Qvx1GrUAO6MEz3HhAbAlB820X/6Ock/pj1p9AEx9/0SgZngGekx/ouXdwGvkhF
         M4y+WA3d5KLPFMN2q0ptlB5AWBvkm+FhEw/aDEfj5hN9VuMfWJygJ+jSrCii0PYfvgS+
         U/VcgtuG2YNoJYcjo3jNYagaxYgp/pqprVOPuy2z0TcnJBudeD3/wYu5w+oQkxDHknPo
         K4L2b4OaiSokLB6nfaPcrLKGikOurq7ywR+ckMIJpsSD1BUK0hqdPamQY+tYia8FE+6V
         21QA==
X-Forwarded-Encrypted: i=1; AHgh+RrIokqmubqRcO9cl21amPkz4yvCVC67r/v8AIrpkANz13Idb/6TStd4+VUeECgcLF/xZ2tON6fC5lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPF1tdwCjwXX7al62HLI6S3G/Gc/XRzx9NCpnSKikE8hT0HRg
	YSW5WcyFEzGV5cjlIpDYgE8QzpsitwdzaqrVPtUcrQXmWfZk0V2x63rB
X-Gm-Gg: AR+sD112z4cIh9Wced9DzfeO38OgU7yiVLkF39af4dpm0S/fv3ZNbknTflTQHmnU52T
	R2ux0ezZSvJ2mH73HWDbBI8F73+li2Uan49ol3nz84o94DoFR4gL2AGAO8+SvGy1jIJUkzSNZye
	O9MPeFEPnJyK02FzDDS8/cjJB9n4u/Z8r+58NvKBuHEvQihRHBvqTxQkagzvM/kcG4s+xO9Q1wo
	71tjUStq4RX5cMd8C50CHzSL/+YWcOLz7Y2xy517dqHdUbJ/kr44Em6vFljdiafOgm9mSu0G9P9
	BJEEseuI+RhFCz4aMx+BUVyag1Tczpy94ZNeLkNIUJ07X5K9DcuDMd8chzDByzZvvU0HGOOT5U0
	T2P32+b9bV2ST16XFtD6BQwM5z+JCaoCkWL6rvIBFiCOltGf9aIdSGMiEQ5fih4xt5zjKYoSdL4
	3nVANh/4RfT9Fhkmp/61lPkFYghiv9CFsXRKyPqPsKfxX/zNFsqkRPp8r3xdq84+S8atMIYOM5T
	TyqIePnR04=
X-Received: by 2002:a05:6a20:3ca2:b0:3bf:6c08:fb93 with SMTP id adf61e73a8af0-3c92a8f133cmr7448956637.53.1785672192078;
        Sun, 02 Aug 2026 05:03:12 -0700 (PDT)
Received: from Linux.tail44a0fc.ts.net ([115.96.219.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm25202018eec.1.2026.08.02.05.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:03:11 -0700 (PDT)
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: nikhilsolanke5@gmail.com,
	Ishaan Dandekar <ishaan.dandekar@gmail.com>
Subject: [PATCH v3] usb: quirks: Add ShanWan gamepad to quirk list
Date: Sun,  2 Aug 2026 17:31:29 +0530
Message-Id: <20260802120128.38302-1-ishaan.dandekar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71
EPROTO error during standard enumeration because it expects a 255-byte
initial configuration request. Add this device to the quirk list to
use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.

Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
---
Changes in v3:
- Sent as a standalone patch instead of a series.
- Dropped Nikhil Solanke's core patch from the submission to avoid duplication.

Note: This patch depends on Nikhil Solanke's updated patchset:
https://lore.kernel.org/linux-usb/20260728195158.65162-1-nikhilsolanke5@gmail.com/

Note: While these USB patches keep the device stable in X-Input mode, a 
companion patch is submitted separately to the linux-input subsystem 
(drivers/input/joystick/xpad.c) to ensure the device is routed correctly 
and retains full haptic feedback and functionality.

 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938..b1e7e6071 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -589,6 +589,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 
 	{ USB_DEVICE(0x2386, 0x350e), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* ShanWan Wireless Gamepad */
+	{ USB_DEVICE(0x2563, 0x0575), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+
 	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
 	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
 
-- 
2.34.1

