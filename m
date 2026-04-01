Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3D3D5227
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040432; cv=none; b=eqQpthZWHky3/JdoZ3H668nHZX0UXnduYJ+tyHc1d1ol2j0H0qjgyDRPYX7j5DmeVV3m3Dk3JxBwzXagbyQfXHhcoO/1fH2AyWnuygBD51e/84AbAXcvM/ae8AxTHt4hljiBD8iZETobfGuP2jPLLFDS1A/Cxqu2Plim4OD9VwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040432; c=relaxed/simple;
	bh=RpB1zjwaXHUsRklRUhIXHDbsSlZ0oTS3vlqc/OnKIK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuaDEgB9gjk2ZlQ2nZ7u7dm9tOPCkt3W756kH798uHwNqyHEDyjRR7GXYBrO8zw405qmZE/SmqDoS330AjYi3GwgbsQox/OyUaW1kkAW2mlFQlqv71LsRCa+gDMVGQokTizSADfuKwTMi/SmG1nUN7Tk8zVaQjjLZ1xxLoaAB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRaX+DWC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRaX+DWC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so16927615ad.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775040425; x=1775645225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa5HXRdFc4yMekK2BPIApP+BH1L7ADzvbTdkQhArixs=;
        b=ZRaX+DWCMLF6XK6rFY/oVrFYbFzP++xAS+qCilqcV9zRe/908O0ZGe+zENa0o0kwj7
         eC2vUaA1teWntEcQjC28SySs/YMcxXn3vCb7hwdSjrXx1p47FvIyCota6/gM5xKP0RuQ
         XKmWeSm1ykQ7nFDxCU12weiGoCrc0ZzxejRgXeq5M4FcXvbFPfQmhvJQUQIYzkljJ+J/
         NlWz9u/jt+TvmoZLLSWnujKCltTeV+XCdY/HHOH6J5PApyN/1jvnMu1Re0ih12/lmhL7
         fSYsduvNZ8fWg3gO3XIvzma/pvADXxBd8P+Q01aMrV3V+qsJLT2YFsCMyIquCgKgGTqk
         QvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040425; x=1775645225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa5HXRdFc4yMekK2BPIApP+BH1L7ADzvbTdkQhArixs=;
        b=B+dUcHD6Qw9Yc7dB8Ly69RhXiizAfzSV8TRgnVtmt8leteFt+ScJVRgPSMfUgulp16
         aNVdQyX8Q+dyOEtc4+HT4HB/Pe26S2Fs/qdmkX/fCzuvF2rlEhn4vvrIGveOe1vPbMz/
         3fE5JK5eyzSQiZ85JoEJ3Df/1ZeH7Ss1UyRltlDT82lApOtYdbir2PrJ+GpDqWIxF0V5
         x6YC7jiQlop+XMTjmoEuzQNKBECU1DfcrguM9IqM7kzTIyfaR7FYaV/ezvttx3Hk1BF7
         m5rtKwNmltOYO3yw9bTIakcaSnoVodMJ96vYtjz7G4ni0Ifd5kR4DWcpnwGl852zMcCT
         k4Iw==
X-Gm-Message-State: AOJu0YyJpwJFSW+BZGEvTPs8R7xr6UdX1DHCvSX+7+A8aQRDKdcz92Po
	7IFRpDMQOCXMQ1c+M3JVknPb98p63Ln1GMFPAb4rAMb8yx9gIBDKyWS3V3WC+5Ji
X-Gm-Gg: ATEYQzyJGA9VGUzGdJGwalyy6AYLeQoGbxliSWoV7jeJ0Ehw5FmG7aAE5krUfaEFS8k
	BlaGMXXVen4qwS0a3zWgTcjMeyrQxiSr3MvujVhMtn27IaPyUOkKDzkRN+t3GxCaYilSiLO446s
	Puk9KrSrKQXaGYRlMG6oeJO8jg1KECDlvX8h8uNibxARGa8fN3N0gtUUbnoHPRgVLh+JIdFQQyE
	PhGX9LjfxEIbmKqB/sPfx8WPmMLyWwcW9xEncaxm23dI6QCbv4Bx46DZ3mpZYv7AuygElLKEXyL
	Tr8REiNhjXAVeVfETPhryvhSaENaPHYERxk331NvtTwkXsPknJ5iZdBAkynkBKUIcJnH6bgPWyW
	YK9WcmsPijC0GQXkPWVGT8KnoKP3N+jxJaYGj/d695h59cogleFkjdhByPxS1Tx03ozwBj5V3lk
	uq2ZYRNOcgcMiwq2KgCk/0Xfz71gFkGqojVIua
X-Received: by 2002:a17:903:904:b0:2ae:57e6:616c with SMTP id d9443c01a7336-2b269a80ba6mr33070995ad.3.1775040425448;
        Wed, 01 Apr 2026 03:47:05 -0700 (PDT)
Received: from localhost.localdomain ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm182439675ad.19.2026.04.01.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:47:04 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH] usb: gadget: f_uac1_legacy: validate control request size
Date: Wed,  1 Apr 2026 19:46:11 +0900
Message-ID: <20260401104611.3375330-1-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_audio_complete() copies req->length bytes into a 4-byte stack
variable:

  u32 data = 0;
  memcpy(&data, req->buf, req->length);

req->length is derived from the host-controlled USB request path,
which can lead to a stack out-of-bounds write.

Validate req->actual against the expected payload size for the
supported control selectors and decode only the expected amount
of data.

This avoids copying a host-influenced length into a fixed-size
stack object.

Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index a0c953a99727..6d6fe5db99f5 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/atomic.h>
+#include <asm/unaligned.h>
 
 #include "u_uac1_legacy.h"
 
@@ -370,9 +371,21 @@ static void f_audio_complete(struct usb_ep *ep, struct usb_request *req)
 		if (ep == out_ep)
 			f_audio_out_ep_complete(ep, req);
 		else if (audio->set_con) {
-			memcpy(&data, req->buf, req->length);
-			audio->set_con->set(audio->set_con, audio->set_cmd,
-					le16_to_cpu(data));
+			struct usb_audio_control *con = audio->set_con;
+
+			if ((con->type == UAC_FU_MUTE && req->actual != sizeof(u8)) ||
+				(con->type == UAC_FU_VOLUME && req->actual != sizeof(__le16)) ||
+				(con->type != UAC_FU_MUTE && con->type != UAC_FU_VOLUME)) {
+				usb_ep_set_halt(ep);
+				audio->set_con = NULL;
+				break;
+			}
+
+			if (con->type == UAC_FU_MUTE)
+				data = *(u8 *)req->buf;
+			else
+				data = get_unaligned_le16(req->buf);
+			con->set(con, audio->set_cmd, data);
 			audio->set_con = NULL;
 		}
 		break;
-- 
2.43.0

