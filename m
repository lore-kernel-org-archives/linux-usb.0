Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198C38D6B5
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761818; cv=none; b=dMvixCPjq+dwWvK8xYrafFROmu7WiVwMZqsFO4PI9lsRPx290AeHmJ7wHzqKmg1Z21nq2EQvlreetSnS6Ykn66M7N0OlbFJoBQdkisu86CFCDtJbGRLUSClCxUEp4EED6ZKUFqeZ3uXprLfPbRypc8epuEiz6nV0x4fasksTI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761818; c=relaxed/simple;
	bh=2Ae1jRtghgPaGN2UHYqG8mJ20F+GbcUv2oPTJOvKQy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bi5i6ZA2GIJG0jtMJtN67sgETD9b/GKyAd93xFo9cngdJ+zaPeQicDl9fUXnT7/0qY4WuKtB+ShIC1aVcdUdqxarZALqSMyuHL8k3zZCOZp6sHILiF1Pxm5+MDdErKn0tf/5iT4RW5b1ikr0dhkH0QQwspYqJUMi/XjOIUpQOV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk5lzM3D; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk5lzM3D"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso2640469b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761817; x=1789366617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hi27yZwUlRMd5wmQWRr4amOPzug6ZfBzyooMoZpHt5g=;
        b=Xk5lzM3D5+HlpAYYdFuG5CiOqZybQl2+G/2FbWN4Ho4b+xOvTBol2PjXRwTCZnweiU
         1a8azQwigcN1jzrqniifo2TTYKMXbC4lNaIG6OfEmAnUbEgR2YHZQ3pCUQ4wQcIj2cKT
         7H5FjqZgxHcxnNbAmRpCSKJX+xzInOW4POF4jFtK7S/CfO5/sSBl3SimOZ3Ft9ZLKP3o
         zNAoB8I3VuXKI/hQCPExal9M7S9/wE3eWG6pKW9XFaNwmDfkY7GJhRau11OZE5NfoTk3
         waPZu2I9hzsYEzwkIOaKGnxD0hvMLVEOFA/SxesV3eR7Pw3HOq9HBzXRAdYpxqviv9jp
         ZuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761817; x=1789366617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hi27yZwUlRMd5wmQWRr4amOPzug6ZfBzyooMoZpHt5g=;
        b=sxJjIC508mUkxx5BfofwE/vSH17BmcxRkSu8U26twm8CEd71XV7KyvVhpv827jtnNS
         Pr9aoc+3GsFLRS4tTpiXJoJit0T4FtQgstBmXoR3/njTfkGt+HY3Bv3h7TFk5ZHCTLCR
         2Jh+e+M6yl7lX4JVtqEmz0Vj+67XLTtkPfg66cG7LES9AHllc58t3AlBd4e8LFL+4QIj
         Ezv/Ue8Hht4qGBYH1YsvBQkmhmdFDGPCyXNb/nNH2akcr1KP8jrKiycVjCqHTqaRoFtx
         xve8K94isVkhkVnCVR/M5SuI9I8ql8GlHTitvjDUOdos2J/Jdi3NXNMyiSFNKOwmiYfY
         C0BQ==
X-Gm-Message-State: AFuF++l91jv9qPAShVnPYcmL5broZcgfV9QF3PZdcyNnub1BNpVJyPU9
	JnmfVFCzDveNH+962exN0JMDMWqmpI6jkVeljY8uwt2W5lAlT8u2BNdN
X-Gm-Gg: AYBFou1Eo4UgYqAxG0cmdTD7ps3DtmWwyI1bkv7pnxuP1AhuQQ3WeIdoHHH9wDc5XxB
	c9LBsepyek6vBrsZyXb/23NtqjguxjS0WARW079g9hHsPQ6Yi9JlXTm7JFzezXB84xfpnrIkLaa
	SLvFl2qgxtGm7IkqYm7noZ5J7hUT4+muSKMqSrZXOTWnbk89JJwcqwFlewNe93GYBeedE746a/Q
	iky3/xrgIzXSrDmIlc02tgTQbLpxy/bHY1HwsLows4uxJLqUZFZgl8R/F41Smm3Gmpv+yzRKSwM
	4sRhZPA/BHEf7TZ2U1ufcZeorVvv6LNW3883+PSmT05c9drGrYuXi6+apVKxcxYM800VlOqhDzi
	/l5iPoyICd8HOUND3lWl8Ooh+godIjcmfUUA+bqSXTf+9ugZWenWlwWkfisSS+EkLWXquAUWGt5
	VUAcXwc/a2a72qFQXRonByPBTViMu0Npr2hlRDT4L/8qc1hAzk3wKvPkTtYxAhRsDZ/O6nUUAQg
	TjW4fQ9u07Hbg==
X-Received: by 2002:a05:6a20:a11a:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3da39b57f72mr33355649637.2.1788761816789;
        Sun, 06 Sep 2026 23:16:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm28510117eec.21.2026.09.06.23.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:16:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: chipidea: fix typo "binded" in comments
Date: Mon,  7 Sep 2026 11:46:52 +0530
Message-ID: <20260907061652.38637-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/chipidea/otg_fsm.c | 2 +-
 drivers/usb/chipidea/udc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index 929536dc96ec..642729893cc2 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -705,7 +705,7 @@ static void ci_otg_fsm_event(struct ci_hdrc *ci)
 		if ((intr_sts & USBi_PCI) && !port_conn) {
 			fsm->b_conn = 0;
 
-			/* if gadget driver is binded */
+			/* if gadget driver is bound */
 			if (ci->driver) {
 				/* A device to be peripheral mode */
 				ci->gadget.is_a_peripheral = 1;
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d52f89489893..c29b2d0dcc7c 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1862,7 +1862,7 @@ static int ci_udc_get_frame(struct usb_gadget *_gadget)
 }
 
 /*
- * ci_hdrc_gadget_connect: caller makes sure gadget driver is binded
+ * ci_hdrc_gadget_connect: caller makes sure gadget driver is bound
  */
 static void ci_hdrc_gadget_connect(struct usb_gadget *_gadget, int is_active)
 {
-- 
2.48.1

