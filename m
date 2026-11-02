Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625136;
	b=yRLFM7gK2qtSEAQ+CIg0o6AjgLTmM7kwJR1OwWlbHYlxcd68abSc806bTjcyHDUOFmgg
	 5AcaL/FlRy5+QNaNDkCVHFRWbzoTuZBXxCGRuWT/+rBrzcpwCqELryUZiioIVbZOtCsjV
	 qeromOzaD47XGoPUE7ZZRwjq23Uy9hWPdZ9MLJ/fK1Y0an9pbzz1TXPsu93BgFnqsV4bk
	 4yX58INvBuj9ReQsYFIAxMD95lz2IgwBVx7wipA4to8xuA5JwF9VBmyE70XvdLVwphNeE
	 I/IiCJplaiC1Ujra0LfP0/rb2EabPaB9xVhI2jT4LeDaDnxtCXuOIbmsv7XfmsD4Hrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
	b=vFHfi/U4oh1kvIsjf69eVpBufORA8vRZ/YnwqEXB4EtnW5ikr0f9gi7ze73R5E58FRUU
	 nhOIpgFj5Sx77cyGmQDa7m+HpxQ3sd7lYeWclAWjV/i/EjKVUmO73TdPxlalX16q7l47E
	 bd9AsMZBWmSi4u1lBNl6sffOw1/y11Fc8N7xOk+VRC63F+Zb22TnBm1DuRTbG9D6azJLt
	 WaDQFqfqHNjqIcd0NqTYvSnLE4ZkM+mCuPxRIM0PSwvITdZrheIHlgmq/krRZkyyTULTb
	 5g+jDcLbJd/1QI/WfabbIgRsjRepriRP7h0EBcCW4L5gMf6SxGbs9QpMEV0CbL4CkJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rQzJ9g5c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7A606A329
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C7A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rQzJ9g5c
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so4142516a12.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 05:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625134; cv=none;
        d=google.com; s=arc-20260327;
        b=dwGJsAJypnIVNKqda2RhcOWd+WXjbTIbOOxJePNHg6AQS+o69k9mlV+ououanQML1+
         1CFNITRdOriRSe7t71FWEUY2W7w4+C6P/GH6w51uHjSW/ncW3uPfmdC5EUNULDbY77mL
         4AvRvJVE+eEfbo5qaTMgXNECDMGu1xKn0myYBWiA8RhDYyQx6yVjpTCAgNDLq0et3+96
         khHQkxzedOboUHdwYjvAhP8co2YHsxj9djJUHpXiXe0bXmCTKblP9C2H/nuDTm4yaTId
         d3OuCi63qId6BzDCcDX78C60LtgxZkQDminvn39pDzvQjM+JuTWcey2ZnoPZKnNRl45U
         wBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        fh=VuLhXw3JncJXxR3qDc950o0y1R82tCexOoAH58o69Vg=;
        b=e6y7StMo2CPU0PIovLSHH2zWtjN0WJ05L5MJG6oYXqF6I3qNlubA9pXR0qIF2gG8XC
         22Gv0qQi0EsDz7200xuO8vciabS2uPrUj6jLE/MWjiQOo0siftw/YWswSh8Xd+e/PORt
         vpS9B3K/yTGYR7zkfDCumuLr8PGAH6eknCu3rxMKUWiKaO2rhZG8qQytP0K6FiohuK3q
         mTI4o8tQEbD6mLox8i2f5iqvCmQbm67yEyhuTyaXaQaAKJupz28RSRolK8kHLtfimVJz
         n/jPc0sCKgNJPIi6zDpI0fI2HmDhDeHU9dnvJ8f68COyk7q2fLh1kbvl+qx0P6BLQmlJ
         I1cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793625134; x=1794229934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        b=rQzJ9g5cgBdpF+KQPJnjKlGwYc/+33GKdSr+8mxsKAVIBmCacr2B1Z2FRjHYAD2q5I
         snSe0dGxq1y8zkQ9z4XS2IwbINAVwnWLJqpzpShs48VdjIAyXs5kh8QkGrBsAeA/GNGs
         WEJDe2BUgid4fYP4N9llZO6lTXPtfM6DZ3Xacjf2ANm5O5bME/gcrYih8bI8Fyh0VP16
         9OSq4p4KkgnQkSJXF033LUtKSGjaiUHiNWKm8NmfnaiWYW+qpFkM59qRbqqr6ec34nUt
         irpCD5/BOa9L7Muvqn8fesaRDeTMe/EkvhciDZ8NQzOOf7YbG4mCC+xr5W0yxOBj/jut
         z2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625134; x=1794229934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        b=umBEapNDGde/53+/WeHfvMYarFgWtG171QncpqF455/uH/szP8Aor27WEO8DoSb6zm
         e2at/n6twh62PUquA/XkQC+WXqpzeakYONYL4JKcV3a+jhKOFOoymwT7nPKRAlOplZSV
         fRR7clEXeLLdJVH9ML11NXWa7T27R5o2ylSVxxCd1byJGWH3X71F2hBNt7eswWzt5+BN
         kfxKBurd1zGrxPpF1LRabmS30XxyNKC/Mz18oVsaJz3si0VsETmGjpAIRxi0VjYt6aKW
         auC2kaYyzF23/DhB1rMm7XF9wlIxdamonjcnpn/c4TEKZVl0aAUx+gSG+doNTnmVvCsB
         Tvpw==
X-Gm-Message-State: APuU4Z92Cb0ELnhZWcCyxJnF4LwL8EOv/+RNuU15BQQl8OG6v0WDUcFC
	Scd+Ns7hjBqeNHQ5MgYqkVrS0W7t7UUtDWfkfnZyI3g9RUGwi8I3efj02mwCaFJbg3LkS1JwNxv
	azvtWSZYwu7XPde9g64sclkT6qXgKvu2rSlhMGhHoLA==
X-Gm-Gg: AYBFou0sASU3qUdVYZAAzPg09K0QEpLOcl961toLTwlll5fC77SU/zJxPf9R/hs188p
	LLOEZpXmhezdwSJ4RhlLFNnZFdLWnN4RSNQLE5HvTu+Eb0weCSdU2j9THih0KuKOI0TfnUDO0uL
	rT6HaTxpDlfH3RxKD4hF5BslIjTpnzYIBISLN5vCJ464Ey6htOVBEFWDuGIBfgO0H85ofQz43xQ
	Sx08TJSAEstJViN6b4ck4GlC09elUOt5uie6n4YAP5LCJukneTqOuDuAsi1bWspT+CSjygVH9Qi
	roxusvUW39fLOdDX/0uG5/J/EPVBVdbmXWaQ44QxRiT/QHi/nivEGFLZJd5LGQRrf5h/aKLrGoC
	EAeosG0CtbfdXeSO+GMsKWDW27D1idb09p5mIqP8Env196OoPnG25z29oAei4+YDtWp/Gxg==
X-Received: by 2002:a17:907:7f90:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c4ca7b5f596mr875339166b.38.1793625133753; Mon, 02 Nov 2026
 05:12:13 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net> <sashiko-outbox-193448@kernel.org>
In-Reply-To: <sashiko-outbox-193448@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 17:11:57 +0400
X-Gm-Features: AclHuK-n43QHaHcrbhfL_HnD3KJAXwokmTYqhfKuY4KazsGHX7cmxbgGZawV8B4
Message-ID: <CAKTNdwGSxPyuadpQPY5oDRHwC_HTX7BujSCM-bRiKgjnyicDvQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
To: sashiko-reviews@lists.linux.dev, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: typec: fusb302: unacknowledged messages passed to tcpm_pd_r=
eceive()
> --
>
> commit c6b027a56fce877cc0a50df66b78e46a0dbd88cb
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
>
> This commit adds fusb302_pd_read_messages() to drain all messages from th=
e
> 80-byte RX FIFO on each TX_SUCCESS or GCRCSENT interrupt until
> FUSB_REG_STATUS1_RX_EMPTY is set. This prevents the driver from falling o=
ne
> message behind when the hardware queues unacknowledged messages without
> raising an interrupt or when multiple messages arrive in quick succession=
.
>
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/=
fusb302.c
> > index 3319f6a2b0c9b..6841db172e117 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1481,6 +1481,36 @@ static int fusb302_pd_read_message(struct fusb30=
2_chip *chip,
> >       return ret;
> >  }
> >
> > +/* The 80-byte RX FIFO holds at most 11 messages without data objects =
*/
> > +#define FUSB302_RX_FIFO_MAX_MSGS     11
> > +
> > +static int fusb302_pd_read_messages(struct fusb302_chip *chip)
> > +{
> > +     struct pd_message pd_msg;
> > +     u8 status1;
> > +     int ret;
> > +     int i;
> > +
> > +     /*
> > +      * Drain the whole RX FIFO rather than one message per interrupt:
> > +      * messages the chip does not acknowledge raise no interrupt, and
> > +      * reading one message per event would then leave every later rea=
d
> > +      * returning the message queued before the one that raised it.
> > +      */
> > +     for (i =3D 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
> > +             ret =3D fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1=
);
> > +             if (ret < 0)
> > +                     return ret;
> > +             if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
> > +                     return 0;
> > +             ret =3D fusb302_pd_read_message(chip, &pd_msg);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
>
> [Severity: High]
> When a PD 3.0 partner sends PD_CTRL_GET_SOURCE_CAP_EXT (type 17, 0x11, wi=
th
> len =3D=3D 0), the FUSB302 hardware decodes only the low four bits of the=
 message
> type (0x11 & 0xf =3D=3D PD_CTRL_GOOD_CRC) and places the message and its =
retries
> into the RX FIFO without sending a GoodCRC on the CC line or raising an
> interrupt.
>
> After those retries time out, the partner sends PD_CTRL_SOFT_RESET, which=
 the
> FUSB302 acknowledges with GoodCRC, raising FUSB_REG_INTERRUPTB_GCRCSENT. =
When
> fusb302_irq_work() -> fusb302_pd_read_messages() drains the RX FIFO, it c=
alls
> fusb302_pd_read_message() for the unacknowledged PD_CTRL_GET_SOURCE_CAP_E=
XT
> queued ahead of PD_CTRL_SOFT_RESET:
>
> drivers/usb/typec/tcpm/fusb302.c:fusb302_pd_read_message() {
>     ...
>         if ((!len) && (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GOOD=
_CRC))
>                 tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCES=
S);
>         else
>                 tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
>     ...
> }
>
> Because pd_header_type_le(msg->header) checks all five bits,
> fusb302_pd_read_message() forwards the unacknowledged
> PD_CTRL_GET_SOURCE_CAP_EXT to tcpm_pd_receive().
>
> In tcpm_pd_rx_handler() -> tcpm_pd_ctrl_request() -> tcpm_pd_handle_msg()=
 ->
> tcpm_queue_message(), TCPM updates port->rx_msgid and sets
> port->queued_message =3D PD_MSG_CTRL_NOT_SUPP:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
>     ...
>         case PD_CTRL_GET_SOURCE_CAP_EXT:
>         case PD_CTRL_GET_STATUS:
>         case PD_CTRL_FR_SWAP:
>         case PD_CTRL_GET_PPS_STATUS:
>         case PD_CTRL_GET_COUNTRY_CODES:
>                 /* Currently not supported */
>                 tcpm_pd_handle_msg(port,
>                                    port->negotiated_rev < PD_REV30 ?
>                                    PD_MSG_CTRL_REJECT :
>                                    PD_MSG_CTRL_NOT_SUPP,
>                                    NONE_AMS);
>                 break;
>     ...
> }
>
> When the subsequent PD_CTRL_SOFT_RESET is processed, tcpm_pd_ctrl_request=
()
> calls tcpm_set_state(port, SOFT_RESET, 0) without clearing
> port->queued_message. Then, in tcpm_state_machine_work(), TCPM sends the
> queued PD_MSG_CTRL_NOT_SUPP before run_state_machine() runs the SOFT_RESE=
T
> state to send PD_CTRL_ACCEPT:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_state_machine_work() {
>     ...
>         if (port->queued_message && tcpm_send_queued_message(port))
>                 goto done;
>     ...
> }
>
> Doesn't forwarding unacknowledged control messages (where !len and the lo=
w
> four bits of the type equal PD_CTRL_GOOD_CRC, but the full type is not
> PD_CTRL_GOOD_CRC) to tcpm_pd_receive() cause TCPM to transmit a spurious
> PD_CTRL_NOT_SUPP on the wire while the partner is waiting for PD_CTRL_ACC=
EPT
> in response to its Soft_Reset?

That is exactly the case, and I have just sent a patch [1] dropping
Get_Source_Cap_Extended from the queue separately, as they are only
tangentially related and can be applied in any order, and the current
broken behavior remains broken until both patches are applied.

[1] https://lore.kernel.org/all/20261102-fusb302-getsourcecap-v1-1-26b5bfea=
4b2b@flipper.net/

Best regards,
Alexey
