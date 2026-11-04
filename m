Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758507;
	b=eVENp6OkWEQfRINQOQ5rNyarVPFimmoa4zGGRnh2knVMmjdnKiSgJ2nbY0aZq28CNCvr
	 OHiYFeok14LHMhsCNmBnuUio1kKteizuSfc2+IS1QyewbbvuEcZYvXFuyPls8r2WGWTmL
	 L3te0bQOYAI76E0LE42cIR+SX9lzU5NY/M7BYhzsGeAcoQjCNOjH88U4LJInkB3zPzNeI
	 R3HGaPlvqX8TyQRZ0Jxiy1ZLFhZBEh+qD5GMq1jZicBkuuGBeyy0HqbXLbWxpjcLdGr1/
	 VEAK7nafp3pD3wkJ2gJEDCbT/LkbFhXYWbmH+waJcOolTOlw4jZKNEYaG9wONDPmYzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758507;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mpD5GkivHen7RjdwzXzRCtw9oXLuV5S9W92YR1V1r+w=;
	b=xcy4Au2QlgfvNTzxWREILvZcbThhsWcUYQ+Pz1GhEZUwk0vserECeLLESn1NYLKCLbN/
	 AVrYDLb6yuoTyviwY7SKztKRaPtvSSBHUdAucW7ZPyMAXfvF3wNxSpQZAUDsD1+cyiZqY
	 Agq5hpHfUo6+wmc5gZOIqdTdmsSa+tftvyN0XPyqeZvZSJdSPFBB5qD91r4m4vBb9tuJE
	 o+x5bx9rUJbjknniQIPGbIo9sAff6KL1Gd+gASyX6l7sKxHmp0D0XVaYNQli/syEpm1sP
	 djHgpakj3v07YR1K4bygVdNioRtvVCrxKhewpflwxkUSc+p4i+d1a2GowXORRorp3rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26524606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26524606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvwplepq9nY+AA--.5039S2;
	Wed, 04 Nov 2026 10:15:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: rt1719: unregister the port on probe failure
Date: Wed,  4 Nov 2026 02:15:14 +0000
Message-Id: <20261104021514.1468596-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACHsvwplepq9nY+AA--.5039S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar47tw43Gr4Uuw13JF1xAFb_yoW8WF1Dpa
	95W398KryIqFWxXF4UJ3W5uas8Ka1xJ3yUCrWxt34IgrZ0kr18Kr4jva4jyFyDCr4rC34Y
	yr45tF95u3yDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5EQ6tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEBA2rqY+S6gQAAsz

typec_register_port() returns a port that has to be released with
typec_unregister_port().  probe() stores it in data->port and
rt1719_remove() unregisters it, but when setting up the attach state or
the interrupt enable fails after registration, the error path only drops
the role switch and the fwnode, leaking the registered Type-C port.

Add a label that unregisters the port before the existing cleanup and
use it on both post-registration error paths.

Fixes: 25d29b980912 ("usb: typec: rt1719: Add support for Richtek RT1719")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/typec/rt1719.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/rt1719.c b/drivers/usb/typec/rt1719.c
index 0b0c23a0b014..61fa865637c7 100644
--- a/drivers/usb/typec/rt1719.c
+++ b/drivers/usb/typec/rt1719.c
@@ -902,13 +902,13 @@ static int rt1719_probe(struct i2c_client *i2c)
 	ret = rt1719_init_attach_state(data);
 	if (ret) {
 		dev_err(&i2c->dev, "Failed to init attach state (%d)\n", ret);
-		goto err_role_put;
+		goto err_unregister_port;
 	}
 
 	ret = rt1719_irq_init(data);
 	if (ret) {
 		dev_err(&i2c->dev, "Failed to init irq\n");
-		goto err_role_put;
+		goto err_unregister_port;
 	}
 
 	fwnode_handle_put(fwnode);
@@ -917,6 +917,8 @@ static int rt1719_probe(struct i2c_client *i2c)
 
 	return 0;
 
+err_unregister_port:
+	typec_unregister_port(data->port);
 err_role_put:
 	usb_role_switch_put(data->role_sw);
 err_fwnode_put:
-- 
2.34.1

