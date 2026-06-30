Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21A381AED
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 04:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795076; cv=pass; b=K0OwkMmVbWmq7pEAwK3lQUylbGinBK87FsOXtCnmQOyxKTeAMXsqdfCTuqVN+eYELrZk5wJLq69bVPaWYQgpoEP+TiTnun/ndu+VmSNo08AE9gvpTYHEghORTpZySs0kiXatKsOkxpdZdD8RsJ4U++E+3ZEqEIe0rHMTv9yBlqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795076; c=relaxed/simple;
	bh=TRjVtJVVkYCXrDDyEP2GKqv9i4PVdFAjyE8Km8RSnC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXD3FVXwAlpgJ3I+sWYtuBQoemEr7J2wRCMUddVoZ6zv2RCs45YCAOuBY76uEa5KmTy15ywswIu9dOtocEQ28yJctLCq0KPxZxHQ8a/UBww807iBgrPMQGRorQwR3LgieYUIYrrytMF9uLmxLT5I6ldwcSt2UvRasqej7PT9I4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=V9y6XLoE; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="V9y6XLoE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38005a36edbso1021459a91.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 21:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782795074; cv=none;
        d=google.com; s=arc-20260327;
        b=lDQwETHqiibFwUWICx+GBrRPqFFq79v1mMxK+qwQGnS3MGySaxxsLWmV28Vo6Gcj2t
         t0A9tzXNiYmjOt7qXylzA/YcWcaElfvWhqpujCuiQbkdcqU5S88XciMxaAxM2pAqhR0a
         V8TtKqAdSGLQ0XNC0eZik2EqpiFQUW3mUSdPAXu9C2QPwlJScWGG39DZhnuBeBfBVSQr
         ou59ZMoZ8tgQgrxeJ/gEVW03veDHc+L3Nm6ovZb25662WeDeRno2AvbXgtSIc2mv2nML
         Q8zqgAdk0GeZ/rNE8zH4K47rn7BdVL7rAq3MUj/i8IUVxX7GLcRQTb4UaWszv35a4A9a
         hN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGUgc0kMZV3Fo7Zy8Xt0uQZgg4awqO/uttcHalUom48=;
        fh=SFJ2y+/cZGQ97n75QySRKpJnxdQWW2y1uSKT5Zs3vEE=;
        b=mz1lJNqNNVf2D3hyCIR6Yx70I3Gg9Eh0AcwOf78qtaSygMOOPpchzApJ7sOcHRXfTJ
         DFAx95ckInkX/dMrfVjHBLQk4L0surLlMQWnkeu7flS35QryiMm0StCmzH6ZqlrMBVNb
         +O5h61WBBQvQu4wrjq+yS9/175+QYDa7orHltGZBv2LHfu+81YWEEVPmMc3as81JtZx3
         4HLGGdv3AjjsX1r/S5h76nZhoDXqrNtw28Kx1P8Bcg+xizUeaIl58P+pRJ3VTEXgHSQr
         3jd8/BtD5LiB2saOp2BhCtS1GYraTRFZWPDWr0mxCSSk6nsBltwuA1Wh+RX9uP5toHDr
         iR4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1782795074; x=1783399874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGUgc0kMZV3Fo7Zy8Xt0uQZgg4awqO/uttcHalUom48=;
        b=V9y6XLoEm9pOSPMLPcWIvx3PZYPut0YC0WKSD0gO+leQ3hgNgI4fI0Fhh3Olcyl08w
         lDlpg8gyWqNHERmuG6tynUrL+u0hb6MOKGQtXpK9LJ+4GyluI2GuoeRoA4RFh0cxFh6n
         o78kG9Bw3jSYJ4Ms6OR7nHG7jR71k+8DFC3qQFLo7jbvToWdsitSs7OaA1MJLBvMkIuT
         UEV/kQZVxeQ5BB2/8iwpCKafXJzK9JTMHp+LPkV1t1aVgHFj3RISiogbt/FTtnhj1QTH
         mFgnzy3SMpsdCkUCOvDuU7JtA73jqLNAJbJXsCtgR/Ao+D4uhwhnDDMwainLaxQbMvrQ
         QxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795074; x=1783399874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGUgc0kMZV3Fo7Zy8Xt0uQZgg4awqO/uttcHalUom48=;
        b=qFQDsDFfhiteMbcFcL045+MbXgk6HOeRCwcUPqnkNUghabqw6xpvLHb4fGIkZgtmoP
         z5k3Wy2qrSpvswNz/WLRgG4X4LLa8d/lnOgiKFG6PPR7/ZVv8xSA4r1CzboTLF/WI43h
         9kIxo7PXiauhLAX5ktg2o3gpYSWZZHgg/m7/8f1R8SXf7N7g6Env2y0HEIjiajF3P9SY
         skNhudhULdcPgIsE8tunjHTdQHUAqsl4OLmSOHjRUSQbOhfv0j2jodtIInRD0pb1g8cx
         Qjod16Y9M/ae5s7iBZICjD8WG0abzgwbEoge/PeLLKJEkk2bwXuUPDz28KshRXVECCek
         NVqA==
X-Forwarded-Encrypted: i=1; AHgh+RpnXDzGqqlBnesIvDCtLuaTBU2F7PYtZthUvaXv0OzcPZz3LwuiquEwbWwFsbJVJM2cEHFr+VEc9eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWDkkQPvtHHN1Kq/OrgizGw8eQ0abAaqgcililq/rYgWlrFzf
	jUswi5fTgLyYj9iBgOm7cTEDenYAR+R/vJYGh13fUItWLT3M8cIVL954Hu8lJv/hXK5tTTw03Oq
	rRz5Ma976qLNU7manUS+wNFOemn3zp/d8+bqk0Y7L
X-Gm-Gg: AfdE7cldpo6izI8t5xW4s1RNvTtK+hrraqOX54f8+WIzZtJihcQu3G8yjk45ffQD5ei
	44vUgf49gAfePiHc8V5UHD8LwsKKaKtLV8w8ykx9Gv1iAEAUsnRjDIyQC7V2HF90hy2gEDiTYks
	RYK9EZ0a5X0P7BLhFLSiKtoMFTpMNIfoCvsb4v69JhcxRsTwX6b92kQ8V0Ho0ITKchxVGXebarM
	NG3mE78XTDqAauM/I8xkDiQZb6SFz+phIyFRfdR3hEp4PQfdQX+vbka/vkKhExlPxvXd1vxzOD3
	T2huRZT7FwI4+8HdufLJkgG0JQzOlw==
X-Received: by 2002:a17:90b:224c:b0:37c:6973:5a65 with SMTP id
 98e67ed59e1d1-380527a8bfcmr1475127a91.17.1782795074444; Mon, 29 Jun 2026
 21:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627212854.4025016-1-xmei5@asu.edu> <20260629185415.56ec8b67@kernel.org>
In-Reply-To: <20260629185415.56ec8b67@kernel.org>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 29 Jun 2026 21:51:03 -0700
X-Gm-Features: AVVi8CewLOgWSWPBc3mXeyF3ERg0gtdsHbk009Us5gbj_iOnook_1HYN5mupzrc
Message-ID: <CAPpSM+Rj9Y_nb1UJNN1koNebGRSwFhpvx-Ne9o3S2juqYFoEJA@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: net1080: validate packet_len before
 pad-byte access in rx_fixup
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 6:54=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 27 Jun 2026 14:28:54 -0700 Xiang Mei wrote:
> >       if ((packet_len & 0x01) =3D=3D 0) {
>
> just add "skb->len &&" to this condition?
>
Thanks for the review; your one-line patch is clearer.

v2 has been sent.

Xiang
> > +             if (packet_len >=3D skb->len) {
> > +                     dev->net->stats.rx_frame_errors++;
> > +                     netdev_dbg(dev->net, "bad packet len %d (expected=
 %d)\n",
> > +                                skb->len, packet_len);
> > +                     nc_ensure_sync(dev);
> > +                     return 0;
> > +             }
> --
> pw-bot: cr
