Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FF2C032E
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175491; cv=pass; b=o0K9qltYPQyaIOPz2tKUAIccuEIHyhFgeAFbS+KJAutrTxdIwmnofxZCxt7LWwso1b78ni4EAjxOiGdTTWd9IpWGa5DNK7TTaCaZxi1VQc8PqnqxhtH4Jwg+QGBB3KqINhdJSqUViJL5RWP7G9+9AHSWJYJKfYAtqXKhyDAk0Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175491; c=relaxed/simple;
	bh=ivHv98UdkMx1tNUXp0u1i9tvsMHfppuazLYuOELJamk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D18Wh2ORJxVDRQvM8rUQAzdsIl8DqLwaKyIqetpvRj+V5/tEJulRuTjNKqKIEXWQYOPFVa79vODchJqTp5nRopTOG9/n02e5aXi4oMM/gwKLrRhexM+11ltSfW2vqmJNM81Gz0NDfsU03mvhJMDpRoo8DWXfCNbJE5sjANAF64s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg2/OpXT; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg2/OpXT"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201f9so275869d50.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175489; cv=none;
        d=google.com; s=arc-20260327;
        b=VndLBBtS1OIxsNkOHOC7iA6N15EOi+t1YQVM5VYGtoayRp9ju/Gw+HWqPBt4UoVTaw
         6DjRyOUnIAl62VRT08/IKInqAAHRJxg173w6eVsBOanZLCU4AJfQbhZnNQWSJHdKoQoz
         YDMYegV3oopOPmPZVMTtQSnidwyTGqCh+DvEKjpkNgURfFnVsSt59a9HjITNyWuAcPB8
         AfMgXIij8dWlDu7CnNLmAbBnLgYpvrgaLFPZTCXxvbWEuAjfwx2KiHljH758EQsSopLC
         dCSHeZG2RBBkrKKKhmdrlOb7NHfASnIekYThR1yCnG9O2ayTEpeQn9PLXT5X49Dm+rlJ
         7t+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=22PTpkoIp5WvdbaY/vm5LSTUvfhXc2qCbslNQIxRLso=;
        fh=oWtcEB3crF31423G5obyUjQBzhjr7D0Ekp59lE8jeGA=;
        b=FAT43yajwqLzTk2z0iKpSODXjqKS6qn1G9uhzGCIbRkV6C84fha5La0CwZxW6cFye/
         m9ey/SEO51Ii5jv36aI/5An+mItqPyCwLxK6UatYPoOSbQOzq1rS+gnNjzD+UaCa6ZPP
         R3C7I7F+PsY+bDaqVST6Q56cSeayG0hY7lFDRost5yfpkGwBETTEj9/6AP96rJK39Nr3
         lWeNAvX6xQE9qug5oNYznDvmHaOa+t+n5szD/pQBoU5E2PrXKJX0taQFraVKKo6xfLFw
         OyiUk90rBtt3Lv/ksCJ7dAnWgqTOfr+3NUkR5MBdmce9pTrUIeL8sebVzqwu64nXd7o6
         Ku+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175489; x=1789780289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22PTpkoIp5WvdbaY/vm5LSTUvfhXc2qCbslNQIxRLso=;
        b=Wg2/OpXTRM4qryEpCwQJ7czKFMnVXTi+Kpk1usvstc5eq246IdkgXjPn6exTBLhplz
         oCScouXGxuBoTUe3Q70e+qE7QRwNqRFzJKoOP8bSuCN4jE4gllmGchv/zVmJV2oA9KCS
         oRKCzGH+aLhOGPqrlzDJPLSUNEvnUYGStjXEh2agrtkUdBH/G8JUrqUKUn5GSUVEt0v4
         txdQ5mq8QxBU41wYESKn4OejHX+ckjHp8yVfZGuz5ebR3OLvT0uD0crEHGtS/8EMASLE
         dFrHpQhaB3pU6UFTi2IQFwVE8Wmek4iWrBVuj1R/Bg5EwJbWTGPtJ1c+TazPuQDOSnmf
         SzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175489; x=1789780289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22PTpkoIp5WvdbaY/vm5LSTUvfhXc2qCbslNQIxRLso=;
        b=UVfk+kNef2ZGHJsRXgsIS0cW+a8a8KsIbisjf/1HbiIoLP8Eb2+EXj5csHn1CNljwC
         jAxv3paL2u2p6tzcY9hDK9Xx4coYAReK+rAolYJpxcRAWz3bUA+wscDgbehbuDmLE9fJ
         vw1t0gcWD/2ifNNaX+tYEvUFnjmkGU07pRGeG2BdPoLQExxkbeHL977lJaG4L/MRLNuC
         XrZvq/Lbplb1KKYsmuB7AIilvUJjr2wdT3t6DexoZzJr4uLy185Uz5ExfeN96Hyf+99V
         4cYhxfz94pHkOEFCiShgeCeuo88xouklNVRhZjeIT1/w3eVg4QgzlS2gsQXTwd7krOkr
         9NZw==
X-Forwarded-Encrypted: i=1; AKwUvBwgvV7crCi6raz+uLTKublU2FLh/bg4kIJmw1nHY29jKuRT6kcxFBqh1nuHwjPKjhPvbYGaBfzmI+g=@vger.kernel.org
X-Gm-Message-State: AFuF++nmgMM1b2bRZH2uy8oQIBXGC9ZzSQ8yS69OeQ4aVj8ajFDnyNah
	6TBKu676J6iJFDv5XbBYYvK0cnDUTAnIdwwtko5XXdir3pua44s0H78ysCHjsXJbXIcg2BdbLSs
	FnJRRf7z5nxiU59p4FNFQEXV872gGE4s=
X-Gm-Gg: AYBFou2b8FS3oJHm2OFp0v5n7IpzZThILN5DhyiAyKFQub2P144TYI6O7d9zQ687TKu
	6XiD3Q8BLXJAlTEgJGJxF0zVaYSlLi4wMwQbANhmzM1uFbR6UpsxiHGCwSWx5BPYUYqYXu/01pl
	jcxpyax8wiYe7hj1YTYLX09OGqisJQ9jE3b2mPBnSEdZ/6q3v0R0FMK74CIyF+K+WMk+2Oqf+53
	itSxQ/t41Sz8KgIDhum7abyQLLGGMaa7KVNPZtb3SRZE9nZU4te5gDMRpPbbwg36HcMvcIDHNv/
	cotOCF7QmLfgEIAtBJeX6mREXmbOntn5RqNvOLf6AL1mvFeqcm9RXkoz1o/jKOkaayGpAoIf73h
	YiJgxaygeIG/wDd70p0bqGgzU+PQpZRx55BlhqA2GkILjwA==
X-Received: by 2002:a05:690e:c41:b0:671:2a94:b4ae with SMTP id
 956f58d0204a3-6712a94b628mr1658998d50.36.1789175488898; Fri, 11 Sep 2026
 18:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com>
In-Reply-To: <20260821114854.12218-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:41:17 +0530
X-Gm-Features: AcwNN1V3fWj5K6wqF8if7WrltpimdvvzgHCiuYvtPlf4pmG6r8o8plNVskWxjLw
Message-ID: <CADhLXY4TxUf0yTxjCJqBV0s=tpU_JaCFEduLznjS7jm4RZ_oWQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 5:19=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> u_audio_get_playback_srate() unconditionally locks and reads
> uac->p_prm.lock/srate, but g_audio_setup() only initializes
> p_prm.lock when p_chmask is set. On a UAC2 instance configured
> without a playback direction, this results in acquiring a
> never spin_lock_init()'d lock when a GET_CUR sample rate
> request targets playback, triggering a lockdep "trying to
> register non-static key" warning.
>
> Reject the request with -EOPNOTSUPP when p_chmask is not set,
> before touching prm->lock.
>
> Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate ge=
tter")
> Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index e53f2927b539..ff811ea1e25a 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_=
dev, u32 *val)
>         struct uac_rtd_params *prm;
>         unsigned long flags;
>
> +       if (!audio_dev->params.p_chmask)
> +               return -EOPNOTSUPP;
> +
>         prm =3D &uac->p_prm;
>         spin_lock_irqsave(&prm->lock, flags);
>         *val =3D prm->srate;
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch

Thanks

Deepanshu
