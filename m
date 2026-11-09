Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202492;
	b=p1ooCDfMtOZO/HWlHvpy6ZZ2eiCJ//MnEcrbI23RLF6+VXeBnS1wIccp7KE32uodJUNo
	 MlDZCNSYX5R5NKGuV9EnaFNE5WHYn/q/s4oB4pvBTN38yxTxwpEbKV1PqiiOiwnohR1Kd
	 WogwOBFNNcpblWiWUEO2JixGpq7cyCr0klEIItYv4KLROJi0M+76Wa7Wo5GMFjgXopMLw
	 TgPwBPAJgonunXrjOrrKotgHxn0MgUM5RvHoMMzoN5E46FzftsOUC2X/repsOVa/lKyvf
	 jH9nIx7ix6SdhYi5hNF1cWtOchOPRwLVGa3+xLOMu8lQQ/q6katfOf1T8oT1X8koT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9QM3E9R5h7QQhJE/VBUjkl+y1gXEpwwAkby8JdqwMUQ=;
	b=eo0STo6UWKBHyJ+gA2sHyXf6SljuVytBgkKxkca8Q3x1Jaf+fJo5wW5TqQ5wlJ3uZzpC
	 xmj3e/56nsrHtgZOoIcM5l06AQftm8hWpiAPoG1i7/dao/JeLeMUtmHa9bBqAKQXT8mbf
	 QU+M1W03pS51b2VUwaqpOeKEn7IxqTsQKCNTMZWWoJ7IaSNCGd6lZxIvqm3nlgV0w7ZH4
	 0z76eRa07C0zaJcd80sanOYF9cSfMwsbl5MRfySzOAf8gxswkMPH9m/omNOIHz3e58Ntm
	 gAV6YqMD7pDnsH+ijJLItrEP4JN5OSoCLF8sUTQRTUhWoPBuw1k/YUP4JuvBKY80Vwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0Ht0KGy;
	arc=none smtp.remote-ip=74.125.224.134
Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D600606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 05:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D600606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0Ht0KGy
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-67bfda43022so257438d50.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 21:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202491; x=1794807291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QM3E9R5h7QQhJE/VBUjkl+y1gXEpwwAkby8JdqwMUQ=;
        b=R0Ht0KGywlqdHOHp7SpQJR3NubGm/jPBw7A7DRxSaKUoN4XEmr8szx/IYpgF+1gUYu
         NouDl59PhZuEzCzO1M8GuIsB+QxEGLSxyBj/9efVMUPt3i4p1VCBafHz9azb/ljQ5tk9
         kfJXXnXCkqLvmRUZ3Ylev0WMcTLW8tgijdG4Lcfrp3L37bmtgjCA/61EmMjcTLdGfGxD
         Qd85fEzKulXf35TOqt9ZGMUuKPhis0FtO+z33hcICMRPaQs0ek5GUE42lQFCLNJb6d7m
         Hk/Rr/n9xW9VRk34VpUXgUZFtr7eR0gs5TyXw5CcXVV088p7Cl0zlDHASUmDZSolAb0i
         x4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202491; x=1794807291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QM3E9R5h7QQhJE/VBUjkl+y1gXEpwwAkby8JdqwMUQ=;
        b=SmPeR5TADxFyDGTKifh+XPMdoDIT8LpoktAj8reWK7uTDomJnjIJK3v+d8/5k1A7Bb
         WeIDSMEzYe/MLm2eCTxLBkbuS9tR4Ha2qXJPQJV1Pj/5BMKD88zlPg4MuUR1QiYvj2KO
         vOR8zC+zS3g4ZIO/zHohwFX0xbd8a/YRtMYGoKHQ7e7vhABdfBnnQQF9xoLk9mBbVRbS
         P92WwGyDJ0nel2AADmFxU7DPLkOksH7GUGo8xvb/jeVKH9XPEaP4o3KwWbZDB0TAesLA
         dOYylICeNcpGzOuhP/qpvbDIUA6buB8TMUYiuIrcd4AsKUGmf7CXkc2sJTaq23YXJML8
         JR7Q==
X-Gm-Message-State: APuU4Z/KIn31DkVP2U2djfv8MbDZ3ReGwyLEQNgTxNknKmX9Cg9ek509
	n8ofmX2KHFm9L4GwmYJjMHnrCC52k6dhDgZs250G7L4x8p5TxNO2vEW5qw5zFC0w
X-Gm-Gg: AYBFou04PMb/ADPalWb2d9p9suPW00Sp0OiPtjQNVHcIgF2YvuUn/vcMWDQduMjM4vJ
	I2BtljcwP2VhiWhA5o889zsQXC+T/CwDelAuVV8ELwFjNyUHuSrPr9On1pOI9PbaHmo9UlBByqP
	JgFl2E44xb35GFUjLY1C1DnOrNnzZoRfGe9t01iJBwt0XVBwkeJE/MZdeAKLMxfEi7FUoPdzNQX
	WBxpIMq8wamhpJl4DXtUq+FUU6HIuBuGVRqUAzSbutHctt6auv8QIbbnI01x56srKFM7N5forJv
	AKzi/iGKfXoK5m8z2coN4m446NIUNTRFUhvpbzqe4WwGTGGrlslsKRJf3BS+kilMFgAhBMRtMJD
	Y6ddic8Ai1pzl6pPJw60LF1srTVHgs7jV/cTNk65RIy8+Ne78+EZlQug8/H8i/lu7RpQ3XhAjzd
	lu3EKuoFzFBM+kBxvOuLC5U2lZ+TzZLvPwuGn5q+hoO6rulskWE1B9JN9EpBNFIhsffMh5+zXq0
	GMdZv2DUewcvqwi4xBu9veC1wwKMvrqjp4eCGNx/MmouvsRhqXDNAin/njVLQ74bkCAyCwoxaqt
	vsSpxqU7rHyWgFePLpAT9eP20pU5aK5Doe6mRNeigBSFZOJYSMFLQpHJJh0k6w6iQ2N0C9zSS0g
	8xRPWwg==
X-Received: by 2002:a05:690c:88:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b36c9dc63amr14716347b3.10.1794202490693;
        Sun, 08 Nov 2026 21:34:50 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:f9f3:ca9:791a:3a8d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36be923e1sm27906237b3.41.2026.11.08.21.34.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:34:50 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	nkapron@google.com,
	gregkh@linuxfoundation.org,
	khtsai@google.com
Subject: [PATCH usb-next] usb: gadget: f_ncm: prevent double-free of OS descriptor table
Date: Mon,  9 Nov 2026 00:34:40 -0500
Message-ID: <20261109053440.49156-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ncm_bind() allocates an OS descriptor table only when
cdev->use_os_string is enabled. However, ncm_unbind() frees the
table and resets f->os_desc_n without clearing f->os_desc_table,
leaving a dangling pointer.

When a ConfigFS gadget is unbound, the function object can be reused
for a subsequent bind. The OS descriptor support can be toggled
through the ConfigFS os_desc/use attribute, which determines
cdev->use_os_string on the next bind. If this flag changes from true
to false between binds, ncm_bind() skips the allocation and leaves
f->os_desc_table pointing to the previously freed memory.

A subsequent unbind may therefore free the stale pointer again,
resulting in a double-free.

Set f->os_desc_table to NULL after freeing it to prevent the stale
pointer from being reused across bind/unbind cycles.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..685152ec9a5d 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1741,6 +1741,7 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	hrtimer_cancel(&ncm->task_timer);
 
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;
 
 	ncm_string_defs[0].id = 0;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)

