Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758505;
	b=sFW2SztC5xwpA8sDdakWVSscERakqmRY+bq/z4DVr0U1yDbmuvG1u71PioWOaNrvuAvV
	 I83LKLG6jwt5ekLIEf86mRtMmTb1x700y0k1k8OIvc8AH9s4H+jcOJjlB9kW62YFzO98T
	 n6xqNsZWzmB++xihv+rEMgUArP+eyGikKYfLrNTZQ6Ome2QsXCKfR7hW8nopWJ04mOINl
	 LYjvM3NSX4b6bfBhBRaQULPvv8Y9lIBUV9xlKiZaq+LDOtw2UeoDCYH8To/dxc19W+WC7
	 7AYp4WJvMd0Fq9djKrVW6Da7BBfBCE3pKH8N9uq9x0JdIuBQz4vnIHDyqCpOMRoTNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758505;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=/UP8tqnJ94KfxOWZqefTlPe1bzzj84bp1WexpCB6pJs=;
	b=mfcFafursuEMS7KhCBqhJ3wSpuH5dOWYLMJDIJqk7eYhXL4GkU9LmFd6d6h3YNJ3/qJO
	 fNguQa9Cj34Ht+Gus/a9jR788NlqHpn8bZWE920PdEl4paFqDMWCIjiNuS2nWtM18INDH
	 Ai6fCx+s3CBOZw8ntaTS/SBXE3XmPQOxgltEqPh9HhF+f6QJWI8rAKmrTo0c6GTJRblKR
	 AYpdkjiatdT+1VfiDnHgQWGUa0ZGmghGYKDrS0wp4DMEFCJ3QSyx8ArMnAhaI6iudfvtE
	 XqIzKpLmxaaaHgF+KqvyTTlrI59+wqFcGzJACnIq0g9f75C8E0Yz+HskuspmX8cbpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675A606A330
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A675A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACnzvgmlepq13Y+AA--.9331S2;
	Wed, 04 Nov 2026 10:15:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: core: hcd: drop the root hub reference if it was not registered
Date: Wed,  4 Nov 2026 02:15:11 +0000
Message-Id: <20261104021511.1468577-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowACnzvgmlepq13Y+AA--.9331S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw18CFW3KFWrury5try3XFb_yoW8Jry7pr
	47W3yxCFWrJrW3CF4DAayYqa40gwn2q3yUurWfZw4I9ry3Ja43CFW5Za1FgFy5CFZ7Jr1a
	qr48A3yrWFZrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0zWlDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggBA2rqY4K77AAAs6

usb_remove_hcd() takes an extra reference to the root hub and relies on
usb_disconnect() to drop the reference held by hcd->self.root_hub before
usb_put_invalidate_rhdev() drops the extra one. If the root hub was
never registered - for example when xHCI defers registration and adding
the shared HCD fails - usb_disconnect() is skipped, so the reference
held by hcd->self.root_hub is leaked and the root hub device and its
HCD reference are never released.

Drop the extra reference in that case.

Fixes: a44623d92790 ("usb: core: hcd: Add support for deferring roothub registration")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/core/hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..1d4a303307ec 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3057,6 +3057,8 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	mutex_lock(&usb_bus_idr_lock);
 	if (rh_registered)
 		usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
+	else
+		usb_put_dev(rhdev);
 	mutex_unlock(&usb_bus_idr_lock);
 
 	/*
-- 
2.34.1

