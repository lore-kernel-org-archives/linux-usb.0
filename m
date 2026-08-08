Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA48387341
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786212933; cv=none; b=ToSdDK4tuXZD66tYrEZGx65fuy4jEp5DbFr+nL9BtHbiegInaqNKx+x4j0iC4zI0Lkp20hcRiMqblMaGZotf6fMPi2ztC7//RUTIbVw0klaaCxk/XRLwKKppszsffWplO6MMImHU972+1AFgoFN2fKg0ayxevBj3sRFOVQ9bze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786212933; c=relaxed/simple;
	bh=EkACh1bDArPo69kB4KkzQxhqfiR3/+XE/Ns+gNlzdm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8YqP4loaTss3O41ltCeCUBDdPBabv4OS/tIORflS3sxsXfStwiGCvimphUSQ8sx2pj+0908xHrXtH62E/QFHhzGlESAjpXdsCUJ6X3sifeDYjXAx0Za/wtqSFRNjC1Aw3OIoWTsutc1dwUi29kS/vI+hXMXXufJvUs0wXkL5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFkSk4VH; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFkSk4VH"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso285956a12.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786212931; x=1786817731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8G6Z8iSF5Ollo2I3Xn+2pO6Z1VQrAx2pCt3BvyTS+M=;
        b=fFkSk4VH9I1oVjQ+KOoH3tMgdHW3i6MtKBTdop31W53ML7YSk9NoNr7VpBgwYn6DBJ
         mjZ8CqXo5UWzz3P3U782vqVVXvwQeshWKGb9UPgBLpEoXZAiKNubGbWnbM1IQZH1JUTS
         74j3ckH9VekuzV9BJ3Hn6mqGlYfvvX12bj7dW6SwGuurSOxULu0M3UwyXvUMlG80malf
         LD7TJcT7hvQcj3hREBq9JmKikig7u7Qh5PbSALfCKl0tL14e7PtLVHEP6CWAx36twMcX
         Zfy3td2EZ0S9T+Vj/jRJ0DFBrgLC+oM40IZWG9FnZRdpUiSLTX4JJo0PFyYBAbQderPN
         J3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786212931; x=1786817731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8G6Z8iSF5Ollo2I3Xn+2pO6Z1VQrAx2pCt3BvyTS+M=;
        b=XmdCItUbJTCRqVDDwVz4e7Z4WH1YK09FcWIuw5wn+SoSmo+7z1jPFZ4qw94gwBaeM9
         dOSuZkrVTwNuN5FWTmaU9Xg5kIqz904QMR6HgpcgbxxPHV7x+aP7nOZXroT9SKdvCqN5
         q8l84Etv6X+d4dtTQx3vf7ZL9BNIbN7M2kdff50U1iPbBEnlJhbETzHDj2QODmSzWBKO
         KC+/uzhjHGzsuZ1FQ69ceUNW3m52O8BrvWhl4PooXzAf/0v+AH0Tb2NaQQev7O5hNHF/
         wD2kmnFk2ckRblRy1Wypdfu3+WycRke3F01GfDVUcysOMfLOsd3P5M+JWTa1Ezp5FxqS
         YSEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXDRmR+4n2z6YCdlEPc5MV12ilhpacoxKujgEAF7K+0TdrVNIX1HZTyhyYNFdRh0msM8R+iWAES0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMYKaRMLvf29LatBX58qtOpelQJfM7atGLntu8K/LNaLgHZwK
	RxgsGUyF1XBUBhjESDvyp60f76c7h4L45JgS53+E81SKSIsXQJLg3tGe
X-Gm-Gg: AR+sD11xEmuLtIX2ynCzPHAnTviVZ7XiBcsXbE4EcX+YKUz+QbkXoCuDUnfvGBng2Zu
	q/S4DyUk9GdunVXqrjuOVt74soCAP3WZ6hmllZxzn1rvSWTDBBZ7ZHvZaSEvvF8cBSBTjkvGeIM
	USBksQGwass6druuw+Cvf3BYN0PlOGab0J91MfmdCtZqvOw+fhT/Ks1TIgBo66NLwDpO0Y9Vltv
	zkfMu+DOGUazAhqNI7Rr+SuolUE2QCIISCDy1/vavzoXSODoI+veDdimIrJpebSPepuiMKTdFfu
	EAKhiTrNVTTkChuK135WZE6ya/46sKJ+saJM6jYtgbJGLf6QDCHvwfUi+d3cDcd61E6LYcTb8OF
	/EbZrTEQfsiViPE419uA64hbeKGPnkOuzTQg8WDmw2Up67+S2dnedjn2F9LeQhlgaG5D/HSUgJf
	aB3IBlLsqmI3drlfnldRQmvt/OfZ9CODccaO5/WetXlw4Ua9EAlNNyWMuPxTh4uzLD8CGc3QuIZ
	w==
X-Received: by 2002:a05:6a21:3181:b0:3cb:9594:91b8 with SMTP id adf61e73a8af0-3cbcea0aa13mr10340672637.35.1786212930873;
        Sat, 08 Aug 2026 11:15:30 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm4348142c88.8.2026.08.08.11.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 11:15:30 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_loopback: fix descriptor leak on unbind
Date: Sat,  8 Aug 2026 18:15:04 +0000
Message-ID: <20260808181504.462492-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

loopback_bind() allocates descriptor copies through
usb_assign_descriptors(), but f_loopback does not release them during
the unbind path. On every bind/unbind cycle of the gadget (for example
by repeatedly writing the UDC attribute through configfs) a new set of
descriptors is allocated while the previous ones are leaked. syzbot
reported this via kmemleak:

  BUG: memory leak
  unreferenced object 0xffff888016b8f180 (size 64):
    comm "repro", pid 5613
    backtrace:
      __kmalloc_noprof+0x3bf/0x550
      usb_copy_descriptors+0x6c/0x160
      usb_assign_descriptors+0x48/0x180
      loopback_bind+0xff/0x120
      usb_add_function+0xca/0x270
      configfs_composite_bind+0x667/0x9b0
      gadget_bind_driver+0xed/0x390

Move descriptor cleanup to a new loopback_unbind() callback that frees
them with usb_free_all_descriptors(), matching the lifecycle used by
other gadget functions such as f_acm. With descriptors released during
unbind, the usb_free_all_descriptors() call in lb_free_func() becomes
redundant and can be removed.

Fixes: 10287baec761 ("usb: gadget: always update HS/SS descriptors and create a copy of them")
Reported-by: syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=28cf08dec5895bd562e6
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/usb/gadget/function/f_loopback.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index d2d07fb49e70..40aaf2eb00f2 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -216,6 +216,11 @@ static int loopback_bind(struct usb_configuration *c, struct usb_function *f)
 	return 0;
 }
 
+static void loopback_unbind(struct usb_configuration *c, struct usb_function *f)
+{
+	usb_free_all_descriptors(f);
+}
+
 static void lb_free_func(struct usb_function *f)
 {
 	struct f_lb_opts *opts;
@@ -226,7 +231,6 @@ static void lb_free_func(struct usb_function *f)
 	opts->refcnt--;
 	mutex_unlock(&opts->lock);
 
-	usb_free_all_descriptors(f);
 	kfree(func_to_loop(f));
 }
 
@@ -442,6 +446,7 @@ static struct usb_function *loopback_alloc(struct usb_function_instance *fi)
 
 	loop->function.name = "loopback";
 	loop->function.bind = loopback_bind;
+	loop->function.unbind = loopback_unbind;
 	loop->function.set_alt = loopback_set_alt;
 	loop->function.disable = loopback_disable;
 	loop->function.strings = loopback_strings;
-- 
2.43.0

