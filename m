Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA638657E
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232821; cv=none; b=pvLwp63acVia7cfwkkIwtBDXaUCenFduP8Hrk6q6uqZeOcauO/MmqR25f1DVGdUJ5XpVIbgxsdDR8j0aVNoM9PwqxXLrmk9ToZYaED1cGp22geKWvBKf5LRnfc7CjTmt8PomkAcZh6iURedlA8J7qi78Mn6lvLBYqZSWbeXoLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232821; c=relaxed/simple;
	bh=fo1Hg4A40prtXvbTJpQwIbWm9AuPnauij3dGDjEgjFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=seXtCyDemQyPGbxVdjMpAjNfe61H9vKoYgP6MX8+fs8bWBDKxO62i4ux3q1XvsAgFqA0ny4qw2Pie7AW1t2MrvQtW7zFuOuaNZKBwAq4Rc8J8eeYrSnZCph9BU+osxhtbieCllIg6c0VsNdMI4LTngiIfBCjhmnvdp0cAmvBsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eqC+tU0z; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eqC+tU0z"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a2dcede83so4946314b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785232820; x=1785837620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNVbJiZIg9bWYtKjgcIObr2+FVZvVS9YUs+1Yr6aAjI=;
        b=eqC+tU0zl6KiqwNJk2kiKvBGIZfSom03kot0wCypDWdCI0gzWu60lANhLLuKuEGArO
         7jaSU5TsoP5FWlNy3IHuUE5VETpQIUGXG0JDH/9sUh/DL+SQK8hLuMk26l0pQ347Vm+Y
         k5RAufNITm7s1Cme6Qp4x6NAkAKXP1R/AityM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232820; x=1785837620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNVbJiZIg9bWYtKjgcIObr2+FVZvVS9YUs+1Yr6aAjI=;
        b=d1NrQikDSLICKiSRUMWUvOIiLLN0Glv7NjQazklua8KLlzNeY4ukbwhdY1SC5toXLO
         +PXFruoYoayX9yfJ6rj3siQy6E5uqlAFx7uCtEbTKPQSwI5B9+waabSpy6tnaeYqbHsi
         LaVyYMYI7CJpbB3WfBakHDo9X+iMWeOUGaq+v/XHkGlvNhRqUXasHTmHzK1GaOApPg0U
         rnJ757NPvKkXD/EC4A62JCO0XboPFCuRfkUzpW5cnj1OXNyUcLcU8m6gHa+cLxrZGLPk
         ZuSGjgPUJtjLyRuH5iDMmVZgDwEmrHmFmGf8r0ISybAJYHhh4ac12/NFmjrqb2Sb9Lax
         Gjgg==
X-Forwarded-Encrypted: i=1; AHgh+Rr814+LSwnJgbfdqO2ftUZUYfDfVTYulLkIltwoZWX6RDc96pSA3DWF8R70uluFlDtWCycNTfW6J0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NGnLhOUF3lbaqCYC/jEnfgp0U0d4VWq+3vaAemzJdd5ls2Yv
	+9ruDXqtTftSV9t9cr5sTBGbxPj3lDdYl2S2isIOcBbaKg416zq+LRWUcI8QUXBdphET+/uFPcZ
	3FHxuMw==
X-Gm-Gg: AR+sD10NTuq+4jTK8GWDT3q5A4QB4Q6WcBmH+iKMr2hhIOP4SeD6OKw4NBJoSeWCBr3
	q/7IghS1d7jPpTuh84iyVxjeyJYR2W4A771f2xQN2n7JBSKHc9J2eM/bkVaiOLvCO6wEHfIcnya
	KeSCzwP2SnYKpQ6BB5B/VHR/EwAx851rF2N/lty/4tDyLJtXNxkvr3mRHkRggAislypkHs/2KVp
	0s5RHKx0bFUl5ld8TTgS5uIMwq/ZXm10o9ihrNzy7snemf4/KDs86pQg9nSZi2bnYVR12TyTzBk
	KmpsAuzaX3HkRtBK44sZ5oB/fEUmJyQozOolBYg+UbS03De2HA3NKEMM6pSn40T0otEc7j/fda4
	txD1LuAu71OmX7sAESDmLJ9Wn8mTO/jpc1n0/jTwQcMa31NVflz0OFjBN8Icrgsep7hmRI/Dxhu
	iEgGEsXPmy7ZYYHLy5F2VTT9U+ojXmxhWzbllGzLwVUdnX9rlXJFL/dBq1L3E=
X-Received: by 2002:a05:6a00:f88:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84e931b4ea6mr1734667b3a.13.1785232819283;
        Tue, 28 Jul 2026 03:00:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e530079f1sm4113113b3a.0.2026.07.28.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:00:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Tue, 28 Jul 2026 18:00:04 +0800
Message-ID: <20260728100005.413868-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves 'message'
set to the default "out of memory", which is somewhat misleading.

Allocate some memory and put the currently separate error message in
it, and use it as the error message. If the allocation fails, use a
generic version of the error message. The allocation uses devres
helpers, and will be freed after the message is printed and the device
is cleaned up.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index b09b43669658..fc4879d9c623 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1751,8 +1751,15 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			char *msg;
+
+			msg = devm_kasprintf(hub->intfdev, GFP_KERNEL,
+					     "couldn't create port%d device",
+					     i + 1);
+			if (msg)
+				message = msg;
+			else
+				message = "couldn't create port device";
 			break;
 		}
 	}
-- 
2.55.0.229.g6434b31f56-goog

