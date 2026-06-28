Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CAD315D5B
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 06:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782627806; cv=pass; b=TRRRSq8ej5V/tvkEScDEmev0YtycOKy92vcksLbAraX+8Fjm0eCc80o1DS+tLLbNGEvhK6hTc1oakBx0C87LtwYgnx/gLSwPwiBp2rYiq5qFeqcOeDaORHVbRfzUo8q7rwEm9ApSzY5KrLMECkiQB5mshtXodJ3C4ARYBGjy4jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782627806; c=relaxed/simple;
	bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXsWyQasjp60W5g0bm8ZslqHqddQ5U15v7bUrmVpXOfnVmWrfpFalqQIBAuj5cnC++GBY+p7Woe4vYBZNfi6hws7kI4gMo0rWjXFSpzSrIuL23TrUGa/+TYwWh4oPPMXyw+TtYSy6snWVNSp4IKdot8zQrMEqk57k3dbMwREMBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPNoA4iQ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPNoA4iQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1214dc027cso239038166b.1
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 23:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782627803; cv=none;
        d=google.com; s=arc-20260327;
        b=RCQYyOefCO+MWl2Kwgi3AliuxJWH8BOv0HUgjUWx6tI2kZ/2e1zqRj/bXcIxRRFjZB
         7fYnZmq+H2Lkh2yw7hfN1tfKopfX8+bGtujnHoP02F68/VgRCfZCRLYhQO3Y7c2ffV8S
         nuN5QqUlgvJ4Zp9CsJdwmIQu3qb+5Kp8+bOUHeFlVT/+d9JnlTH/kcnTNiRevdrjxnY9
         RmVW08vxPFmPDNFEldnYpRzge+PZejo4iLDLxbGJ+Wpr2s9fi82H43FK961YLQJ75ngN
         VMVOuRN+U2+Ess0sMgxDsK/roScA6FdbZgKCHdWsOKxTYGiFZa4QFBeWic2zRv4K7rV6
         sumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
        fh=cQQC4ZcnSDaZ03G3vNlFyuY8RcJWNy18nF+ZnOE1ImQ=;
        b=F7wZ0o2hu7QeAQWnEkRbrDxlJyJacj1vixGJNjww60wZbbx6+Qj1KibADg7rfrNWr7
         MacRdIPuyRqh+t9LOBsqJ2Yh7zgwOG+2WoBj2NFMlNLYZsconJTisq04zR3uK7UcgAJj
         /rcjWkhecD4YGoL5b+jE74WI0sPTQbezJrqf0Bgk/JnZIRjxiZperisC8vlYLaWlsTHK
         6QDgTPettQI0uoV6tXqsWRF0l2wwB8s6pfk2u2/SqhHF9i4jYnd5rcK4V6Vn3Wfv3y06
         LqNVez60kQ2zBLL8/68vYt9LQW3QdsfbKHzQlbxJ9Unr+FeUWyL4MM5rv+0aiEPAbKQX
         JEJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782627803; x=1783232603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
        b=EPNoA4iQlIzz9NigehdKIO7AMaJMUw0QzNlWS1vlbWdOdFHpW7M2PSJzvBNlZMYCZ8
         BWukGH8w5kvrwt+DZwyMdnHLJkkmFQaPIfpVntipk8PHVsN51Gqb/KhBHzuznggYyS1w
         zAcBmcfyLPtQN99HcTfOTse/4Xe434Y+QyaLDGqMBRLb0nuiq7Ps/UnErKc4+auyBj6x
         hb+WZsIVuc2ujVZc4fASPRLdig/MCxW6S+AURcfiYien3/iIQ2wICPb7fo3HekdNCoVd
         eFBZ7rn0pl5ZOUhcYRVNzKOGy4McSm5KpmmWSDCVWTRZ7/xv+jqekHj8Jy/0KlaTm89u
         Mvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782627803; x=1783232603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTzRYgBgZOamBxw1WiYenNhfQ94/nUWzB9wfTPJ1rsQ=;
        b=p6BzOoGjGvSn7zyXy3ICzcLZvSLL9uUwhE7G9BLNsp9GgqXtQGFYEwN1teny57qx9z
         XvZ08vj1uLyn7R8pMvbKAktgH0CC46kb385nDr2K4E2eDDKM2gFE6aKnerHDybnTE37n
         OS4Ko9fIx3oZ6yH+3Z3jcngoJib59m5b5HccBrs3YsJJA4gXLWGN+IdbrKsN1r8fMGi3
         mORemqua9sjAVi/b1PYn6if+u2tDQXL/1C9rUqHLLUvzPCXlNXufQojg8hjoFxJ0uSvB
         7oTjBciiUHEAOMtqLNCTgNN4/yC3/EG39+nPJD3rZBmzqsnW2T++BK1/TM9e6BYbRIhj
         zmEw==
X-Gm-Message-State: AOJu0YzlJZIUbKtXrOlrSR2J3koCASsJgVSyn8XpybZc8/Agj3JQteiI
	wHps9lkXDpy57oOiZLmhd/LNcsj3xeZ3flawWEAyr/gUbhJbvnggae6jzTA//F1P+GfFIPpUeDV
	lCXlsgtB4zR/VeSuDsOoFQJLeQ8xz9MQ=
X-Gm-Gg: AfdE7ckc6aXYHSboY4D1bTtoaoPftE8j9uMMDy7oxMNHzPF+EZMX2dk6w7Hc/LPOG5z
	OiTEp4kJbBAobp93xy3azMjlgrTx9d3RJkq46iin+35EyRNXCCXxHZJUs4y8/2D5qSZqWG2Wa1+
	vzaZmtGOFUKazPS+0iFFf+qqLCYqu7azWDwEYLoWUgd67s0W8/h+XHluylQQ0GSWG92iCS/kyxw
	fGxPDmELfapUrnnOrpP3EPbdguofsPcJs+WFx7t4IjR9xxj3WJJ9Q/QSfutROJ8AYetwwcDUHm6
	NMjnlj8=
X-Received: by 2002:a17:907:7b99:b0:c12:1d42:6cd1 with SMTP id
 a640c23a62f3a-c121d426fc1mr437953166b.9.1782627802896; Sat, 27 Jun 2026
 23:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com> <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
In-Reply-To: <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 28 Jun 2026 11:53:09 +0530
X-Gm-Features: AVVi8CdvfZ8_HcAxzQ6YMXiRMTaitnhhJ0mCfb8fG-r-MuhUVjsbTL_143EGKF0
Message-ID: <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
out how to make it properly work with my patch because of the
following reasons:

1. I don't want to move it to the top because, from my pov, there must
have been some reason for placing that quirk where it is now. so i
don't want to mess with it.

2. Regarding my idea of adding a condition =E2=80=94 so that it doesn't cha=
nge
the behavior when the quirk isn't set =E2=80=94 if the full configuration s=
et
exceeds 255 bytes, we would have to issue a 2nd request. In this case
the existing behavior would be more justified.

So, I'm a bit confused about how to implement this properly. Adding
yet another condition to fix the second case doesn't feel right to me.
It would look unnecessarily complicated. I would appreciate a bit of
help and advice.

Thanks,
Nikhil Solanke
