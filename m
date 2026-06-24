Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7033254A8;
	Wed, 24 Jun 2026 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280580; cv=none; b=X4Xsm6dJP8bR7EvsRBYkPT7bAAO4HMIUsNtuvD/2bMo5H7Yy4tA5E6RrqnDNFR2Gh5e6/5qjf6nxtb0khqrP7WlWDvesblcz5kSC5Kj9ggJGMcv3jYaCRIybCjifwmc0MCrvVRfdPDgb6A5aHEvgITUNbwi7UVZU//mrbuHaBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280580; c=relaxed/simple;
	bh=g5WV09JGVfZ1qEjy61h1xULxAC+48v7Wmyz89kGOG98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YgYWCzXl71jw1kLRrys1s/Jtd4mGHfPjbVhKe8AvDN0NQu8xlrvqsD2512+JJ1Ymkd+mQ+PFvO7WyzR5hNohrXAdkbApKMoU7URiZ/XOnKvKdgCWLRsj/nD5gYb5uHMc8FTVZKuOwyZocxPRrizr294whnj/gk2lSKXu/jVsb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAH5px8cTtq1iStFQ--.23028S2;
	Wed, 24 Jun 2026 13:56:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] usb: dwc3: am62: Propagate USB2 refclk enable failures
Date: Wed, 24 Jun 2026 13:56:12 +0800
Message-ID: <20260624055612.43319-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAH5px8cTtq1iStFQ--.23028S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF13tF4fKFWDAw45KFy8Xwb_yoW8AF4xpa
	yUtF4Fkr1vy39a9w4rAF1DZF1rtayrKryakayxG3Z2v34xZw1UKFy8Ganagan5JF4rAF1U
	tw4kJan8Cr1aq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The AM62 wrapper requires the USB2 ref clock, but dwc3_ti_init() ignores
clk_prepare_enable() failures before marking the mode valid.  Probe can
then populate the child DWC3 device even though the wrapper clock
transition failed.

Resume has the same issue after context loss or direct refclk re-enable.
Check and propagate the refclk enable errors so the wrapper does not
publish or resume a child provider without parent readiness.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/dwc3/dwc3-am62.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index e11d7643f966..632634d6e81e 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -205,7 +205,9 @@ static int dwc3_ti_init(struct dwc3_am62 *am62)
 
 	dwc3_ti_writel(am62, USBSS_PHY_CONFIG, reg);
 
-	clk_prepare_enable(am62->usb2_refclk);
+	ret = clk_prepare_enable(am62->usb2_refclk);
+	if (ret)
+		return ret;
 
 	/* Set mode valid bit to indicate role is valid */
 	reg = dwc3_ti_readl(am62, USBSS_MODE_CONTROL);
@@ -361,14 +363,19 @@ static int dwc3_ti_resume_common(struct device *dev)
 {
 	struct dwc3_am62 *am62 = dev_get_drvdata(dev);
 	u32 reg;
+	int ret;
 
 	reg = dwc3_ti_readl(am62, USBSS_DEBUG_CFG);
 	if (reg != USBSS_DEBUG_CFG_DISABLED) {
 		/* lost power/context */
-		dwc3_ti_init(am62);
+		ret = dwc3_ti_init(am62);
+		if (ret)
+			return ret;
 	} else {
 		dwc3_ti_writel(am62, USBSS_DEBUG_CFG, USBSS_DEBUG_CFG_OFF);
-		clk_prepare_enable(am62->usb2_refclk);
+		ret = clk_prepare_enable(am62->usb2_refclk);
+		if (ret)
+			return ret;
 	}
 
 	if (device_may_wakeup(dev)) {
-- 
2.50.1 (Apple Git-155)

