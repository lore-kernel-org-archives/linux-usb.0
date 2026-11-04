Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758500;
	b=F7ofO9z/OdLpjyhEx4CfA8xijsTEM2CkIcAX+50YaFlUPNIZSGGs2TBONl5b98eay0zO
	 TLKHOuLPmIrJ37+6wsZW/NUP4desjJdqM0SCKpq3cuzq4sB1Q3B2LBSpnk4xkneqf6FBs
	 w+6YKlj+kOl67iLCcUdBkVkGivq3/ZXgOv+XrbPmZ8RoAYVJZEsoByVWRT9dfId2NUb0U
	 m935fqp+2fFxxhnyBn48YXoVddZG8jbruFsLpHsS2nYn78R1R5TISNLIMJjXP8dvk6AgS
	 bxCKklxRs+Qq5zBuCmnIWxLYuwC3g3x2+ckREeFviVj0Ki8RftDwzsXZxGT5aFrEZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758500;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=4PQqFlQvqkLaDMBeEuH8a4JA3NsOKFsSx5q1l9S/O+4=;
	b=eH6WPevmoW/f9d+iINUHnz3RgeaLEhwEPFg2GbCwhuXrp+JDu04J37bjKvJMWJzPasZI
	 rYQ/6klbDk7jZxzacdnVsclwGdxgpHEkyTjPeIGnzYkgG/HOZblI89ug9Cud28lZ2TAOn
	 tvCfsLu3I5NR+R7+LjVS4Ofdpee8ZoVa946X5o/GWGlmIeaFWijAPSmoQ3jLdxbyhlDay
	 zagaLAYFLLZ94f/BpZcfMCBnCDC1nAHn3ZfeAXteQh5NtGPQPff6oJ2hFm0/3it3GRapn
	 kNewxAmva7CxSBWPU2M+oFRhIj1C211xdKWy0usZdXi7Anh+9mUJQ230x6ZzD2jAaRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2F0606A334
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2F0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXwvwhlepqjHY+AA--.4847S2;
	Wed, 04 Nov 2026 10:14:57 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: drop streaming header reference on the EBUSY path
Date: Wed,  4 Nov 2026 02:15:06 +0000
Message-Id: <20261104021506.1468539-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACXwvwhlepqjHY+AA--.4847S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw1xZrWfJFykWr1rZF13urg_yoWkCrXEkr
	y7Wr93GryUGw1q9w18C3y3uF4xKFn0vrykWF12grZxt3yFva1xuw1kZrZ5AF17ZayxCF98
	Ary5XrZ3Wws2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUyZmRDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUBA2rqY-m4YgACsc

config_group_find_item() returns the "h" item with a reference held.  On
success the reference is transferred to uvc->header and released by
uvc_free().  When the streaming header is not linked, uvc_alloc() frees
the function without releasing that reference.

Drop it before freeing the function.

Fixes: f1fd91a0924b ("usb: gadget: webcam: Make g_webcam loadable again")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/gadget/function/f_uvc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index d1bf3ea75197..1633a3535e03 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -1146,6 +1146,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 		uvc->header = to_uvcg_streaming_header(h);
 		if (!uvc->header->linked) {
 			mutex_unlock(&opts->lock);
+			config_item_put(&uvc->header->item);
 			kfree(uvc);
 			return ERR_PTR(-EBUSY);
 		}
-- 
2.34.1

