Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991A2DC76A
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228869; cv=pass; b=YyipLysNyTFXzOisiq6SMocaHucA4/p+wrRGkknLs4sTVxujHrNIgIvhDxh0UH3K2X/R/sEErB9CCXz6iuNjKQY2Yg5ZxruQF/nleVXh6S+EBnJ2eSL2vj8//2esUYN4bvZcEZ5oucmXaCYjv76Aw7H6XQdnNg5rH7BNMtRFPBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228869; c=relaxed/simple;
	bh=vn+BJ+6KQsghLuQRd4JVQkNCZ0/DG4PlW6rElpvS1l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ru2WvEZwI2xX4FpsoAj0+9XMU2ikOPtJF0E3KkhKrV3nhZ3HCOUdHOFhYhjbz+w9ixSPpWpWtX60QPwr3YcTT1Ohbe4OE+PvbnmW8/W5D5SXZEzxkzW8bMjYLEZ61MiWrob63pHr1gEAZmYLtVhjXG64MxmwJpS9NRRV8Iwdko4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TIR+wPQ6; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TIR+wPQ6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c7cfa17fedso5677295ad.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 08:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782228867; cv=none;
        d=google.com; s=arc-20240605;
        b=fItzYaVchAwuNljjipzWbpPRvGYhjRk5P89fh4qXlfkmXqtFFNpDFzSN8iwIh4Kp65
         W3+G8Cr990XGSDwtKYvIWnyiC1VOBicxXnYr/OuLABOvFLA73Egt+iHK6qS5Si8ij9Wh
         gCnVVPUeA1JczOwLZVieBpMDYXbZjy1mYbbs6M9LJyw0BvOuZzjE2YZnWB/A+54ydmtM
         aAXVAKkWVX3jc+/a3hDgN9myI85PVy9Js/IfSd9gHsQRAsSxuX8kBRLJ3tYlGV/rZCDy
         iizgPhI98flxXwJMP8WHUdmQ+d1cOybYFuePqvkwDAnOKmMtbUJIkJN+OiJxPCpEmQn6
         TnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z7vnlqODZEiIutitnMi0bO00sy1EqsStONkkVHSpA1E=;
        fh=HGR79YBsjllFn4OA+F/NIk6nlpYT7p2ZNiGIhrs5ncI=;
        b=XOVZN2AuxKTXUJZlWyk1tCIZ1m2UVjO24hk8Ph57/+yKzXIuIOfmT3FpMzVchyjYL3
         krhh6A7fxsnsUi89wYGH4rJRbovH2zY0s9qzVMGv1Tl1UGaXh736sS3egZiD473wrX6o
         7HXip47vpDGiPkpVhYGKgciSjQo6gY7dpdZMNJukOVXhBcyS/Y5yLGyCi7xTE8rTCrqt
         DP/n1ZsKGXTIVWisihbl3qmxnHUpwV9qGV7cONJ/fTzFq9RQ1Gwf/uzlex1Whb2PH/SX
         f4gTcU2TCMTuyPZcfEi5QBPD2GhjxBX8EKxJa9g1dwmNKEUSqufN0gwGP9KN9Zr7SkK8
         bfsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782228867; x=1782833667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7vnlqODZEiIutitnMi0bO00sy1EqsStONkkVHSpA1E=;
        b=TIR+wPQ6BFti+HiF5PWqzciJpDHouG4vDxw+Qfs1/QxnPYtdmYv+kJzrKPJ4Jf9ajm
         /B14ct1gW7VS60HNeR2a+bvBV1sXPqTJp53WNfxtbLgwoH1HMCM1wVt9ulQySVdzuzgM
         exDIcCf73kT8bdJrakQwjdByuPDpA4bYkDNM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228867; x=1782833667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7vnlqODZEiIutitnMi0bO00sy1EqsStONkkVHSpA1E=;
        b=W97jWzchEEzdiFaKnfUcVtizW/lHHmgENoocI/wt1H57O7hRSer85JKmN7YmQRDxhH
         aHUO7FhjrDME/M0XfKTaT0SEs7N1OHMt1heRWV8krnJuOmwdmbiNV1AiusmiDsHf4fFU
         u19ontAPebCzrePsAMBADCEIxXbIH1UjUJJImwlK8UeN1QrZknzmWpxfJ61iMed2T56h
         +TsHQoX8Xb0FDfGGhdzSxlw7GKr4b/kwUx/+rJyuXvLCUKXmrF6HUS7lmlWkIpDNYkDB
         +/D1iNEnA+s0hJY8ew4zjmpWqE0eo9r56IpoAmAjuOEkG5iSH5x3eDZE/ecWEJxDok5a
         OzpA==
X-Forwarded-Encrypted: i=1; AHgh+RpBolD1JnCWt//mLAxKrUkpR9k8ePXwjk4tbOPQ/7halWrS6ZKlgPnpDX5lE7sF4RicjBPauvs2E2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAZ77a9pPbE3kk2fqDRcYGt0j57+FkcDMjalrkSBv/+4UU8Wq
	UJ2iyl9cZ90nuZ5Ysr5m6t8ZdkSI0QdxU3dH7vFO7oTlQmSeWGG3vK3GZjdYZDTyvUhF5jUKRg8
	l2n+DirIG8PZXKknk1gGQXY8CQey2L4A6Y7ZvoVmT
X-Gm-Gg: AfdE7ckGJhbfEFYEkbMttPmVMMNx3HU9SedhCupw0RR4bQyGcyDWfwJZPrL/97T2Fw7
	6DWjN3OpuqqSp/qy8JXyGKuPiBNGyl0yrlYMPEig2L4ZGXXSkY/NpBv/ik/flG6DWpgmPsQ5VXZ
	iPmXQKQeI4CuF0YIeVYJEgSBrSQYJUzYrtBd46R9FqRPE1RWY7oRqyoMxNmLs6RnOgpLRUrA4Qq
	l8xoxG05rFNZdlR1w42IwOkLmPO9Q6930icssoYQH3y8WYIm/oxWEmZHk15uFv0eiL5WZWDpfQ4
	vT8uzlGODft5LEzcfgt1TkrHFXo=
X-Received: by 2002:a17:903:40cc:b0:2c0:e7bb:9081 with SMTP id
 d9443c01a7336-2c7c9ae760fmr29354985ad.33.1782228867199; Tue, 23 Jun 2026
 08:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622093910.1210089-1-akuchynski@chromium.org>
 <20260622093910.1210089-2-akuchynski@chromium.org> <ajkMCz52lkq9hz3s@kuha>
 <CAMMMRMf0kLTJeVztQwDsz8Zm4wBXX52agNpvnKttkFqupQX=4w@mail.gmail.com> <ajpEG7ryQi8im7U-@kuha>
In-Reply-To: <ajpEG7ryQi8im7U-@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 23 Jun 2026 17:34:16 +0200
X-Gm-Features: AVVi8CdhWvDvpfI30UWnbFHYL5KHZGNTWGyj6-0FKovu-cl7ytAGt0TcF8BXMp0
Message-ID: <CAMMMRMcAkhbyJ0F+a_C6QSmG5AxB3UpDPZt70sXoit8iQW3XOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: Add helper to check cable altmode support
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 if you are not against it

On Tue, Jun 23, 2026 at 10:30=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> One day and I'm completely confused again :). I opened the code for
> myself (not compiled) to get the idea again. Please consider that, or
> something like it - the important part for me is the enum. The enum
> does not cost that many lines, but it does make the idea more clear,
> at least for me.
>

Thank you for such a detailed look.
The code not only compiles, but it actually works as expected)

>         case IDH_PTYPE_PCABLE:
>                 if (speed =3D=3D CABLE_USB2_ONLY)
>                         return CABLE_NOT_SUPPORTED;
>                 break;

With one change: `return CABLE_SUPPORTED;` instead of `break` here.

So, the enum and the wrapper are in V3.
If you don't mind, I'll add you to the "Co-Developers" list.

Thanks,
Andrei
