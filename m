Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941FE392C20
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321144; cv=pass; b=PNfnLGqmUOWF0jzBm2Nvb8qNQHY+AY4XnioroZd99MMoB28YoSzSB23t0IIIqIisWRRO7GdXK61BI0GoVMsAUo22893kLMguXvo1kuLzf8P3nD2uLEg5UnEpao4NBVDHnaV9lHXQrDNZWFCeTQ/8mxz5JvsMoMUrcfBz65OO0L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321144; c=relaxed/simple;
	bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKYk+WichQF/EynVdb659dx8GSRCbTlyVxGTvz2N69EKpns+UbK+WeL7NmG4bI4WD3MXgY0ECnIUQUSKosOtQf///tLmTIxRwxyR9tB+/g0nJKY9aJ5pRllO8QGy9RMAZ5xvHwohN8SollkT8+tdwI8tOdL13OSGpMztIJU20qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2NI4BJJ; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2NI4BJJ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d63f60bcso8745577b3.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 03:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792321142; cv=none;
        d=google.com; s=arc-20260327;
        b=LHevF60M65CxhTRxC1xSIKc2zrRspqQ02z9upwKC3F67YXRwR8Nng0XoCS+y77kagb
         BM8Vysr2ZyNslgDPebkT0FDJi1sGtg9D1ri9+n8pZi0acZveIc5SW96HgR41uNC0dXZJ
         dL94cpYw81cRAl0+YCdcWmxt7EIH6cQ6OX3BgMKfoGrtE3hj7nX/cEThK23oFKkRUc2I
         lsanulUfSf1JwFcPY4CLXl0JrLwdt0Jb00m4+NW0wDces2iLvJ3mV8S66dWmCZv3Eghc
         jtbwGPNjcjGyIOxdFlV3XWW13N/9ES4nu+3LQBRsVP2UknOk0nn98TBfJfsDdyALC1mT
         OHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
        fh=BVO4v9k2q3V5Vkk3gUxzmx3S4Pqs1lkfn7Ys/023LrA=;
        b=lwvo+ScyM5RUx5ZbemMQRGldLs2FSfXAFGMulq6LzSWQoQ88T/hp/1L4P9m4ZEZqgZ
         UckYKN9fN6XBpCF9ivuy0tFuDBLBD1RHkgqs3ezi+ugZUBSWDJz+jVzK7Jk2/Pe7zqkH
         14CCT6YkZG1IJC1y17PZslqvk3WHDHfrpxybH52u28tTTuhBCJJ2b8accyapco8Yg84m
         yD5zGevIOGZepFqa5QCi5q4XJcKsltzKd3pn7y6aQw0bV/rl0xl+SRl30qR+iWNORg8O
         KcISkLfDOMZO5r6iaRqh/Pyd74fYMH57ZSFvFViVk4si1CtdS/3AU8oqBeFv/4QY01G8
         TcJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321142; x=1792925942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
        b=U2NI4BJJ51mU25KLT8gG5+jEUCYuddntwUkcp6t94Fpw53GvTasaS57I7hf4uzxzZz
         ELskm3q31qAnl7SldlfYQm+kxw/+g92vtygoYJWVDzeVV+Te8PfsCw/Y2/YOprdq67tp
         BPr4DvNs0KVdJMwr8DA561AN6KKCtH+B75gj/uae6OviFEDb0M2M7nJoitogdy9ANtzd
         7HoUtnNKhBvY/JLV2+/3obHdkL7SedimdSa8fPPxkzpqt58WGjLN/f8jmrzXcxpJMZ+M
         PN/BQEFmb0wj914MisJhg1iBQW9HdLrq/dBEkC8RiiKERyEGTotbMnb7TC95b1K0Pv5i
         bSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321142; x=1792925942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kH379+03vqq9VgNoMgF4X+CQYZbnfJhixopqpO0bJ7A=;
        b=mntWNFUZon3r5FWTGLFLsHBZs29DlBKl7gzH/goPczsS6m77Y4V8x4CYzlBqkCqe/P
         jb45V6++2xHPXPMRlN8n8ob0g6IMP9PV6JljtUhSy2cn6sCdZQUb5iRZRkiVuB5y6k+6
         qqcPoaVxTc5+W2JiUQT9TyUML+miAZddNw5KTKxx3rb4LbRS7PYdLBuoD7JF1AEicrhZ
         mAs/lou9GaFl9yOsfPBeXq38T+taD2s5RhUJBT9FdkxT4w7UgVRe7CX+5QVZ/c8CB3ET
         It3Kuj1mLRzsMK79Yi8h5evmNNpcg2vQEi5XM6cg8Mc+VWUowysf5JV0ghePbzpJ61ei
         EkUA==
X-Forwarded-Encrypted: i=1; AKwUvBznDT/NDRzOtG+lIsGZildv1AZxoRgMdHEKfkzPrT8xGOtfWtr4F7LtiMiGMcvaUP5bFi487nN8frc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgk+s4VlQ+88GTsF7sSVQtMommY75PNMW0gUXfY9ijwneRLk3A
	UOQEexyzKiBRDKwyppbwmneZZ9jImxZpFU1dxqE8G7eOmBKh5DQvLw/VrTyAu/KNAmrtzeQ38Ax
	ntO56P5pSqZt6HIPE4xRCG0hJ7+lIjlE=
X-Gm-Gg: AYBFou315tzWSXAvowi+FsrMsYBBls8umEQBAj8xEia2U86fNXPmX7X+DKia7eLipnr
	woxr7PiBFOFvztyfS2zfKtNAMPP7s8BzQ8cMJ3tjnCmV54nKVy7oNg8SM/wbeDxmX3mwT3pH733
	Q/P2Qunzp/nSK1VQpF+hFRGgRn8s+MvSqjYISoMxI7cOOguGzy0BZa94kkQQCqW5BPpyKNjrT7s
	1eKo0jjgsIeOXDkDW6nS81ZUf6yleDr3Gac9/kDxmPYblD05Ba9RWTt11jNC/eZXi2UijNlmtsq
	XW2R7jEP0/5H6VaU3VymT1Vjey4y4a2TXcd/QYKPVeSBpeK+dDLLjcM/oKICKAsSpIdxNAHa0VB
	G14WJLhlte4OfyjhILArgnekmzaQNA0et2u8s7P98acCj
X-Received: by 2002:a05:690c:f82:b0:8b0:f074:75c3 with SMTP id
 00721157ae682-8b0f219a62dmr15543377b3.11.1792321142377; Sun, 18 Oct 2026
 03:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
In-Reply-To: <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:28:49 +0530
X-Gm-Features: AclHuK_HMv1PVjOPtvzFyVILO65tZfoFuR0e_ptveMjtk5RooNmqwPancL-Uq38
Message-ID: <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:48=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > > u_audio_get_playback_srate() unconditionally locks and reads
> > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > > without a playback direction, this results in acquiring a
> > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > request targets playback, triggering a lockdep "trying to
> > > register non-static key" warning.
> > >
> > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > before touching prm->lock.
> > >
> > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srat=
e getter")
> > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > ---
> >
> > How was this tested?
>
> I have not been able to test this since there is no
> repro present in syzbot.
>
> I verified the fix by static analysis of the call path in the report
> (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirmed
> in g_audio_setup() that uac->p_prm.lock is only passed through
> spin_lock_init() inside the "if (p_chmask)" block, so it is left
> uninitialized whenever p_chmask is 0. Leading to lock splat issue.
>
> This patch is compile test only
>
> > Did you forget a Assisted-by: tag?
>
> Sure I will add assisted by tag
>
> thanks
>
> Deepanshu

Hi Greg,

Please let me know the status of this patch.

Thanks

Deepanshu
