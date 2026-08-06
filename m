Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE65427FA0
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007405; cv=pass; b=qXazQkkXmdVgWv2d5dv37eFlC7qEThOByQQAwMqpvgWhCrBklyRDFfU7xju2pciPMNHybA6geAVro7eEQ5ThxhPtOkEQGRhDKu8i55phf9jrx6OZsRnfz1DnPBRZsPVEkwmjRr5Ug/fGT4N7KszglBgd3h5tIMAFiSMrYH/gqPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007405; c=relaxed/simple;
	bh=PjgzYh4xhi8r/1gtDSs2lcpXDwHgzvW8vY7tDCqm8d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJw7KmPEz/TTzILLssuA7PNXs70jJ0ImXM/OjdOG+8Mf+RR5Jcxs8eg5iTDSybVKnB/YPxQU0A6HBqA6rduMn/cLeGOpwxjpZ/kJAwdmVLlveSiSfIklzjumRo8sHBFsA70jJJcREhPIZgZYL6hSG7F4uE7ImjyQkmdYBRuSupc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g6ylxaUT; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g6ylxaUT"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-456f7012050so620816fac.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 02:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007401; cv=none;
        d=google.com; s=arc-20260327;
        b=K64uEchF7/xJUD9AdXK0VT7Bdwj6xmDXmn+6xXoWU3NVwBjK8eGiz6rI6ZNZW33vjE
         KW/bTWn+kuWSbcZBCgPFFy9SJD102VWm27D5eNZIKX/7uHBV512RP8aaxW4Gjdz9PMwt
         Jq1w01qsvmDeyu++/yYZ11s3pcgk5IYxyjLdCd+2V2EJU4t+Q9i00PmztLHzrX5GQImc
         PEq8m8hH+AtatH2A+6Y4fe1YyzNgrPML87MrK2/lsJ+EQF/1LnmjjyN/Fd3adkuPtYbI
         pSc7XDFFz8XNjdMuRWNQqBZ7c8yixkUrBNVcnCJ7Akh9LY2NId97bizhcaCKbtfOnA1a
         UotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O63QlgegA4Mm6qi4a1gFdlgc0IoabcGZvqlXlfGAHy0=;
        fh=MccpAvgBaSDjyoYk6H4f1f/idLu06YpIFUje+y1qkiU=;
        b=Ltr6SRGoELkJLzckyEbS5T5PE65su8GBGvFYDkGt1JB94Yi83197oJd7VaKTKBrXZf
         VNhn+rRic7ujlwh+ZHwiZwcgtXFQhcotWhsc81jaNn4eMGR2GUNH5GAiIhruit17RqC6
         R4R7D7XPr2KLVeX6gI8EWm+sV/hMU+t8rwT1DAYrIJXE2HrtKCm+6OJnRUvMjbkO6ONr
         qwCVyAr9xo2osGP2w7yoAN4phoJLAGIDe9bgCgXqWEn8fCkZm+qz2NZdOtnjyYVkB3oH
         9h+f4Sr3S7aIZmU+2u3vYrAY7cuvF/JJ+D6wc39Fn/wHiTN1JaJxkM66ZWsWmcPoZe2g
         kghw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786007401; x=1786612201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O63QlgegA4Mm6qi4a1gFdlgc0IoabcGZvqlXlfGAHy0=;
        b=g6ylxaUTwkMaQtZjY4nFnwOdKYzjpfufhS7RcCEcetLkbp9q+dYuBIWUhE9AGWsN0r
         YhhtbGk4l1bJQ6FkuKlO714f8VuXlmXYrDw7vdVS8ra5UUk9XLVmrYdraA/uqigYKQnR
         70HSuwbVsykU47qkWs4Jm0juxtOHwC8j0s4Oo7wk9wI/a9ykxxpfmVQpPT8BZXeVQn/N
         fl1IAxA2o51T+uQF06uP/jkt7HSuDyaNmF1dcGYlGBU5sx7zTR7d+pTPMrWb72XIU4y8
         V28mVAEdGPvu5kuXPIU1oDSJ1ALf7j6cUjGgNpfuB7Tk6ptsmsrl1ZoNSHLqYzpKydRL
         Yjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007401; x=1786612201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O63QlgegA4Mm6qi4a1gFdlgc0IoabcGZvqlXlfGAHy0=;
        b=fCQmuNe7R/YdHdgKHGI09dM1GiksRNFftNoASM8e27NOYXTxDf91+JHpSQekytEa/+
         OvRXdhwIdaluAUaJSZp9QXrx6EOqpMmNaDtBf/2i0yMgiak+sddsFWUXasUy9Y7fwpBz
         dr8FYOvMb4Ge+eGrGDrMrcwk3LgGknoOC/E4Jm1MOo3tknYImH830NPu/dNB8fzFJM0W
         VOKfqAalSAgzzJOAErsmYINmuUalvT8ZgBfGZNdWhSwLTRzHWUc4B4VMWps5C2Z7KYk1
         bBCL8rt1sPieUP1Ys9+GLQKV2PhuXNL4F/ZPsLfS2bYAsHB2Blj7z57r7Cu6IPwUecCN
         s40Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp4ZNr+s2mrLQam9Vztr7SaA5VCl0KNc+xM7/pM4M06PG3GXUPdITgF9rqo7kO4DRXBc1sGqSpmMLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47h3FeYIvQTnQj0CvLvsPgJ57IsvjypLMwKWuFegwcdl/4QjK
	Ji5eU+78rqVEE/+Q/KQHIRM0bgY9kS4R6T8OJoVuDLiQGEAo+ngh2/VNNXFkKrlTRKTmCrhpipn
	FXoFUuONGfz2KfNmVLfn6tR5fNDZiLBfCytv8BnpV
X-Gm-Gg: AR+sD11wydCfz1rPqoT9vzykuc9SYl5Ttdt+csHaI7IFdWS1U8zcTKwpymTYz7ZTmbI
	gdEIZdjfOLJRs3/8dLj+K1np6/cKdTGxL3TPJ9WgmaG/APJ+vCU1MNhBi6RYPdAthmvea6eGsl7
	tqN/+gVmdRFfsh/QO1zHiGT1U7512RLJzlZv+K4Q+pVv56W9N6qa1CJuMl44pmksKMmVswfkKST
	BrIR8Bz9uru4WcwFBBUm+wSTtNVgzc94tqDRsDL9b/ufAU8kj9a8qGgmwQGJpbNhKjXmK7+f1/8
	CQKtEgT23i5RLduDZXZtwOxb+sU0xUG/6SMRCsJJSjuTsZ1QqubUK0/ydKwMHtm7tI5+J2JYp2k
	DDg==
X-Received: by 2002:a05:6820:4cc1:b0:6ae:33ee:7ae0 with SMTP id
 006d021491bc7-6b016dd4870mr1350572eaf.15.1786007400738; Thu, 06 Aug 2026
 02:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com> <anMRbinFAZ668Rpm@black.igk.intel.com>
In-Reply-To: <anMRbinFAZ668Rpm@black.igk.intel.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 6 Aug 2026 02:09:24 -0700
X-Gm-Features: AUfX_mxlGsjUiMkRPJa9RiotkdNP-jSL7K4c3X_aw86ypmvYQHzpAMuEsImXUsg
Message-ID: <CAPTae5LkT5EqCi8w4oTRNxX9oWdi4eovZ41u7LMGrG=64ocJUw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 3:33=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Jul 23, 2026 at 06:46:14PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
> > to tcpm_pd_receive(), ignoring the actual frame type reported by the
> > TCPC_RX_BUF_FRAME_TYPE register.
> >
> > Cache the TCPC_RX_DETECT register value in rx_type_mask variable. When
> > a PD messageis received, read TCPC_RX_BUF_FRAME_TYPE register and handl=
e
> > the message only if its frame type is enabled in mask.
> >
> > The TCPC_RX_BUF_FRAME_TYPE register records the received message type,
> > which has a 1:1 mapping to enum tcpm_transmit_type.
> >
> > Fixes: fb7ff25ae433 ("usb: typec: tcpm: add discover identity support f=
or SOP'")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> > ---
> > Changes in v2:
> >  - add fix tag
> >  - check return value when get RX SOP type
> >  - pass all possible RX message type to tcpm_pd_receive()
> >  - cache TCPC_RX_DETECT to filter out unallowed RX messages as suggeste=
d by Badhri
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 12 +++++++++++-
> >  include/linux/usb/tcpci.h      |  1 +
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index 7ac7000b2d13..6717ac914c6a 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -38,6 +38,7 @@ struct tcpci {
> >
> >       struct regmap *regmap;
> >       unsigned int alert_mask;
> > +     unsigned int rx_type_mask;
> >
> >       bool controls_vbus;
> >
> > @@ -488,6 +489,8 @@ static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, b=
ool enable)
> >               if (tcpci->data->cable_comm_capable)
> >                       reg |=3D TCPC_RX_DETECT_SOP1;
> >       }
> > +
> > +     tcpci->rx_type_mask =3D reg;
> >       ret =3D regmap_write(tcpci->regmap, TCPC_RX_DETECT, reg);
> >       if (ret < 0)
> >               return ret;
> > @@ -749,6 +752,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >       if (status & TCPC_ALERT_RX_STATUS) {
> >               struct pd_message msg;
> >               unsigned int cnt, payload_cnt;
> > +             enum tcpm_transmit_type rx_type;
> >               u16 header;
> >
> >               regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> > @@ -773,10 +777,16 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >                       regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> >                                       &msg.payload, payload_cnt);
> >
> > +             ret =3D regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE=
, &rx_type);
> > +             if (ret)
> > +                     return ret;
> > +
> >               /* Read complete, clear RX status alert bit */
> >               tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> >
> > -             tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> > +             rx_type &=3D TCPC_RX_BUF_FRAME_TYPE_MASK;
> > +             if (tcpci->rx_type_mask & BIT(rx_type))
> > +                     tcpm_pd_receive(tcpci->port, &msg, rx_type);
> >       }
> >
> >       if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_ST=
ATUS)) {
> > diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> > index f7f5cfbdef12..9b46a6bc762c 100644
> > --- a/include/linux/usb/tcpci.h
> > +++ b/include/linux/usb/tcpci.h
> > @@ -144,6 +144,7 @@
> >  #define TCPC_RX_BUF_FRAME_TYPE               0x31
> >  #define TCPC_RX_BUF_FRAME_TYPE_SOP   0
> >  #define TCPC_RX_BUF_FRAME_TYPE_SOP1  1
> > +#define TCPC_RX_BUF_FRAME_TYPE_MASK  GENMASK(2, 0)
> >  #define TCPC_RX_HDR                  0x32
> >  #define TCPC_RX_DATA                 0x34 /* through 0x4f */
> >
> > --
> > 2.34.1
>
> --
> heikki
