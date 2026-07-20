Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF553F39C4
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545839; cv=pass; b=sQvX22RN8cj7GwneiUHaqxYU/6QyEz16QQ43Kqg+Qo1KPV0S65VlNqAd98bEweTj8z2JNXumlq6WqL1BOWpm0VsvlFoxWrr72ABUfthZMayIhE8xx6jBF3Fw9Szdvgh5B0jg3jJ+0H4P8BoqgP87IGmWm7De7peX0xlGBg8prig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545839; c=relaxed/simple;
	bh=UKngneTFPXF8poS1q5fNtashfeg8DcKeJ6OYgfoXl7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Syny2k30p/1998l6Q0BLGbZSNYLAYOBTr4fkP+wRGeaP04MXtfFGLI0YGMddpdJR0zyGhVlAaXmfeargdoq3bOEJVJvkenkicHlWunxR5DcmQto6W16T5FpEPSx/cU1jBqm1nm/ZR3tjL9qAM6lCNH2e7Isj0sO6/ialK9P4Lm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mYnODL/Q; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mYnODL/Q"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-448cf99c133so2361300fac.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 04:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784545837; cv=none;
        d=google.com; s=arc-20260327;
        b=lYnGMZ43TweVXO6ZHDsiOF4/LIUP6tvbOVRlSerDNnLXXNV9SihURyLs4rKMxrixP5
         mY2ICWUqdww3ld6TNZfehxK4hgO3+YjULNPRaB3w1ho7AhPYSCwFGCi0KPc75KZxVeDq
         vROjRS0PVE5qRTLeA08vwExxZzQyuMHcyS8hB1f/t6v7nnjEWUQ7rZgbiudijk9i/BbR
         AsPv5LNBgHkwP08d7XTQGrb6Eh0Eg2Rmy6ZDoJ4mxL28NON1jvi0Ngrer9BnQxUTFjW4
         jqd+mqkADHiIb5Bezyk70MGX8UEFvVXAoqJ0jvuUTfrdiaPa0O5e1mG8ERWvbQt5AV9l
         F5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4iy5g0+ixbzL2cCTufEUXDAeXZcr26NvjHxO5tS93Y=;
        fh=jAboDJEQiB0/2CpFQoijg8pZ+3AlARF9/mwPVSeNvSM=;
        b=BVKYnGWuvKR9m5SEZbFt+ATgtVABleZ64KgLqxYumTYDd7WRfDEyTF9xfO4TJRsyVB
         mfr4TIMywQlmukfPiDj3KaeWRlYIPWSn+uBVIVNH6nqHhK05RgUEfG2d+47PYTIZSVIR
         /xdBVHNFu3KoDvcp1ENAk7jZ6bahHEktJjma2xOreRSUPiNwn2t9u0TABeG06cU3B7bR
         NPOntKuzVLfCpHD+gEMkua4nwwYjOWiU9p5aK0e8lC7bSv+5iQ4ugaBk8HY+0Tj6Hc0U
         YFvDHWiwF+ydsbc0mnTaan4f7/CipenW0Ku3eUcSZZif/ffOeY9igcBz171xcC1Iaa7G
         bonA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784545837; x=1785150637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4iy5g0+ixbzL2cCTufEUXDAeXZcr26NvjHxO5tS93Y=;
        b=mYnODL/QB8ZTNk2QEG6x6GML/pmbLhG1QTYOqar1Sjy3RPSTngM7r19p/aiON4sy5z
         aJlZ0dHTvprCGE8RCg3pZp1KhvX9jaI6tMyNgmoCfSLvC5ibYfVmHLGExs+R/ln3/lF/
         P1DBusTl4SVA+hOc0/uCicBwVckTea3nFBNuVidHulxkxySDhQvh5ckJGva0snvzLQq9
         rBU1hbHArwxdv0J2LlxXPRy/MZbRMmEOTuJVRllfncDorrzu/+Y1uDf7YteuesZmMH1I
         jxlxDLhrmE8mTws3yymu9bfOcOdaT3XL+h49nxTiSAiJyfwg8MPTOuDjGkIMUFwg3iO8
         eNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545837; x=1785150637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4iy5g0+ixbzL2cCTufEUXDAeXZcr26NvjHxO5tS93Y=;
        b=roXMngmn+n53SEUCcGXZ+VMABwm6ozM6hI7CUakX+uPQ+DCWdluvkKjuKAWUM+fdIX
         e+mhgt3f0WGT8QgcCLtIbIsBieFfKABo2SW2X6wFcvM+9fvCZ9uLN4VrfBaPAUAsLNkk
         wJXZvCbv9ZVYE7QoGJjCeLNIkg9AL8S/Tprl/YqIqur3CtYvmVvm5k/GO65qPYHWnkmU
         sGqfp3hT4/ZkDaL1LFH2bd7z7re8JBqmp4LTeftmQ5ePmx7CLCmkjWGRoa5pSEDcBgWg
         1FRAMlApz8xYRgdpeAmNGE80qoT9HQLUIex2Bo/fmvgYKz0O/x6yS/3mX2lEnDlTC66a
         YEQw==
X-Forwarded-Encrypted: i=1; AHgh+RqTDYwReCd06WUV2uZ+r7/jjvhNWOLfx0rgf1/jHP2YwiZcExJdtWtRUWupdnU5N3J5DuJDhJJD4LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCKtBx7dPaPGhdKFFFyqbKhV7vdc1mE8nmyOMwOxvFluXKJNI
	eGrJp1wlQsv1OvdYgRPKZDHy0WgWzuJf0IvsGkPrfw59rfkoKreoxfESnLs2as28hLmnU2/52z0
	W6QKQEtzvoVLyUKE94r3eO9Q2fRCriQslz5qPz8Po
X-Gm-Gg: AfdE7cmgzX4YWdp+RNSayoCdUXs896EGQMWTQGGNtqS4bIhpvOcIQOdy/GF7aHiExJo
	HLmaxzzknn8IfavUtnvaQhh2X9iYAsygpSLRhF6S2XBaoBsjXi0YkeWOT8ADFpAzn1NKXaeH2Lm
	dX68VwlcE48FgC1bktE8HAzbdvQYzclCl6lmCjUs6RdDJrY0Iaeuvkkt8CX3MTEIVx/lBuQxKyr
	zx/s5VXd2kY8VNHCkoFPT7GU3G7PJvTvPQXRcAaJHfEXrNWsohN64T4rp0sPMrRCqvVFOIZBgEN
	9NooPa/EzoRoHRrUWg==
X-Received: by 2002:a05:6808:c3cb:b0:495:fa67:7496 with SMTP id
 5614622812f47-4a4cf26bb93mr6980875b6e.14.1784545836234; Mon, 20 Jul 2026
 04:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
In-Reply-To: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 20 Jul 2026 04:09:59 -0700
X-Gm-Features: AUfX_mzHCu4vQ3381cWLlJf4lmLBc46WP_-kLs73DVkvjTeQs-I65NOSJUBSaew
Message-ID: <CAPTae5+6-NYoP7NQGDJN62AFnGSGW-8vaA1Jdny9V8meeDifQA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 11:29=E2=80=AFPM Xu Yang <xu.yang_2@oss.nxp.com> wro=
te:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
> to tcpm_pd_receive(), ignoring the actual frame type reported by the
> TCPC_RX_BUF_FRAME_TYPE register.
>
> Read TCPC_RX_BUF_FRAME_TYPE after receiving a PD message and map it to
> the appropriate tcpm_transmit_type:
>   - TCPC_RX_BUF_FRAME_TYPE_SOP1 -> TCPC_TX_SOP_PRIME
>   - TCPC_RX_BUF_FRAME_TYPE_SOP  -> TCPC_TX_SOP (default)
>
> This allows TCPM to correctly distinguish SOP from SOP' messages, which
> is required for proper cable plug communication during PD negotiation.
>

Can you add "Fixes:" as well ?

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index 7ac7000b2d13..c19413f41bcb 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -748,7 +748,8 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>
>         if (status & TCPC_ALERT_RX_STATUS) {
>                 struct pd_message msg;
> -               unsigned int cnt, payload_cnt;
> +               unsigned int cnt, type, payload_cnt;
> +               enum tcpm_transmit_type rx_type;
>                 u16 header;
>
>                 regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> @@ -763,6 +764,17 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>                 else
>                         payload_cnt =3D 0;
>
> +               regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &type)=
;


If regmap_read() fails, type would be uninitialized containing random
values from the stack, can you make the code to handle that ?

>
> +               switch (type) {
> +               case TCPC_RX_BUF_FRAME_TYPE_SOP1:
> +                       rx_type =3D TCPC_TX_SOP_PRIME;
> +                       break;
> +               case TCPC_RX_BUF_FRAME_TYPE_SOP:


TCPCI Spec Table 4-38 also defines SOP'' (SOP2 =3D 2), SOP_DBG' (3), and
SOP_DBG'' (4). Since enum tcpm_transmit_type defines
TCPC_TX_SOP_PRIME_PRIME, TCPC_TX_SOP_DEBUG_PRIME, and
TCPC_TX_SOP_DEBUG_PRIME_PRIME, why not expand the switch statement  to
handle SOP'' and Debug frame types as well to cover all cases ?


>
> +               default:
> +                       rx_type =3D TCPC_TX_SOP;
> +                       break;
> +               }
>
> +
>                 tcpci_read16(tcpci, TCPC_RX_HDR, &header);
>                 msg.header =3D cpu_to_le16(header);
>
> @@ -776,7 +788,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>                 /* Read complete, clear RX status alert bit */
>                 tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
>
> -               tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> +               tcpm_pd_receive(tcpci->port, &msg, rx_type);

Please also check whether TCPC_RX_DETECT was actually programmed to
receive the specific "rx_type" to begin with. Perhaps while
programming TCPC_RX_DETECT the allowed received messages should be
cached and cross checked here. This would prevent unsolicited messages
from being passed to TCPM which poses a security risk.


>         }
>
>         if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_ST=
ATUS)) {
> --
> 2.34.1
>
