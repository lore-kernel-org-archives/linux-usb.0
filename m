Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438991;
	b=FBSQjhO3XkqhSmJ/XHUH2Fb0qgeZX92YS4fRusajejYfrFEYdmxFroSxIWJwBFofHT0h
	 JMFKzzSyF/FQCXDCusVHPbwPlgeQE/C3k9jFvrwC2UjxcRCCZfrRCcADnppJBzIDZyCZ/
	 O+6QcPFlWAqQtgNS1AFLyf5Mx/ZDc+7qf+N0aKLLnkxs6a0qIUEaee9Mf2Iep3tyV+dIF
	 agcRGgDhL6dBIQ4flK3orm4kb0ZSKFonkDlBTJyJMUEGR0OchVJwUntQa1rJFmRRwnPec
	 yMSo9Q+Vo0piOpCQT2jGNisDM0OI5uaOfVEgBcc7/7LJnmKSigHuIud5MH6MhHxFLJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DXYfjHMF7j6k0mtN3BH/w8d4nc907qjO+zSnG7azIAw=;
	b=ov/dopIenZnLxykYRmZgBsz00Tb9Cdux7O4D/1it4lxcSv2+4ZFzN8K+rhkuMlT6cp7W
	 Qr140Q4NT+x7I42QTuznJOV2SmXZpXZp0ohFY/ozW4bvkMBlfDS1a+7tYIFGC+k3UCRna
	 oIEBmEWVhzh0zJop1Oz1htwre6/UanNVR0PbMnjnIZQ4hl5mT74Cw7/pAWuzW0jh2SvZu
	 Rg6hHUQBa+yoYIH71BnN220Hn7tsyzF/PQO3Dts7q/tTjT4/oaXHtIs3umMFQ1VFtLvoa
	 oJBTAuxIPQV69UNbs4xcsHadk8V+ftbyC6GlQHaveoedVQuKh4l8acxRRWB2k7mhnSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g7LmM0Va;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23474606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23474606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g7LmM0Va
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c51373ae637so489896966b.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795438988; x=1796043788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DXYfjHMF7j6k0mtN3BH/w8d4nc907qjO+zSnG7azIAw=;
        b=g7LmM0Va224jdPXvZ7OgKVReUJxGW4wGuat6pFgfas11bKklJS589Gl0afZW6bgnVt
         3L3Bgd2FzCzoABQmxavg3puZLkdVshFb52dX95Cyi1Tz9GE0RdkTw/hYyUT8jPFCpg/5
         4vHPmAGz9rO4Sp7flV/z8Tg/Knwl/nDB8roJJTjSiUhwAJutUacw5D5150ri3+vRYDNU
         3dW6SwTt2E7GUz0K4yPB/J/VnQMxOHluLnGkR5Up+Nnd2UkT9yzCds1QtGfr4HLHkclw
         s4F9eMmncTojn/KNH5IVHH9hmv870SwcDSBNAiauoYTNAP7cq6r3c4KCH3u46nn5rZNh
         UZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438988; x=1796043788;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DXYfjHMF7j6k0mtN3BH/w8d4nc907qjO+zSnG7azIAw=;
        b=rRU2DnNN7wI44YJOuwWMZGbzCUW1Ivww0mm1DyEBDx6eP+REwA/9dv21pTV65AmbAt
         4zpIJwyy+tJKUgyJ78r4PgKAN083LKgWRWMR+UeiskxKRoWnryVT7hnR9BmzfB4k7XcV
         unQrdg1prMp4Yzbq1PHyfei5+Rmk57/hu7kGeubhP+VFYG/7/4TPIat++I1x2UPl9USa
         1r3kFLYU61zUKa0QpKpdNvYGpLZDA8v3t5+WCow/TbDH1zDXDS4C0uq3LtduP6zBFUsf
         lM81jsJnLh0PUMw71kPNj9HtCZi4amIJ0Icm3ZcbSjixdKuHuxXjZ7lUbO5GXYcgLGfG
         XEZg==
X-Forwarded-Encrypted: i=1; AL+hErHJNWC8Jm1C537DYT/6iATyaXR8rR0fEqlHtMZERmH/Z2kIFPXFggmay3b5hr7hKCKBRHJegmanCIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m6+JA7T/3rJNeh0PUjQi1JtG5Ef1YaYkqAi5xi94cQnV2rZNl
	WtudLzTxIsnMAUZdY9mVXr2sOnGqbOgm0LyZjdTCVhEQfkA4d6aby9vsD8Ux05ZXDok=
X-Gm-Gg: AZFdTZdfJcjYKKPwpyBQaAsRsm7wFBF4AnmE3P3Zm9CMM/IE0jM4Y+IF538g8Xi8AdI
	Cgt8FGlPixfmXQDKQsSTHYqcTS0mBbtHpXT95zOkpSiL+7DBKTFb3ihGi3J54dT7a8yxKe5npl4
	1sOOd7CDAnSageL8bjBHmu1ZWyKl8Z5pO2s5SOyzdqfXoJuN5p8Hfv8rBowcNzkRHiMqvGZjTzg
	SdvBOt0L60ZXZLPjEqfamDLKQxCt6jfxrhUzMM+o52hTccvWtmgOjh/zcOLkMq4Bf3ZRSWj1lCF
	Xzujh4Zj+gU8vee0iQUIoGIBfLAmq83v9VTK8PlfoGLIvGTlQEvzo6A2roWL3trAgL7Bl9+bs1t
	h/i7Sq3WKSteMEhUe+X1/oMkWxzApHK4xWNncyO4nPFJPHaR3uEsAi9Fkhxni5E+qahpCgM7Hq+
	EXv5yu3QN4wMmyuDGBe2gNh6TR293uP9Z/LKJwkec0yhH15ME9KP4PGr2Dbtj2vc8a+gM+NK7xu
	5+aaOY56li6NbECNGRnVa4K4lU7Q4/bbshsQOuFz79muUVGhl1HRnvKKJYCAvtYWqG88nu1wZ6E
	//kj4PDBHOREf5SX2dEbiCmuIn+Br6i2Y15bv/iH1WkFPIM5IA6zp+8hpXdBlpXPzt4u9/fhUF7
	XMHjwevVnjVxNT7cbXK8XQwup5gJJJm15ITF6tqo=
X-Received: by 2002:a17:907:a890:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c513ab14402mr997167466b.43.1795438988469;
        Mon, 23 Nov 2026 05:03:08 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm401379466b.70.2026.11.23.05.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:03:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] usb: typec: tcpm/tcpci_maxim: lockdep and PM wakeup
 fixes
Date: Mon, 23 Nov 2026 13:03:05 +0000
Message-Id: <20261123-max77759-wait-v1-0-6fa54a751bb7@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIk5BGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3dzECnNzc1NL3fLEzBJdQwNLc5M0k2RjQ6MUJaCegqLUtMwKsHn
 RsbW1AKjieAtfAAAA
X-Change-ID: 20261123-max77759-wait-10974f4c312d
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Hi,

These two patches fix a lockdep invalid wait context splat and a
probe/unbind wakeup-event race in the Maxim 77759 TCPCI driver:

- Call pm_wakeup_event() from the threaded IRQ handler instead of the
  hard IRQ handler (the driver uses IRQF_ONESHOT, so the primary handler
  runs in hard IRQ context even on PREEMPT_RT).
- Initialise device wakeup before requesting the IRQ, so a pending alert
  or an interrupt during unbind cannot miss recording a wakeup event.

Tested on Pixel 6 (Oriole) with CONFIG_PROVE_RAW_LOCK_NESTING=y enabled.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      usb: typec: tcpm/tcpci_maxim: fix invalid wait context
      usb: typec: tcpm/tcpci_maxim: init wakeup before irq

 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-max77759-wait-10974f4c312d

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

