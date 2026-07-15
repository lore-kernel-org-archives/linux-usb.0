Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D113191A5;
	Wed, 15 Jul 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105183; cv=none; b=KBLjo2tqbXdTlfpmOIU2GJPtRWgj2PTCm0X/BXRQrUzeVlJMevBfrQ+V5OJQuPih4SiwPw1hy4WA8ZIJM0tfXVq+MdGmujK4SgFmd7YunZoMijv7kKNBtfXnX6EZoH9a1vxUJ/Lo3iZfBhG3ciKsSAc93uGZSYmQG5KxVpRzcVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105183; c=relaxed/simple;
	bh=ZAHbUd/7tRMd2MUxtedfXDFD3xmousN96yxgK0t+p0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeMRTMBfE6Bx9lHJhB2xkkqZhsdoTNSAvr1pckww5VYM4MaZ1xuAQ/4WTt8/2r0Cfu518CSCVIAiGLycdVUh0wuk7D5j9eoCOUK1zB1cMSqFQIAm32wBcsHY+viM79JS9QZM425QatESHcu0QCWLmUfyEuBW9Rl7h/Ma89wvTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAHfO_TSFdqy3xHGA--.9335S2;
	Wed, 15 Jul 2026 16:46:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH] USB: serial: mxuport: validate firmware header size
Date: Wed, 15 Jul 2026 16:46:11 +0800
Message-ID: <20260715084611.45995-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHfO_TSFdqy3xHGA--.9335S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF45Jw18Jry8Ar4xWw1UAwb_yoWDKwb_Cw
	n5uwn3Gw45WFy5trW7Cr9avrWrArZFqFyruF12gF95GF9FkayDXF4qg39rJryDGw48WF95
	A3WDuF4F9r1kWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8-
	B_UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

mxuport_probe() reads version bytes at fixed offsets after
request_firmware() succeeds. Firmware loading success does not prove that
the blob contains the whole header.

Reject blobs that do not reach the highest version byte before
dereferencing them.

Fixes: ee467a1f2066 ("USB: serial: add Moxa UPORT 12XX/14XX/16XX driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/serial/mxuport.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index e3c5a1b97542..fa7438ea8fef 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -1080,6 +1080,13 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
+		if (fw_p->size <= VER_ADDR_3) {
+			dev_err(&serial->interface->dev,
+				"Firmware %s is too small\n", buf);
+			err = -EINVAL;
+			goto out;
+		}
+
 		local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
 			     (fw_p->data[VER_ADDR_2] << 8) |
 			     fw_p->data[VER_ADDR_3]);
-- 
2.43.0

