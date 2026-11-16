Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836725;
	b=08PN2Xpo9Pug1qyeea6MvtgBvVTBBa/Oo2g9J48h7MZAor8VD9uJRSEmLJk3o0WL1pNQ
	 CNdBVuC/e/CA1I4g/2LadQhYBoB7VnPt5OBJm7zpaJL/nDH6XiXRnaDsIOZFzeIDdKklr
	 ZxPv+WRjfFQi20SQHqW4fWbiGJUyaMZjuWUCHKqZYxM1egPqRE7RiqN4ozPZIJh3Mtk+V
	 7LyzK4ZGuV3SdMz4ln0OQA3ac/c5gS+vul87sJ6rarVimJzVDmMxRQS9gem4Tu79KHYBN
	 lhGY6CzUehEkhXATq/8y20yLklSV1aikwW3hmGU6vBAlxFykPVM+Lb1/Y9Pc8S7CAGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
	b=m7jGIcWpdiTEFe2HJhcz7hItBKJ2MnOZezPH3SfHlhxlR0mLFtKXFzOxa1HLiwakoMKE
	 B1NQxhpJymLsD2n9kwporQBb6WqxarMBGRZ4+IScH1ndg1sKBsNTikyQQY0KH/jeGDEEj
	 qagacvMg+Vzm/p24Cxh0i5EQpRP+uBb2vEhpAj2sxo7j3SJOJp5Ke4XYg+fwFsQFRyMF9
	 wTKn7kwwcj04VFgVBOir8Fcy02g6H90GNSjlgZ4rP4/bkX+h4TCGYaExRdRO/2tqinoux
	 CJgGsLD83pDCYoCwbrd618qwnNiIE+6uOPMO9I8RxxlhqfontuqV5vEG9s/maOWorwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gwSa/GC6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F8D606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwSa/GC6
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3ad104bc8ecso16843261fa.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 05:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794836723; cv=none;
        d=google.com; s=arc-20260327;
        b=i/yxK5Bd80krs0ZIIA84E17VmdRsRKgXA6tDCjI7pTF7F2iihtkkbki/Y0joYxjflM
         HU1Q/i8T2Q3TPCtcIUhojmvvVHunhTd+CTrSDHGdjoi5v5Iq3GU1IPxTmSzNHjihGa8d
         151wIdmiQ2n+/WJKR+SMoV5W9oGx68pOjtgqt1qjPZ5AOmblWD5aJzgqmMDeiIrz6S8A
         /WJcB6D9UJsYcud0KOniNCCjbfDLHLSn/UnXfSbpJu//qEzknC1C8OPgjOXyOXFpnkOA
         W+tSyrkbSCV864MwKDoZfSC5R0R1WnCh4oMl4F7HsAQxtZbuM4mv5CjPF2bovt4FEL9C
         O8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
        fh=N38sCg+pCcpQhzMcBD8lfxEjeu2kPfTsIZzQ4umC9Qk=;
        b=l3eT2+Y5IW7darqN47gjTkjCxtPmCEj3e4CvUv4Z9cvM40sO6zDRtXl0Pzlu5qS+c1
         LMJU81UPRHJyUByq8Hnzyymyo9ynh2CcSFbjQFfUUSNX7A3ik3C3SPG24dqq1MhNUU7W
         MVbEm6zlRI6XKPrwsMmrxkanxxTw6l13EdCsdvb0E1cAKNAGtChjRtvs/DOujob/OqtM
         dcEsr2pki0bkfhXra2mZZOlZg99KnH/1dHS5xuXouKNEWEpRQIQnobn3x/3+l/N0aiWt
         CL+orAWnePuRcsVY/VMj5s0cu1XR5D6YpkjDAJS65hCpxOqmBwK+aNpFI3JI4efJQZI8
         Sgnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836723; x=1795441523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
        b=gwSa/GC63pgr2q5W1+uhEpCkbq/WCBEU31JLYLPhsrNMreDR9Nzh+Pd7kdwrSo12LU
         +9dfKPjZj1QT1vfmeeE2YyKGqXelUp/cexnj2OmGSaw4MNpfvh/IZITZt57C4emhnGYz
         KO2v5dL6CwMx8uVOcgbZ+nNyszo/RzTMPOp3QS8eEPNwq3od4imADGw1DZPTiOSmOB85
         JQRzIfXyS8co3p0LCac+g9JrudVLU3J+TnoL7cWzP4pRqT2bQtMJCd1dF3umoXzwQl7P
         CWm+opke7QR/6BCeA1FBWo3tD0pQdHC0SKUHqFpaoa6a1PHabIw4jECx3GCcwXn/NmJG
         lxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836723; x=1795441523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
        b=X0cCBvuXi5BnM1hkn8XFSHxJpx5Dqj989RO0xakez6XWx3tI/bnKE+Ke23JVmnuSwq
         y520DKtpZL1BFDjtc673wP/UZiwNHqhNbaEKiG9WehFb/PMqIBj01KW52Dq/XLGgW5V8
         ARtcEg+3P1D7cYg13xkHjy/kGcRY+hEoQTbabpYR6AcUr5rmqnZdlGblVqEDpacg+77v
         zQqqTOrD+sYd8Vh25ARUFafcL8j+zGDib6+QqQl9HlzrZjqNr0IQ3UXZFozBNiew86Uf
         HBRQFugaa8Ba9YLWHa+EeDAwAFFvY/K8aYkS1xcELCNcbummyW0qCmp8USRutqcVKUyn
         YlSQ==
X-Forwarded-Encrypted: i=1; AL+hErH16VsfSrtxjCONHQ8h8OKt3HqR05XSWcZhOJmWvbqXRgcPcGGHjJK0Hr2gudqyM81LItBVmoKF7IM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ohZpdqcWvQSrpZiQzppZxJgCfo4LYDbh0Gzhu3JF2JtJIRygr
	kljF0WlqggAswmrIde/8L9rNaySJXYHsLBwM4h+FomMq38TB4iEJqLgLriKrHk3XGxWU6AK6EYM
	LsjLs1ro7eDR9Algoza9B58yj1DJw0p4=
X-Gm-Gg: AYBFou0OuHSL7I34Gzv77Irs3jag4tNzqJxJZXsVsrEv3ASTemYHByGceth9iA9tcn6
	HkkO3lBsMNsYgTtYEaCwjIXwWLNJaf7FXUj43rDu5vpQCiw7Fnlz8pwr1WnTq3GudNL9GH5Kr+n
	tOKAOeUOZgkIzcty/2KDPsN3GbK+Qp197604qcGnQT/ypYgkH6+0R46RWHFcNtHfCoHxS60i8Th
	2aqWEeCdQbKc1RgbBZkzEKTF4UyQbny44ew3qrkKR6JSuNC5jlYGo4TrD5syOXuZja9m3p5P+gx
	djidnz3wQZQrO/A2GnReJeIfz2P3BbI7cX2k73lSRu7oo/DgbybW79Jz2jHzb9T4Mi1dRbnCFmT
	9Uj92Cyzok8XtFXYjlsOedrrZl/J0GVIntvb5UWSRgOd8flzvVupGiWmbMWfmXHhoUMvf7A==
X-Received: by 2002:a2e:ab0c:0:b0:3ae:90:b8a6 with SMTP id 38308e7fff4ca-3ae2b524882mr30549221fa.26.1794836722999;
 Mon, 16 Nov 2026 05:45:22 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
 <87zev9t1m7.fsf@toke.dk>
In-Reply-To: <87zev9t1m7.fsf@toke.dk>
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Mon, 16 Nov 2026 21:45:09 +0800
X-Gm-Features: AclHuK-uiuuP0_wdfUnnUvGj05nPd6NTNUzShHBnpf62vHOiGyAMLfWUICUj6dg
Message-ID: <CAO-4RZ2Bwjtg=6o2gL2J0y8EWKLNrCW_Vy7sbKWhQ-Ga9a2A-Q@mail.gmail.com>
Subject: Re: [BUG] ath9k_htc: KASAN slab-use-after-free in WMI event tasklet (v7.4-rc2)
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Toke,

Thanks for pointing me to the existing patch!

I tested it on v7.4-rc2 using the same Kernsight/syzkaller reproducer.

The unpatched kernel reproduces the reported KASAN
slab-use-after-free, while the patched kernel no longer triggers the
issue under the same test conditions.

I can confirm that the patch resolves the issue in my tests.

Best regards,
Zheng Zheng

On Mon, Nov 16, 2026 at 8:14=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@toke.dk> wrote:
>
> =E9=93=AE <fengaojigui88@gmail.com> writes:
>
> > Hi Toke,
> >
> > We found a KASAN slab-use-after-free in the ath9k_htc WMI event tasklet
> > on v7.4-rc2 with syzkaller:
> >
> >   BUG: KASAN: slab-use-after-free in tasklet_action_common+0x2ec/0x3b0
> > kernel/softirq.c:988
> >
> >   Allocated by task 1259:
> >    ath9k_init_wmi+0x49/0x320 drivers/net/wireless/ath/ath9k/wmi.c:95
> >    ath9k_htc_probe_device+0x203/0x2650
> > drivers/net/wireless/ath/ath9k/htc_drv_init.c:956
> >   Freed by task 1259:
> >    ath9k_htc_probe_device+0x292/0x2650
> > drivers/net/wireless/ath/ath9k/htc_drv_init.c:978
>
> I believe we already have a pending patch for this in patchwork:
> https://patchwork.kernel.org/project/linux-wireless/patch/20261021120237.=
481898-1-toke@toke.dk/
>
> Could you please test if this resolves the issue you're seeing?
>
> -Toke
