Received: from mail-qv2-f1.google.com (mail-qv2-f1.google.com [74.125.230.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D0D3FF8B6
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550676; cv=pass; b=NzOJ0FrQIl3Ch1qySTQ5LZEN4fKlEbnTvWc1R0skDyGqU8dudwpIP+Uy4Yxd8R/ehh4QMiPiICQSOiIPVgtUihI3VqNVJeXMcEgpRx5erqhxttU5GqxyL8zntwfJNQwtZGCo4bAPfk23s0CO3wlEOcwb/brxIO/WR2vX10AiQ3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550676; c=relaxed/simple;
	bh=LLNhkfWdeUPVzDAF5zUPQg/J3NffcXVnybN7CMTspwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmS0+kQeKRlOZf13yMutsaW9UFTTLEl6IlhKH7shpVP5zTOPLCJstqW/Pqu/XuAor+U6DXnM1L5bqCS4o4CQEyMuBvTegPeanwKjsd6pW7g/4l38SpOWumLhkoI9lbEy2x61b82qMvGnmY+QlVCjRef2PwKI92vIGKRShmKwonM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVKTyyLA; arc=pass smtp.client-ip=74.125.230.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVKTyyLA"
Received: by mail-qv2-f1.google.com with SMTP id 6a1803df08f44-8eeebcdbfa1so3518546d6.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 15:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783550674; cv=none;
        d=google.com; s=arc-20260327;
        b=nvuDQRPb2OpgbjbQ4v5r5Bdwc9VoaQ7juLzGLp25tEdMGE/dLfHwpduiWoswj0rfBF
         pQf708xj/LpX5jDi00fMo2931HxKsL6RNOpCav2Qu2v9ltb1cgWF7s2KI4+Aw8LJYVdK
         Ih5v4Q9Xk2127bVgzzsUIPFxPm38xgNFRTannJVXuJCOrzqa1I6HEfdVArzok2MXaJhE
         DkDGTRWp0tEpcfp+7EmfDKzQShdQiC4ikemVEHeRm+o8Cuc7OHNRC2eFRXiTsNWqM8ZT
         RBj7ITD1y5u4QRDRI9eaGJTEKyx83vIujHzWh9JxVOY/Dm8VY/e3lh0NTnV5WDNOkj2s
         8HoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLPKDOeCD+1o9/Dzr4Ln1MhIdulj5ZDzLX8a0QaxQYQ=;
        fh=8RsDrP5dUa6pF3IO+OaLtxg9DlmLs0QVWXd27khFB0A=;
        b=h/OhNwgoiH4EYSDrsb8deQOYRBvSa+0ghO8VQGD1BSzKO7rLlFYcSmdoZougNThM0d
         daA76aLNYQvA8fJc3oig9s4csqtXc95rbhgfAw33xW2ehfBmxkL4uyqn8fWisfZuAfGj
         oEbf+w6E7QJVyTN9xni/KECzBLkWrGjLQt/LR+Fyz+FVjS4Bb1VRjXtkpXcoB1tY8gNj
         31jbkPFvPmMsg1qr6gj35KfDd65wShAJJUGvIitKfe67G4/LDjPeoDjTKCwK8AZ1raWR
         gUpXyOMq5im1ykJTy/i9MDoJAvQwYX/Pjjl/yxfegkezowr5BHf1YwS/ZPb0sl0WQIoh
         6xHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783550674; x=1784155474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLPKDOeCD+1o9/Dzr4Ln1MhIdulj5ZDzLX8a0QaxQYQ=;
        b=UVKTyyLAf5TiBvUWbqBDF3eV6RI96UTyaqH6aVQ7kFB30qB+G10rL+5LwNv8Dg11Ox
         ohBwxVj1bZkVucfZwyle0A4ydDciJ9V4DxXFe7TqczNnQpWX1VKwwsuKEyMJnpiNMYWp
         EUxd6932wiN3EqpvqnXd0i6o4W1XXHuIqxn7VpLSZzUoUaVfkMW9R8V0w90quCeK3XP6
         OZfWlGu//mcBguDPyxbUjro7l3ecB4dJOnjhW4Veg8RQGIZoDBKJVCA18N9xkLlE9S8D
         XWuyQ48uJ0vdKLacVyNoQ4vgo1HSQBWSFKZHBG6a8D6CLsEi2qqh4gTA5wumM0Xjdt2/
         J4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783550674; x=1784155474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLPKDOeCD+1o9/Dzr4Ln1MhIdulj5ZDzLX8a0QaxQYQ=;
        b=WK6CoUOsfz73eupsirhElB+/GalKh1NVZ9MU7gGm+AJZNBtz7yMy6hCqAWkEM7kzdh
         JLNmlcVrI0WHdp3UJ80O5UPrdv7g1WFbPOKBMqRPbSL5iZ+mjemAXQtXWLV+V0nRaKhU
         Ek5yoP1X88tZ6sYezi1ZdOLLd0kUFkcaztObWNAIGsFdFgQjtcFS9zrvcy8LYLE0Nfzf
         RBH8WrseqH8rwkuxYXNsYwd7VwExJJDLhKl8JSzF/Po7wPBsVWhw+U3xEFzpMlC9B4uA
         N8qqSSvQbw9rb/3Vd7k832S94uFV+gP/RlBX9dqGoaxQV8aFbK/btI5qMugGohm37G4I
         663Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXrkVFGu1YtjPQR176YVx+KeYDqQAK6QN1nscX1YCTfkz4CCoUB56LKWAPliHDQq5MkKwpJ91Qso4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmeE8geCJvQ4Ds2hysMqLHK5XhoNDkbHrjSb6SVK/m9xrsNn0p
	nzTPgVksNaTMxME3EIj0MmmMXQRFfLKhQBW2v5flJbz+GTvRji6oRSq0m8Z0VTfiIJ/1+qjiFf5
	LLaP/EjQWNmPI2p8yCP+hpXbKwkiC+NE=
X-Gm-Gg: AfdE7cmvnrxO7645CAMtnZw7Z8u0z6es1mmGh/C7l78ZcCH/FI9667lfyklZfJDU0wR
	j1wpwfQbBIBDDV7WrF0Nj7heOaaKpTZztuXZHVe/8kNDhjggZuVHB/bwsUmEiHESjrH5vZM6BHx
	V+M0garq3XE71QmomomIIbr0ApNBtDNa6vANEZ83Iepl7BzhxGqykFDiUYi4NMdKNV9aYYjS8yw
	hPA6+RxuK92kq1eQNqkFOLpM91X1CdLC8lw3kNIKR4YITtfEtFmB+ZvMTTXVVQrBuLOCJ5lZ5rm
	/T4mkE/53mGAwj8soWf3WMtDKG2uQwWZuZhkw90KNynaKfDqAqFkeDu7rw==
X-Received: by 2002:ad4:5ca6:0:b0:8ef:a4d5:1523 with SMTP id
 6a1803df08f44-8fec2d4614cmr50151326d6.42.1783550674017; Wed, 08 Jul 2026
 15:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705083724.24494-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260705083724.24494-1-pengpeng@iscas.ac.cn>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 8 Jul 2026 15:44:23 -0700
X-Gm-Features: AUfX_mxJL2tTqyB3fiMZ9o8Nt9yyvNlGf1QmdljUFtCVK4O4T07jrTSLQnm3nZU
Message-ID: <CADkSEUigsJmMgMPGFX1TdhgC0+NVEyR2ijK8rk0yTz-UGHFmSQ@mail.gmail.com>
Subject: Re: [PATCH] net: usb: sr9700: validate receive packet extent
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Simon Horman <horms@kernel.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 1:37=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:
>
> sr9700_rx_fixup() copies len bytes from skb->data + SR_RX_OVERHEAD when
> a URB contains multiple packets. The old check compared len against
> skb->len, but the source pointer has already skipped SR_RX_OVERHEAD
> bytes.
>
> Validate len against the remaining bytes after SR_RX_OVERHEAD before the
> copy and cursor advance.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
> --- a/drivers/net/usb/sr9700.c
> +++ b/drivers/net/usb/sr9700.c
> @@ -355,7 +355,8 @@
>                 /* ignore the CRC length */
>                 len =3D (skb->data[1] | (skb->data[2] << 8)) - 4;
>
> -               if (len > ETH_FRAME_LEN || len > skb->len || len < 0)
> +               if (len > ETH_FRAME_LEN || len < 0 ||
> +                   len > skb->len - SR_RX_OVERHEAD)
>                         return 0;
>
>                 /* the last packet of current skb */
>

Hi, Pengpeng,

Other than the subject needing to be clarified, as Andrew mentioned,
the patch looks good to me. Thank you for noticing this issue.

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Tested-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Ethan
