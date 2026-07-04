Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC13B2FD1;
	Sat,  4 Jul 2026 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169254; cv=none; b=pnlGLF8FHyn2BCsYwSLvQp+ArCOTaraErcogczkP5U7zBHCj7bAg/5CXZZlLtdUJWBmKA/OUDafmAAFabvbGFb9VaZqDslO4/EKf0LOA2H4Aou8FmikCA+fUIODSaCmghjBLnbRSY50cZToDacb5ggDOpfBSb7MyOVMtwtxLUTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169254; c=relaxed/simple;
	bh=Nz0KD4SNmjzV2N89UmFep4U/9xUMq0W3pUhRZQgArSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDPVjJlp+c3F9AcgSUBsr49uJpdkd0PZlByHtVV/NSZMy91DLtJZ8hjbT26zfVgyMWUus078LHLyhJSPfxJMyXBVCJTFH3cAWzSWT8Aji/sSzxc9efulYwiQN1NrsDWTVl6dMbwqufj5nwr0RgOKDHf0gBe3WP1Y/e6LRW1fPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAB3Zq3UAElqpF_WFg--.11658S2;
	Sat, 04 Jul 2026 20:47:16 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Romain Gantois <romain.gantois@bootlin.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: mux: tusb1046: add missing MODULE_DEVICE_TABLE()
Date: Sat,  4 Jul 2026 20:47:14 +0800
Message-ID: <20260704124714.18404-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3Zq3UAElqpF_WFg--.11658S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr45uw1rurW7Aw4DuryrtFb_yoWDZwb_CF
	ykWF9xXr1kCr9Ygr1rKrs3Zry0kw18WF1kGFyvqwsYk3W3tF13ZFWDWFZ8Jw1DJF47JF98
	Zr4DXr18Cr4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
	Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUQ18
	PUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The driver has an OF match table wired to .of_match_table, but does
not export the table with MODULE_DEVICE_TABLE().

Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
information is generated for OF based module autoloading.

This is a source-level fix.  It does not claim dynamic hardware
reproduction; the evidence is the driver-owned match table, its use by
the platform driver, and the missing module alias publication.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/typec/mux/tusb1046.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index d6e1289a4945..34ef81f75693 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -178,6 +178,7 @@ static const struct of_device_id tusb1046_match_table[] = {
 	{.compatible = "ti,tusb1046"},
 	{},
 };
+MODULE_DEVICE_TABLE(of, tusb1046_match_table);
 
 static struct i2c_driver tusb1046_driver = {
 	.driver = {

