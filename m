Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816925;
	b=aH2wL+HZrHDqXpVlMJ9icuyEGLQTdRUgC5icPdsiDvbFaXpb+zgGfqKdpk5VaGIvx6lv
	 pSNB8eAkaUaRdDAQmXWYdZZR9LkrYDJ5bvOnywbGhrqQZJ6iO/C0LgLj+dWdPVGBpC2v7
	 Q4vo/1prCNaIimPmvAOSq32Qu8d2twhu54Mr/DkHlGg0iUN9MLS4UZ0bvP58JRnYgcSls
	 ziABCQscx2QscnRQ5q/o9ugLmNPxbJiRj/J3HH39ZpphT1x48K0CONU5IQN1UFpa6M05J
	 INH4P0KHTUGqWr8oyQeRHAZH5UyK0MsYs7TEK7oIsjvSdJLMHgM5BKSz9p2qcptdgeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RmHpo3+pR2s5ML5HiGnTikUyVxsXw4licnGddfMA2fg=;
	b=VhnaEmLpb4xSjuJu0L6KSboiXHLUBmgX40F+OPsjyCT093dxY+nqdZtSP47Trc9JKeVr
	 OCNGm8TsrMaaPURDHlcVvP2zGAwyA1xTc8ro8Lh4oT1GW8PS7VIsrCra68+j7Y3ezAXdS
	 JnfG53RzgeZO5SFPKWbAN+mf59qM3rG96wisq7SBOywj+K1+PQhK5X8DOD0H2WKOLhXwe
	 uwBmVfLPlw+xvytlqBUl03SX144aMazz5QHTKJBblr12UO4FXGA49oyQHP/gSGf600xaB
	 KnSPxq1V8ZNHLKLo2cQM52lgGCv7G5C4NdFjjkNR9QYX2PSxslWB0ZqhvWlopKkhwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnhuRls2;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C12606A329
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 18:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C12606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnhuRls2
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so2313104eec.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 10:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816924; x=1794421724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmHpo3+pR2s5ML5HiGnTikUyVxsXw4licnGddfMA2fg=;
        b=bnhuRls22bPr1CgblNs2CholbSpN0yqFa50f5qD2aA2WkZVca94r9QS42VwXkcYAZo
         My/elqfe0kiSvN071wEeMoeLihKJbWpGZol76RSeN+C46JbO9iWfHPaTjQD8zqy7mxqY
         KFvf3ASdU7UUXszVU29ZtjF/bf966F+ZRvUgYCJQoSCvHuk2xYdeArZL8Q8DosBJvXhp
         Kaj8KTas80UdcMQX/N6ssYOYuMtNM3EADY21ZGzlTSICyR9feHDuqOkUGU9252Q4HdWc
         0qNOqijNlGJyTTBUXNOpqLFZ+gx5XRDKBf14QiAMNHNbxfsvyLfR/FZ3KeXRbbvAmC4Q
         eJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816924; x=1794421724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmHpo3+pR2s5ML5HiGnTikUyVxsXw4licnGddfMA2fg=;
        b=xSrg1RmWoPX4SDRVDHDsQvA6G6DXj607c/bUAT2nojECMSJip3ANKu2hbiDH/nvBy0
         OLCpyLXtUUQ6EUJtTFCN++2aNWzAn+j7zHfeNZOpZiHXnFdHme52D2Awn8m5yRLBMZAQ
         gNH4BlPdDDyhDMkESRuKVk/+yN7gLYqhLk/REM+YpqSQB44CXixw/BH6WqQjiGt8b7rC
         EGsoV00Ll/1btxQxrMxK9TMEptUEOeUrJrdqOBdGeJroKT1IT2wVmDz962uQ47UbsYjx
         DcIFUknrLqvsl5/Vf+Zn/MoMOH1zKsRwvOubAtOvI2UHhBn2WwA2craaykCMygkooN7v
         AuSw==
X-Gm-Message-State: APuU4Z9Y/z/yXt+YPtQbY5hiP2am5Si1YfmW+oYmk2G87WMvQPoZK6jn
	4seUIeEaYlSJErNA1YtHW2i0bRgO+5pEo0Q9QdrKMt3BJCubzTBsF4GF1uVS3KA=
X-Gm-Gg: AYBFou1JfrdEu4OS6jQNstbqbc29RPJKmnoZwqCJn3XYfhQHu72GstyrBy3odzGYDw7
	e7NOhJYvSX3c5xVaEkPfFFKf6vWYdsn7Q46QREnrZ8tGC42yHBGPfTaHSg+bQCbIoBM+h3l3BSK
	u9MYUtvzI481F6jOIQr6PPG+3QuHB2IAR+4t1X9vWXeYIynkuAuDUgPzsiNo73zUirsic7emaEt
	69EPNXtU+zhdxPj/FpHJdF5j0HGmWhwo5JX1bIPwdfkd78tXOKQBuSzYvPoAzfCqAdXWcTLy1LU
	6L4yqDs58gsrlxhxEHMHkxf480OMtHoJW1cLYD/2i30T88dhR6WNg6ZB7MeRK/0GqXOqzBRfueE
	xjuTqFUVOR39LD90RPQmxjeFC1RrjmIubGYWjZbqG9WyONjnoaOHz+MRImUBjyNyIZP44ekVPU9
	FO4wQL3QLaEGOW/6Tn7oHWWw/Mh9eA0zHYc3FdZxXpdNKM8eCSwvm1lVJ/oFI1QtypveZNQ7L8I
	Z4wMTqz2TNHSa5ID91NT/ccV4EUMnxDAVNLlqqNSdjDUkIJ+qWAfVD6nfqOrLWIEmggKYYDbBN4
	bQGn6Z1xmKNxGkjd7r4+848/2YiN+YrbkRHNhBKhCUYnkQKgCMaFZTlapMV8J6M5iZ5v
X-Received: by 2002:a05:701b:450e:10b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b24f2b4bfemr377336c88.0.1793816923539;
        Wed, 04 Nov 2026 10:28:43 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm9412265c88.6.2026.11.04.10.28.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 10:28:43 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: musb: tusb6010: retain and unregister the generic PHY
Date: Thu,  5 Nov 2026 02:28:37 +0800
Message-ID: <rc-review-20261103-35-b81ec08fb02e@gmail.com>
X-Mailer: git-send-email 2.50.1
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

usb_phy_generic_register() returns the newly registered PHY platform
device, but tusb_probe() discards that pointer. The zero-initialized
glue->phy is later passed to usb_phy_generic_unregister(), leaving the
actual registered device behind.

Store the returned device in glue->phy and stop probe if registration
fails. If registering the MUSB child subsequently fails, unregister
the PHY before returning the error. Normal removal already unregisters
the MUSB child first and can now pass the saved PHY to its cleanup.

Fixes: 2f36ff6915c6 ("usb: phy: generic: allow multiples calls to usb_phy_generic_register()")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

The N800/N810 registration path remains in this base. The proposed
OMAP24xx removal affects its future use; please advise on the target tree.
https://lore.kernel.org/all/20260914140821.1805449-1-arnd@kernel.org/

 drivers/usb/musb/tusb6010.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 1d9571f24a56..a7e0c6fabca4 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -1245,7 +1245,9 @@ static int tusb_probe(struct platform_device *pdev)
 
 	pdata->platform_ops		= &tusb_ops;
 
-	usb_phy_generic_register();
+	glue->phy = usb_phy_generic_register();
+	if (IS_ERR(glue->phy))
+		return PTR_ERR(glue->phy);
 	platform_set_drvdata(pdev, glue);
 
 	memset(musb_resources, 0x00, sizeof(*musb_resources) *
@@ -1274,6 +1276,7 @@ static int tusb_probe(struct platform_device *pdev)
 	if (IS_ERR(musb)) {
 		ret = PTR_ERR(musb);
 		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
+		usb_phy_generic_unregister(glue->phy);
 		return ret;
 	}
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
