Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758536;
	b=cc0U1Fm/QcbI6pZXsVURDvfB/JOKFfMdF2hS7j+uQ+RgnFjBj5lW9tE1eC+AUZ3WwWit
	 fDf5+9imttQJnVHIAsd30QLputCxLSLVe+mF759UrFqPr6T2mDnGxjfNCbhRRRBLBD39C
	 kebzUOAh8s9AWU5fhx6wx4xyFWAHwPwHGwxsl0BQhjCi/Csb5U4L8lXs3e7C6u3jmzRSp
	 J0Pl+H1hYxmIZvk1Zr/5vHt9PHDU38dWZr2oJvGgY6Wu+XzBPlQIg88nGiTmMK4Nsui9Z
	 onU02n+Uh7O1DK2n+nkWHv2AuuxW+AnmBVN8qR/dNoJ0XQLDLkxbQNZ0m0U4eMH+uhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758536;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Ju7PmerPIkMR+jNUdaKEY36gQmSRR+ywRxhNw5yJXHU=;
	b=L8+VjE344oHlyFQPpsGMM+KCOm5w74FihbK/3/w2M/JyHP0KN9vkOv3x33PbtnsOJa4T
	 x7huKW1gVzydbbmkXL8QNHc/mrFbhwq2Yg/emTqfEfrZnCmAwIx5PZN5mYoE+vqLq2O84
	 R0lC3isIDcUN72y+lw6IczxaK6+IrG46D0MhaIhrNjo4Ysjnbncp5w5R4xIosfeaRSvJz
	 fIxYUhZ1ph9L/ZM/wNY0MESxFazbovEIktgfdEeinmOh5yrB4Me814ZM4rCRij5ichEt9
	 P/elkATvjBkQp9RIVpjClfakxsRXfdmanZ/ewFFFV5vKTM3b7tUSq56IDgBh5ReWlOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84859606A339
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84859606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXf_lFlepqOHg+AA--.27365S2;
	Wed, 04 Nov 2026 10:15:33 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: hd3ss3220: put the role switch on the VBUS and ID error paths
Date: Wed,  4 Nov 2026 02:15:42 +0000
Message-Id: <20261104021542.1468818-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABXf_lFlepqOHg+AA--.27365S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW5Zry5trW7Zr47Xr1UWrg_yoW8ur1fpF
	47ur4avry8Ja4ay3ykKrnYv3W5Jw4UtrZrCayxu3WkGF4rKa9rW3W7tFWjqF1jkrZYkw1U
	Gr1YqFyxJrZ7Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwMBA2rqZFi5dQAAs2

hd3ss3220_probe() takes a reference to the USB role switch and then gets
the VBUS regulator, the ID GPIO and the ID interrupt.  The error paths
of those acquisitions jump to err_put_fwnode, which only drops the
connector fwnode reference and never calls usb_role_switch_put(), so the
role switch reference is leaked whenever one of them fails.

Jump to err_put_role instead; it drops the role switch and falls through
to the fwnode cleanup.

Fixes: f8d2bf7c0c5d ("usb: typec: hd3ss3220: Enable VBUS based on ID pin state")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/typec/hd3ss3220.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index a717d0f8a4e5..3898f55e745c 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -442,7 +442,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (IS_ERR(vbus) && vbus != ERR_PTR(-ENODEV)) {
 		ret = PTR_ERR(vbus);
 		dev_err(hd3ss3220->dev, "failed to get vbus: %d", ret);
-		goto err_put_fwnode;
+		goto err_put_role;
 	}
 
 	hd3ss3220->vbus = (vbus == ERR_PTR(-ENODEV) ? NULL : vbus);
@@ -453,7 +453,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 							      GPIOD_IN);
 		if (IS_ERR(hd3ss3220->id_gpiod)) {
 			ret = PTR_ERR(hd3ss3220->id_gpiod);
-			goto err_put_fwnode;
+			goto err_put_role;
 		}
 	}
 
@@ -464,7 +464,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 			dev_err(hd3ss3220->dev,
 				"failed to get ID gpio: %d\n",
 				hd3ss3220->id_irq);
-			goto err_put_fwnode;
+			goto err_put_role;
 		}
 
 		ret = devm_request_threaded_irq(hd3ss3220->dev,
@@ -474,7 +474,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 						dev_name(hd3ss3220->dev), hd3ss3220);
 		if (ret < 0)
-			goto err_put_fwnode;
+			goto err_put_role;
 	}
 
 	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
-- 
2.34.1

