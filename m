Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577939AD51
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349491; cv=pass; b=G5bGrpdyFcBD3JdxDktxjFCJp9d4FYNwUhnVhxP6ib6uDl0z3wxzUOZ3xu+vKzS4HySe7Q0Ya0NqM/CXP/KmU5nrM9ZJsF6I8ixGtbkSS2nvJrIvamis8cN8zl8IL1rb82DPp2GJridBuOE9VVMyZl9CIZkB66cse6cyjWtHe2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349491; c=relaxed/simple;
	bh=2+w53266An9QE6Q9iEB9pElHB65/4o+nwCLKLHSP+wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNtKq3getqbczSb9s2WsYDTMMIAVJ40x45bEWS4Fl6Rh6flnkcHnpg8YB0f4xaCeVkeRSLVaJ7NB5iSvszmuoK4VOu/KWyOVd2HNs6JnoE3e3Euv6kHkhMkvza076iAK9BhANdhRXJ+eZBCQD/V/7SjwCtC2ClpOQoBszOa6uyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDo2Lo+G; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDo2Lo+G"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c124c3c876aso423471966b.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 07:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783349489; cv=none;
        d=google.com; s=arc-20260327;
        b=LcRKnRuFczo5SWcibbGN/oZ1Y6FpeEF4Y207UCa3zh3dRkjimKHh3dmq7DarCPyGnd
         Vs3p7Lws7cJywO7htMjF2PuJX/wGe+l5pqo5kPgix5HzhKhqGyZjRKxEaba7rP6PbDYV
         4TZvFaLcVrI+Bwu5EKhhrvkGUgrzjC4ljWqLKnr5IhzBFiCyRGISCbJf8JeayS3G260K
         cQzlXupqfK1j+KL1LZyH3cJs6L9ElHKQhY8baiHOiQkmm/V01B8aF7jSISbARCc7a/Cx
         cxwVHh3y6NW4P19n0rMvotVntWh3IOO38ExWk61n09n4QT0N4ghD79d2laRzDhumF1jf
         ZRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fJt2Pz3HKv4un+OslMuS+onMEYWtjH1njJkdjVg6TX8=;
        fh=m7ZFCiA9Sd3FSIPNNKdFfT/8QGX3Ddxu5Mg4meV0Vxo=;
        b=cvx2Vo5KyZSB7luxvr0WnzT3G9T+IuxZLiGmlYJjLGNEuMLzUi6bS276WtQwSH10X3
         01M5yljDG4ihkaWPZju31MsgZVSUzN4a+QS2bCx16Gx/s2BnxjB2yJ5KbK4jl31D0kK3
         lbvLjLlEINv7CqGJ/cflquyotMEUk2dP/bO+rGvJTFX3YeFP8KuT7kWSXGvrcNf8r898
         fDkgsZ7OPgqNlI1rXhrHeHTJ6Kl5+SQyVUXxjnncLcdRHd4gj1F0oeby/Xejy0dlUXse
         f2MpgOfoZSXCyBBFsxYo1SnTjFcx+qSA4QiwgQlAvfixvV9JtQmlSMPnozfd1hGAT004
         FhoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349489; x=1783954289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJt2Pz3HKv4un+OslMuS+onMEYWtjH1njJkdjVg6TX8=;
        b=PDo2Lo+GZlcLiI3bewlx6GKvT2LBnRkomPH9TdClZDd3teLjHbb505w8Z/tz2beSqI
         dlRvItl7b5lrO9MduIzSXRPET4rHdk+qW1yizSpkr5t2TL2D+aQ1Zt8ZpOXV4x5vXNxh
         OO/njSo+K1NDAMtCC7/1RKk+4jR+gKuoiCok8aoOGn/zj71t55xFfAwC8tphJbQVnev2
         H9tdn7E8JssKFJhLPNGPriviH8a7/m08JsZJuZv0r3Gi0qGQBG3ljhaCq7jjrWh8bBSg
         2n1WscIAKO3MUJiEDAqGV/haE3zmXevl+4ovJHZJadjbk6cFZ41xNe0cJH4zWQrtSOar
         cCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349489; x=1783954289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJt2Pz3HKv4un+OslMuS+onMEYWtjH1njJkdjVg6TX8=;
        b=EULILUgVdA7v2k0LVoXk820E/bO1kLzuXDcdYMJkDJ5Q/2exHvU2ZGgqkT4Bioy3Ga
         CF2Gagw2WrdediWNkoott7tHV9+fKmO18Y7QsJz72KscxW704ycNBR26YSzsoeqUJKhh
         Z3BIslXinQJp4seWu/TZwnB3y4MUeFwAzCIqYxWgFplamnaOdUpF0RtjL8CHdHg7PfL2
         mDkPJnL6po8vK6hRDWKFjcq6TaC6eyCaeli8P7IKX1k7rOop1kSV50IJCyKWvf0utGS/
         wsmrVHe4QCQwg+vTX7rxr9CEZSKQautIaXU14/cTqaIxw+jouAolvoPX+JMJ0FLD6pib
         pdww==
X-Forwarded-Encrypted: i=1; AHgh+RoKWPVELjbtr1X6+bkj1zLvfkd2+5ntOZXWgQV+NMG68U+ctiSX/eW2irN0XvN8VMUAqVnsx/7WN+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9AgVv/BHbF2Wmi5pMdmORR9Y7PSd4Z/FGFFg4eawYfgz+Z9/t
	J9MekICFPKAFRPYhR+rDQsa7LBfeQriBDGN0lULNC4DixT14WPbEVj6651WriOol4dHrptqlAXl
	FpKYpYPAQhVAmw75NlPOE1LXZQihrWw==
X-Gm-Gg: AfdE7cn+WjSdgnFmVONQoQMl8Eey7UeyyRfh/x5aNm+58N4aSYJeGWd6BYg3Enqg1xK
	JA9eFhQeqSQoofVzG7KgjXVnl4MwMKyvEJcVfn3PUVTWJT6Na87yXxwSN2KETzD6C4RocCQJZAE
	8tZx/w9im+0BWC++WOmpWjgrPsgnmmDvVOTJeCe1nBoFnyAoWTUb1Npjix+gUp9uWRv4CWpqPdo
	7QkRi6sRhU8ZC9zTToNGzEUabo/vXoazGX4VjSufmZe1fkEuxCYxfAdQp4e6n0NCa8JcXv1OkpE
	NWTaAZXwtPIPYLUIXNT3w+Ghx9Qzh2KB0UFqv3KpUc4fD1OmkKN3v/yZTtf2s289fzZb39W3ly1
	S0bC2CQ==
X-Received: by 2002:a17:906:6a28:b0:c12:80a9:d571 with SMTP id
 a640c23a62f3a-c15a6706bedmr52498166b.24.1783349488569; Mon, 06 Jul 2026
 07:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701121007.92789-1-mhun512@gmail.com> <ake8Faa-c6H0CBiX@kuha>
In-Reply-To: <ake8Faa-c6H0CBiX@kuha>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 6 Jul 2026 23:51:15 +0900
X-Gm-Features: AVVi8CfwN_hhDQ6ku1bBs-rJaZ4Zs4DivXj_0Cako8ZxyE4vCMRFzsp89ePWSh8
Message-ID: <CAGEsz8FA=+_e2WNqAHpG6PEXSMqRHFnDA-45O79kMwop7VZ--A@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: unregister TCPCI port with devres
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, that was my mistake. I'll send v2 with:

Cc: stable@vger.kernel.org

thanks,
Myeonghun

2026=EB=85=84 7=EC=9B=94 3=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 10:41, H=
eikki Krogerus
<heikki.krogerus@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Jul 01, 2026 at 09:10:07PM +0900, Myeonghun Pak wrote:
> > rt1711h_probe() registers the TCPCI port before requesting the interrup=
t
> > and enabling alert interrupts. If either of those later steps fails, th=
e
> > probe function returns without unregistering the TCPCI port. The explic=
it
> > unregister currently only happens from the remove callback.
> >
> > Register a devres action immediately after tcpci_register_port() succee=
ds,
> > so tcpci_unregister_port() runs on later probe failures and on driver
> > detach. Drop the remove callback to avoid unregistering the same port
> > twice.
> >
> > Fixes: 302c570bf36e ("usb: typec: tcpci_rt1711h: avoid screaming irq ca=
using boot hangs")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> Why no Cc stable?
>
> thanks,
>
> > ---
> >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec=
/tcpm/tcpci_rt1711h.c
> > index a8726da6fc71..20037ef130ca 100644
> > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > @@ -298,2 +298,4 @@
> > +static void rt1711h_unregister_tcpci_port(void *tcpci);
> > +
> >  static int rt1711h_probe(struct i2c_client *client)
> >  {
> > @@ -339,7 +341,11 @@ static int rt1711h_probe(struct i2c_client *client=
)
> >       chip->tcpci =3D tcpci_register_port(chip->dev, &chip->data);
> >       if (IS_ERR_OR_NULL(chip->tcpci))
> >               return PTR_ERR(chip->tcpci);
> > +
> > +     ret =3D devm_add_action_or_reset(chip->dev, rt1711h_unregister_tc=
pci_port, chip->tcpci);
> > +     if (ret)
> > +             return ret;
> >
> >       ret =3D devm_request_threaded_irq(chip->dev, client->irq, NULL,
> >                                       rt1711h_irq,
> >                                       IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> > @@ -357,11 +363,9 @@ static int rt1711h_probe(struct i2c_client *client=
)
> >       return 0;
> >  }
> >
> > -static void rt1711h_remove(struct i2c_client *client)
> > +static void rt1711h_unregister_tcpci_port(void *tcpci)
> >  {
> > -     struct rt1711h_chip *chip =3D i2c_get_clientdata(client);
> > -
> > -     tcpci_unregister_port(chip->tcpci);
> > +     tcpci_unregister_port(tcpci);
> >  }
> >
> >  static const struct rt1711h_chip_info rt1711h =3D {
> > @@ -394,7 +396,6 @@ static struct i2c_driver rt1711h_i2c_driver =3D {
> >               .of_match_table =3D rt1711h_of_match,
> >       },
> >       .probe =3D rt1711h_probe,
> > -     .remove =3D rt1711h_remove,
> >       .id_table =3D rt1711h_id,
> >  };
> >  module_i2c_driver(rt1711h_i2c_driver);
> > --
> > 2.47.1
>
> --
> heikki
