Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551678;
	b=2iYHNfLj5d3JQ0S+hBrUKV0IthgCHqocKTEV9JWLTrxMYOrduRgAiXW3WuV7sPKOfJRL
	 k1ap4tRD1Dl71aZjt3sOwNZRGW52HH3Fm6iAPpg4LLokwJjsIA1fJ9h22f/U48v4vrfkt
	 fBcAeBB1A8JTmousXmMjrNuPKAEV2w+qOthFGT+VYyZtjipJvCwjNWaN0hGpW7V3ue2Eb
	 iMlb18cRk8I1oXKgX6/K+7Cf5M2rI0is7PZpa5yhmvuXlmCD3tFXVstB6ouAkhRPZLo6N
	 Z+bZn2wfX76kIs9/PSS7Q48Mz79uS73TrFYUVSvvHgTZpnb+QRiVqlai5wBgWl6Ui9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOfNEqSfoT59QxdKyBFLdjbrDM/jdxFlBB/CFZZqigo=;
	b=jf7tJx76UmOGJwobW99lI+BT0FeUYWpMLEtrR62pduYmhI3y8Pt0MzxIB4anLVUHW9wS
	 1yqTCoAVhwBCYgme0J/ZIFxizoTc8kqLEwrW0m0Dm2T/UgXKKLCwI2qOCsH6I5dYV+lax
	 8ZAgzBZ6XsfEQfhX5J57nECxDpe4aF753auoFcYnqS62oz4LeQn6rSpzyoCsoo/lww7bJ
	 SP7bXH36y+4olaqWOvCGUFKAXdUNZrsb8Udr5zxGzoX7MEtlIufkejwsIA6NF52beRqG2
	 +a7SjqhtO3myLpvfzXBld8ZNMqmBBM1BUUNfjrMx9O22nI4frfZ8qtHe7teSxCxc0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3Loi+yZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B279606A32A
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B279606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3Loi+yZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372cba0ecf9so67932eec.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551678; x=1795156478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOfNEqSfoT59QxdKyBFLdjbrDM/jdxFlBB/CFZZqigo=;
        b=J3Loi+yZKa0+P4Zo53EZvQDMuRxiuWsWDWXTJSFSt/2USleNVCFUgBgh7yT6OHZnCx
         3AFDPYUMu5C097q+gFZ7ZlobUPJFRCNLnrIjRgZ3iH3nA5SUH2ifkkQ5cPxSS6i/ee42
         RiUDcx5MdY63uLkqIFf98yOd3oiSnrYoZFxNRxaYmOQ0B1XlvBiwR7JVj/b6hvFHDlZ2
         a7RqBczAb3A7xq4SXez4R0hikQMrVSGJN6D5ibsqkh1t61u+VjTz+GH7e7r9uNb144C7
         Dou4inIMVRNHxP14Usf+enIc7BIB7haVm4Jp9uJHH+913uVLkzBkeyyXb3vhQ+77y/+F
         vjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551678; x=1795156478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOfNEqSfoT59QxdKyBFLdjbrDM/jdxFlBB/CFZZqigo=;
        b=WppWr/IqDcBMHN/5l5kZu0mACaQAijTI35qyDJWccDKlqGu7KYXpgW6F1Nv4KKDAXl
         A2FOWmWVwyH6TRsFTioaP7yOKgcYEWL94EcFCYjw3sdwn/8P6gThz9F6QE8EOS7OCT37
         li71SW/yXZzRIw7cqrI7KTYbkZFESSvOP+Q8amjJAi0+tqOS1/4BTcAruSBlEOXcSXks
         znW6jT6wjSdVPzI8FS9bxDUHEt/t54dpa0mV1uDJFwnESdT/fb5b+C8h0jE2VMNw2ZNZ
         g96xeRwomo6dZ4S7Jqc87sLoQ6gwuTjICwSoj5JdNqf9xjJGT7p+OGj/J01JF3pRPnlS
         O7cw==
X-Gm-Message-State: APuU4Z9q7uMLp1fmCIk9g3FnuKFXfEm0CXdBhVPHzu8zkJE83o8rKAOt
	9v4dbVRdI/GTm+miICF6Z2nnlV9TD0yW/8Lunq6v6qRvOb7quf8n2TpSmRANF9NMewo=
X-Gm-Gg: AYBFou0LkxXSXuV87ZBZou0wEqb/WXfCqhXHiNyNnpoXBKLLasCYZbxL3F6n7EPeZcy
	bO0Ep5A0NhkfTPBBotOpepmmwAGdWOlbh0v8P8R67bzki8uyMZ72X8Wa6zSsgptS9MmDovZaohC
	zj6C27VgZzrEazssC+BZBiGTGdhQfJHEHnqbJaFNzkwV7YQpiVVFJ0b0I/frQN7fs4HE4+7qjRx
	FpKatFt5h6FVGS7wrzMTj1f/9E4CIzSUgrRfATgbf71FEGvoPPeKLCfkMj/Rn0D1XiaDneLujYc
	kiBtOwQ4xu08bDsmwJ4KQExzHhVwQYCXzFt+fid+k1K1QE/LwcN3O2qth+kF3ALZlCXsFPTTEme
	iSlBsRcVl+5phNo+Y1M3YvyqO/KSeEfts2REAnE+pa57vCPRqgFRlsuO8Nk9k+1pmHHBglJ9/a8
	HnKJALrFOUDgC2LGDQABcayYvzj76q1BmSZ6gBTSdIxkuBQn4CTWM21YwfDymCpt3nE9czHGCaO
	+QTwlkBh2N6fEV2al2+7R2NNExSYlFhC0HIAH6lhjQUBOZWrORhZBqGNbzKMd8yAhe3Nt5MHhlI
	6z6qH4lnrsM0ykVh/MFkFdLc0V+00UBBwpso9e6kCQ==
X-Received: by 2002:a05:693c:881c:10b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-379655d503emr2060686eec.2.1794551677672;
        Thu, 12 Nov 2026 22:34:37 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm6745027eec.25.2026.11.12.22.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:37 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: linux-usb@vger.kernel.org
Cc: b-liu@ti.com,
	gregkh@linuxfoundation.org,
	nkapron@google.com,
	tony@atomide.com,
	bigeasy@linutronix.de,
	balbi@ti.com,
	shimoda.yoshihiro@renesas.com,
	robert.jarzmik@free.fr,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] usb: musb: dsps: free the VBUS interrupt before the child teardown
Date: Fri, 13 Nov 2026 14:34:07 +0800
Message-Id: <20261113063409.47485-3-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261113063409.47485-1-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
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

dsps_remove() unregisters the musb child, which deletes
musb->dev_timer and frees the structure, while the glue's VBUS
interrupt is devm-managed and only freed after dsps_remove() returns.
dsps_vbus_threaded_irq() re-arms the timer via dsps_mod_timer(), so
a VBUS event in between re-arms dev_timer past its deletion and
otg_timer() runs on freed memory.

Free the VBUS interrupt first, which also waits for any in-flight
handler, so nothing can re-arm the timer once the child teardown
runs.

Found by static analysis.

Fixes: 369469a92393 ("usb: musb: Add support for optional VBUS irq to dsps glue layer")
Cc: stable@vger.kernel.org
Reviewed-by: Neill Kapron <nkapron@google.com>
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v1 -> v2: no code change; collected Neill Kapron's Reviewed-by.

Build-tested on x86_64: musb_dsps.o compiles clean
(USB_MUSB_DSPS).  No runtime reproducer: requires AM33xx/DSPS
hardware.  Fix written with AI assistance.

 drivers/usb/musb/musb_dsps.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 91d8712efa41..69c8b4b3ffa7 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -942,6 +942,17 @@ static void dsps_remove(struct platform_device *pdev)
 {
 	struct dsps_glue *glue = platform_get_drvdata(pdev);
 
+	/*
+	 * The VBUS interrupt handler re-arms musb->dev_timer via
+	 * dsps_mod_timer(); the IRQ is devm-managed and would only be
+	 * freed after this function returns, while the child teardown
+	 * below deletes the timer and frees the musb structure.  Free
+	 * the interrupt first so no VBUS event can re-arm the timer
+	 * past that point.
+	 */
+	if (glue->vbus_irq)
+		devm_free_irq(glue->dev, glue->vbus_irq, glue);
+
 	platform_device_unregister(glue->musb);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1

