Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E93C457D
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268618; cv=pass; b=SAlUNnJBaiDKyN84mGZi5K38GOrJHid9Yq7gmCHkdEapyI6/JSq8kgFABBuTQNQExSNQ3hfs3o8Di8VOImGa2VgtdLUh8FKQl9Q3MGF984smnLGfL5Lq9Jcxa06tU2+fvsumzHN20le78+pj058MraTOzAY51sjhUctdiMlVQzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268618; c=relaxed/simple;
	bh=+Mp4Q/CWdisc4Z6FbRzGtg0NbVAH8o2mlpYOcjqDhac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pShEEJPB4TLy+FAbqpDOWF3KUP3k1KRexKK1O+1VuRnt2fI1r1/d4fc2LSpr/N0kVVS//japE1tv4rXoOkaBJHrCgXKjMmRbU8o8Sq+El+GBMP9Fb+qf2LQ9uHs/pxg5SsVZSIiQ4DNqm3MuEEjq1QBT8Lnso0Hq6wJ1K6CajP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJi3kvcB; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJi3kvcB"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c26d7e951so36913966b.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 12:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785268615; cv=none;
        d=google.com; s=arc-20260327;
        b=pUeGjzdmvQaGjpBWq1tz5yMEWTJKuMyGG8DHsUwUY5g0B4UfHmT9rQL1knshCxOJgq
         D5i7w82OhaWOYP/v08vFfIgD3wIaC8Da5IVvn7OBqELbttuNVUqmeWZ4KJJ+LMhpfPM6
         RVOlAjnPf0HdOBi5DxRRrtTq26Vh8H46Y2zDpcxWkq0QMQcjhEOnhn5pCs0enOZ3tVwa
         BZ1+XcP2FDS4UolQ30x7B7S7WnXl9bpY92i0ZTtoR/Tysp5LpNu0sPay/quvJshvdua6
         hS25ldJa0v6IEZPuWCppbgKhgpZoG4BjWvyTO3LK4SE0eD71VO5XWdkIkhkY2rLlDWI3
         TOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Mp4Q/CWdisc4Z6FbRzGtg0NbVAH8o2mlpYOcjqDhac=;
        fh=LqaL4jKMNhhq0IVbkMObhbYMcvd3sBWwzCsjifKpuOU=;
        b=MusszviuLxTB+YmVqwLDmBQEGCZ0+Lxxtj8NPybosjwmXxZgiw+E4NPCzBpXQjg3Y/
         2qca3qpatylySE7ZNU0fNwL1pcoiJbzYIsnW2tnoHU8oySMzLO1nOJ7oWrceupDQqBeN
         PIpYvBrIjjrdo2il/Cok6lCmwK3/G6kT5Q+1kQRGxrWpbKxbhXUFXvdAPb4OQVQcGrPR
         ayhJIikCWL0ghmVBDC90q4DVbsnFKIAQB03dmmg67WRqVLr/XUTgIMCvh7joo/9tR9AP
         pY/zUIOlvC+FG9aMavta/R2+MEYSoxDPAuj6pcWV8VXhKZx7ooqeN9UQe/BvDbZ0CBxv
         5Vhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268615; x=1785873415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Mp4Q/CWdisc4Z6FbRzGtg0NbVAH8o2mlpYOcjqDhac=;
        b=nJi3kvcBAgHTDuk2NfCcoOZIYiQB+ATX+zsUnznzlaLRdaSUYnurlETgk8ZkyDdmAH
         bFoKppaXpDabI9sAMxhUR6hToCGbX7FHVspLKDqJbSXhUXDi8Qsr8EYDf/IKjmVoD1Dh
         pYwqSFF9Jc4KgXXOoaqEf6ZGp3ik+GHcgyqRvlcU7evfz7/wEPDs9Z7wT118mGIdzdDV
         q1i/jZW6e89K3ivJVzqcvNo5TKUZq6fy5/4tT4ilvpeisdeDkTF1mBF1eggW4MF1rPCc
         XgCxW3PD+p8b1ebSZNK2a9ZGszFqKlujKaSAJqUwiC/5iJmy4RzO5ZgULt9nDajjPxIo
         eFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268615; x=1785873415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Mp4Q/CWdisc4Z6FbRzGtg0NbVAH8o2mlpYOcjqDhac=;
        b=G/PiFXPZqhJSwjd75mOcL7nJQkBjJA63Sy/AUU0AYBAE3ePMQczhkEgVTcqYNXUBrV
         qqfWJGBOLpr1NFtdIzwM9KSeQiwJo52wz1XCoBvTAXJLwbgtX1AikGFkc2y/vLON48t2
         fqkScKDsGG7NdPdvYSZHSkpwSdSEhDBbE2xesdAgFkNb1MKj16C5FeBfkBAmOSnfi9d8
         M+oYZ6qM4HiZOHOPHkOYPggAHzaKrn5pzKt9qh/i/0sb9Fvi9i1lLUtRX6NXKnPSkxdv
         WoW23YOkOvHgiLmCE0wE6jIXnSQjAdzLia8CnLUTgRo+1l/PRhyjPAVMZzgaJ5dECs7d
         opIg==
X-Gm-Message-State: AOJu0YwV/w2Dojsr8nocMcRrB+MzrTv25UTj5ILyl1cLnC+DPnJxVwwq
	5AXe325ImTMHyPsNVgNXUivBMXcJ+LvkYBZAez4yVbsTV9ESfVfojPnvC0DnSlAh274EMIx5Y1W
	q5zltNutet2JNkWeoaBbQ1LyG9PSzAwEOrH/W+K4=
X-Gm-Gg: AR+sD11K4DLr4TJ6zxnmie5BaFYjLeWHa1iuPe01pAla1dgvYE4DXkQUhz0scnBbuWy
	vagYdtyzDFDt0HQ2peq89RiAg1jdsQVCNeOhooMQb3h6omCET6Xh1kQg8Yh3quHuVICHRYgohIZ
	tqE2FjmtEZeQCur13U1czB12LnJ/o1WcsOFtmIzmck568sRLI2X4shqXQiRz9lfoJwwwfcyq9+x
	5oBkGLUelbJn0neShseN4YBV92xLp52NnuXlhT2sGnLRqk6KDVVvzDZZ4tCWBQorwo8O9ECbqih
	amjNaHm5gyKuMnrMj/gGQHugtcN+2pXwKyWmugXpi/6MtvXh09tmRonviQ==
X-Received: by 2002:a17:907:3f05:b0:c1c:5c90:1bb0 with SMTP id
 a640c23a62f3a-c1f71e918a4mr207515466b.8.1785268615360; Tue, 28 Jul 2026
 12:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726171423.42850-1-ishaan.dandekar@gmail.com>
 <CAFgddhLD5xJYf4SjJ3Q34PBEq_k=g-W3=UR0RCSL85OSw6KPHg@mail.gmail.com> <CAG0uPa-AkAY-qPxGq=9OhUOuz2EqN0w8yfwdqNBcfyGniUo-AA@mail.gmail.com>
In-Reply-To: <CAG0uPa-AkAY-qPxGq=9OhUOuz2EqN0w8yfwdqNBcfyGniUo-AA@mail.gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Wed, 29 Jul 2026 01:26:43 +0530
X-Gm-Features: AUfX_mynIlfGwQ4gJ2GQw3dif_vQgFQdjwrNlSnEL_Pt-WpHLq4IQgXXOcKvYm0
Message-ID: <CAFgddhLJXzgcfRXfFwTo9W+njNdnuva1JGco4KmNZkc39gkVGw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix initialization for Generic Clone X-Input Gamepads
To: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jul 2026 at 01:47, Ishaan Dandekar <ishaan.dandekar@gmail.com> wrote:
>
> Hi Nikhil,
>
> My sincere apologies for that! I am a new contributor to the kernel,
> so I am still kinda unaware of most mailing list etiquette and
> missed this protocol in the submitting-patches documentation.
>
> I will drop your patch from my local tree immediately. When you send
> out your updated patchset, could you please CC me? I will make sure
> to strictly link to it as a dependency when I submit my v3.
>
> Thanks for pointing this out and taking the patience to guide me :)
>
> Thanks,
> Ishaan


No problem at all. I am a first time contributor as well actually :).

Anyways, I have sent an updated patch and cc'ed you as well.

Thanks,
Nikhil Solanke
