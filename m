Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625735;
	b=matpL+G3fn3UIDG8AMobFqNf78ehZy05YFHsLC4UgXZNbwr3/1bC+si6wup03dm7bKcG
	 +x1GCy56wKT01N+dM4jpEfuk6RNJXKE/94eleedIYESoQai/HcOWgAQwbvvgei4O7m6/c
	 7hDyuw/VCFVLdXj3krdp2uYLveJ2/47ZNN6UGnErDc46ESYw9RYpwfQO+R6zxckBAbKEO
	 hBhN+Ps1b2nanr4buuu7HL7EKtZVvmZpY9z/5brkI1bKlJXQi/51rBWfCL6yj31DyYuMt
	 kmn1sgTP8o5cuyq+4YkaVy1SwS+MpULMbhyWITGbOhTMv75i3VnCqL8qam9tpeu9UVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
	b=iGkuT5xj21n+cboNOzuDETEsA4NeIBHvWzuhsYm9+YlZHmqNmerNcXNre0gkKjStIil3
	 BQLiicto25pQlXk50l/oFch4seiC/dfSlM0YLZr/B4++tVPVjruTDiZ0d6zmVoXaREwu5
	 ba8JP0jbsN7Zs4Ou6zRqWgGScCWhAC1Bbl6UtVocSB5JhpBVwXeaBp1PWqhvpDKk4knU+
	 2x9k5iJ+O+vOkqLm1At5IGPJrT7Y6zg/vQmHqLM0gEUI27qh6h8IAr1PgK8ntFdGwGRGS
	 1SKH/0WSkMRtgmUNzDiwx3lgh2y2+VxD4ecbyBNqP71zQ4ozgJ3yxgj8LvGzxpd8rgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VXKT5bST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CC606A32F
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174CC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VXKT5bST
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso519297166b.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 05:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625733; cv=none;
        d=google.com; s=arc-20260327;
        b=Fy+KFV+piIDXxYO8GJHwCvluxA6UmcwolKd7nfQTia9/9ax/lHfolfWbJ6QPtoK1zo
         HnUDO3Rwt+pxw9dLSH3lQuB/9KBdh0elrK63o6XpLuQyujdRSg6ul2L55xmE26EbWdG5
         4pAKQuUYSI5WUva8BNtuKu+/pazEAksU6gUz4oVyz7YbMYQJcEwhwL66973yZ0CFXEe/
         C97Ks5w3PAiWaJyEjTblH/3tN+vWmneXuFOSNvXvGdHU4IHrb4ikx9blSsZqaJnyCF2Y
         bbQoEYGPd2iMlLPHAQMTi9jGT/r0hEMpaMl2trISz8E2fpgTvogACavit/DVWOf2MwLr
         V+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=GhzRol5LrIsGELk7WCHTypyD3Y8rzf8IKNJeFJIuCDUda4sozOLDJ4HM3dylZxIwTx
         CpLrmyAlLY0zTJtZ/fGv558lTaN1FRQYKoPJrtxLTrPLQEAqO0FlMAg0+e2OYNcJVhRc
         WOEgzdaRSh6rCg6gLDDnHfNVRT9ZqTCFkJ3NDQpRhz9IJtM64qpT77umUm0wzRBmYeal
         azK+TTrzJ67fhFQlgY+mQdRdwkOjO+GsSSK3S5KPzYS6cQZ88rWQkFoyY/o3TB4YErjU
         Ie8+1PoMpPGVDHxPog0sArOh+718WAcEEHOXH1Mfx2E/tER/wks8aCO3huBpdGK9OHLI
         L1nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793625733; x=1794230533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
        b=VXKT5bST/E9OpmbvL9/+RqgEn+OMDY2kLbLLLrBouV6ffiuNoeYSrHNYNaKYH5JCIF
         aI7SPfnUZpzvLZoZfKFsdUmKEJeYUI5sE/OwqeligXJpcNuKTfSKmYCxtp8fxnMquSye
         JWQvWDSJfFMCsyfXpnd9mDPFaQIo0mOA/H8s17QcA+yb2tFr4LAvFY2zrvoJ1DZG3SBp
         uSPq8YUTrSUcW8StMXJmzK8vdA+Ag7nDEIuK13gK7uKG0ReK8RPeaxQvpSaDgWbo7h8+
         JF4uaaYa5CsN2v205OZfgo0LsL12CWgaLLDXgeLUMDMAK8f92oYk1nQReq7N2NJEYldF
         NX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625733; x=1794230533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzSgnhqleAog67Yb0q0Y1c/eDIvyxmt+o8COHhZeRGE=;
        b=A2ZUJSvi0wI0OFSxQZ5ecenNN+ooHt1Jf3IYQjoBPPOc4jmhPWc1f4FvErPs21fnwY
         kGtGRCBLkLqMyO/NHYRLCCbU8XKlyGalEQHJeUZ3ApF3YVSz9xWarunqt4dqpuEov7rq
         bw5srjGdeOAyiLpz6XRAiPLN7sHIBJJ346NHKUzyyoDn1r03MaVT5akO+yKjDwHda3LG
         /5jsYUyjbr/pxYJmBz7cbqT403tOYRwRl9gOneeuOF/ijctR8HVf/8oL+ImB7w1iLX06
         YxFXFFE8Tr6v6+8dmsGF/H/O+xZot3D8fZQnnORZIZzShuWBRO866w7yx3t2HJq1W2Ko
         CUyA==
X-Gm-Message-State: APuU4Z+TuQoHDTeYl1nNtNp2oeQ8XHwHnrzRbbXu3IDQmpM0jVzbfneK
	yU3ZXNAmMuXYnQsVahaoZWbqwJ8dPDTBdhwZ6g2LtPCOqVLBqOjjg+OHWZLbO1/I5IBzMOw6GyB
	Idmnt+/sWlTF/0jeNK5HX0vHjOPtUj2GTx9grX7JRPw==
X-Gm-Gg: AYBFou0tKEhPu7GPgTtxxZjUVneCxkpz1p3JgxDiBIQYNkX/tETIMNPoIr4A0TGZs5x
	h2wShBDw4aLXPyX0CafjgJ4w/1jyhp2vf4rE6SESFbuhTHchxmvRMWpWUCZGwnM+GZT3NFI0zcw
	YKqhvtS5uUEH52Wn5yrIcCoLlPAkcX1/QqYZjna0i3A9qzwmkWqzIUCvCL3wg6appP5NnzN2XGs
	Whr3hOaEVELJ9xyOqsWkk7ScypOcqURGdZIMkMctWDW1GMPS6LqoDNFMoxIkVq1w8GMK4413WEF
	g+ZFeqPh+dJ2oOs9Wd3RuRUMyggT61bGfYPX9wr4/xiWn+FNmAgbINNLD3V1r9qL5peTfQdBmxy
	0q65AomRmJbiJYseVatnuUPh1JybxVPuKUv9XzE5nb2g22YbMfP+9B9H7SkeLEURtyz0iMQ==
X-Received: by 2002:a17:907:1b29:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c4ca7ab18d6mr821555366b.38.1793625733404; Mon, 02 Nov 2026
 05:22:13 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net> <sashiko-outbox-193478@kernel.org>
In-Reply-To: <sashiko-outbox-193478@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 17:21:57 +0400
X-Gm-Features: AclHuK-lcmki2jLa3eVCETCCdd8_r5dRb0CE_o5lxTpfWFSk-b6dl3cOH_O5FPM
Message-ID: <CAKTNdwFvL9+GT1xBG8LNFpHYYn5Un4HSLCfCzx3DKgvBNPfO+w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: typec: fusb302: incomplete RX FIFO drain in fusb302_pd_read=
_message()
> --
>
> commit 2a38943c4db3b547e9d3ad8f9cba90c33a8b3dfa
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended
>
> This commit drops Get_Source_Cap_Extended messages read from the FUSB302 =
RX
> FIFO in fusb302_pd_read_message() because the hardware mistakes them for
> GoodCRC messages and queues them in the FIFO without sending a GoodCRC or
> raising an interrupt.
>
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/=
fusb302.c
> > index 3319f6a2b0c9b..96dc48250d6a6 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1463,6 +1463,19 @@ static int fusb302_pd_read_message(struct fusb30=
2_chip *chip,
> >       fusb302_log(chip, "PD message header: %x", msg->header);
> >       fusb302_log(chip, "PD message len: %d", len);
> >
> > +     /*
> > +      * The chip only decodes the low four bits of the message type, s=
o it
> > +      * mistakes Get_Source_Cap_Extended (17) for a GoodCRC (1): it ne=
ither
> > +      * acknowledges it nor raises GCRCSENT, yet still queues it in th=
e RX
> > +      * FIFO. Without a GoodCRC the partner never considers it deliver=
ed and
> > +      * will retry and then soft reset, so it must not be answered.
> > +      */
> > +     if ((!len) &&
> > +         (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GET_SOURCE_CAP=
_EXT)) {
> > +             fusb302_log(chip, "dropping unacknowledged PD message");
> > +             return ret;
> > +     }
>
> [Severity: High]
> When fusb302_pd_read_message() drops a PD_CTRL_GET_SOURCE_CAP_EXT message=
 and
> returns early here, doesn't that leave any retried copies and the actual
> interrupt-triggering PD message unread in FUSB_REG_FIFOS?
>
> Because the FUSB302 does not raise an interrupt when it queues
> PD_CTRL_GET_SOURCE_CAP_EXT, the partner will retry it (queueing up to 3 c=
opies
> in FUSB_REG_FIFOS in PD 3.0) before sending a follow-up message such as
> Soft_Reset that finally raises FUSB_REG_INTERRUPTB_GCRCSENT (or a GoodCRC=
 for
> a local transmission that raises FUSB_REG_INTERRUPTA_TX_SUCCESS).
>
> In drivers/usb/typec/tcpm/fusb302.c, fusb302_irq_work() clears the interr=
upt
> status registers on read and only calls fusb302_pd_read_message() once fo=
r
> that event:
>
>         if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
>                 fusb302_log(chip, "IRQ: PD tx success");
>                 ret =3D fusb302_pd_read_message(chip, &pd_msg);
>                 ...
>         }
>         ...
>         if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
>                 fusb302_log(chip, "IRQ: PD sent good CRC");
>                 ret =3D fusb302_pd_read_message(chip, &pd_msg);
>                 ...
>         }
>
> If fusb302_pd_read_message() returns after popping only the first
> PD_CTRL_GET_SOURCE_CAP_EXT frame, the remaining retries and the message t=
hat
> actually triggered GCRCSENT or TX_SUCCESS stay behind in the RX FIFO and =
are
> not delivered to TCPM on this interrupt.
>
> Should fusb302_pd_read_message() loop back to read the next message from
> FUSB_REG_FIFOS whenever it drops an unacknowledged PD_CTRL_GET_SOURCE_CAP=
_EXT
> message?

Addressed separately in [1]

[1] https://lore.kernel.org/linux-usb/20261102-fusb302-drain-rxfifo-v1-1-bd=
9b232ab345@flipper.net/
