Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80F03909BF
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044901; cv=pass; b=QPG/bLd0DGMck1zr6alsZ1BbSlrl5EvwG2VgSC6bl6luN82XXFOkVyYqnHm+EnY9rhwMYLGKpy+xFYXo0zy+8sGNgk1E3UN63j6YEHHw48TtcCihUXXmC/ytmjXh9sDEqJMgq/kSIX8maPq7K0WrjaX9kHKaybx10hln7gSQZng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044901; c=relaxed/simple;
	bh=KpmH/Rf8PCQUoN5K980iEZAtV/t0VVxk9GV9cULTJz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLRtakMa4Qw9lcdn4uqqgjTiL4RB4gR4hsLoU/iafz5wtZBl6TJBN9KAQr1RtCQUczJMnE/Sm+7ZapQWLOawi9OZFDZRiiUySAS1vhzlzwPrm94AXDRbZ7tyIkyeOqjaf5qnJ8NiDw5QKIuqciIqbY3NSGBGa7w+mzUgzTFqMlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq6ZK2/7; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq6ZK2/7"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1b327so2808892d50.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 19:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044899; cv=none;
        d=google.com; s=arc-20260327;
        b=QZJuE4HDRjHo7uYQ/SbKHDri6MKvd1I21EJVHvPoA1RW/KMuB3h4taw3sNgJ4VzPzA
         V20HTCkqBzdCSBjcH2C1nhQrf4Od76J3QcrwR9VXp/VJnjCN7J5XLYPfodxyLIqfQGsy
         Fg32cTahW9yJ7g64uL+Fu2j2hykFt9jsZnm4mZsyeVap4p7u6/CY0M0DM5MHcAQqquy6
         Ixy3jMl7ZDjVO2OTWgHHBFR6PFJ9skNDwy6Kc+27yuZZuV6cCp70eQDRP5pXIji/Hq28
         gtjkBmAuSNN7aXkKyYOwFmCp9VSC+H0LxroTZ9kLs6y4gZgEo5qj5iNrt2Yy4kaK4hrp
         AZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        fh=EMVe9Wszcpy9+iuO0wZwLqBeggJYNdoqKeYgbptnG/M=;
        b=RgtpzAWdTbGT3/BbyfINoObU+CjS8m2Z+KrCE2JaQzUzDAsFZetiEImwREwrP5as+a
         eX3kbEUdfbCK/+gIMX5MeUSttldqVW42kZ4TSszXBP0TECfDMq/vVUdRWphzZFCEdsEW
         TCGMY3+mz5QcJ+bttTo/ipZ9RyyIWRS/bvJOXQI0UsuVDHszbB6TigzZNlHPXyAo+s8+
         O6OIxWFF9IhFrW61d5oNGftqOhiIpB7kxGO1Xt48wZqJ/EBkG8bwUQqoPrdpeZbv2jyT
         Jh90V+stdXwzmCjQXsoq+DVRFrwd2z28ifV+Gui+X7JWfTwk6AR09pVMvhtiVaLGhW5K
         dRvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044899; x=1790649699; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=Pq6ZK2/72LS6NnnZdqEPTp8lBmwMrAjXoBtXPfxEE1n0h3bGH276aA9D0FtUSB0hgQ
         VQU7zZr6Dg/zO4v2Heuvstz/9Lp2idMpRXGoDcqrN3pKnowYImicruRvoYoNqs21jpaG
         nqCESll05xbkuKLm+UWzMJ9chseMiP3zysy7Qo4f4Iy/AlzAyQN3oba2p6DUm99HQzoI
         mjXRPYNZm5TVYKO2Z5oWH67gHaFSznZidVWKNwoxzLKC7hDjD2Xyit0mq7tuYaf80THg
         KQ14SnB4EPTCWav4zqiyJUr8ENtUjF7hz0zNQzl2W6X+13V+Zvl8TJkF8ciwZ2QYu0f1
         eEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044899; x=1790649699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=LKmi7q+0l0z+jtIzQ/QX0TP0yi8yNhqkB3l9nX2Mc8bKRPl1WDvT1lNkXzQW+7nNEh
         Ca8QLBj7wVZBTXjkIX8jR1az1owqCu23URFDLJZZSsdoSQ2tqB6p+pdxphXkKiGg3qMi
         S72W1kogUuJZ42g/c3zSGCj3djWaoMd2ng4zQISfU0dMdNLpF6wrXmSLLJJdpKc4Y3jf
         cRCOO1IbeuslInUan//jfkSjHbIyC5DQS21RWOx4muTdAtf+HI8ir32NrNjSX9F0zDvq
         mIjO6CdpWeSTK6u2f5Ig3bIbsHTxxtoJsKrxwN3O3bqxAMq50EwcTLImvwOuX8W6Y6FS
         EGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2H7pLVXE9oDhXZf/re8oGRV+AXUG3tKuOjYXGVbBCZujK8G4FRKWXkjw0jSci62+xi/WiyG34HBg=@vger.kernel.org
X-Gm-Message-State: AFuF++mgFkCmPfoQL5TCPrN03lt76tStCmr1WCf+F+wCdt/jeRumK+HA
	iHHLhgA7MjuZbrjnFegqqB1ZqRGEvyhtCD2Ki4CbBu3nQJo8XqSjG8N5onyHMG3rPnxbKN8SJ2S
	bHn+hutvZFm6XDZKLvt1SMQ3v21Pm098=
X-Gm-Gg: AYBFou2G3uYLFxffvojc1xPYq0qjz1aEMUbYDDYbDsH4Sly7K6wCIryvcPoS3WqhH5j
	eRVMw8powBvh23SYr0ZcPCnha+Nx8cb9UPYQnenfL8XgQSDe96AYKH/nrB7yz05FD45+yOnzt90
	RezbIYFkN7PCO/zyGmjc0IJp7n06Gf8jXjSuhuDGuQ8/nLt/7AeL6E39e6f/WX9e1lBiZY7xOm+
	UEZaH4Q/6g1mRLCzUGD1flhG/dST6x54yTIe+xddUUea3IFO8kCoGs1Vnt+A1yyc2jRgmQ60oF5
	HUweSAmr3/D2H7piZhDiYYwhnQNishm32p4Xgj5imOCcuCLygcACiiunEuIce0iDCg0E
X-Received: by 2002:a05:690e:418c:b0:671:6e1b:3579 with SMTP id
 956f58d0204a3-6717fce3850mr3483604d50.31.1790044898781; Mon, 21 Sep 2026
 19:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921085119.308981-1-lgs201920130244@gmail.com> <arFHWJb9igZQPkeZ@quoll>
In-Reply-To: <arFHWJb9igZQPkeZ@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:41:25 +0800
X-Gm-Features: AcwNN1V-Ux3fREqDv-l9JklLsk_41fzba7T8a5w0aNSBvvhTkqxYTyKq2Y8-7tQ
Message-ID: <CANUHTR-FtO3EAxgTmXeS0YeT+2CPB=4iA_T-2qFZO3QT7veYYw@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
To: krzk@kernel.org
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	Yonglong Wu <yonglong.wu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Min Guo <min.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:03, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> > mtk_musb_probe() populates child platform devices using
> > of_platform_populate(), but neither the probe error paths nor the
> > driver remove path depopulate them.
> >
> > If any initialization step after of_platform_populate() fails, the
> > probe returns without unregistering the populated child devices.
> > Likewise, the children remain registered when the driver is later
> > unbound.
> >
> > Use devm_of_platform_populate() so the populated child devices are
> > automatically depopulated when probe fails or the driver is unbound.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/usb/musb/mediatek.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
