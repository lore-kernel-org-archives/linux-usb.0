Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [51.250.60.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF12383C84
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.60.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836491; cv=none; b=KWx1K+sfqeDWzUKcKAHepUXi7QArSX+2JAmGgSy78mPaSuACmxIIhsI29sGUet95Uv0DjLlbPzW2+XDmXxqfDiyHeuAa9zwK8dGygmM2jmYVoxtLL7woE5NzzgMf4i1sruamYYovjpgj4swSO8vGw87mLSJibI/ht3oY3AVpNM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836491; c=relaxed/simple;
	bh=J3D89E8dtClsJeotM7fR3c4O4A+cK/EYwru7OpM5C/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qI2pLcFDIUEA1Ch/7mRFujiDQFVO6JzwB8dXz7pyvJ2xJx1mYaxjENKGpQS5Gnm5RgRO51tKlRm+ERIrk60H3mRzx/neQmW1W/afbTecX8XGxGeEhthzzGfnweYSMxqPEnhHaeqLZFGScKZn3mUURIfOFZB5+vvN8pj+pAAh0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=m1lft8JC; arc=none smtp.client-ip=51.250.60.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="m1lft8JC"
Received: from mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2224:0:640:a699:0])
	by forward100d.mail.yandex.net (postfix) with ESMTPS id 8062BC7C9B;
	Thu, 01 Oct 2026 09:34:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net (smtp) with ESMTPSA id XYd8JsDhumI0-NvvmBJvT;
	Thu, 01 Oct 2026 09:34:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1790836475; bh=xhvBy4X4k99OWBtOIvOOnNWdJXScc5zqptHnLk68u1U=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=m1lft8JCMbq30OFnZteMzA0WoDnIIz7XsFQx8vlh6yVlEyyInsrtEyZirzTarX8Qb
	 NTRGQAiYPB/8B0pQBOY7/OiioC1ou0NOU1FAbznSd5+uoiuAdugWEkzBV9e0duGmjo
	 ehgBIxrAe0SZOP0J0gPhVF9m9rE/ZgPsZUpLqt7w=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] usb: gadget: uvc: fix massive leak of configfs objects
Date: Thu,  1 Oct 2026 09:33:33 +0300
Message-ID: <20261001063333.488091-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running on QEMU with CONFIG_USB_DUMMY_HCD=y, CONFIG_USB_G_WEBCAM=y and
dummy_hcd.num=1 command line parameter, g_webcam driver probe error like:

[    4.653636][    T1] g_webcam gadget.0: uvc: uvc_function_bind()
[    4.653677][    T1] g_webcam gadget.0: uvc: Unable to allocate streaming EP
[    4.653812][    T1] udc dummy_udc.0: failed to start g_webcam: -22
[    4.653820][    T1] g_webcam gadget.0: probe with driver g_webcam failed with error -22

produces memory leaks reported as:

[   79.307997][ T4707] kmemleak: unreferenced object 0xffff888144a9d500 (size 192):
[   79.308008][ T4707] kmemleak:   comm "swapper/0", pid 1, jiffies 4294937600
[   79.308011][ T4707] kmemleak:   backtrace (crc d47ac4f9):
[   79.308013][ T4707] kmemleak:     __kmalloc_cache_noprof+0x316/0x640
[   79.308030][ T4707] kmemleak:     uvcg_config_create_children+0x114/0x280
[   79.308037][ T4707] kmemleak:     uvcg_attach_configfs+0x33/0x60
[   79.308041][ T4707] kmemleak:     uvc_alloc_inst+0x6f9/0xa90
[   79.308045][ T4707] kmemleak:     usb_get_function_instance+0xe3/0x2f0
[   79.308049][ T4707] kmemleak:     webcam_bind+0x20/0x560
[   79.308053][ T4707] kmemleak:     composite_bind+0x1d2/0x530
[   79.308056][ T4707] kmemleak:     gadget_bind_driver+0x2ca/0x9e0
[   79.308061][ T4707] kmemleak:     really_probe+0x254/0xae0
[   79.308067][ T4707] kmemleak:     __driver_probe_device+0x1d9/0x350
[   79.308070][ T4707] kmemleak:     driver_probe_device+0x4f/0x240
[   79.308073][ T4707] kmemleak:     __driver_attach+0x339/0x600
[   79.308076][ T4707] kmemleak:     bus_for_each_dev+0x23b/0x2c0
[   79.308080][ T4707] kmemleak:     bus_add_driver+0x345/0x670
[   79.308083][ T4707] kmemleak:     driver_register+0x23a/0x320
[   79.308086][ T4707] kmemleak:     usb_gadget_register_driver_owner+0xf9/0x270
...
[   79.308343][ T4707] kmemleak: unreferenced object 0xffff88814d973200 (size 192):
[   79.308346][ T4707] kmemleak:   comm "swapper/0", pid 1, jiffies 4294937600
[   79.308348][ T4707] kmemleak:   hex dump (first 32 bytes):
[   79.308351][ T4707] kmemleak:     08 32 97 4d 81 88 ff ff 66 73 00 00 00 00 00 00  .2.M....fs......
[   79.308353][ T4707] kmemleak:     00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
[   79.308355][ T4707] kmemleak:   backtrace (crc 1443faf1):
[   79.308357][ T4707] kmemleak:     __kmalloc_cache_noprof+0x316/0x640
[   79.308360][ T4707] kmemleak:     uvcg_control_class_create_children+0x54/0x2e0
[   79.308364][ T4707] kmemleak:     uvcg_config_create_children+0x20b/0x280
[   79.308368][ T4707] kmemleak:     uvcg_config_create_children+0x20b/0x280
[   79.308371][ T4707] kmemleak:     uvcg_attach_configfs+0x33/0x60
[   79.308375][ T4707] kmemleak:     uvc_alloc_inst+0x6f9/0xa90
[   79.308378][ T4707] kmemleak:     usb_get_function_instance+0xe3/0x2f0
[   79.308382][ T4707] kmemleak:     webcam_bind+0x20/0x560
[   79.308385][ T4707] kmemleak:     composite_bind+0x1d2/0x530
[   79.308388][ T4707] kmemleak:     gadget_bind_driver+0x2ca/0x9e0
[   79.308392][ T4707] kmemleak:     really_probe+0x254/0xae0
[   79.308395][ T4707] kmemleak:     __driver_probe_device+0x1d9/0x350
[   79.308398][ T4707] kmemleak:     driver_probe_device+0x4f/0x240
[   79.308401][ T4707] kmemleak:     __driver_attach+0x339/0x600
[   79.308404][ T4707] kmemleak:     bus_for_each_dev+0x23b/0x2c0
[   79.308408][ T4707] kmemleak:     bus_add_driver+0x345/0x670
...
[   79.308500][ T4707] kmemleak: unreferenced object 0xffff88814d972900 (size 192):
[   79.308502][ T4707] kmemleak:   comm "swapper/0", pid 1, jiffies 4294937600
[   79.308504][ T4707] kmemleak:   hex dump (first 32 bytes):
[   79.308506][ T4707] kmemleak:     08 29 97 4d 81 88 ff ff 64 65 66 61 75 6c 74 00  .).M....default.
[   79.308508][ T4707] kmemleak:     00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
[   79.308509][ T4707] kmemleak:   backtrace (crc f01c5b6d):
[   79.308511][ T4707] kmemleak:     __kmalloc_cache_noprof+0x316/0x640
[   79.308514][ T4707] kmemleak:     uvcg_color_matching_create_children+0x53/0x2b0
[   79.308518][ T4707] kmemleak:     uvcg_config_create_children+0x20b/0x280
[   79.308521][ T4707] kmemleak:     uvcg_config_create_children+0x20b/0x280
[   79.308525][ T4707] kmemleak:     uvcg_attach_configfs+0x33/0x60
[   79.308529][ T4707] kmemleak:     uvc_alloc_inst+0x6f9/0xa90
[   79.308532][ T4707] kmemleak:     usb_get_function_instance+0xe3/0x2f0
[   79.308536][ T4707] kmemleak:     webcam_bind+0x20/0x560
[   79.308539][ T4707] kmemleak:     composite_bind+0x1d2/0x530
[   79.308542][ T4707] kmemleak:     gadget_bind_driver+0x2ca/0x9e0
[   79.308546][ T4707] kmemleak:     really_probe+0x254/0xae0
[   79.308549][ T4707] kmemleak:     __driver_probe_device+0x1d9/0x350
[   79.308552][ T4707] kmemleak:     driver_probe_device+0x4f/0x240
[   79.308555][ T4707] kmemleak:     __driver_attach+0x339/0x600
[   79.308558][ T4707] kmemleak:     bus_for_each_dev+0x23b/0x2c0
[   79.308562][ T4707] kmemleak:     bus_add_driver+0x345/0x670
...
[   79.308732][ T4707] kmemleak: unreferenced object 0xffff88814d972500 (size 192):
[   79.308734][ T4707] kmemleak:   comm "swapper/0", pid 1, jiffies 4294937600
[   79.308736][ T4707] kmemleak:   hex dump (first 32 bytes):
[   79.308738][ T4707] kmemleak:     08 25 97 4d 81 88 ff ff 73 73 00 00 00 00 00 00  .%.M....ss......
[   79.308740][ T4707] kmemleak:     00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
[   79.308742][ T4707] kmemleak:   backtrace (crc a8fa07b9):
[   79.308743][ T4707] kmemleak:     __kmalloc_cache_noprof+0x316/0x640
[   79.308746][ T4707] kmemleak:     uvcg_streaming_class_create_children+0x32f/0x470
[   79.308750][ T4707] kmemleak:     uvcg_config_create_children+0x20b/0x280
[   79.308754][ T4707] kmemleak:     uvcg_config_create_children+0x20b/0x280
[   79.308758][ T4707] kmemleak:     uvcg_attach_configfs+0x33/0x60
[   79.308761][ T4707] kmemleak:     uvc_alloc_inst+0x6f9/0xa90
[   79.308765][ T4707] kmemleak:     usb_get_function_instance+0xe3/0x2f0
[   79.308768][ T4707] kmemleak:     webcam_bind+0x20/0x560
[   79.308771][ T4707] kmemleak:     composite_bind+0x1d2/0x530
[   79.308775][ T4707] kmemleak:     gadget_bind_driver+0x2ca/0x9e0
[   79.308778][ T4707] kmemleak:     really_probe+0x254/0xae0
[   79.308781][ T4707] kmemleak:     __driver_probe_device+0x1d9/0x350
[   79.308784][ T4707] kmemleak:     driver_probe_device+0x4f/0x240
[   79.308787][ T4707] kmemleak:     __driver_attach+0x339/0x600
[   79.308790][ T4707] kmemleak:     bus_for_each_dev+0x23b/0x2c0
[   79.308794][ T4707] kmemleak:     bus_add_driver+0x345/0x670
[   79.308808][ T4707] kmemleak: 24 new suspected memory leaks (see /sys/kernel/debug/kmemleak)

All of these configfs objects are created by uvcg_attach_configfs()
and rooted from 'func_inst.group' member of the corresponding
'struct f_uvc_opts' object. Not sure how it was expected to work
in 2014 (in particular, why uvc_func_item_release() should call
usb_put_function_instance() and who was responsible for doing
the matching call to usb_get_funcion_instance()), but fix all of
these leaks with config_group_put() called from uvc_free_inst().

Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/usb/gadget/function/f_uvc.c        | 1 +
 drivers/usb/gadget/function/uvc_configfs.c | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index d1bf3ea75197..0783cab89ad8 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -908,6 +908,7 @@ static void uvc_free_inst(struct usb_function_instance *f)
 {
 	struct f_uvc_opts *opts = fi_to_f_uvc_opts(f);
 
+	config_group_put(&opts->func_inst.group);
 	mutex_destroy(&opts->lock);
 	kfree(opts);
 }
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..5c44c7946351 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -3634,10 +3634,7 @@ static const struct uvcg_config_group_type uvcg_streaming_grp_type = {
 
 static void uvc_func_item_release(struct config_item *item)
 {
-	struct f_uvc_opts *opts = to_f_uvc_opts(item);
-
 	uvcg_config_remove_children(to_config_group(item));
-	usb_put_function_instance(&opts->func_inst);
 }
 
 static int uvc_func_allow_link(struct config_item *src, struct config_item *tgt)
-- 
2.55.0

