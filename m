Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6137F339
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221373; cv=none; b=cQhKYjjk8QsvH9MJgGi8fd62fq9ya4XFHDBmrCpuodOsYfedvVIwD2bUpOPjyFV+K3VIrlFiQ6v1TmyG1lmLhC3JOWAPtwMSpmETWw9LXXh6YHPYoyFtROnyAa1Q/6iYdugeW48soZW0usWWMAMKIsbfmxoISLAPEFGho5FX1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221373; c=relaxed/simple;
	bh=L7Qj0R81FVetP/4gVv5QkY4ivQKBZys/aLRQObP1Z/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdUfoa6vT9IMu/WBtbECwwaRiVVH67WpjH90Vd4IjQ7Bi5aiqiKv2bPB+ajvg+7YM6Mr/x3BRV0aLyEGaOHYP0CYeooYKg1tgWzlF6T/ris0IMljCLbg9IH/TxpfH42HJzmv24WwBbESJcGu9FNdS3JsX5l3vcTdSGN5JLfnDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/U9HuQM; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/U9HuQM"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-910537b51a0so11842756d6.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790221367; x=1790826167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yFANMoCUp7JOoOigAwUOA4gmgxzBSM9RgfKkSVfdaA=;
        b=i/U9HuQMuFeimXCIazXolokMFgaDQBJRwNBVJfgOa2zxMRNeh/D4moi++3s3gvdKBE
         4fUI4uJE3i56Jj4pGNZq0dhw3HNJxIC1YaPem9yZASOGbW2HWsetFQUbvuz5h7JjUMfo
         hnYlg7GtULycFTSVmDYdEiEoXP35W1NKMl8iC4J4BZqkcnVmFUzYgUilwIP5+vQb+uR0
         PArP11Hm+dVzs2na91uVH32oypqf7ssTT8bD7Xa66YsN/36HklG7ZbVR2aAcSds4IxBq
         MeNHLeG1xmtxmGNK0A8nYApE/giapcITbABmjLqIPcRqiSmh1RGfsTxw6MNJ38+upTxv
         Elfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790221367; x=1790826167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yFANMoCUp7JOoOigAwUOA4gmgxzBSM9RgfKkSVfdaA=;
        b=INSDi/kmfstsXZl+uwSYxbNjOkNVXkcQeVAApyjpXPEf7VBQ0kcvyZ5Jfg9+M9AKSs
         JhdRGpJlacptF+LI1GfTTxTRX3Udl/v3JJGVGZ62xDuCgb+UgxXRqkUwiujk8dBF1Wtp
         V1QRgtaW4qiZsrDGRx1yrZP0V/dNiDagIiZsai9q+ZewsZZhigzUMD6PAjDK4S4s88MP
         D6uQAy+6CqrWHaWXz9gndb3VZwWKgiNw/nr7RSLk+ADZGlf1P34cRfhg+AZ39Zbjnw2W
         Bhqbf6t5cAzSVwjaddMMtzMz7qOJTUQBIni6lEXM2PRM5CDkFBG17l0ZD12gCKaSBFUK
         OkLA==
X-Gm-Message-State: AFuF++mSusK4qJLT+GxOi+U7FjeygB3/F7qVaicmoT0NHJi1qzds8cG+
	3CUlUsAuADIpw3xx+hlpaqKYA/YY0CVs19iQjnGxXqAbx4KG9HPoH5eG
X-Gm-Gg: AYBFou3wAvp2lp8oWPR0cv20G+iFISa1My/1Z0SCFJbROCXq387l77rXDyCCvTxHgEV
	MSH/FuoriZ3ScCPIhtj/Ss2Ez2tVqA/SI0dljccQjUqgvottuVAsz6NPa3ALvR9ppvzkaT/QnBW
	meQYyxfLmclV1DZZ82qY5dB6QiFcb6BKkqTNgEFhdwR+ilZHGUHWK5jDXH9IvhfLnoLVgAiZGKD
	io415JP94Jqs9rHqSqqIi8KBc5e0QGmm05OF4+3ULU98KkC4fQu4LHXuqWTMtqEN8nqJfvbwUtn
	Dhn2ajOyvz056u0x3tfcT/YDphLc3GRgjukvNQr1c/xUiryHPhTl7R5gtXpGAq4AYL2nlsaV1dw
	dPlSmGmEHTYGL1Yisdc2y5S7sPueAlk/sanM4J5Yp1niKvux8VwV/La/a+XhARxCeEECBMMfXr3
	1iAoWN6KVbAU+/5SkwHC2y06HVxkSKIoAOJCCoITOpurrhebuXwG1Uv/8tXkNGfdeR4Laeajuzz
	6E+o4KbYk035Syw5559YUODeHOT8vqSyom3pw==
X-Received: by 2002:a05:6214:4b03:b0:912:517b:974c with SMTP id 6a1803df08f44-91421eefa65mr5437166d6.38.1790221367421;
        Wed, 23 Sep 2026 20:42:47 -0700 (PDT)
Received: from dhoja.local (S01067483c248479d.wp.shawcable.net. [50.72.244.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e2177f0sm8229836d6.14.2026.09.23.20.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:42:46 -0700 (PDT)
From: Curtis Vogt <curtis.vogt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Curtis Vogt <curtis.vogt@gmail.com>
Subject: [PATCH] USB: quirks: Ignore wakeup from the Valve Index HMD hub
Date: Wed, 23 Sep 2026 22:41:19 -0500
Message-ID: <20260924034200.421686-1-curtis.vogt@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Valve Index HMD's onboard USB hub (28de:2613) asserts remote wakeup a
few seconds after the host enters S3, so a system with the headset
attached does not stay suspended. Observed on 7.3-rc2: every suspend
attempt returned after ~6 seconds with wakeup events recorded from the
hub. Disabling wakeup on the hub through sysfs allows the host to stay
asleep until woken from the front panel. The headset most likely reacts to
the DisplayPort link being taken down as the host suspends.

Nothing behind this hub is a device that should be able to wake the host.
The headset includes a radio, microphone, and a downstream Microchip
USB2744 hub.

Link: https://lore.kernel.org/all/20260910170254.833871-1-mario.limonciello@amd.com
Signed-off-by: Curtis Vogt <curtis.vogt@gmail.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b931..7ededf8d9cfd 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -596,6 +596,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* ShanWan Wireless Gamepad */
 	{ USB_DEVICE(0x2563, 0x0575), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
+	/* Valve Index HMD hub */
+	{ USB_DEVICE(0x28de, 0x2613), .driver_info =
+			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
+
 	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
 	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
 
-- 
2.55.0

