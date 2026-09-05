Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151CD47988B
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611705; cv=none; b=WR0H8Cp4umOBaQQ/txrxXOcvXTBMBIgZbjhWLSjsnHWJZWTWjNsmf9SKAX0VDLcjVkU6y9+/yLNZuIkPV9hiTHZQaQNmzwovzf02ymiW4S3JkqSG3UtYOE/5ZMNJrIHQrjh3qx6UTaDdTbw8sVLU3nlSafSQck6LWcKWJaRhxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611705; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiehRhltJrtFtv5jaPqLqhkXUr9Jf6tZfInyMi1ojCWAE96pMZkC6zYR7iuYMkkHgubgi2Jgax7h+T884G+yHls6zHPCQEwQDI2gemtFxhXn4TVbFxrRBHdR4ipFEcMEdB1PSd5sml66EJd1RG+B5+kNk3Lp4a7/MKtSK7l6EwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfFc8NvH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfFc8NvH"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2281546a91.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611700; x=1789216500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=KfFc8NvHycwffxp/MuDnnI6GzEu6tIHkW7Y9k8dKiMJfZJeskPB3P5q6k9dVF+jvmM
         Ydfr1SY5F1o8KsO693B+bapTI3AmcIOQ12mZdNgtxBsDzt+uI8iSj/szdJu6H07pswID
         u8iCSNqEj9vr68rZF+sv77X7kqqF5mgcH6wEp8ep1ZBshraYqUf6C7sX5GQFyCG6wSjl
         dfzPw+cDm9IQOLhTcptEpWKPK4shPYU1u3ooFNYAlUKrOtMEVQvSj2jq57ArrJsZdR65
         R3YTlfJcbI2egUYL501e7Etl32DKVwR7vi6VJxGAv2j+HB8slAKHeTVFYzsbD9isqzK1
         FW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611700; x=1789216500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=LfZqvkNbyiWfslY81B3X/dA0ZzxUviq9epq6x1SrhFO4zjkLoaxeBcOETeAd1dXu6n
         Impt8gyGFa0RsMPIDsTSclTJXNG3y7ogGUK4Reqh+w0kO2d5fnM6kXXfVGJqQD99hxQI
         aD14UryA+CdVZccN2jWhgmLr8QcjgqaTKtenLFeNiJBWh5GgkfDmg0lmUiiWEmHb7nEZ
         mkJWK1Ff0yjWKLb4M8Q8bZ8qx20xh97LX8CZpiHagIhHa2niXqTSH6T/ysueQEFrCnAW
         cQoIuMXS/MVpvtCZ0Zh4a+kwkmgpzsFBHIy1nMwEEVIJsJQGG9TVeXfr8oL5onNzYxIF
         F62A==
X-Forwarded-Encrypted: i=1; AKwUvBzvM5WMs6vP3UhXPf60HaQ6pEUcu7mwIvWuLBb3MP2Lmg3/KqaU4HWhE3jaPYHN+1aRbFg0nLMEBUU=@vger.kernel.org
X-Gm-Message-State: AFuF++lgd1skSpVxYDzGvLh1QMAbYdWiedn1TKiUSWgeJxsIoUetqMq5
	5SyEhSN03Jqjjl7dEm5Jmr50HAw3lPy300woBQ6v83bnRR3NZqjCc678
X-Gm-Gg: AYBFou23Men1sApl1HtLBWjPup8e3SYfBl90o4VwqfLRxz1NHXQ/VDrvj96jV9xUXy+
	tpJspFjZPGod3h9XCPhY0o4Lugiz9ZN7Achm7cooR9pB5acnds7BNtCxI4ht+7X7cI7pqOYNP8v
	1wUbr3WrqVN3p/6fbWAIpHVZ2k8/huWkHx5h1grHFcaSnGwGOZGUP3yRiH/QOoOqJpT7xmSyvZl
	MG4+dYegDAtBfv7agN6wJM5tXozIFtg9rLifWlYAXL4GaDMFDl71tb9XoXr8ati6iTwuZZNoniD
	LGLkJU8JMfY9AMljV7+/tBjAI844HqI2pp1/SQK6JrXBOMtoH99Wiiz0rKWiKrjQv364mEBnRaE
	ENKfOgxokaG/zHSpfyXelFt+3YDpYH3yJ1jDAk9EItq8UAi0+OoO60h+WHbnig3JOTXdxMBk5S6
	QTjt6di7/HDELNUaZbt36egT4ec6pP6F1e5YTaVAsfdQQg3s1u7rWjO4h7V8I/idTMi10a2uMYz
	xeADeMf0R79EQskXZLV4qN3NcY9DEJG
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr18508993a91.23.1788611699999;
        Sat, 05 Sep 2026 05:34:59 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:59 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 2/4] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:34:48 -0300
Message-ID: <20260905123450.5620-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

