Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.6.4.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076120;
	b=qv98S/DBLNpmzUbI5OBoDecRvxT3+bvUrrm2blQgHXFfnd3RkhrcpZhnA8tLADBOc/fH
	 tkpd6luBifOtA8U3tbjXjM5b5b+r+ZPo46eBiZ03QBozqP9CQ3R6Ho/HOhgvwVBpzA/gf
	 CoKcDRIUCtgxQZDgPnIY57TVYeHxCyJpbC4w3OJfrNuaecq54mhRD3c22FVpuWCpOGk97
	 Gntv7Qe09qtn+KAGD9NJpXuMyhGVoV8kI1Yqorbfp6ITLv45081zLC916pKmr5S9BLeS8
	 rZXfbWZ83dEYUFkFQVQnotbuX21zhFgULRRpIoFjWyKT0QZE3X1IP+iQ/kUkluWDpaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076120;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=EX8I0XrMHSGwUnTBmNpsway2i8EjJlLf8OAEc8ctsmk=;
	b=Gx7mrW20EDg92rxvKaxXANPygxUtJ8UUQWKu3aH0Gj2apMEVNv1CiPfAwnZJOcqYcguf
	 kMUB16u1DHKFkTHvhDBmxLYXXNw3WQTgtvtudo5wN0/3VZB3EhA4V2nQ/scD8pFefQf7N
	 X2VDO4YfaLr7vIdKE24pBXz36jsaxaQgVa0eqznTIqrEqD9OjOspJ/hqVzxR0E6ZofD3h
	 pS+VqRnDk4/aXC5pudwZTtnKNVrzZM04gBdyZhnWsxkEXJXf1IRIKRWpsYWaa31j+8Vu8
	 mY5l9XLpR7mwHLALCSXPUj5PX4JLKRB834212N1DagCKC6najGsYTquu2a5ojNIxHmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=RpeXpwY2;
	arc=none smtp.remote-ip=101.6.4.70
Received: from tsinghua.edu.cn (smtp46.tsinghua.edu.cn [101.6.4.70])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22D260A6F79;
	Thu, 19 Nov 2026 08:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22D260A6F79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=RpeXpwY2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EX8I0XrMHSGwUnTBmNpsway2i8EjJlLf8OAEc8ctsmk=; b=RpeXpwY2dE6FX
	ZhntGsb5CEpe0+Pby9r2zjqswI7ct+hzznibROsCUZrl7+xQMyiXUYuhqdtkqedf
	b3myv/4nb4TqDqBLS+odBlANin56kDMP///rmy66E2b0lX7wVgsb88VPl+5RDwX6
	eUZ63bOqiWjXE4yMRA7g+NwEZcgDvk=
Received: from 14.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQDXlQMLsP5q3rwhAg--.22387S2;
	Thu, 19 Nov 2026 16:15:07 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] usb: phy: twl6030-usb: disable usb3v3 before releasing it
Date: Thu, 19 Nov 2026 16:15:08 +0800
Message-ID: <1795076108884-14-6a4060a6@mail.zgclab.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ywQGZQDXlQMLsP5q3rwhAg--.22387S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWkKF45AFWfJF47JrWrKrg_yoW8XF4UpF
	yDWa1Fyry0qa4kK3yxCF4fJF1rArn8ta45GryIg3y5Z3Z8Za17XrZ7AFySvF48tF95XrnI
	yrZxuFyfCFsrGrUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXw
	Av7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwAC
	jI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUzpB-UUUUU=
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgEQD2r+rloDeQAAsG

The VBUS and ID interrupt handlers enable usb3v3 and track the state in
twl->asleep, but the remove path only calls regulator_put(), which warns on
the still-held enable count and leaves the LDO powered until the PMIC
itself powers down. Unbinding with an ID-grounded cable therefore leaves
the USB PHY rail enabled and pollutes dmesg with the enable_count WARN on
every unbind.

Disable usb3v3 in remove and in the probe error path when it was left
enabled, guarded by the existing asleep state.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: c33fad0c3748 ("usb: otg: Adding twl6030-usb transceiver driver for OMAP4430")
---

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 9bfcb2c1dfd0..6a53417ecad4 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -403,6 +403,8 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 err_free_irq1:
 	free_irq(twl->irq1, twl);
 err_put_regulator:
+	if (twl->asleep)
+		regulator_disable(twl->usb3v3);
 	regulator_put(twl->usb3v3);
 
 	return status;
@@ -419,6 +421,8 @@ static void twl6030_usb_remove(struct platform_device *pdev)
 			REG_INT_MSK_STS_C);
 	free_irq(twl->irq1, twl);
 	free_irq(twl->irq2, twl);
+	if (twl->asleep)
+		regulator_disable(twl->usb3v3);
 	regulator_put(twl->usb3v3);
 	cancel_work_sync(&twl->set_vbus_work);
 }

---

The vulnerability was found by static analysis.

