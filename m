Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7C41A50A
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522412; cv=none; b=SqWxW52rF255d6MvWCWEFkhNhgwyOBVx8m2i8CYBeEfZ3PB0O9CB102GDHrJEG6xEJWgLch7p4BJDA57oSCsfbB/up4cJKK7qMVRRiPKFFfeygWVVBN1RG4ZexXmrL1h21ynkdR4R82rlwkLhqKIpOaYXKNbGvksnYd8VPz2w5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522412; c=relaxed/simple;
	bh=K9QUoEzOXzttTzAp9boI6lK3dp5MDnuFB7zokkl+zmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JYxSeqj0liIYy9J+isPhaPfJ6YIcsz3LwLCW14QyW7h+pSE41zkJid02PiydjcGUksuvQmq8avpNWberXbpm0zIms+KeoIOQrnxn1NzDWNF4tfZcodwRhK5MYO+HpJFOUVOLBJcnFe8swsMhoQmMMhu6FayOMmzcoogx4s6Bncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGnw8tKX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGnw8tKX"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so951434f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 11:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522409; x=1786127209; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FfmYJP/sWXNynGa5Lc8nKwOy+ss+jDxCCY3a6elrvaM=;
        b=QGnw8tKXJ8dfdUBhZB4SFBV2echiEUcYioGIYP6Pi8xvBuFUKN6saJOzpp5uzSJcMN
         sdYRtU1gQ1rVz4j93RHaexkTGBXsS3y/16NhC4PSJWTvIgqntM3cLJHOF5hmqnElgej3
         26HWJGuV/kyLVddCIj09gsIm/YNznrhGMFlsT7n16gVk1aRHrcWG8zOH8Y/wCCa3cIrW
         IJ025xPl+X4pWocDSt1VKCKXLgkT8fQgFIf8YS6EJeXTuYtZovO4kIn6kmyQWhpce7s+
         VG6KzvB3gRSd4I4VmPOa+yOsRwfMNyQCD40RCapbeGaY85ELFkwYpQh2cfmgzLDguqoX
         Zs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522409; x=1786127209;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FfmYJP/sWXNynGa5Lc8nKwOy+ss+jDxCCY3a6elrvaM=;
        b=YPM2yrdywP2YB9VK3ewSs4lyBSNEvKJUlNqYz5mHSngZgfTkMDxUbyWTcDGio9VdRs
         7twwRU7DvDxuiyF9quCLt2lo/oJbWatq31+fwZ3abbs4Jkp+mgwu/6HOO/D0LJKjSouH
         q5FQlKxQBBkQFK8DyK7aPZIncSj2BR//BLqjfHC/5ZXygraly6QkxVb5KVAC82NQ51pL
         ruLSLNvvktiE2qR3ya9lm08qg2TojhVvV6D/4PL5/Cui4CF/I1Bkxt3TmBC9/IC5enab
         P878v7uI/YeWnepZusOniPo8/DgFRAWGFBlzv5271a7aTbgqtmNCqFF0hQTxEHGmKkxj
         bzPA==
X-Gm-Message-State: AOJu0Yxgy+1TS8+7pQaRKHuigO68xIlDXQ5OLIKrbDnyESEdyag4CxuM
	TbPMc9wj7yDkfA/IkH9DNgNBhXq0liQrzULFaQeJjXAvh+JSepn1IYxX
X-Gm-Gg: AR+sD12TniMwdSh0hlPp9VVFnytPAJmL557r4Qqv1GtncMP5i39hKPEJqgioIbiiplu
	m8pC1eQvKzkC5+IDfXJo71AwCmM9sbbpb39V5NhlNS4NBUwBDSxA6Pye9PcwNSKUAW8NcZPfryf
	ANt4fz3Bqkx/qxh1w0jl1e2/tJdSn1kl9oDd4Fr36bQ9EC/EECOm9AlZzOUl0gCsf0JPtiBCbdu
	pLX+vyAk+9Pi0L9YLNpKOlaTYrFPOk3gZ/8CXnQAb4alsnOTRPvIL+9QJbfqQgUD2Km19qnlg4I
	kSnzANYbj/VgnsnGPNra33xHZVqxjwyzimtunqS2u3or1AQTk3QRFb9yDrGawe74KZ+bSZOCpG2
	FhvJPBJ0TD8dkAwlJxMTda9j96l0/gjnbluB7h6ktlIn/Zp3zjJhVSEGW7/oglBDkQuMCfllV0h
	Xiz20+pc6O38FAX/sSSCpgRObeXc7Q0OR3XSdsechWetn7LQ7tXvzNoT+a5vCnuqYXSTvdrMRSo
	x20Svt9pCQHwdWmxm3drh3ZZxJl4eHafwAzHVDqeaiAx5KhzqBR6aE2M1Tgwrdn4q8=
X-Received: by 2002:a5d:5f49:0:b0:47f:853c:ad7b with SMTP id ffacd0b85a97d-47fd32b96b6mr6615129f8f.9.1785522408579;
        Fri, 31 Jul 2026 11:26:48 -0700 (PDT)
Received: from valmpani.valmpani (cgn-195-14-217-60.nc.de. [195.14.217.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm7229065f8f.23.2026.07.31.11.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:26:48 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Fri, 31 Jul 2026 20:26:45 +0200
Subject: [PATCH] usb: gadget: f_uac1_legacy: fix double close of the ALSA
 devices
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-alsa-v1-1-95eb93ba32ec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOTobGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc2ND3cSc4kRdM1OzZMs0I/MkQxNDJaDSgqLUtMwKsDHRsbW1ABcvhC1
 WAAAA
X-Change-ID: 20260731-alsa-656c9f27b141
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+df868600fe111c5ff79f@syzkaller.appspotmail.com, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522407; l=4467;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=K9QUoEzOXzttTzAp9boI6lK3dp5MDnuFB7zokkl+zmQ=;
 b=uemBlYPXlz4ucSvsvOqLcPF9IE14JR0nXxc9Ex0pYbWEZ1cJ8Mb9jBRJ7PXEIezhGUpcYV3k2
 mv8nz7dD7KiCbDu9n7YNV0IN7mq+iSL4RI3RrdgrNkzYU0WeWiGFesL
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

f_audio_bind() records that the ALSA files are open in the function
instance flag opts->bound, but keeps the file pointers in the
per-function gaudio card. Its error path calls gaudio_cleanup(), which
closes the files without clearing the filp pointers or opts->bound.
A failed bind does not destroy the usb_function, configfs_composite_bind()
puts it back on cfg->func_list, so the next write to UDC binds the same
f_audio, skips gaudio_setup() because opts->bound is still set, and on
failure closes the files a second time. Dropping the config symlink after
a failed bind closes them again via f_audio_free().

BUG: KASAN: slab-use-after-free in filp_flush+0x31/0x190 fs/open.c:1464
Read of size 8 at addr ffff888045f01990 by task syz-executor659/5617
Call Trace:
 filp_close+0x1d/0x40 fs/open.c:1484
 gaudio_close_snd_dev drivers/usb/gadget/function/u_uac1_legacy.c:263 [inline]
 gaudio_cleanup+0x54/0xf0 drivers/usb/gadget/function/u_uac1_legacy.c:305
 f_audio_bind+0x4a0/0x630 drivers/usb/gadget/function/f_uac1_legacy.c:792
 usb_add_function+0x290/0x930 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300

Clear filp, substream and card in gaudio_close_snd_dev() so cleanup is
idempotent, and close the devices on the bind error path only if that
bind opened them, resetting opts->bound as well.

Fixes: f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function interface with backward compatibility")
Reported-by: syzbot+df868600fe111c5ff79f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=df868600fe111c5ff79f
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c |  8 +++++++-
 drivers/usb/gadget/function/u_uac1_legacy.c | 17 ++++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7f19c56c372c9112eb888781bb90d..02774faebdbbc07a3fce0ef1fa47136d34b961ea 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -732,6 +732,7 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	int			status;
 	struct usb_ep		*ep = NULL;
 	struct f_uac1_legacy_opts	*audio_opts;
+	bool			bound_here = false;
 
 	audio_opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	audio->card.gadget = c->cdev->gadget;
@@ -741,6 +742,7 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		if (status < 0)
 			return status;
 		audio_opts->bound = true;
+		bound_here = true;
 	}
 	us = usb_gstrings_attach(cdev, uac1_strings, ARRAY_SIZE(strings_uac1));
 	if (IS_ERR(us))
@@ -789,7 +791,11 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	return 0;
 
 fail:
-	gaudio_cleanup(&audio->card);
+	/* Only tear down the ALSA devices if this bind opened them; the */
+	if (bound_here) {
+		gaudio_cleanup(&audio->card);
+		audio_opts->bound = false;
+	}
 	return status;
 }
 
diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c b/drivers/usb/gadget/function/u_uac1_legacy.c
index 01016102fa1728f8bcc92a3ed66b29a318cd52f4..c2b6c88b0bdc9994da027854ec107934c8e814c4 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -259,18 +259,29 @@ static int gaudio_close_snd_dev(struct gaudio *gau)
 
 	/* Close control device */
 	snd = &gau->control;
-	if (snd->filp)
+	if (snd->filp) {
 		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+		snd->card = NULL;
+	}
 
 	/* Close PCM playback device and setup substream */
 	snd = &gau->playback;
-	if (snd->filp)
+	if (snd->filp) {
 		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+		snd->substream = NULL;
+		snd->card = NULL;
+	}
 
 	/* Close PCM capture device and setup substream */
 	snd = &gau->capture;
-	if (snd->filp)
+	if (snd->filp) {
 		filp_close(snd->filp, NULL);
+		snd->filp = NULL;
+		snd->substream = NULL;
+		snd->card = NULL;
+	}
 
 	return 0;
 }

---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260731-alsa-656c9f27b141

Best regards,
-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>

