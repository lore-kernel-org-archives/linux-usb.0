Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08125331EC0
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435237; cv=none; b=muZuMPteIZnvCBItA5CSdTp5Y3qugffxKmPi4E229d37O93UZZNEkkxnwVeSKwlqsBVPj91PfsVbwubQt5yzrGndji7jI6mSf4Y6gA3FniWfwfk9qZ/hoZXG3kPIWAxMyvBa7mOXK6Nz2e5SPIT375fnK2zCeRCQbc+87aKLF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435237; c=relaxed/simple;
	bh=CLoTbPNnFD7Nf/FWMZIj87k9uF5C+XkJTmib7IEKVno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbJFafZGP8J4LLMRZ5vHQd4ATeLmkdoEOsHOlLxLbV3wOGa55sAgqAPMjFg6HJtHasBPjy0f6sSYHUd1Ja1Hypk/mTs1ERqef9uSHv2vev/aJRjBPk983dTNMSwxO08MT/Jt5syzncQ2LCECW2Aa1LS3Zn09+xHKgolN+d8Sv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlKJnuek; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlKJnuek"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so33156836d6.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435230; x=1790040030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=LlKJnuekpTYOvLF203ixtRfg2YfTgXIfAJ6c8MOe/6akF3oOyTPXLxOpd5LPDdUTzD
         kbed14k/V33uMFqHASt5oScMev/oITKYdfuHSWSf04LhAOmUEQpdqIEtyW2gtvpYN2f6
         0LLakiEQ6lWm4wQ27wV5KLYEZ11Z40lw4wuedXBpL3x29ilDR1Rz2DGbwqBnvR992XsY
         ETEg8e80fKMs8qZAd443y06Km0AHqyiGbjofe1hPcBMaD3FMbG0wYXRSiznBMT4nH/Xc
         f7ZnEN9MtNHwIK5ZqNmcdTRKFW1u+gQhBdG7sUMYPgqEQ1MU5lME+Hx3LhtZ2VIvhkyw
         SudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435230; x=1790040030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=yU900BSielWCt+mVZuKKQVbIymmgDGQvohR1xNJK9vlvMd3UxQF9nT46Iu7wfSfEot
         Xg80it1UFPkQMtlHT0TfBGdCP1lzXS9geg/WUg7ewNrapJD2hOJN6S8Dh/I8DU0/R5bD
         ydr1e2nU8p/Q2Z2yF6cD6NswCzAWE/7CrNwMyGI6OtRp69wlPaySfGrw/fCXC1+PacXp
         bkmgOZo7UDKGEPSe2C0AiNkqHdJ/hV7SswBDLN2VNep03CohHjb+IrmxZxGX2ymdjgtn
         Ckl35pCluQPfJs9OGoNRJdsilHbQ4YtkhwcpFXPiRUzifbfl2j12tHGuIBNXvYAChddb
         EJuA==
X-Forwarded-Encrypted: i=1; AKwUvBwAkqAdjp8fMuOU1RMfJUclFXFukRXFkID07oSNkFdpBVm7ga3HE7INKnfEaY04oiHzjSMJ8kqPKtg=@vger.kernel.org
X-Gm-Message-State: AFuF++mJA7xAiXPvdMLFE28A5QouhP4CuRf1Hinw69k0fYS07BKfDSXV
	E8Qkxscz0P9oMyhIKn6mxV8U3wVWIqZtsmm6Bv7V8pYtK0BBmaoDwkU=
X-Gm-Gg: AYBFou0/6W8/AB/HPYWUPLnyRp7XWQ++RXdMZbbuWeFmH7MdqloCkMN2iw9RBy/UTnO
	1buTy7lhzgAFAJ3g0J8NBPNWPVGbw2qQPaQbn73lUlBsu3IP+SCZ1VohNH6X41hD8kdu8bqBRzT
	r8wXBLlAKbSweUOJBivvlxhOkecwccEcu+DDTsegnVMdqlAsy3u9e0dMIwy3ku+MYmSOkzbdKgM
	pAkmM7jbw8Ysi77+SRd1KJcAitM3Y3FNPIHvN/6Sgt8ZvNT9vihEaZ0QrJ2yyF0CP5fnKiN9KBi
	wGEmcOiJw/pSVNGuh4Bm0NLXHpqOE9MWp+3Y3gLBd2hZFj273v2p9YXuZmopmaEq0JfhRhILURG
	NJWs2x90ndoa3Kn8qi2gPr7557qPmyQ3vxdcSzAlOhAVG3lqFyrsUsTOhPmspUPPdmrG3hdgY0T
	r70zOgizynmqpu/ey1bAUEMjfkEPkfcSZqCIwBkSpahHvrNUwkXu02cfDE5MP/BmGxhY/fBroZl
	m5Zqw8jQPHz5stM0jxMS50SwQMcn78aELGxXeDIdaMglZXgue2vshDyzqyaFYaFuUSMVbZ7Pz4E
	QlMsasJMG3x2PReqst4q4Sqdng7UqF3faWjxHZSg2eGqD6/0XCivBxrseIFW5XHZGbbkHQ==
X-Received: by 2002:a05:622a:1bab:b0:531:164:fa73 with SMTP id d75a77b69052e-5310d0005camr81499831cf.32.1789435230101;
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/4] usb: ohci-spear: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:10 -0400
Message-ID: <20260915012011.61874-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-spear.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -103,6 +103,7 @@
 	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	clk_disable_unprepare(sohci_p->clk);
 
 	usb_put_hcd(hcd);
