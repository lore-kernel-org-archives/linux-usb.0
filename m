Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768827;
	b=x8OuTKFBr15sPuKm91qIE+mGZVCjvVawPSfkoW52B5bnkKfsBnLQ6UO0LQo/+mkcqtBa
	 ck7cvrL5rV5RUPowtyYzuacK6/DkxeWe59DesJSr/cA4k46M7+j/tb4ZRFHOHEyQUjj0u
	 /zdWMLkyS8wgbWKHI3hZuDmIaQT0b91ILXD+2p+hpXubeDxb6eYYgspngBTgq7IyFM98d
	 e+vMnTZvmSChqNPfAqMAwRWgHL6cyLgmN4670LqCLMquBFm1rzevKzWe3dyxOLitJl74T
	 fDBvC4TRvTsRxw+ow5ALuKYC+SKpdk5iHdVBCbYeulWMLaRl87Z51ABzjgt3mjUp/MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
	b=CnkgfT0IfVtXngyXEvbzb7UlN6r30vQqiurB44y45t0EnJ/CsZY1ijTp0m3ll9XLLiUV
	 P1tg8fZByQ/2H/evUC1yLPHewEvl6hP7YlC3zjvJ+mUO7WPfZPMGfzpk2mloMr9FXNRrc
	 /ol44If5pE2w8YOvoiiwGkVZf6lgXI0aByqqgajlKg5cB3BH9oMB6xyvZ6x2lC4imBugu
	 QGEsvA5+7q2oVwBy5SjKtiWcwr8vQvgcNnrwwpPpFeV5gdnSoUt9bWNd74ZJLX2RV6Ah/
	 W13yFYZ5InOvo3kvywzaG3SAaob4h8dkaH6U/V8uqQ3THfSb8RgU9wUq1sYeMLkJtpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b="Qz/OoFVD";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF593606A33D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 18:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF593606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Qz/OoFVD
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so20140975e9.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768825; x=1795373625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
        b=Qz/OoFVDqQMRaPKbKcxSvz9uGdYbVzG0xRmKwvqw5qZ6XgELSRG4l3eJ+IMjRAHkAi
         F2lsYVRUdXmsF87YT6tdcNj63BXq+CA0gmOIUcGmZ9KcVBs2g6ZS0Sqhw1O48l6ylLQb
         BWhY7Begw+pBgFzgY4wemsLIze6Uh0uO4oQFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768825; x=1795373625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
        b=shigv45+2I3csQIl/HPJtkTF26QLv5o9jWCICmxh5PuwXWbgRLoUcDtos/Z8OSWPbV
         H/QCIWslZTE8Ph3IIExFOF/lSxrmrwSBb3+Hc95b5+SWrwwbm/fU7c8ckHZKAhfVxpHT
         S1e08mBAz5VzY6j85+ACUeLKZPP6emczfMZIS5+V14PaNC0Dv1mJIa7GGiHhsK5Sv+LS
         /N4ezZdZxHu7s3riXDvo3oCBqOtEQQcgD9SMY7vQzMACFf//xhlxYyf0y1+xXVx9+dMx
         LHIHxKXYMS8Ca0fVouIzASPnGGaIOOjiwQYTTTga1p/nvHU4nRwJkyve+JDDx7Dj+d50
         457A==
X-Forwarded-Encrypted: i=1; AL+hErHHUMjBNorTi/QMUeighrp8g9ZEQtsmW1iNTCXv9+P8LR0OaOD0FgQBuOOWwM4v5ApwxPhtDEquzUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ko0bg0WGcHYGS+cTYU4W5LU1Ji0ACWJaGGyuqiVuuMh0uMUwq
	JYQciIRonhVn3NIv8QgXYUJwY4qQmW+qtuzy+LMaMv5T/omCvm3K2SyybApRwCqLVt0=
X-Gm-Gg: AYBFou16H1kAuAkIj1hNA8R5Ph/dxTs+/Z2n8WQoWmTf7ktBtV/4CwtsRuaM4xHRckd
	nwKTRPjo/zmdv8R5Zgt3FV7Y2zD4OES5qzX24aw9mNjA+sab+LpF9qoTYFmhPIDLezClKNMbH5A
	uUPsVf8cd7v5GdY9O0Tyts6+WLjLSrUB1RfepajeJyyZ1OTofaOJy6nn6/GeRLTpXU1ZECQIJ8f
	GlFh7APCSDAqvwIku0UrSpnrkwN/kSIn85jDQA0V7XCywWvOwK7vxlLyxY1lK+KXYc+PMqXG49C
	YU9P+o7Nk7dv2JF0GaTEUBufQu/lHhOsY8wulrXwQieuGxDHZS7iHVSY0YZwAgyKU2IVKQY473o
	CMzRQcF4OHAo+TiCX11EDV4FpiAX0D1Fs7BVS2rhXx13URIBgE/MbXYc7ko6FhZkX4RO8rur5yt
	/7sjWgC8BEJpPOlyYL1MoqWNYMj5X99BOEL+Ba4DZP1akCTlL47eSZD/DLP8MTYHeHANw7VcH5x
	4VXKhtHZpuohy8JRXMeMGqmeXLE3vtFs0UrgUXcKgH9cRHsEEGGnVsqITqmQNHQv/GEIzAQqyXv
	QOT829ATQ/U3AkSlXS3i5DQcKy0t08eBAgOR7f4cp0pXODwBMjNqiys+pf3vOK/j1MIrbvUKfMP
	I2Ng258A+vz6ay+8UjpfGM09op6nbF+WkYUW1EOZA/Btl8j6NsMrU+F4cLYSNtP/sIrcKHCoQg5
	oQHYFJiM5fM6exuw==
X-Received: by 2002:a05:600c:8b16:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb5d382639mr158238605e9.12.1794768825374;
        Sun, 15 Nov 2026 10:53:45 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:44 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: dwc2: gadget: make descriptors visible before the endpoint is enabled
Date: Sun, 15 Nov 2026 20:53:35 +0200
Message-ID: <20261115185335.782678-4-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-1-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
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

In descriptor DMA mode the core fetches the first descriptor of a chain
as soon as the endpoint is enabled. dwc2 fills the chain in coherent
memory and then writes DxEPDMA and DxEPCTL.EPENA with writel(), whose
barrier orders the earlier stores before the MMIO write. On a Sophgo
SG2002 (T-Head C906, DWC_otg 4.20a) that is not enough: the core still
finds a descriptor that is not host ready, raises BNA and disables the
endpoint, although the descriptor reads host ready, last, short, IOC
when the interrupt is handled.

With a host sending TEST UNIT READY to a CD-ROM LUN as fast as it can
(about 2600 a second, each followed by REQUEST SENSE) and a 1080p60
H.264 encode loading the DRAM, about 0.8% of transfer starts raised BNA,
99.5% of them within 20 us of the enable (the latency of the interrupt
itself), with DxEPDMA still at the head of the chain. Without the
encode there was none in 254000 commands. BNAs per variant, measured in
turn on one boot with a diagnostic build, at about 780000 transfer
starts a minute each:

  unchanged                                   6215, 6510
  mb(), read the last descriptor, mb()           0
  th.sync.s                                      0
  udelay(2)                                      2
  descriptor written as two word stores,
    status last, dma_wmb() between            3728

Mapping coherent memory non-bufferable on the C906 did not change the
rate either. So the stores are still on their way to DRAM when the core
reads, and a load from the descriptor waits for them.

Read the last descriptor of a chain back between two full barriers
before the endpoint is enabled, for non-isochronous transfers and for
the start of an isochronous chain. It costs one uncached load per
transfer. With it there was no BNA in 6.2 million transfer starts under
the same load, and none in a 60 minute run at 1080p60.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 046b5b045..fe37250fe 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -854,6 +854,27 @@ static void dwc2_gadget_fill_nonisoc_xfer_ddma_one(struct dwc2_hsotg_ep *hs_ep,
 	}
 }
 
+/*
+ * dwc2_gadget_desc_visible - make descriptors the CPU has just written
+ * visible to the core before it is told to fetch them.
+ * @desc: The descriptor written last.
+ *
+ * The core fetches the first descriptor of a chain as soon as the endpoint is
+ * enabled. writel() orders the CPU's earlier stores before that MMIO write,
+ * but on the Sophgo SG2002 (T-Head C906) the stores to coherent memory can
+ * still be on their way to DRAM when the core reads it. The core then finds a
+ * descriptor that is not host ready and raises BNA. Reading the last
+ * descriptor back between two full barriers waits for the stores to land.
+ */
+static void dwc2_gadget_desc_visible(struct dwc2_dma_desc *desc)
+{
+	/* Order the stores to the chain before the load below. */
+	mb();
+	(void)READ_ONCE(desc->status);
+	/* Finish the load before the MMIO write that enables the endpoint. */
+	mb();
+}
+
 /*
  * dwc2_gadget_config_nonisoc_xfer_ddma - prepare non ISOC DMA desc chain.
  * @hs_ep: The endpoint
@@ -881,6 +902,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	if (!ureq || !ureq->num_sgs) {
 		dwc2_gadget_fill_nonisoc_xfer_ddma_one(hs_ep, &desc,
 			dma_buff, len, true);
+		dwc2_gadget_desc_visible(desc - 1);
 		return;
 	}
 
@@ -893,6 +915,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	}
 
 	hs_ep->desc_count = desc_count;
+	dwc2_gadget_desc_visible(desc - 1);
 }
 
 /*
@@ -1021,6 +1044,9 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	depctl = hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	dma_reg = hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
 
+	if (hs_ep->next_desc)
+		dwc2_gadget_desc_visible(&hs_ep->desc_list[hs_ep->next_desc - 1]);
+
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
-- 
2.56.0

