Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499514;
	b=OdrpiT6ltXG+cHpPRE/pHbJMTTi2lJ5cM7BDocnQmmAaGZEKLCO+qa3VHi60QivfE5pf
	 4OTJ5nafOOpeIxFmFdyCCIttB1IeGpBzEt8bAj0PvZLcVHip5dstT4JEVBiSJXOcvMCmB
	 18mSklislYaIrvLpRzK0OadSYPYYS4FvyU1OXTKT43BqVp4sbxxtPfhcB+hIeS/QHOdHY
	 /df1Z7Gxv5zxhAhilorKmKi+VFfY6FzQFR76DewbT9UaI3yb15uDJvrhbkpNAYstjJXZ2
	 Ggsm4W7cjKZzYZz56H4q3EAWV9OfJLMA6ZR+w7wMdTYauBWaSUq5Ge/VmXQFLLtAHPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VMc78JgEAs7pEZMCa+sdp1KqpJLxePsHY7uD0WQ1SfI=;
	b=mgCBsA6bDb8prG+bGTmArxH1baFY7jFAyttigV46aF2pGyZF6kaMf81S+vFukkhlWYHD
	 0aogsk4woS3G81tJvV7zyVirJqHUG/ij7Qld2431/Jc5HT/yGh2+D1x9GeZ8Brun+s/R7
	 9MNkZrrmgiwZVKs7LAFPP+GpcAlxEqO3fe5zIBDfOKCtgEkpY817uCFm4UmJ7CZLgzOrO
	 UmRNfS3ne4jbIxTaq3Y8JiG+hVQWav0mU7VS5YxzNGiW1SrkuclBm9QtDvSJw2fUG9Ot4
	 JL+yZkeD+Ta3LDokihCaaO2anwnsB5WUTQnWPUXT5aRwriWwcHNBHTFsvKibtfDdkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1q7RrDR;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16A6606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1q7RrDR
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-376a4059061so2189eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499513; x=1795104313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMc78JgEAs7pEZMCa+sdp1KqpJLxePsHY7uD0WQ1SfI=;
        b=j1q7RrDR8fZBAlj+F2pwk9+Ag3SURyZ9+eispT9RdIXwg4+OZyNr2vtoHdyOeYU78U
         Yf5Ffp5ueJyvP6Y4TPA6CLVbL/3o8Vf7CYf1simUG0vN+pBuG8fYU+EL7SCNA2RPuhou
         ausY6rusQodrFfUvpOzEGty4s223ht7uIdP//0wOhYHntW5LhoZcx21a5EW677CYB7YH
         KHFgZHpDfYa8re7wGaVBAdmR28tmgy4hO007PsHoe78Vju7sFMunH0nZvVNI8uc1vGCB
         IeqCrhQ+bdO49pHs8myjvAH/ECWnxwL04WZXPue0X+07EzX/7KDwguN+P+c5viGHIDVy
         BVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499513; x=1795104313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMc78JgEAs7pEZMCa+sdp1KqpJLxePsHY7uD0WQ1SfI=;
        b=jBGlrGZWgVrMpZ4KFOKrK+kSz3r1N9DdFjfeE+suHMJ88KTeZ3rc4kjefQlLNoPxhR
         tl5vOnDKlbEexAIQS9XbOQnp58XN/36WeYzjzsn6dwEByNCAYkVGW1aM3cNcVdereB0g
         ZtlyP9PyyldXcVu7kOXU1ObtqMRRyrdYeQt+btQRHoNsQBjilgTV7f+KneMTUOYnPbmx
         WSlSRc8yV+ysFjX/K+Z9DL79HNq+LkicKK1m4inzjcuMmaVn1FprFeGm8n6qBfIcIzQw
         fVobOPzWmDEbremZ01YR2lvKRKURxOSeU9gOeOyYaVYsOfzc9oooE42dFOlSJHL4wIdo
         T99w==
X-Gm-Message-State: APuU4Z9WF/N5kMAlc9t3m8SIKHT2PLg0cYxHBYo2OaJZ1c/U8+h3alo3
	TgvyTwBIOGCb2py2WpIFYkQLC7J8RqWM4I/aJsToP3gFfmOY0TjykXAIJ2u9zuS8Kgk=
X-Gm-Gg: AYBFou1XPu7Pm19pKEHZnMTNROJAhBGhOto9u18Vw7AHcSN1amrze1TmSnehamrdgal
	6vNsa9Kc9wk7btiiiDBLW0avGBWoPkcjGEwUIdkFaLIeTt4PTpIb0JIeuPDQGWdGkaY7oXb27wI
	cuIvGmn7ZW3/HViRM0c165rV7n7FcX4gQJAwRSx04+m4Z6cuV+IzpiJUmXE8FpKSz0s7fA6VFOw
	twrxkVtOnRmMaxGQE/AVzDoqFJaHlyKmHJahIOkcxSh0HLtS/dXcyPI9ts1paioEqMrCTUe7MIf
	tDDRl4UAZsB955vWxG/Q1nAFCOwSnTYAhN3w3fGWRZd7GUSD3rwC5hMUOVIdi9zNhtTsbCR4RoF
	LLmCYxMEZO64SC2IJfB1MjgpWxyxflh0pHiUrCtua775s4PhtKmz/iMaMU5kU5736UyP7+AGG6n
	CE7TzTanZ5GMhgfUTq+bXjwADj7+zrlTpsMmdBd8mdmJjZgCTRvUGN+W0OKCaxd2sbJpGyqgV7d
	JLXjtzSMUYn/SVnMcyFsKoU80BuGQWiAmKQJ40KwSeXU1MjxGrpm4WBNgsu9GZBN6k8p3kE6MB5
	NRtDcJZAdvj+D40jjDQ9x7e0boZkTNG9NCKF45dcgQ==
X-Received: by 2002:a05:7300:fa13:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3767ff8b6abmr8776758eec.0.1794499512744;
        Thu, 12 Nov 2026 08:05:12 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37922d49049sm613673eec.1.2026.11.12.08.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:10 -0800 (PST)
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
Subject: [PATCH 2/4] usb: musb: dsps: free the VBUS interrupt before the child teardown
Date: Fri, 13 Nov 2026 00:04:46 +0800
Message-Id: <20261112160448.41566-3-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261112160448.41566-1-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
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
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
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

