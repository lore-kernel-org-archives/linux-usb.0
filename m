Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132D33C195
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798470; cv=none; b=dSyzDfyxg0Smk3Dvdex2Vj5mW6ykVxe3bUJwvbNlgDgLeXQJ/5u2KBXVijqRU1e9Eio7uTSRBACiTp/SJtl5Uv3Hij0zgloEMC8WBgF4uVg+FOfIHbXmBfpjzYCYOFKZjsAmwlHtoYaEIyIcbUoZ3ye14gw8B69zTy3B7ih+4nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798470; c=relaxed/simple;
	bh=ODrTdiGYgh7o202WByNUhArA7o64gVxG9AhBg1gRdZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RlB6TdLP5anwCP6EX0/iBZvSDEbxAD1dhCRY2OpICHzWPt3bqlR1F3FW92YcIKsqNZBpBYk3cshLJpF4K4lRbNN6/9YT8oBWqvuxxkaGCNDklC8EUhuPm9Fo6mz6UiNLycrWvfLNf6WCAO5Cdb7iUCponUv9JJkEeAsdxzc100w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XehhJ8u7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XehhJ8u7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so14136455e9.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798468; x=1792403268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sqQN1mlZVLGzemjsWwopzJNi8JFqqGRYORri3i0CIoM=;
        b=XehhJ8u7BWXnh/jvOSLRz+QQKD0gy0d+m4fW5BEmwM7LlG6dCfItMh5vE3/inKQz/L
         054iTsn46GIwMJeezbsr7q3vcCuzfQh4zJugOXnTtRV1RcMp4ScundyNW/vNRuIe/fNh
         sh3cByG/cXwkaYl15UnXrv0SIHaSJY0pciQeeeLgj3Msv8AoZtz1yPxo/LO+Poul9VlU
         8Yk+jEUqciwvZvv92QVcxyBnVA8p39Mb7LZUZJ+jsEfvLogtZFfG18rQN76XADdg/buW
         C+ryEHUibLQyPk9UvWqFAlsrzYJ1xI0WFgiJxLvW8lqFoxYhvput+Kb+8TEJOmVh+Pyu
         udoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798468; x=1792403268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqQN1mlZVLGzemjsWwopzJNi8JFqqGRYORri3i0CIoM=;
        b=ZR9+8PLZTnIQuZD/PeeejEtvL1fwV9yip6fg9abrB44+50NvAHio3iDg/KjTZu7rqS
         h1vNrZsYJ1i2jh6CJxjXLZwnjs6WkaAyQsr+jcdtXS7eGlktCi/Ulrr1oaSPzO8LMSaL
         XLs41mun0taFYmwJJog9ehriOVe5hJS81ZLUqMK4vEHfqi9Ya/wzy0vxqgoW6LN5ordJ
         ZLVEtQKPSd1Ya61jZh01PiiUOKFB8G6GvzDk39YkrmUBV/FR4Ni51Je+mJ/qE8N0MU0N
         asdK2DrbefnNJAA5hUff6F8HHkpHdBRrVP0nJnXfykDvKMOQt2IeojAgtZK+kKcZ3y6O
         QFJA==
X-Gm-Message-State: AFq9FYJ0bP5UChz3L6MatBfkGpOB3176IoVGS1Bupbwi6NhqSA0fhd/C
	cIOgd3PGvvhpdiVlDf6AK3wQFyc7S3HR5qc4jXsz41FmRfyfOCQSTdxP
X-Gm-Gg: AYBFou1zU/dOT5h+ss+RZkM6tT7Tp79gI4+meqStVYGvVYLT8jV2RlohrC6Yab7XJoz
	Dr348s9dyKYCxq62BdCNmzaUW4FwGtByaZBzO8CgNZ1A1W+gKBjVaqMnfB81/qLBHWGAnF88AnV
	Oqsbj/DxHuyTbsBxRvqEvfIjAmxF8IFtdPh2QJJogBcBzRbDg8t44o+xYwwQLm55v682Y9W16dj
	6hLMz69NOA2Yif0pMK7d+qGmU7ZG0YklXQpwVDLros6hUTZ1bBCoG6pjO3qW81rf1NUZSdI5XIa
	nYvbCZFJdq3TxbLdZVHkVj0mYxib7OxA+va0epRWo9tgoTGGaDzayzUiAQ9ywuxMygZv3x3LKCj
	xg8T1Chn70RU42gLT7BZUW/JOssjd2uuDoiMCufWqQ5bQ2RGWhGqKPIcyxs1bRW4mKw1Db+vP6p
	OVh2UektzJeUL8ysEk/8e0Wqg1caEMybmVMnB9yBKPB+MiHZxufMpMR8gUEW2HUPpR1u9qNqJeZ
	TsDHiuwhHoH1tp8bHLHJadfWzOMW0HRmCfuVaI/nQGen7c7nFW4hBVQa24=
X-Received: by 2002:a05:600c:1908:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a18e4dd018mr169410895e9.34.1791798467323;
        Mon, 12 Oct 2026 02:47:47 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm300025085e9.14.2026.10.12.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:47:46 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: cdc-acm: add control line state quirk for Telit QCX216 modems
Date: Mon, 12 Oct 2026 11:27:30 +0200
Message-Id: <20261012092730.332531-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add control line state quirk for the diagnostic port of the compositions
exposed by Telit QCX216-based modems, since the control line state
requests prevent the modem from sending the diagnostic data.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 0d3f815b2f1e..c07b21872d19 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -2039,6 +2039,18 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x1bc7, 0x0023), /* Telit 3G ACM + ECM composition */
 	.driver_info = SEND_ZERO_PACKET,
 	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7020, 4), /* Telit LE910Q1 (RNDIS) diag port */
+	.driver_info = QUIRK_CONTROL_LINE_STATE,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7021, 4), /* Telit LE910Q1 (ECM) diag port */
+	.driver_info = QUIRK_CONTROL_LINE_STATE,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7028, 4), /* Telit LE310Q1 (RNDIS) diag port */
+	.driver_info = QUIRK_CONTROL_LINE_STATE,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7029, 4), /* Telit LE310Q1 (ECM) diag port */
+	.driver_info = QUIRK_CONTROL_LINE_STATE,
+	},
 
 	/* Exclude Goodix Fingerprint Reader */
 	{ USB_DEVICE(0x27c6, 0x5395),

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.37.1

