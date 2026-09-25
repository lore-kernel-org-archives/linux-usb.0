Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A244C4E8
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324875; cv=none; b=i47ALiY4T757lFCT6Sa7sNctloZtsa0afWyD+BYkCm+SdReZ/uSA10v+gqm5EUI6mVLZ1sYx30dDhQ7VRO745DZupA1C3EHkW/YhO6057w68XyAjjJcE2lm0zOHWzm41aLa8PlCzwnZyvA5CeIadU/GFBdUleEiTXAyt8WT3C7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324875; c=relaxed/simple;
	bh=dV+yEF8vwO7Bgg4Vha4du9LSz1RfJcsenP6zJWrCCf8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdZh7UzSM+VqC2CEIGZIJ64pgEp2C7EELBdDjM9gCm8WNGVOdCZ7gWi0yIXbXvWOLSe3nES/xS0dJzA8H+qmg8w86CZtRug26EUTmgermfWpFNkcfwUicjeGf6oQ0DMGU26Ihab9j/F+MEERkAr4lqBdLFixfSWvLbNb3zGDQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Izf8SeS9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Izf8SeS9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so355632f8f.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790324871; x=1790929671; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLG3+U+EsgBznmzJjPEyscpewRswLCSuYk8HICKUXVw=;
        b=Izf8SeS9RE7d+hVhiEd/ewGEmIxkuAN8gvXZ+QuTVVezEfbGVyQoXMgtjPXMcLeF18
         kj+pihcbpYb+jnJhMOgJenG0e2gEu7v0mNH5mJTECVtFaRhR/KSPSmfAlTzi3hCP3XSQ
         uc9OGQ8VDm7sAz2bywAlTHTEDnkedxsJ1OdM0BHK419vJXLLxUrr1FCABpO7yIZE6rC7
         x9mC+jt6FQsAcK0e+pebL9vwUxO0dsxXMwE4ULocNY+cmT4dCCWQsUutf7J2IU58Rzcp
         30eQMvKuOv8Zhz5BSbRuRCIYm522JUYYl44ziApXVgpw99w69UOvCTf3yKG1wjns7puk
         RNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324871; x=1790929671;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLG3+U+EsgBznmzJjPEyscpewRswLCSuYk8HICKUXVw=;
        b=ua5Y7zIFrQcaqJYTluoZiupe+hjf7NvuxdIdcvjxArrIhszZvnWC56FOhLDz/uphYn
         vINklKSvDcmI1Vt8AyyB/NDC/KQo2gUlmZxcg+/rkmHNVCICd85xUBDgbaCrmbLkrlvY
         q5l+MiXXyIrZpl5+E96XicBCyhxkBpeC81Ek//Asq3ZPXh74UIM+ddsJAd8jw5rcVSfg
         tvme8L/tVxQriTcAIKi8PY6Ss5dM0uM6THzAaKUwfgMD6vEKYxoNiqjU9j1IfS3cIJVl
         QZGQXp1GRMKSIG0nHwCo2obMW7Nak6D6l6DyMOwZ+HzPxzf5ScOEK3lj/5WJwGwnKnQc
         Uxbg==
X-Forwarded-Encrypted: i=1; AKwUvBx9F3xVRS1zxhTKVWLi0QwPoyaOccFXwUirszoXYel9AEel6m6eEnmtxCLe/9G02zUYhosPMNlGd9E=@vger.kernel.org
X-Gm-Message-State: AFuF++m7RQdLe/qp0SjKU0eICxAiVxYsEW6f1WKrZWCGIaCl4b7VZ+Qr
	AtUhkFnDTQYcrZjR0UAzgqty2ceX1yynjN9Qr3aPADOtZV979aKpxv+a
X-Gm-Gg: AYBFou21rCHSx7Z3S8P2ZZx9P0HnydonIWv4Rm6jJSurPqIv3Kp2v6ocieE4bsLRlbC
	RYni7S6NoN/rNI98W/WADDQAMHdQkGp3u3f3x3gLHnb0yHRIXjxIYdWqFzSJnKslxFPit9HBDDl
	3AUVS27KQkr2/IrMoWzSsRTCTZNQTIhUalzztUu/cP5kJuB2Qg2JCpiKIs4LszmDtjnxYwZblOV
	qEC3Xitic5Ma4AQUhhaTsy2CcrZZiuMXU7F46VQ836ALdKjEi4gOzmiKdyZaEsXfGcbpgG7Z3AH
	xvhPjuW4x5Uo/yfNlpzqTNjRI/sTXtU5G7R2ht/ZCfGX1xYNfeGN3ji6rxzOAleHLKttkVLW3up
	oPuxn0YMXP7BFFvOUINkx6tKfbW1Yt4fc4JWZ3aSn9WtwsKr/uUqLeRWcZFAIaplz1ZVQjOFjKR
	CgfStO13nVWDrsNmXczMpMu1Q8cGxNI8fQxrvW0/WACZ95xENs1gmXqPjQXq8M9Ch9WsN8/D1BO
	m18/fOkHw==
X-Received: by 2002:a05:6000:2909:b0:486:fe09:6918 with SMTP id ffacd0b85a97d-4887db5d401mr2301567f8f.56.1790324871329;
        Fri, 25 Sep 2026 01:27:51 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm5612376f8f.22.2026.09.25.01.27.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Sep 2026 01:27:50 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:27:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ben <benstaples10@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org,
 andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260925102746.25e87ef0.michal.pecio@gmail.com>
In-Reply-To: <CANcA1gAM7UsSxNyHET7HZndeWzAnf4yBDdhLC4pRFsMNuWOHgQ@mail.gmail.com>
References: <20260915043845.GG106095@black.igk.intel.com>
	<CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
	<20260915050515.GI106095@black.igk.intel.com>
	<CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
	<20260916075135.GN106095@black.igk.intel.com>
	<CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
	<20260917043847.GV106095@black.igk.intel.com>
	<CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
	<20260921044453.GJ106095@black.igk.intel.com>
	<CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
	<20260922042608.GZ106095@black.igk.intel.com>
	<CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
	<2a4026e7-f5d3-4301-bc60-0570cbd7fa09@linux.intel.com>
	<CANcA1gAM7UsSxNyHET7HZndeWzAnf4yBDdhLC4pRFsMNuWOHgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/kUnTxCQcCOxww4w98C3fCYQ"

--MP_/kUnTxCQcCOxww4w98C3fCYQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 24 Sep 2026 18:18:53 -0400, Ben wrote:
> >I noticed that both event and command rings DMA addresses are above
> >32 bit. Maybe dmesg log with usb core and xhci dynamic debug enabled
> >could show something. Can you add the following to the kernel cmd
> >line:  
> 
> Unfortunately, did not fix the issue.

Broken 64 bit support usually shows as IOMMU faults logged in dmesg,
because the chip tries to access different addresses than intended.
Here, it looks like this chip doesn't attempt DMA at all.

USBSTS.HSE is supposed to be set by the chip if its DMA transactions
are failing, but it's clear. Only "Port Change Detect" is set.

I suspect we could write junk into CRCR and ERSTBA and nothing would
change. Maybe worth trying, see patch attached.

Are you using some Thunderbolt adapter in a motherboard not officially
supported by this adapter? I recall reading about such configurations
that they may need various tweaks to work.

But Windows works, right?

> > Odd thing is that event ring is completely empty.
> > There's usually a port change event when host detects a device,
> > this event triggers hub driver to start the usb device enumeration
> > process, queuing the 'enable slot' command as one of the first
> > steps.
> >
> > Either xHC isn't really running, or fails to write to the event
> > ring.

I think usbcore scans hubs using control transfers without waiting for
any change events. Here control transfers are emulated by xhci-hub.c
and turned into MMIO accesses. This, if confirmed, would indicate that
the HC is somewhat functional and responsive to MMIO, but doesn't DMA.

It can be confirmed by watching usbmon0 and then:

echo 0000:0c:00.0 >/sys/bus/pci/drivers/xhci_hcd/unbind
echo 0000:0c:00.0 >/sys/bus/pci/drivers/xhci_hcd/bind

Regards,
Michal

--MP_/kUnTxCQcCOxww4w98C3fCYQ
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-bogus-dma.patch

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 83ed26c4f9e4..8d0b42afe911 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2349,7 +2349,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
 	erst_base &= ~ERST_BASE_ADDRESS_MASK;
-	erst_base |= ir->erst.erst_dma_addr & ERST_BASE_ADDRESS_MASK;
+	erst_base |= 0xbeef0000;
 	if (xhci->quirks & XHCI_WRITE_64_HI_LO)
 		hi_lo_writeq(erst_base, &ir->ir_set->erst_base);
 	else
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..803cbadae9c5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -497,7 +497,7 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 
 	crcr = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
 	crcr &= ~(CMD_RING_PTR_MASK | CMD_RING_CYCLE);
-	crcr |= deq_dma;
+	crcr |= 0xcafe0000;
 	crcr |= xhci->cmd_ring->cycle_state;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting command ring address to 0x%llx", crcr);

--MP_/kUnTxCQcCOxww4w98C3fCYQ--
