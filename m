Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095726;
	b=GfUSJ9M9EXITHxncoOk5nJkd1uh4o4IDm9XjNPSgV1LKsakWv9az2nO9QXbqtTcxE7ts
	 AMd6nZzESZZ0R0EKhbPFwEoFjMmk5+yumiAUECivKx/hTIpSzKEb7fGf3NHttzcz7GnwO
	 HbKmoin4k4X3AYeUUqXY4Mz9EuHpO0X4O6elnx6GrxWH83jE4/S6XpodBGe7CsF4eOV90
	 8Owz371VdcWb11+JUNhW29UTFHDD089j/rmFangG3QZqOaYD4wnAP8w8cHHGKGTfDEKR/
	 kkCGtkVEb2kMxBeMe46cQLysj9++CBsVQMf+AlNUirxPRm13FZA4RTIpKTykmyw6dLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095726;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=vJrsW3QpcJrdFLi6jNUTW5WamsTYGj6uur68EPicJtg=;
	b=BSGZMsCYLblhJNHPjRjybW9394o/aBVGShSN1/G1oa1L3jzBenJm/B/znrn5/l4puLb/
	 BPYvyAxfehsV/k/YMjaSTuVlD8WVDL5UEDazlMgvXXl+rP+lIPZlra3xfRR1rK3D1QhLB
	 arMbNmsMsLilLOVPUraD5ztq1NhE1XSistRQyCHznq9r7UgYkSdsdzM6zw8B3HcaHf4L4
	 oIoGbIl1bgS1WCkSOut9TgsdRZOFPiFkpy/i1pMfKjeL9ojXiF6R18luH/kJClvpDkyMn
	 GpiLZ/92LsiseGPXwMlCLx0ZN4BYQNoIR0SFU7gSaOVfHnK3179VySRAG0/mRS/jQ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kMAbjjf8;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184F606A330;
	Thu, 19 Nov 2026 13:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E184F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kMAbjjf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095719;
	bh=vJrsW3QpcJrdFLi6jNUTW5WamsTYGj6uur68EPicJtg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kMAbjjf8/4w8SyN+B5+D4IRhUF6WPN7QTjKCntv0spsfQD6EkqvmlZwio5B6L5izQ
	 I/jmUQFNgNbQpKbnTRtqdEYXketxj/y2iDln8QOmslEsKkeL6MfDnX40g8KSoGbyJd
	 Sc9VayWXpmt1J55iXSRF43nREa6MFDsE3p6COnzo=
X-QQ-mid: zesmtpgz7t1795095718t435313c5
X-QQ-Originating-IP: vFNWcEIqTdt36hWWfc+IdUrGAof3bNn5eftkVjG1rQI=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:41:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1876427186186974373
EX-QQ-RecipientCnt: 15
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Thu, 19 Nov 2026 21:41:51 +0800
Subject: [PATCH v6 2/5] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-2-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=2411;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=EogbRnEUW+1QVZRECSe0HilEGsZ6TP+VoWFnoRjQ0GU=;
 b=PweoQLIKEM93ORqSyu51umA/FsgthDkQ0pAHUrA2UApyFjhrKJ/hN8q+8F1ys38I6mAxmdqcG
 8rL1J9MJb8/An/zizF34JrMoelxghQ75yOrlVCpZ2fNelANzGDjjAQi
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NnOR0lrRv3QeY323dvAwRP9dFcBWX7oEwb1JS9HnzeXqrhsZEWkNsSLZ
	vTWLx/wsIZ+wCG8gpqiVRd0kEXHIZp9Ep5/EdsGy50AMS24Fr07nHkf2eyC+vaFQHBGmsUu
	AN34aCB1Xq57Z6hgDvoR17ZJ0kJik/83HKp/6fEQFUtyTfefljPMdkVPkiZD0mrTTucSWR2
	bO0cSknLY2W3FvJx0PZNluJa90TZRy3gB4c88Qf9pPzz07mphDHEeraprnFm4yvMxqQnP5V
	1keDWxuaK/KPc+PhinBtwqAa4MdrIlvoW0mHyD7SrqP3x+dLq84Ek7UDR3yJrNH3FuEoDcp
	9bekdYX5Of+Dnaf4PBymC5UlPAt5cY79ga3fHsaOLL9fg6Cj7TV2I49SnujCEAqdNIq4RDe
	3x+vEDDjIulAM+yeZ3qg8UM4l5UMkNnJ/1AwwPkB92SKxLkyA4smUz266Mg2K5LCRpS2tFi
	BN4RU2WxI2OMXUGjzmy7YsF/WSYrd+g8WGWeAkR8w8pTZuic/6ym1GW7yHpK5iTG46fW6lC
	wVUm5LpyV4EVqeZLYhzuW/4kbYWT/OUX3BgH7ttkjVBt51yk3VyF2nH5xlPs7brYd7jufw6
	WCQe0JNlGBTkxxsrenOZz8mX4whus1J2GA3W2eRUyulFbsxPUDXVw/ho9sY4gg3ysiPUkzD
	Avy/eifNeNqoHFu23arH9s10nSwwACnrymXw8mtg9LfdxHD0lyZl/ijQTQPLrhy5YpDsBOl
	GKAdt2t3iFVmGXQOXSZGgHaPs2td10wGjLgIZF8A2p+xPjQGCcbhTXejclIrAuQJrDNeqq7
	sGQJMCRFHpAjnwjF/7S8wZXMLmOPyBttWUnrgK5po5orr5DY7nyONkP43gSHPAYSThmIuCd
	htXOLvG9NbwTLglzrb45aBLXWc0OAc+wUYdV0a5Q+ef7d1KiqQtiUga3iPUyXgaQpIMoqdw
	ar1ke3JK5dJl3u03/IdDHfppikh/3FcGZ74cK8tG/FSNheCLwJpi4Wo7a5lZvZVBMuRNmYQ
	1IXFihc4DFjoD0gbLl2vlhffKCkh7qP6YeX8e8M2iDkcj0rbTUScvzIcsZJ5Kj34xDzvt/X
	yK32KZyLx/2dVttiTpiKPtDny6nZjIqhw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Convert devm_clk_get_optional() and clk_prepare_enable() into a single
call devm_clk_get_optional_enabled().

Reviewed-by: Yixun Lan <dlan@kernel.org>
Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index b0200c5937cd..0032f9a9888e 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -20,7 +20,6 @@
 
 struct ci_hdrc_usb2_priv {
 	struct platform_device	*ci_pdev;
-	struct clk		*clk;
 };
 
 static const struct ci_hdrc_platform_data ci_default_pdata = {
@@ -52,6 +51,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_usb2_priv *priv;
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
+	struct clk *clk;
 	int ret;
 
 	if (!ci_pdata) {
@@ -70,15 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable the clock: %d\n", ret);
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get or enable the clock\n");
 
 	ci_pdata->name = dev_name(dev);
 
@@ -90,7 +85,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"failed to register ci_hdrc platform device: %d\n",
 				ret);
-		goto clk_err;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, priv);
@@ -99,10 +94,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	return 0;
-
-clk_err:
-	clk_disable_unprepare(priv->clk);
-	return ret;
 }
 
 static void ci_hdrc_usb2_remove(struct platform_device *pdev)
@@ -111,7 +102,6 @@ static void ci_hdrc_usb2_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	ci_hdrc_remove_device(priv->ci_pdev);
-	clk_disable_unprepare(priv->clk);
 }
 
 static struct platform_driver ci_hdrc_usb2_driver = {

-- 
2.34.1

