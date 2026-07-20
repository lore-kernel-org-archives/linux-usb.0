Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFE40626F;
	Mon, 20 Jul 2026 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548349; cv=none; b=jVe6TfX8d+UDDWa801BhLVaqS+Foml8GAhGl+C7O6wYkIT581cPeHCWcQlJy6mLrzh0xvH+VFuNjtN4XcBQstsy8A3bKdE+3GUEClpq8nNKVJuj30kvVTl+Rm/F6ZmXF/+d9ewDU/eqxQCozyoYzY7anObtbqxu+6KBeGAdoZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548349; c=relaxed/simple;
	bh=fGfjIlBHhvJtiN2Szq0z4bjHNLFWYT85o1hI9Qjz4Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Eq830xt/e722l/s16dGUUTWSUiq2TOfDhCJovj4vSdx8WBPh8CQ9juYLW0ePtf170qFOP6S/WzhdhrGynyxP6nhcAUsvuGqieVyZtYC1V28jacdF6J9eOh3u3b0Wb9nZA6wMEPCTFYCmfxTfc2Ba/llpMGNo8RnB8TqxAc365aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAC3JD_0C15qjsWIAA--.52237S2;
	Mon, 20 Jul 2026 19:52:21 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] USB: serial: mxuport: validate firmware header size
Date: Mon, 20 Jul 2026 19:52:20 +0800
Message-ID: <20260720115220.84905-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3JD_0C15qjsWIAA--.52237S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr43tFWkKr1rKw15Ww4fAFb_yoW8GryfpF
	4jgFWqgrs3Wry3Xw1rAan0934rW3WFy343GFyxAw42gr4ayas7JFyxK3yktryUtr48JFW3
	Kr1qyF48WayUKrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeKsjUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

mxuport_probe() reads version bytes at fixed offsets after
request_firmware() succeeds. Firmware loading success does not prove that
the blob reaches the highest version offset.

Reject short firmware images before reading the version bytes. This is
source-level parser hardening; no affected device or crash was observed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260715084611.45995-1-pengpeng@iscas.ac.cn/
- drop the Fixes tag and stable implication because no regression report is
  known
- carry Andrew Lunn's Reviewed-by
- rebase onto v7.2-rc4

 drivers/usb/serial/mxuport.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index e3c5a1b97542..088d5dd8abb5 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -1080,6 +1080,13 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
+		if (fw_p->size <= VER_ADDR_3) {
+			dev_err(&serial->interface->dev,
+				"Firmware %s is too short\n", buf);
+			err = -EINVAL;
+			goto out;
+		}
+
 		local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
 			     (fw_p->data[VER_ADDR_2] << 8) |
 			     fw_p->data[VER_ADDR_3]);

