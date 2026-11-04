Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758510;
	b=csnWI1kn3hBcHPLU+VZGRkIDhLCTCbZgGQiGPHV5Do5qqTwsMwts7Es4s3Ix4in8cNHR
	 bRvUft4oKPbMyq/y1VGA7HY6SR+S+g0Ji5X60gC85IN0xBWBdyJzXNUkCTjS02BC+Bys4
	 C2BsdVQjzIvXHB9EK/ofsE8jagevzSiJDY2zS0RYQb+K68BgrLkw/EXKu35CNYjx3Xu72
	 yppd4qPr0pws2NB2oalOL0qwIx23uaUYBfYU4zVM/spGj2lk+yMBV5m2pExmjtw6Go5gW
	 BbUEwjp4j31IVT79PUPk4ztz9y3KIURUBhhJiu8qC0/45sxvttYdg9m1VPtxEIBV55w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758510;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=sONx+rPi2BdTd/PXdgTWWwzpcaD0KYfct4tyZSvXHCo=;
	b=KayyS3S4BzjjXFsJm0FnOAyDgv7Qn1MX+hoBJUgqEuicmsnXW9rakGvPtiElIVVyXHsZ
	 7hh1gevT7YzrGsS89tSPjmvbm3QGTu9KMF/LGkPFF/e9ZHyIUh1G/XMSIYLZjf8Ab9Hf3
	 /UUhpvB9rqr933X+nErINdabyZhovBnzMMFfYOdjQxsekONilvooNY2qcQiqJkz+C2w1t
	 GwvcN2//qjio9ComnNhvjVEyDrYQgb7o/tbL9MTF8vsjxTGhUkcCSKt7tw0jlflKRaE/6
	 KTeHabGJyBYDWa/rq4n5gvQ+vZvVR14HoCTTroQnp2TTAkaqx6YqRCNV3djqw/wMvVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA8606A32C
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDAA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEPsrlepqEnc+AA--.9362S2;
	Wed, 04 Nov 2026 10:15:07 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: thunderbolt: release a non-Thunderbolt cable plug
Date: Wed,  4 Nov 2026 02:15:16 +0000
Message-Id: <20261104021516.1468625-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADnEPsrlepqEnc+AA--.9362S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GF1fCrWDtFWfCF17GFyDKFg_yoW8JrWDpa
	yjgrWjyry5GFW3t3WIqr1jvF4YgwsrAFW3Gr9a9a1S9r4aqr12qFW8JayrXFy7WrsYqr4a
	qr13tr1fCa4jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEBA2rqY+S6gQABsy

tbt_ready() takes a reference on each cable plug with
typec_altmode_get_plug() and keeps it in tbt->plug[] for the lifetime of
the alternate mode.  When a plug reports an SVID other than Thunderbolt,
the loop breaks without storing the plug, so the reference taken for it
is never dropped.

Put that plug before leaving the loop on the SVID mismatch path.

Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 2e1b1a1da7d9..fad48aae6751 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -340,8 +340,10 @@ static bool tbt_ready(struct typec_altmode *alt)
 		if (!plug)
 			continue;
 
-		if (plug->svid != USB_TYPEC_TBT_SID)
+		if (plug->svid != USB_TYPEC_TBT_SID) {
+			typec_altmode_put_plug(plug);
 			break;
+		}
 
 		plug->desc = "Thunderbolt3";
 		plug->cable_ops = &tbt_cable_ops;
-- 
2.34.1

