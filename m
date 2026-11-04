Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758526;
	b=QP11vEqlMcnWAv0yd3EWkQP4KUQpiArkhPY6a7RvdEjnbgszKxn9Bu0JyRRHoJKN76AV
	 EjLV33YRi/kqvbyJq23dQSFw5f0od/AHXMpavGGYLZvxuDZBfrCWgux8A5yolRDsrXZav
	 mhgrCkvIOJOJq11v6q54/JHilyEPx550oDmv2Ym1qx/YjAlLSAjJbJaPju+NCli04Akyv
	 NO0X5A7Hc96gCBIwesnFj8me8uCxRFlx2wdFHJ0DU+SAyJGoPlh/tGOB3BwYCTMQbpq9e
	 84SCkcJHRShYS8R+AkFW4Z6GQnBb2Uw9diu4fx3NzOyYSk0uVNTqo7aCP/uOUVwjH0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758526;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=58AhmKv3tG2dtewGHK9LRABxjvXczylqqCaKMwodBeU=;
	b=Y3O/j0ppAs++kUGz1zZvzARIcHd2Ln2HlQbYoz/jZ7RHw8vy+bXkfA8SA1xH24bl8qjC
	 kVw61ZWOcGSR4mNjQy+BFpcv0qRa4e2rNlr+9nSpmxDsa4O803LdWHpABCmPhHziEMfaA
	 jjUuYLw8fcUgKYdnVOnTJkZ+uhTP4uz9NWrjFJiA9dQTJiCTiqWo4rHwAGCOCKgKUOKeJ
	 XCsAx3F/aABqQRNztFXN6EI1dfjRjbLKTSX3r2c8qLCovfFVQUzNsOR5V6qfLoyn0WmJV
	 wfOF2zHmO/9aBWRte7eK+vxDiSfXeaCQN8kKCvXURVU5hcZk1e6gYGYeAP97ptxUE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E4F606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E4F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAC35P47lepqvXc+AA--.9377S2;
	Wed, 04 Nov 2026 10:15:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: usbtest: free the urb when unlink1() fails early
Date: Wed,  4 Nov 2026 02:15:32 +0000
Message-Id: <20261104021532.1468741-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAC35P47lepqvXc+AA--.9377S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trykKFyUXFyrKr17JF4Dtwb_yoW8XF13pF
	s8Zas0kw4DGr4a9F43Jrs8W34Fvan3tFy8GFyS93yxZw13Aa97X3yjy3Wagr4kGrsYg3y3
	tr4jqr45Cw4DCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5EQ6tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIBA2rqY-m49wAAsM

unlink1() allocates the urb and its transfer buffer with
simple_alloc_urb() and only frees them with simple_free_urb() after the
completion has been waited for.  Two error returns skip that cleanup and
leak both the urb and its coherent buffer, which also pins the device.

usb_submit_urb() never frees the urb it was given, so the failure return
has to free it.  The unexpected usb_unlink_urb() error return still
leaves the urb submitted, so kill it first to be sure the completion
callback has run before the urb and its buffer go away.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/misc/usbtest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 8759df49be28..fb273516ee39 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -1459,6 +1459,7 @@ static int unlink1(struct usbtest_dev *dev, int pipe, int size, int async)
 	retval = usb_submit_urb(urb, GFP_KERNEL);
 	if (retval != 0) {
 		dev_err(&dev->intf->dev, "submit fail %d\n", retval);
+		simple_free_urb(urb);
 		return retval;
 	}
 
@@ -1491,6 +1492,8 @@ static int unlink1(struct usbtest_dev *dev, int pipe, int size, int async)
 			default:
 				dev_err(&dev->intf->dev,
 					"unlink fail %d\n", retval);
+				usb_kill_urb(urb);
+				simple_free_urb(urb);
 				return retval;
 			}
 
-- 
2.34.1

