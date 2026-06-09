Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B203F6601
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996834; cv=none; b=e0ja25XAUIjX0j2pyWi/ztQlfVdes0iSOt/7Mjy+O6xkQeWNExPSPhH4xU/MLwepp66edHCokIttX0Gqoky6hRoW+X/FpHNHKcn7tBPEOuEbgUAIdI/l5RzkOdIYGFOtc6xlNa/uFka5FU/alSGsBplXeD6D1xNBhQRjlmfcKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996834; c=relaxed/simple;
	bh=OHrl1ENn3XbKWixzs3KeXahSmXCmgzEZK//8wsbpGUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=myG8KSpxyZLfViONacz4n3UuYWLM/+eQjfJUfZcFO6QGvE79cBIAbc6ajTJB9bqeS0GFHC6Lf4VptHNxiNlrXUYrkueML1mdkhmoE411mNHT8VXd+cyr3DwQT6LHQHTEXQp083tJDoXySFRUm5Op8Ue170QK0BF3HORj8Py1Ltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=sRghqj8P; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="sRghqj8P"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=sRghqj8PSwD3F+i3bPeXr7OhfxWETfQL4WwecimqMkfQ35bbLBltRxDMu8Rb2+4RZqvR/HevK9AraD0kP6fbFpgnjqQqD2fWpyK/lt4X5JhP/WfmnME+Ehvp8PpFrtMc8gkoXmkZ/S0HnAJ1wEBOLVGCvuf0gmGb4S7y9LIiCMYWBeJkwouutOJQ295SseXyrUbn04rhrD1/GdMzQBcfstxP54K87i8pzDoYovchccu94sAHSmAIWD21WzjlR2fVEjqvi/S3Oau5QniecR3Itg3EIVQ5tFF5nRnvZ3Elwt96VjxXS5Th0lrRCLt7huLk0lDTLrMDgk762Tzk9JsOWg==; s=purelymail2; d=purelymail.com; v=1; bh=OHrl1ENn3XbKWixzs3KeXahSmXCmgzEZK//8wsbpGUU=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 55508659;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 09 Jun 2026 09:20:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1wWsdB-0000000BOpR-08u5;
	Tue, 09 Jun 2026 11:20:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-usb@vger.kernel.org,
	julian@jusst.de,
	gregkh@linuxfoundation.org,
	Pavel Hofman <pavel.hofman@ivitera.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usb: gadget: f_uac2: fix memory leak in UAC2_RATE_ATTRIBUTE store
Date: Tue,  9 Jun 2026 11:19:55 +0200
Message-ID: <20260609091957.2716984-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

strsep() clobbers the passed pointer, so we need a separate variable to be
able to correctly kfree() the memory at the end.

Detected by kmemleak:
unreferenced object 0xffffff80038f9098 (size 8):
  comm "audio.hook", pid 323, jiffies 4294896085
  hex dump (first 8 bytes):
    34 38 30 30 30 0a 00 cc                          48000...
  backtrace (crc 503efa75):
    kmemleak_alloc+0x30/0x40
    __kmalloc_node_track_caller_noprof+0x240/0x3d0
    kstrdup+0x44/0x90
    f_uac2_opts_c_srate_store+0x13c/0x200
    configfs_write_iter+0x238/0x360
    vfs_write+0x4a4/0xd00
    ksys_write+0xf4/0x1e0
    __arm64_sys_write+0x68/0xa0
    invoke_syscall.constprop.0+0xa4/0x260
    do_el0_svc+0xc0/0x1c0
    el0_svc+0x20/0x60
    el0t_64_sync_handler+0x118/0x130
    el0t_64_sync+0x14c/0x150

Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates"=
)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/usb/gadget/function/f_uac2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/func=
tion/f_uac2.c
index 897787d0803c1..0c2a8afccbb69 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2012,7 +2012,7 @@ static ssize_t f_uac2_opts_##name##_store(struct conf=
ig_item *item,=09\
 =09=09=09=09=09  const char *page, size_t len)=09\
 {=09=09=09=09=09=09=09=09=09\
 =09struct f_uac2_opts *opts =3D to_f_uac2_opts(item);=09=09\
-=09char *split_page =3D NULL;=09=09=09=09=09\
+=09char *p, *split_page =3D NULL;=09=09=09=09=09\
 =09int ret =3D -EINVAL;=09=09=09=09=09=09\
 =09char *token;=09=09=09=09=09=09=09\
 =09u32 num;=09=09=09=09=09=09=09\
@@ -2026,8 +2026,8 @@ static ssize_t f_uac2_opts_##name##_store(struct conf=
ig_item *item,=09\
 =09=09=09=09=09=09=09=09=09\
 =09i =3D 0;=09=09=09=09=09=09=09=09\
 =09memset(opts->name##s, 0x00, sizeof(opts->name##s));=09=09\
-=09split_page =3D kstrdup(page, GFP_KERNEL);=09=09=09=09\
-=09while ((token =3D strsep(&split_page, ",")) !=3D NULL) {=09=09\
+=09split_page =3D p =3D kstrdup(page, GFP_KERNEL);=09=09=09\
+=09while ((token =3D strsep(&p, ",")) !=3D NULL) {=09=09=09\
 =09=09ret =3D kstrtou32(token, 0, &num);=09=09=09\
 =09=09if (ret)=09=09=09=09=09=09\
 =09=09=09goto end;=09=09=09=09=09\
--=20
2.47.3

