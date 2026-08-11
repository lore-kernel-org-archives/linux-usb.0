Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CB33D4F2
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420280; cv=pass; b=DkRLZpCmb3t3rzRNPanwOv1LjCGqNcf0oluP3FF+qqJCocjj9nDINIsPZV0FI2R+JcbleK52mYAfYzKrcUBCoQQjz5sPDFoWPf9/erLP2XmZItJYnoCiuBcoFN1oFuY+tClxoVK+wF8FiNo2MaT0hcHu4liV0HTPu8/BRRnbQwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420280; c=relaxed/simple;
	bh=SFZ/FcMMcD61KfXSOEweghc5g0LX+O2jSFh2a+Gbmdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHV/XftntrU/t8bPKD9Fa1zmtUZnLEA+pJPYDziEf80W3zg8F+RmWdFUJG3KcebfmypzEprAG/Yo8UtXsI81vxTGRQGNvrYsBlXVwMKiuYGo55+JlLS6PybbOl81p1GVI+bQFraqMnFZWRJgFsxrp2VIf2E11iHiz5cwAxzLfNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LEGeJJpV; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LEGeJJpV"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-668296d0ff3so3139512d50.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786420278; cv=none;
        d=google.com; s=arc-20260327;
        b=KsyeoZ8Tg7YRV42A1Tq0knAzmAgLzdbISRovs5nZnC2QePBPxpZRofgFl3pw2tdUWL
         dZSZvzoapoiy0jH5tRjTxWMQw8IZ+YUY/eMQ3UkFN+AMSfD4RUWt5LngJOwTmTFUINqS
         bOxjZhrIr8SG2zeJFdmtc4RGcOavPi8yXTVedsQGQ8sTrq3AbsO4HT+7UBDuwXOOHKJa
         cMDSNKdGNDn22eFnvRTGGCjHrtr0S0KgwxPXBb3TeN8yFwYjAgAizF8oWRuE1HjLaz9D
         s7iDRfavPIYaSPizMR143mh+WzvCPN4KTvthmOo/BBgl55R520NpwgW3spm8c+Q+7hjA
         Q1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SFZ/FcMMcD61KfXSOEweghc5g0LX+O2jSFh2a+Gbmdw=;
        fh=oZNX9/W+DPnUq6tWumfuFRUxllPB6k0lCgsUAgaQKOA=;
        b=ebdfhLbDNAkKEZC0YolC/haWTT62UeBqk3DUeHIrELTjd6vWNuwqrjJEl4Qgj/0jd6
         fhgSH3Jd5uvnaMBmVEcY+XNTjf87exlLL8NIsUn4ygyjjcLS74qsJ8sZEqPeoZQZLO3+
         PPMRHc9NfVwHCArbuXLSAQ28lcLvb3c1QeBHx5dE0oqkDUv+tED7GsQ2ihi8PDwCcxwg
         mwGMM569ASKdRYJeHgfKky10duCwuO89DsgcSalYJaINcxwKu/71y3nEyfeAhgO5LzjD
         G0HuzMDiwPY66nLGFT4/otgP1Q+vVexHAt0Tz0lGdmd2AogRJiLlgTYjsJgiOOIpX5pR
         ljBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786420278; x=1787025078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFZ/FcMMcD61KfXSOEweghc5g0LX+O2jSFh2a+Gbmdw=;
        b=LEGeJJpV7eXvaox+Zj3Cde4z1SgjtPV+2jRwmgzybp2hNB7HsBwyWtkztGa5psyQ/M
         GoRwjxlZWF8toarUhwPCfCquOi0VOXENeuzyWI7fKxLjW9jPqiII05xXqqpPCAm5VttQ
         BTNeVPCR+7mIHR4n8wZC+vt9r5lAyTGJXpVVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420278; x=1787025078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFZ/FcMMcD61KfXSOEweghc5g0LX+O2jSFh2a+Gbmdw=;
        b=P4aN0i53vgGBbgYKbi5jcRl1b2J8qZmurBbbwOU1MwbDL45T/EV/ldyYyBjXyeBFr2
         qibmFK1P3MIYquMRCrN0wCZX9c1bTqDskSX7yytr9KzeMZGIv4yhseq+AS9WkBO7+1Ws
         uOhwM4duoSkRY7Eef0d2you+SYWANriLQskgP4QeoXt1cbvFSuGNKW8T9F4Hc/v0n6oG
         IzcvRgge52Z8tlLSIux+uhMW7EkhWzQVkjl6o2yN7H33TKQHjOwmxnR36FHtg7WlORle
         yA4tR7K7rSPidxkLdyT1UPzBPG9NNPy16QAYlbI8/CTm/EEGlKphiLI7pQ1B/lKrpYbC
         +1ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7+QJqAOLLHv7HeBTgRxsDDDX+0ZVthN5fphu02TCNF9yECYoQvM+jK311zPiX5LhO9ZZmTnCydvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSdRo9V10nsTmQEKHJPcCPaQf2LX+d8uTirShVKfONM1ccmCT
	lWe+gaVowR0OrMJLJFErXPdR+iGXF2pU/ZJ2awX7m3IZNMTeRyVDg33KQsmhWW6dG/xkXPKQjFb
	2M9w/Q+h/lS7HvNtFmKLH5qmn46DRI93Hdai7Vieo
X-Gm-Gg: AR+sD12b+goYFjMpfbRpYMH5Ew0IS1j2gIgrGOV85Az6zuXuzsI03KO04/dEl9/xl3j
	fnu9S76HCTDDycrOX+FWQxvOZ6W7LbFDFdLQuxWL7txCmX2QTwtS/qSNlXeqfLi0n1aH6E98W82
	9P+WV/DwRr/jCZMzw4IcYH/sd3eRzKO0daKeC58FV/rpx8HTpV6UfE+QrMaX8fVDUZqnGoDC3Kc
	amJSR5nEUxYcEh54yehbKI2h+liUkh/1JQE+5Wl5fjtLo99jJSpv4pyUK4/tuMeAsOblBVpsIEA
	qtfuuGVqkZU9yu3BCFR0ymA8g3etfrdH7LGto+0WElki64I=
X-Received: by 2002:a05:690e:4184:b0:669:3e3e:d64a with SMTP id
 956f58d0204a3-66b22db9f7cmr137591d50.15.1786420278314; Mon, 10 Aug 2026
 20:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728100005.413868-1-wenst@chromium.org> <ann84DKCXCPLtgeX@ashevche-desk.local>
In-Reply-To: <ann84DKCXCPLtgeX@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 11 Aug 2026 11:51:07 +0800
X-Gm-Features: AUfX_myLM72faA_z48ulZmr43Hb0JfNLexE4k5hzDoFRzpAqM7LcttAPh4ZvkKk
Message-ID: <CAGXv+5HGZwAKpGpyV4=QHfg7yBQPx-syc1Gma2qad_tzW_RLog@mail.gmail.com>
Subject: Re: [PATCH] usb: hub: Set proper message when usb_hub_create_port_device()
 fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 12:31=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 28, 2026 at 06:00:04PM +0800, Chen-Yu Tsai wrote:
> > Right now when usb_hub_create_port_device() fails, it prints a separate
> > error message to say which port failed, but otherwise leaves 'message'
> > set to the default "out of memory", which is somewhat misleading.
> >
> > Allocate some memory and put the currently separate error message in
> > it, and use it as the error message. If the allocation fails, use a
> > generic version of the error message. The allocation uses devres
> > helpers, and will be freed after the message is printed and the device
> > is cleaned up.
>
> The 'message' is local to the function, why devm?
> Shouldn't __free() be sufficient?

I hadn't thought of that.

The scope shouldn't be a problem, since it's declared and used at the top
level. But we'd need a kfree_const() variant of __free(kfree). All the
other error messages are just plain C string constants.


ChenYu
