Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395427;
	b=qFPx8r7L2/CutATpkc09ssC7ZDM/nVGbvnwJqPlrdqkiRFNzUXuhAZW7WYx7tuU8bomW
	 8RBhqwat0WVRyWKvfkdXJHGv2SKFzTSr190Zlk/6b1WhL9HEkEOfK4sbtWM/a52VonkyE
	 2F8iocPoJsshy9QJZncyXI/59iLqvZJY97QGp8qDCQuxl1UE96HYnEbbXOFiHGLJl99Mx
	 34kxRVKw1In8jErsCu80OPHGPipXMSPpugyWgu+C3dUo6UeaYvnmeNV0056yMuP+grdIJ
	 VaG/k8mPW4gpQGPCYBp1bxlCNvZmox6297xRBdSjMatTE1JBYahvSuv8ucRCSxWz/Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XwkuBLy5toj4xmSecRyiSJuZGOX5kjvXYj7mL+5wNR8=;
	b=sS1qLD6JOhWOl0Jl12l5srhHd7NAPLXEOthquYq79jyqZqzSA+I78sbwYvpPQUD2z+TS
	 w15o7EclRxWU7C+rs9kDPuRwgGIxIzx1HvqePqjtqv1b76U0EWj4rgAtC206X9uaDbkpb
	 imlS+qlBxWm1XAz+kN8nHu+0zZJS+dcjI2sm9l1+L5wPz01nl4DbwrWtpoEFCzR8PYdFH
	 NmeJ8o/OITj9OGW0j5/QvAOE7Pe1qqkSWhsG7pX3nuCiaY+7zQ4jvEDUkS/daUkz2ikMd
	 SsKAk4SYp080z4udDSdovdlW1Zse/U/HPDWgioIdP46dQjytZkSQqkdkvpyrgEsgiIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AMltq5/y";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0461D606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 11:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0461D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMltq5/y
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1400210f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395425; x=1795000225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwkuBLy5toj4xmSecRyiSJuZGOX5kjvXYj7mL+5wNR8=;
        b=AMltq5/yGNWP58DK7r+glzzonp8mh5I4LgGC006a2C30lJF69tWzRY+aJchL9xmHEP
         b1SnLObtvr3c3H6UYX1tsjwRxjqrbVY/3bHPMOVIoXSB7m/H5y6Ir6wB6lPkpgWweLnt
         nJs5F1QW95WlZl8enGFIVzt8Hk5NxtaVUIe6FBU6YjpbImBMrPYQ2+czBAPY8Efy1MCw
         rLt1YgY7g7UP6zadrTCg8G509eaDtGAuzJATMGrjiowta9aWhcOtGUEsppjtq6BWyozI
         UJ46hvK4IdPUKlcWZQlN2705oEehi1IEVoK90eJnOT/4XJJpQcVJmlYiC8kcQLMv1Xt9
         UY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395425; x=1795000225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwkuBLy5toj4xmSecRyiSJuZGOX5kjvXYj7mL+5wNR8=;
        b=y7pWeJ4GJIwozPItdY+RB1+/VORvnPWenLIzSt0bfnlAConyBWnxBjhDwJmbp8mvA7
         hyJZCyTAHylAuaEzwCL/JNYxmEIdQZDq6z4GbXpsgjAMqaPNMxU8uS1YY4j74U1dvnOX
         Y0Ym+3jNMp4nek/zWo2f40sGf/y/WR/729HIxotrmJlzl76BlAn/TcFM1YZHs9J8TBcg
         F4D76mGWBB/yrqdrU2YAM7HZmXwAFNeiJXpiLIokzjgevu6JSxnwIhazxM96v0ehJOtP
         gMc5QdFJO0MoqWVUXc0imfuQ+J86boraHfoZqojM9LCHcdsGZbFjdlUNFtG8uMRrSMA/
         LNpw==
X-Forwarded-Encrypted: i=1; AL+hErF7A5Dw3J9W257xHCJLupJp11RTlIpUq1k5cI+49QdHmeoD+CFG5uqd5rNaFRVH4Fj2Ru0ovLzCUjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SayRKqEoQY6BHNez0cAgg1sfMwjtYgOo/FgefPZYxXTgEwNf0
	661NatQLumk2kjFF4qTSl+fTXchpA/qC/z/lg1oFsvBOuwrP36GFT6pVFjLk69LC
X-Gm-Gg: AYBFou0NgS7pGP5doh+KTR+mUNdmVHwiE1hGYUgB2G9xKmQnI051QCOK0qsmmacfwqj
	4CuH7dYmYL5YBRz/X4n3TWRRS4WXZQEEtfNE1tRs5DBsEY346ODaSW0x0J+Vv54+Pnk3W6CK6SG
	bvCPJkNgAnpVFAodRNU6jg1hlFfWlmKh5DHLFdh5+jd5jtpguJDaoi3ZGR6C7Up9pR14Z/+H2hK
	Q2iQoAGBiP6ojJm3ZI+Rw9Rl8IEDyjG6lKCpkYP/98w/gn7rdYat2YgWzGu/0GOd2+Ok6w/sJhB
	1BfS6I5AaX9pANZwsvUY80wKWaQ009pHms9OVaD0IPj1qLTBM/06dv41U/GKFeDtyJlXuwApTA7
	8wJvxdyrbr5EcEclFjNatolkBKDR5bhv9tv//6swX+NeNJz0jfTWEl1KfpNRcvKKjX7wAOkB+0i
	CaFpoipcsPMDDvv5YhrQ1aaQl6Gxe4CasOR1IeeL5+rSL7AxpTFvbzF5K4aZc2sp+SbKtj6ohLT
	YOtJWkOsR84+rIcCKYmqRBLZFxdZS0gqPHl71KODSJGcai94PhPSJVQporUxK1azJq2No3k58Cb
	vut5RVYo4uFToP+VD3SiccgKBmsjrvd66KLel1s=
X-Received: by 2002:a5d:64e9:0:b0:48f:bed6:4d79 with SMTP id ffacd0b85a97d-499c792ef43mr3394834f8f.48.1794395425185;
        Wed, 11 Nov 2026 03:10:25 -0800 (PST)
Received: from foxbook (bfj76.neoplus.adsl.tpnet.pl. [83.28.47.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm10645983f8f.11.2026.11.11.03.10.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 11 Nov 2026 03:10:24 -0800 (PST)
Date: Wed, 11 Nov 2026 12:10:18 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Olli Salenius <opsalenius@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 linux-usb@vger.kernel.org, git@mayer-bgk.de, "hadess@hadess.net"
 <hadess@hadess.net>, "srimanachanta@gmail.com" <srimanachanta@gmail.com>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [BUG] HID: steelseries-arctis: NULL deref in xhci_urb_enqueue
 from status timer during resume from suspend (Arctis 9) -> system hang
Message-ID: <20261111121018.49797328.michal.pecio@gmail.com>
In-Reply-To: <CACQx0bFrJYn60_QAogb23n0yiSy4hu5ZHQWXbRb_WBfS908tSQ@mail.gmail.com>
References: <CACQx0bG8+c9+CjLRa-tbgGkc5_4Wxhmanbd2vToo8Aj8k_WUYw@mail.gmail.com>
	<CACQx0bG4bvt4bHa+WG4u2UGmUc_YMUnhpWovz5+rzp76Jpb9ZA@mail.gmail.com>
	<079cf13d-542b-4084-9023-06a89fa4ea97@linux.intel.com>
	<20261110105709.5fdec4a9.michal.pecio@gmail.com>
	<CACQx0bFrJYn60_QAogb23n0yiSy4hu5ZHQWXbRb_WBfS908tSQ@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 22:46:27 +0200, Olli Salenius wrote:
> Disclaimer, I am not well versed kernel level stuff and using Claude
> Opus 5.5 in debugging this issue, so the following info may not be
> accurate, however the patch did seem to fix the hang at least on a few
> test suspend/resume -cycles.

Your LLM is right. The test patch makes no difference, but commit
555040535 removed the trigger. If you revert 555040535, the crash
will be back.

It happens because xhci_reset_or_discover_device() allocates new
state for the device, but it doesn't bother to update the root hub
pointer, leaving this job to xhci_setup_device().

To fix the crash we need either the dumb patch below or some rework
to preserve more state during resets. Probably the dumb fix is the
only viable short-term option.

It doesn't solve my problem #2, but that one is a race condition,
so much less likely to actually happen in practice.

Regards,
Michal

---

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..81656bfdaf66 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1662,6 +1662,11 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
+	if (!xhci->devs[slot_id]->rhub_port) {
+		ret = -EHOSTUNREACH;
+		goto free_priv;
+	}
 	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
 		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
 		ret = -ENODEV;
