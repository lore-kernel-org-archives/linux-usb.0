Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795326576;
	b=e/Eg3nlm5aXROqDafhFBHLcBUCdDSzXcG9/G6I5JbVZsdUgafxMB5fgrHmxuJEm+1GxF
	 JkfUpxhJ808WTFZE6ZD4KVOFclKbDDtuEBsGHOqZ0cXFsN9dudrFW1u5HQDjuTuDEoJhv
	 YZssshuZKtvKdryxYCCPZu8GO+7mne/+PbmvIgKDlviIILX0ypK2vcJepeCagf1y8Jl4y
	 xOJx1Qg0/RvJtz6vfMpe4IvrgJK78zc2dAlkSKBnZK8ijfJTvKgDjx2vUB7asD9SZ1XV4
	 cHZHq2h5nGFRDexWul4hngNfyY/JMbhWfIqoy2YbqzN/YYpfPF312H4vr49lFR81QBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795326576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WtlSXd84ql2VigrMlFs32DKgX7pCmPq/IHLXz0kYT/0=;
	b=YmLgfGJe961pTEBiabx2wvLDL7jHdLY+M/9oAghabw5nNl2OzAmKd81nWRsImH1+rYJR
	 CTExIKoeFDyqha7CYG3JJcgc6NVga8OoM/mJx+DcA+RoNziA1scv34SoK+/rD/4M4iAPK
	 DSnAYpQQAIivs/Lrc/7MnLnkrNSYcwPLzFC0z/98u165Ut+qJDWd+CNpJqJYroGM6ep+b
	 WT1WFPVT02qc+cHjLV51hFzm8z6G40W3JJLJaCPP1I8mXKf3daDGPPdAZdi8cmz8XQL8X
	 MBIMPyaySzKBH6LxmhoDrA24SNaX5rkhRITo2QMne/jxFm+IScezwWig7VK8i2YmpGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf4+Rhbg;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5C606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 05:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A5C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf4+Rhbg
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cddac941ed1so868769a12.2
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 21:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795326574; x=1795931374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WtlSXd84ql2VigrMlFs32DKgX7pCmPq/IHLXz0kYT/0=;
        b=Xf4+RhbgxZWfRcLg7iy2ajKnaKqEpKD9OaJl9VpOQOUep+NhOcssyyU24bYltvfbnh
         q4Mj738M6d2uLCM8uX2oLBz3VKaa+jvU8A//6HV9/SAdI+osCpER4Pc6ENmcXvhz0X5V
         W9Kd547/kkLhwkg56Dr2fLqXVYuZSw96uzJ2cWUiUt0UgkQPHQvYcYSTKasmowC6nL0T
         ECGD7H65HuL9T36JasoUuMfFWyjySm2ERh7ovo84mqpzdXREgJ80eJg/YGjUoFARaZ4a
         i5x3MpcOwHrJ8qVcTaAKcVrU7shExwgrO4L+H2GPLkTNmGHZ5pS7Gss4l0O7ZyhYDed2
         8nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795326574; x=1795931374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtlSXd84ql2VigrMlFs32DKgX7pCmPq/IHLXz0kYT/0=;
        b=kTeQR9fuj/SYSEIDvVtSrO5ScN6asdvKmJ1eLkCKs/G1e9VQ6496YQExF2tFwyvYbf
         i58LaiWxDnCFfLaeM2mqVIWs7+0O6FrYwk0Pj6ONblWtpoavuDaMpb7GsZCCRdYJB8TQ
         DoKKcH7l6AsIJWb77uDlYgETEXODZwvW7COdFyu6JFyxwLzFm9ivX2oMV5Re0sHG6or3
         VkOzYWicHreajmanAreGNGTPn91xp6iKW7Nl6aMFvTMrARAMIt8EEJ7WoZMjDZ/B68WA
         SFo7dRzww5fv5mLqHyQHG1VKDiJUCTR9DAzjwYywZSBtNDcwJZlMutMBxzJfUjbcwa9o
         yZhQ==
X-Gm-Message-State: APuU4Z8t4u/sGG1BFTCfYYFFDeOBfJ8aVl11kv70yaQn6RRyURpS/j8B
	p0VONjCmSPXMPO6s+02ze9+Es0l8m1LxtAjxXZQnaZEdyoRzFWilh7YQ7q4BdQ==
X-Gm-Gg: AZFdTZfiZPpwp2kTtICSCBsPeAHvYrIh2VmY+dZ8PUCZwJI84FmQSSG6NKQismPIIfh
	yxuJLF4zojDzOHEl/Dp6WObboOHSrnWmSMyOyTV/ongxp/oeZhrrL4eohaDVWuHWDFoCZGkYXOX
	Que10r2X2lQkEvW1vHCFsnCP7xMLjutXltC/08PFqPzr19YapuRyL1JKrQfOFAoCAjxhv7rYBMk
	ie/O9rt4XmjdNwM5sgdXTqz06IIda0uyq4y67tYFKF0SiNrMTwWSt54ayI/3wgvGnAoS9tt1p/K
	hnn4uXzMtWRCMSKrE6NFLCS1v26unmV2sbSAxIgKPkDjQjTl6pkHcx+TmtyRNWGsALmEFa+Hxjo
	03A5aV7Yq/si5eFoNedpjxx4TgXb0wS4dA9A33uD5k6uMnQTpEH/61ESyDZaAe6F50BLpafX2sm
	6jcVK8IFAD/CmQEntL5/UhEh56MY9qUy6S7Wkqh21lti6qYrf1rT4oQHKRwT7z4B2UBPQoCfs/j
	CBHDnFsgRRDv2K96aM+wS1V+PIaNhEDPP+9N11PU8sQyMu9c6bi8IazPV8wKhzV1xu85/0y6eed
	wxjtwr1XyC87DOIMoVvq5G16cwpCxhzLewwPBwVoJQPe86zQsM7rcLfrx54ZTN9B4CQrcOMJcJj
	kWypJ9ZsREq3zRKRxn5mAKSjpnjvC7lKCqVtvIuz+1FMk//3NX7loWq2GXIVZxpXjR82trWoh2e
	uNiw==
X-Received: by 2002:a17:90b:3810:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b41c9bc27emr7446448a91.53.1795326574357;
        Sat, 21 Nov 2026 21:49:34 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm11150732a91.0.2026.11.21.21.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 21:49:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: xhci-pci: don't perform Soft Retry on the AMD X470 chipset host
Date: Sat, 21 Nov 2026 21:49:22 -0800
Message-ID: <20261122054922.50251-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Commit a4a251f8c235 ("usb: xhci: do not perform Soft Retry for some xHCI
hosts") disabled Soft Retry on the 300 series Promontory hosts, which
fail to resume an endpoint after it. The X470 chipset host (1022:43d0)
has the same problem.

With an RT3070 USB Wi-Fi adapter (rt2800usb) on an X470 port, the
bulk IN endpoint sees one USB Transaction Error while the interface is
brought up. xhci soft-retries it with a Reset Endpoint command that
preserves the transfer state, the endpoint context reads back as
running, and no transfer completes on it again: the adapter receives
frames (its RX FIFO overflow counter climbs) but none reach the host.
Booting with xhci_hcd.quirks=0x10000000000 (XHCI_NO_SOFT_RETRY) lets
the URB complete with an error instead, rt2x00usb resubmits it and
reception keeps working.

Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940a58..0a8b5b04e324 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -88,6 +88,7 @@
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
+#define PCI_DEVICE_ID_AMD_X470_XHCI			0x43d0
 
 #define PCI_DEVICE_ID_ATI_NAVI10_7316_XHCI		0x7316
 
@@ -493,7 +494,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 
 	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
 	    (pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_2 ||
-	     pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4))
+	     pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4 ||
+	     pdev->device == PCI_DEVICE_ID_AMD_X470_XHCI))
 		xhci->quirks |= XHCI_NO_SOFT_RETRY;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ZHAOXIN) {
-- 
2.56.1

