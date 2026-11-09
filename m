Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254132;
	b=w4g3lZq3uJBP/l8zT5vgcFq7OULSfKRT/ZaYmjCrS1wN86Ofh+/htW0D3X3wydyDc1fA
	 rdAqqD1UxW/BKCXlho6m25rqKyqHZ7iQpAXtAC5F3H4+owqpSn6PsGRnN3Ol4Vo1erTZy
	 W6AN7hlikjaboe0TqLC01I2143MN7b/XbxknLl/Pu6qHECm1H8yBXwpl/TBtC6SdXAM6p
	 BQwfvH0nxzRO4NArqsUZrIOBnY57snQL5Jw6y7raPOlyVLyWkjeQADelFtpHfUeLZwhao
	 q923W7tCsS/X6vFMGm1Gejy6+F+4FlDB4v9OraIaEcDbhJVw40L9gXtPpevBvIvHxOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dSvm/+U1SH5c1GMUOKNRsUdiOS4n2lUf2oRKV9+fIpM=;
	b=KnzhUshWU+5EexT2TEjj2Uwo5nUUClk1JPy8siJmXvL/UQUoR7v4zGR7pebCOCGYPaEm
	 KpRarb/GG1bpufzWx0aq4SHEJ7A6Ty9FR50xfStc8Zt98tRB1hgpv3w6tkjkmdEIs+Jwz
	 1QcsG7liJNByoUJnZRV3CLU8z/x/D1Pqs7upLBeC8QXdhbHl3HBNSvFvO1J5WTxTZOG40
	 2qxmDglfArHEenozyfTGeVrzDjzODpSWpGSHzFilYZCkFmTqznFCIBP0IazAjkM3ck86X
	 loZh5zISJ0VgYanSTBFyaS7mY3kqTYKTDNgwSg7ozI85u6rLFBn6F8JD1/DQZjWY+QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsKBxrv9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F0A606A33F
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 19:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F0A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsKBxrv9
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c11468b5fso11675976d6.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 11:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254131; cv=none;
        d=google.com; s=arc-20260327;
        b=o5kx5d/MtYWcNQLRqWiRX9goXOXHly8zIPsH5nSJ8t8c5g9gl6KFotEMcRfni2stH5
         2SUokF+NNVaD8yjxQR9fYqWh2ExHi676R9NutclA/cd9ataXvdp6YG8uzsLkoTKil7Px
         v5dbCgrpphCuA+AEEXmIiG85Vbi0DfH5BHP1/qFIa/jHAmHJBoP/dmYJdmgkPtfG8Fpj
         XO9Omzv2mK7g7MZJMz57jvleCrdXgHNxIfjRAeHxXi9mdFXFiLxwYdHo00WdiaaBNYt6
         I4zWpZNX2Avo9hhn9N3uSfFxhAAvd9DuRYjzfJ9KWlkpy/EP9OHXn70aN8M5O9D2sqx0
         UMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dSvm/+U1SH5c1GMUOKNRsUdiOS4n2lUf2oRKV9+fIpM=;
        fh=Kfyu0FIUQKbNEj9ppsHUEZNtgnJO7kxwA61522Sx4zg=;
        b=sN70p5ps1REYXkf1ovK0kBpU1AANDwBzdtZGysT9t2qVDfCCKRHrgKpgTJ2ZL34Xuy
         y8muwJN5Kg4woMQSjB05sbNgC2N1Je0PjRp7SpO1se2YOe+gmJ/C+I7HxgW3TPFElM3o
         /GM3PsWn6i6aYQSnV+p1Sn0QrWDekL1ywK2b3/xWkaHK88raxtPvfT0nRYrxHx359jPE
         5ySyWm44aP83fJxhKpGzLpBb5oxEVR0uMD4Wx4iIPORMxGgRzDSOR8oGF1xhq4pkyFSG
         sp3YyhOdR+xWhdGPB5gmsjheKFIHX8syNENNGG7UBU2iHuAbmf5UQzJd41h7oWvFh+Yq
         R2oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254131; x=1794858931; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSvm/+U1SH5c1GMUOKNRsUdiOS4n2lUf2oRKV9+fIpM=;
        b=nsKBxrv91OhvgLr96gC5GUhx/XjnUdznzkPvUi4lltG+12YXTOnzxKDCnSWTArrBXf
         DUYcsAnApxuNg8XPKf26T4GpV+TGYMq7kMiF0f4+COq5QWL8swBHbjJSChBqLAJ5g81e
         vmieChxXD5SNhZ8uw0d4DfURwodyIB2vpRKH0f77BcQzchEhkTPQpiyizQHnneWRqQqn
         XB6EMm+7+BGfWakKOVfAtVvdJzKs28mbMsP9FDiYBuCeuJInrRqiedDFDu5Ie0DJkRK5
         H852k6m1yyCAXlCJecPxZoCIX9SOTJNPRhn9zQo/14N6o+IY7URfMNx2csXfcjyyGKzF
         Aljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254131; x=1794858931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSvm/+U1SH5c1GMUOKNRsUdiOS4n2lUf2oRKV9+fIpM=;
        b=aBFnwU+z1SHjAFc8zEvyNyI0qS7FwWULSlhiWrMlGobsnqkSBm1YVXJgjGQB3o7hHO
         aVR05Ad1USJHQs6HcylnlASbC/2TeOoXyf/GlAtwogSf5ML/g/OIylpxT2AGKronoiaS
         bloNL94MDg+/4yr/xrTFsCiaVvCyCIPX1B2TWx8SxzJDVtXihp+Z5M/9WE+kyflz/AQ+
         xiHLxR3yMNYMQocxI//8XnLTMLahZ7oJDGbk0I0Pz4AceUliqmRxt6gqRhMC8Y9/goAA
         tqp9qXoaVd2DBMgoUf8Mwa/heX4qqI2lI5AtD+FX+uu6+SF5CtEfvxcXMlbUn2cF84EW
         5bAA==
X-Forwarded-Encrypted: i=1; AL+hErEA6es+JNduQRrS9fmIno9yUHQUgpeAL6hEpxmzaWCNBO3rlbLHD0aGuYEcQB9x1dW6TKQkmvsolRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U2zN+HuDeFVEiYOskq1LEkNPXkTX1Rlj5EY8/cj2ZSX8Xvlk8
	XcuDykfZgiCpVsIW/nHIIyccGxPD3omlUnTraMmr0MIvxsTRPCuazQHR6usijiolR/IOQEQbjoI
	adVp8yEsGAmpdrdstmKjDqXU3aczY8chOO8+7
X-Gm-Gg: AYBFou30p/5bSE5Bp63h8gvGkOOmErZ0fbtvVI3ldGFRdUmjWJB3fi+7kHSCGfEjYWu
	2fclgTR/yy2DPjuij88jVHdH9hi+M4aKi4KmUwfqZIZAghfdIS9TSeKmS9tOMld+ctidoAExO7V
	Pmwu1KUXzArcwfZQqcrlIe9XuTLOiUOEFDVQpZuwO5F+remFsaUbgZmfjyR98ARv42rtjbANdDa
	oUiwOvV3Ry4PQrzJ2NGbGYnSVjkn2xndB4HxfRmhBSbrkTxX9QZ+8E9xKQz8XBMJpXQgD2VYQV8
	maiI0evG1rUHTJexmAiFHyEypPSc4NF1q9FA7m6wj0jr2wn8J2qN80nQi0Fc9Z7MN/k9MmA9kNy
	UZLzd13xJ/fEPYslfLKI9zLlCEIxdOJg6S5JdeqcYO4xOtYEqp0+DVrB1ocTlP9X/8AU=
X-Received: by 2002:a05:6214:1fd1:b0:912:517b:844 with SMTP id
 6a1803df08f44-91eef8897eamr8612876d6.40.1794254130768; Mon, 09 Nov 2026
 11:55:30 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGYMYpgLU20vVmwnWyQkYgvjL=fo+Rb8TxYJUu31FSPnhJ9DpQ@mail.gmail.com>
 <20261109110004.GO176724@black.igk.intel.com>
In-Reply-To: <20261109110004.GO176724@black.igk.intel.com>
From: Mykola Dimura <mykola.dimura@gmail.com>
Date: Mon, 9 Nov 2026 20:54:53 +0100
X-Gm-Features: AclHuK8N1cvOJxClpBsSWuir4uArD1fWV_d_3L-c75_EzeuwLEB_yxBOSALyoUc
Message-ID: <CAGYMYpiJgo6c7BgHSA2avpcLs1LP-YjQYcfLRAF=67drmyGjpA@mail.gmail.com>
Subject: Re: thunderbolt: second DP tunnel starved at boot while first
 tunnel's DPRX read is pending
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I see, thank you for the answer. Hopefully, the eBPF patches will be
upstreamed at some point. In the meantime I can live with the
workaround I have now.

On Mon, 9 Nov 2026 at 12:00, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Nov 07, 2026 at 04:11:22PM +0100, Mykola Dimura wrote:
> > Hi,
> >
> > With two monitors on a Thunderbolt 4 dock, one of them comes up limited
> > to 4K@30 after every boot (or dock re-plug). Which one gets 60 Hz is
> > effectively random. Plugging the monitors in one at a time, in the right
> > order, gives 4K@60 on both until the next boot. The cause is
> > the order-dependent DP tunnel bandwidth reservation in tb_tunnel_one_dp().
>
> Yes, this is by design. It's now called the "legacy" mode because it works
> exactly like the firmware CM: first monitor gets all, second gets what is
> left. So plugging them one by one is the correct workaround. The solution
> to this is the bandwidth allocation mode but unfortunately it's not
> supported until Meteor Lake.
>
> We don't really want to add any new command line parameters. I have an
> internal patch series that makes it possible from userspace to affect the
> monitor selection via eBPF but that's not yet ready to be upstreamed. It
> would help in your case though.
