Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758520;
	b=tW8nYc6AWgRXAQyJRjzzXmcY+p/UedZRwUUrf57oSWPHbOlC8LUjQBOHXbAOiWTSI5wK
	 r3OmFdo8YzWloXbpznFKrbzkCH1Buayd33ryMlGkvqFg4emoqniN87A5Xw6oGRZZ9qpVE
	 JaXuu0tV6nd8NmRRxsWnaOYlTOK6K3cPQeWy/C2ixbAwZapRCzWXNeoyPGFFsykAWD08B
	 sOBbvTXH6daWI/I7Ye3kzpYppHyoWWYO9hr0xbAQSo4DaW75rFTvMk4RuuJvUIPL31MPN
	 BGdSrJCg7zOAf8sMYGm8nacohHJYWpjflrShFiySQsbaLETPrlgx6dvpeNkTUddFMYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758520;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=zwY1DGSD6vA1zzQJh87ENSbdV8ZIO/525qWWL6Y6g3E=;
	b=BPW3dgVTw8btxPSZ0lfi7nAPkxKssPPh0IRM1G7nKIE93oNSeun8mNpkr1VkZKbqgyLB
	 5k++gLXj17AzJp0x8LgfjnkKqAMR5/GVY4Ie5e0waDIES164OaybYkVIlbNjbgqvMxfvv
	 KtdqyVF75Xrw/fmJhr186soVGYKcwuxQ/MEy2mQP40TD3IKYH4Zcye1WsAQYO41Q3Z6Vd
	 d01Xzo9l4dQ8CnsVm8SyR4JPveTssMUArEWtERatM/TuTul+xi7Q+KD9RR7SCrvBAobUp
	 qtvyIMQSUc1WQyTxrbXQXkh3yQZWXyeWuf3MB46Brpe8cQ4l7VHPgeCfyCDpFn2xB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0757606A32C
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0757606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXwvwxlepqRnc+AA--.4848S2;
	Wed, 04 Nov 2026 10:15:13 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: musb: mpfs: unregister the generic PHY device on remove
Date: Wed,  4 Nov 2026 02:15:22 +0000
Message-Id: <20261104021522.1468663-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACXwvwxlepqRnc+AA--.4848S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZr1fJFy5AF13KrW7Jr1rXrb_yoW8JrWxpa
	1UGFWUKrWDGF47Ja1UJw1UuasYkan7ArZ0kFZrJ3sF9wn8J347Wr98Z3WrZFy0kFW8KFWY
	ywn8tFy8GFZ3ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYbiStUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUBA2rqY-m4xAAAs4

mpfs_probe() creates the "usb_phy_generic" platform device with
usb_phy_generic_register() and keeps it in glue->phy, but mpfs_remove()
hands the controller's own platform device to
usb_phy_generic_unregister().  The generic PHY device is therefore never
unregistered and its reference is leaked, while the controller device,
which the driver core is in the middle of removing, is torn down a
second time.

Pass glue->phy, as the probe error path already does.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/musb/mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..6cc2909b8ae3 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
+	usb_phy_generic_unregister(glue->phy);
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1

