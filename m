Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758495;
	b=J5JVapURQiWb9u3F87dWXS6/uPvVlCd/GwceFK3QGCwwkL2z6y5+/NE0VB72mMpImi5M
	 HSeN9jk98BZZqpHE1ZVkWJshxhPLJTK+gke8Q4oUuNoCyAR0UQF8Bo75Fu8im0tl9THvc
	 sexpjkAkdQV8dsRiy9SmRJYn0SphXQ5AA9lnJP1j2TURFO1XZACMovFlHAaMFbYDxMlVf
	 h/siyAoK82gEpCuOQ+eYEPuzYGK/oicumpncvZ0Y1wqJfakgvQG5w0Pv+N4DFDxFQgzb7
	 Yrw1Cp6dTrU8lqBm9Ti5SCQRXJNYf/GfFFRMjJXrVsr/j5Xtm1FIa8mSsi0FYq74fPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758495;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=11jjPWiqgOMEn4N4YnRzML+1grEqbSxQFTZABNOP3Lg=;
	b=veqfwOZHYru2FawUP1fhtkhTZTq+Qyh4BhBXnNwjnlrJjHRs2+wZweXC9QAGhWD5DZeb
	 FLlVp5Yko390bgdJcZ/+Tl3oGwv1FniIUpGGfRZP9kSUiZipxh0R0Zfh5fXYHdJaFgJFq
	 erecnPcxJyKMuUwjBLDCbbj98a4h4VKMoAP1knMoZGRKzbV3y9mBEOeLrvAo57L3QxRL6
	 FCDYoGYyrS0CKD8svZ6ECMbIPZy0mYl8WZq5Ob0IvhRAXSm3NJupGlyCaLlYU56qdSMCE
	 RG/Y7VgTPKhl3s1wfMrLN5pk+7z5TWS/61HkNPY8Zk1dZu+1EqqQ0O3dLf1UQF5eErw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34827606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34827606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEPsWlepqGHY+AA--.9357S2;
	Wed, 04 Nov 2026 10:14:47 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: openbmc@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: chipidea: npcm: keep the ci_hdrc platform device for removal
Date: Wed,  4 Nov 2026 02:14:56 +0000
Message-Id: <20261104021456.1468462-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADnEPsWlepqGHY+AA--.9357S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw15Ww4fXr43CF15tFyUtrb_yoW8JrWrpF
	45JFWfGFZ8Gw17Ja1UXw45ZFyrGFZ3trWrKF93t34Uurn8CryfXF9Fqayjga1DAry0gF4q
	qa1xK34kJFWIkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5ENtDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQBA2rqY+S6DQABs7

npcm_udc_probe() creates the ci_hdrc platform device with
ci_hdrc_add_device() and stores it only in the local plat_ci variable.
The npcm_udc_data::ci field that npcm_udc_remove() passes to
ci_hdrc_remove_device() is never assigned, so it stays NULL.

ci_hdrc_remove_device() therefore never unregisters the device created
during probe.  Both the platform device and the reference it holds on
its parent are leaked on every unbind, and the UDC core structures are
never torn down.

Store the returned device in ci->ci.

Fixes: 70f13579c2f7 ("usb: chipidea: Add support for NPCM")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/chipidea/ci_hdrc_npcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
index e52a2b05cbe2..8ad8797742f1 100644
--- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -70,6 +70,8 @@ static int npcm_udc_probe(struct platform_device *pdev)
 		goto clk_err;
 	}
 
+	ci->ci = plat_ci;
+
 	pm_runtime_no_callbacks(dev);
 	pm_runtime_enable(dev);
 
-- 
2.34.1

