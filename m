Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C268484238;
	Tue,  4 Aug 2026 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864055; cv=none; b=DuAUkxZIcjI96JHBxCQWfHxGlsUsUYiiIOAEsQJs2sGVZ/XAWUEjNs+kd4l8e7irkkecbp1fNDWT/AYBmYD2LvAbhYnA+GYCpiInfLgMI8tnchQbcrD2V01o7uzM1DUm/6W/STxqsETD36KhIAx+RkAhmQaALmibA5kKCyKUTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864055; c=relaxed/simple;
	bh=qlcATplE8kULCTRneo9VRnJBNU7hed1HHrDpnRp/7FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FGFdXYwIw1pUHGLSYZ0bb79xe/EyIAoZSAJRNf12MN2TgBipyp8j7GOBRNadOEVNAReIhKX8eQnv6lJac1VpsF1CxIhUXYc40XBXRXeUsqAhBvdf9WWL/aqmKfmT+Xkb726TX9BoaVaSBWPJ0hXo2PIhlt4j3laIySg2+5Vdpro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trt3am2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trt3am2u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21225C2BCF4;
	Tue,  4 Aug 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785864055;
	bh=qlcATplE8kULCTRneo9VRnJBNU7hed1HHrDpnRp/7FU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=trt3am2uXajYnHEDCTpTVYAIjA5t4UeO3haHU8T3aPpwBWcG7nVF134NShyGM9TD0
	 bScOyk+FaFFfp3m3PwrSK04/9milPNW9NqdaPsiskWmNBIb00ZEpmYQAue3ulCI3Jz
	 ROk3DK9bYAATxU7zW3Ny1z3440rwjA1pEpSxvQ1UxrV2kzQqrHimZAK1mupL2oSaLj
	 xnOci6KNzhlE/C7qwAUfdaXayvoLbuSiKs7sT6pLr+LbfVRTGtEGRGj3AcWQAkg7jo
	 6JOr8+p25sYaSJc8TGm+0yED2GW3u4Zp17PytbRqAJY6UyFXGc7V8BthC1iFvXvYwU
	 YsVbyZEbaGQBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C65EC55822;
	Tue,  4 Aug 2026 17:20:55 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 22:50:54 +0530
Subject: [PATCH] usb: gadget: uvc: fix use-after-free in
 uvcg_extension_drop
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-uvc-extension-drop-uaf-v1-1-4a5db42150af@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBSE4VeRs+6BJBQRX0W6yGXSHhdREiOC+
 O6N7fKDmf+kgiwoNHYnZexSZEkN+tGR/9j0BktoJqNMrwb15Lp7xrEh3UsOeVm52simdxFWO2+
 CpnZeM6Icv/D0+rtUN8Nvd42u6wtluT0LegAAAA==
X-Change-ID: 20260804-uvc-extension-drop-uaf-26bfea1bc2d1
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
 syzbot+f093afc4e90b1908abdc@syzkaller.appspotmail.com, 
 Anuj Bolewar <bolewara@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785864053; l=2708;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=W838bVUurWYZNY+1DKGGhm3wxWgzNATfRFLxHYdrL2Q=;
 b=npVcnkwvwoGZCllYtfiIdi9cdpbYyXEu2OMuXY5R/E7Dl623esTnw85rUBuHEEfgfx2RjL3nG
 kjYcx01yznDBmJ0clppXjdwtzOGwJqN6/YbE9jX3vOQufs6MweBcml2
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

uvcg_extension_drop() releases the configfs item reference with
config_item_put() and then removes the extension unit from the list and
frees its dynamic descriptor fields. When the put is the last reference,
config_item_cleanup() runs uvcg_extension_release(), which kfree()s the
struct uvcg_extension, so the subsequent list_del() and kfree() calls
dereference freed memory.

The configfs mkdir error path calls drop_item() on an item whose only
reference is the one held by the configfs hierarchy, so the put inside
drop_item() frees the unit synchronously and list_del() reads freed
memory (KASAN: slab-use-after-free Read in uvcg_extension_drop).

Do all the list and field cleanup while the item is still alive, and
release the reference as the last step.

Reported-by: syzbot+f093afc4e90b1908abdc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f093afc4e90b1908abdc
Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Assisted-by: deepseek:v4-pro
Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
uvcg_extension_drop() releases the configfs item reference with
config_item_put() and then removes the extension unit from the list and
frees its dynamic descriptor fields. When that put is the last
reference, config_item_cleanup() runs uvcg_extension_release(), which
kfree()s the struct uvcg_extension, so the subsequent list_del()
dereferences freed memory.

The configfs mkdir error path calls drop_item() on an item whose only
reference is the one held by the configfs hierarchy, so the put inside
drop_item() frees the unit synchronously and list_del() then reads freed
memory (KASAN: slab-use-after-free Read in uvcg_extension_drop).

Fix it by doing all the list and field cleanup while the item is still
alive, and releasing the reference as the last step.
---
 drivers/usb/gadget/function/uvc_configfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea40..65bad40ec6e 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1256,11 +1256,12 @@ static void uvcg_extension_drop(struct config_group *group, struct config_item *
 
 	mutex_lock(&opts->lock);
 
-	config_item_put(item);
 	list_del(&xu->list);
 	kfree(xu->desc.baSourceID);
 	kfree(xu->desc.bmControls);
 
+	config_item_put(item);
+
 	mutex_unlock(&opts->lock);
 }
 

---
base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
change-id: 20260804-uvc-extension-drop-uaf-26bfea1bc2d1

Best regards,
--  
Anuj Bolewar <bolewara@gmail.com>


