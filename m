Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3C4248B1
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169801; cv=pass; b=N7onCoJuavq9hyfxBBMQDuTUoUP+uRu6XvgiqqcOJT+JkwWopbLgktKJMycSOUCK5o/v9V0Zn5oqhWzKYORLtYpc3SNaOcAvUpJHIpGAgexAFRCveyYlm+BeieT2EzT+pIB/Gz2Bq7YcSVPm9sOLIjXK2UOCHvdZxy6Ug+4yE74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169801; c=relaxed/simple;
	bh=4fw+Tj0+DQysQ6LoLPz6sEIQDfLSYGRYcdm5yHyz104=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRSMxX5N2t+5LLrzRxgD5b1dH3WQTI4OE5qi/N2iCAupyozIIe4AWaLhwI/kdcaytICzB6xAZaKcIyk+ZqnhPs4OKrvmrn9w+/lZ0Zhx3a0t+sHdsGJSj1xZI24FwH1xSaaAnPsId4G3jh8MHWCcJRd83/vEMnxtkbBDEaAEuI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWGd5pgr; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWGd5pgr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15f47e6297so304808466b.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 09:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785169797; cv=none;
        d=google.com; s=arc-20260327;
        b=K31UdKIIxjitY5BdorAv14HwXBISABJDrdgGyz+OCpW0yCzfaTet3Hmfl2FE9YlgWX
         ztlAQVDBcqPYpgNTWeVqv2EOUYJWLFiLbA1Aa0mouHabpBGWcIg1U/EpXh1JH647m5NA
         rPu5fIU86UPZkHF6pPa6+y2Mo1V3Ryfyo4758L3ucaCde8PwFBnO4X1nsXfS+z1/6SO/
         IgykiFtPXFIncWpMreXCvhp82SOJ6bWi+jhqR3ClO10sgF7ull2rdDHkBu/VkRe67/Nq
         y1Pp1X/Yq0bwMnbqAWZP1tFZnLilAbde1VAiuSYdBxdM29RM3vCeKTpL+Lezc/54r6Za
         mdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yssewUfVkwN4cFK4Z6j0f4XwofFyqvtnyN84dqAF65I=;
        fh=PRx3zGN3tZB2xr7+Dngow/ptw8Up7DZYC70cqpK02Ok=;
        b=pRSoxDWpvsqPGpaFoZ2DW9/GvEd1ybzyn2wJ8ludvTwj9YlhzyzXyZb168Mo9SJ8Dh
         Y4mHCia3IZ0B5o4Vx11ZekLk2ccTYQL0VIQpXunQBhqNWQQVol+hH6R4zbj1TCXXUdnm
         VM7SSWpkmzBtaFpmPa8SIqtrlr4cjruOCkupe3PryqSQy7aWPHAyqWhUEkKVl3/k1OFB
         MMGV+7yPKgIzM5T6gWMsVCWycfGDH+UkfrMXGRndCaX5j9/qopHGY/mc/LOUL1hgiiPs
         3R/PVYxf20exqvjbaUZi1KPZT9cyqaOu9pFUOYIhKVdn50mH36ZgnOuU0JBd08vdCHmE
         z78g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169797; x=1785774597; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yssewUfVkwN4cFK4Z6j0f4XwofFyqvtnyN84dqAF65I=;
        b=gWGd5pgrF+i8kAH/mOp2E+LAfYJzJS578qtFnTqQh8cz5w8FXc/doegNcSFrB3DwQV
         xZHAJjgkJCy+zyXK4RKSkv9y/YuMu6WyeGfxeHT+rxyO8rUHV4/sO38PyKjiL6O+XBfy
         Qpai5QA0QJnUm2SqZpsvtwCdXFM5WP0fVvb3X+hOp8WSG6w80hCzv6eUyqjLeWW0VXu7
         ZYvpwOP55/qYoup1MWf/qsGFJOI+3FMuyiL18xJsieC01zv6Q18Uo6tZPKnT9aNCowTd
         qj2HlvWlNhPVWPov7L65H/Aqbqr0F3HWZ951EU/BRenkXNzU7Z/htfSv/WGmPHmJZdbx
         Zjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169797; x=1785774597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yssewUfVkwN4cFK4Z6j0f4XwofFyqvtnyN84dqAF65I=;
        b=j8FTTomfQCLoZ9kElEbzl5+R1/+I3idpue0rOR60Y36sHiFLP/Y0y+qdtq6WcB92Np
         UyI3t2KNNMlezQ4XW+/KFf3e8JHrqVnY2Ub/tq4U2Fs1c0aCDxPGzzr21/g5fFxVJ1cc
         Nw7Q5vRtm4pC/pA+6fw23X6I5WCuEJa/rBmB+zTmfwTrU823TIKCFN2DdU+ZK6WXbTyj
         H5OWTmhTHgr55SQwa9sdySmtudCwsZXNJgl8hJF+NyL5NbDjJpQBv2df1OaFIAVqsIPI
         Q+yIkQ0K255lPj+Mp7J72kfpTu23w8b+tr63bRWNPjVYnBa4QmwJZ4ZCSb2R5OGcTbzm
         67Iw==
X-Forwarded-Encrypted: i=1; AHgh+RqaOajfC2Fw6rilc5W7UPXamcjMCIiTJvRflynIKUCDFkOu6BLN9l03m4mpSiywZZQ/UR8zmIyH1Us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx374XZOQasP8z8r4hTiz7d3uooBvxwIcAtxHRtXrTW2Mheg0dE
	QGClydCw10vVQfAMqoeIgQiOW54XgreboNa5Ip5yYROkJ6xXjZ4Qui4AvD9P3PbYbzzhatKtifH
	CYIEGJmbGylno21d8VbSZ9QGxIAeDa+I/0pT2D1zOYw==
X-Gm-Gg: AR+sD12K3FEXEiiowIi4dmOophNCZ9G+ABV863wm6BUA+LP3PnR2TnDrsDvpiyQlrAE
	FxjISckRbXXgv3ktdPO0KT6Tyuf6FJw+U76DM9u76IV5d/o011itIfLP3rR4FlIavJcsJK2ENDX
	x5A6K8Xo/FmqNNmjl3qqChsXD/IYEVSO6HuaZcI0p93RmIVPvVGDhdfHsQ7MpZxib0jymCggJn2
	puUi03VVBRjQQ2L5qlDV9CMJowVsFoKfT0GcZ/PQCo7FcQicvdzYvV7woL2r9kEiKylb5R/pQsq
	WIsLxpp3AAtH1Bqejb+fZ3Q73WLh2iOR/apuEmbfoT3ze2I=
X-Received: by 2002:a17:906:7315:b0:c16:589d:c969 with SMTP id
 a640c23a62f3a-c1f1f0391camr387687866b.43.1785169797067; Mon, 27 Jul 2026
 09:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
 <20260717195336.98500-2-nikhilsolanke5@gmail.com> <20260726182946.79a4ef98.michal.pecio@gmail.com>
 <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com> <a0db0e6d-ba94-4577-ac11-6f2d26055427@rowland.harvard.edu>
In-Reply-To: <a0db0e6d-ba94-4577-ac11-6f2d26055427@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 27 Jul 2026 21:59:42 +0530
X-Gm-Features: AUfX_mzffcfuwQcRNau6f9N-lR3BG3pBZBzfB8I2zKVV0zqs6e1HssoZ4dKzImA
Message-ID: <CAFgddhKMGMw1rv8EOHyW9ZNMGPW8U5yGCuLYBgef9a+FcMwX_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 at 21:43, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Jul 27, 2026 at 08:55:27PM +0530, Nikhil Solanke wrote:
> > For the remaining comment and log message wording, I'd prefer to keep
> > the current version for now unless there's a strong objection. The
> > patch has already gone through several review rounds and I'd like to
> > avoid extending the review cycle further over comment phrasing,
> > especially since the implementation itself now seems to be in good
> > shape.
>
> I strongly agree with Michal; the comments are overly long and contain
> information that the reader doesn't need to know.  You don't have to use
> the exact wording in his suggestions, but something like it would be a
> big improvement.
>
> Alan Stern

Alright I'll do those changes too then.

Thanks,
Nikhil Solanke
