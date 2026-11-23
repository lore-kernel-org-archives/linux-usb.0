Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463150;
	b=nYF9feByHt8VALax4/Wnr3u90bQVv4ngAfxYCWdqK6nIZZGQ/IB9ZRfeWEbotOAFgssR
	 qJCKtt66/bSBjs6HjjbRzgRA6HBQv3UO3WUn+4Sin4Wbs3WUphs0EfNyGF9x/BvuyG2bv
	 XzkG39VTrt4KXJiEXsf8td6VE4CfF4oj1XLhRIpDnzfR4SF8URBkbiDsL7Y84ulKLg5RW
	 6PeCaT5kPWDoh/QDNqgZokoJZEVe+DO/Z3R0VRQIPJL0z1YKxZJ8ydz18StoGvyAsOJ0r
	 tFTnAOTKh1sIKaTcvbKDRWgwswrN49yZtnxKs1rd34DnPnVyEvxFJn+uznaMNtcgSRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sWpHDwX4NA5FzsiIsGJw1W8t/+RBE5s4GsO2WVDVB6s=;
	b=EXcXOn4CUouRUbizNsxGSa3+zUs9bsf1C3ozA3b21gIgfHcszDCekuuENZLoQaMvWC6O
	 WE1HIIGwebrdj94IRdXwHc394h0raUyWuUqPUotHlW/NpoUOM1fmYJ3F+W8ghug3Bx/U4
	 3MFU7e+gkA354GPDoCPIQXjGuu0j3MnEOsAM8Rsv8eFEH+AP0wj+Q/6iYVkSUW2l0aAm4
	 pmTR4pRlF/lp1wI+NJIbdFInmlHPZfDTm6967czyQS3MQNMTHdZNUbKLoB1kHMsXmYzgX
	 bSHdLOBRvyi1mn7AyuCVJLwsyMzMtQ0VB+uoRfZ1ZcU0uX9R0JAxS7G2dsnsGhtkHTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XxWqDgBP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0C9606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XxWqDgBP
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57148b8ec14so1279999b6e.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:45:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795463149; cv=none;
        d=google.com; s=arc-20260327;
        b=Hjx5PLnunkY/yJdJ1xjyluEkWsHKc+m/KenKXmAi+0uAX4LEM14d/ftoftgoRnwTyN
         y11p3bbzLBXpinnarYsu9oZs8iECVqcY+GI2qdOXKKUMaus6lHskAzO1z2Vy+lPTEF1w
         +rKv567m92EtX35hjgUM3wibTbx6eoW1kZIs81pVF+IM1mqI89clolYvYxfNrnrN1uq4
         LvfSVkENgjP5cdykTQR/q2J6szWgmBNhFSbf+CAp3G5Uxn0wxEQ4X5+E4QgQyzaBnps4
         9f4qX1CCc9XtAl3Wz5kxOC9/9kPXu6F2gMGIJHT3Bg5DxIEppILeSckDFB+W6zkwri3K
         snUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sWpHDwX4NA5FzsiIsGJw1W8t/+RBE5s4GsO2WVDVB6s=;
        fh=Pn9is0pVJbKJ5wbzrJkP8dpj6jUcjuzbuNuSb6/uKP4=;
        b=jnE2aU1r4SeZdg0tWQkwQjf8hnZx3Jf3g5tPGEaxQTOML1pghJUPUDvoz3YTHg0Vvr
         0SNngBgezBXq84MyBhl0aTgmZRIKYqVnuYTi1YsdvUk9Mm/V+FnF3tpC69bWZHsQF9oQ
         FXKozeCrDXcGWwSZ0D1eq0PVaYiTDYJm//LvTgS7XLEH3Xq9RgYiYAsXq1STnRAnMOHY
         KarpOyOe3xCtKwXYWKUUfS8rjXhU2xvbiNoD6bDIifp/jDyytiw9z122cUscMqsREiup
         Z+AlLaeYDxmjOS2bKf7NmZ4ZlIDfjfprbFbhW48lJB+WB/FG1AWGEsFp3QAwMwCpHIBo
         kN3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795463149; x=1796067949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sWpHDwX4NA5FzsiIsGJw1W8t/+RBE5s4GsO2WVDVB6s=;
        b=XxWqDgBPvOrPiG/JBS+4vCjVp1NJOTBors+acPB6futXqhRKJs6jnkSn75nYG5gc3O
         L1rvc8WB/k4tGD45bTmzWQMdmgOE0LuwDMyP80KjulnParY8TP0vrdbmTWuWuevwz0It
         7zQtYWLGXqcShfdpszAT3/eZbQRnjnc6doiDcROsUs59UuV445wqCFPKKje1HzL8OcRc
         jOOPfLbHSor81vSdq/qz+u4cO8gJHkX6Py/w7aksmfZAQQVnFfR3jcTblBwsrKM3h5E7
         dEoS/Oz5d2Zz5QEYPiwN/O8NfpQ2V/GmdT+OOn+ac2KPMsBHGMUUNtVala7+uF5027bW
         7+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463149; x=1796067949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWpHDwX4NA5FzsiIsGJw1W8t/+RBE5s4GsO2WVDVB6s=;
        b=rVKrXYu9bjggJdX5nAy6/Rpe/SX4BH1fpS6/D4OuK1qNhml80JnoDmro3rS91wa4Xv
         DSG67VjuV1NHv/mVIRQX5FVzTikI+RisYFa9F0Ul3Ii1EWbn5sE144kRsvx4D/PGxq+e
         U+g+QL5eSu48BMU/rgZVtV8c3aw/2QD8XiYkAHKI56JWtBwg/4n8WFRktEk4GiL4A9qI
         gJ+PZOEXeYJaIRjvie+p+nfg2dI91cEKDxCXQKSnbvUGZmyiTgedUnNpWCrzuwLIw2pt
         8+yr5eyaFRVioA3A0d/Rvvn6FwuIMZePiQh19v4Jb16pToQnnDrEjkAHU0bHG0OyntuY
         i9Yw==
X-Forwarded-Encrypted: i=1; AL+hErEjmZBi/DXtgtEu4nI4DXWSrkeWhU7onMdnfwWSm5vkssFpR3E5bo2nSE5TYC7GtZK8rVQ4Md+cwG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cEDD1EQmtc9d4HZF3SApFD2FY+FfaBRRAjwjFl2JE3ex+BClQ
	rQUnO+ly90A9/2IsJD4xI/36fsikvhRlVJV+YePt05r/vpEy79W9yfC7IBKxxcw9BCK7/vcbva1
	UtfQNQ01rywZ8Ncbh8kKu+Banj37lYNRw5cxBcvgU
X-Gm-Gg: AZFdTZcCCwcx/FFrOCGu2SHLlOY9szDwErQYlOoIkm6MvjGQY8Tl8PPx/AssCqMFTzp
	Ig+LT4cXRsp5y0y6t9iKq7S2UEJXBTbL3OmKvxB9Q1vSdqdYt1GieWz5ZnccstXMu7/EoB5NV8J
	ONIdYf/RjilEbokfztak++2iYBKxxWL0URh+A1zXYGHMfInoM0jcXjDyiJGEV6sVKycuGRXiP0i
	Y2MTlwx5hiTOAJgbUemBbxzUM8E3T0cgUB/1UC4mOKd3HhXhkWlfqb4m4FUaXiYTNwQbkWwHb6d
	I16GUfIMlwdSwCnt+9BZV0OiRB/4x+fVkVpXOrWrnalF28YZWkJ6YQ1E2UL6Ul5+tja5iKmVGuc
	o5w/4orMyUTZfzhf2gY3IhtS5yOdaf+19lPM36+J1v65yPhBs6tz9eGnjapg5mycLQfOIPIA=
X-Received: by 2002:a05:6808:4f26:b0:571:c073:74a1 with SMTP id
 5614622812f47-57a06b1d98bmr13253520b6e.6.1795463148513; Mon, 23 Nov 2026
 11:45:48 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net> <20261118-tcpm-soft-reset-sop-v2-3-b6decdc95e66@flipper.net>
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-3-b6decdc95e66@flipper.net>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 23 Nov 2026 11:45:36 -0800
X-Gm-Features: Aa3M54qeLdW7__eto04IrOjIag6aN2KwS8X5d3xJpM2jc3XAmw1IIHMMRYpRwTc
Message-ID: <CALzBnUF82EEAOaiPXKQaYvOYQkthpBaD5z4maKf-bupuuqHzog@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST
 whatever the cable answers
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 17, 2026 at 11:27=E2=80=AFPM Alexey Charkov <alchark@flipper.ne=
t> wrote:
> @@ -2745,6 +2745,12 @@ static int tcpm_pd_svdm(struct tcpm_port *port, st=
ruct typec_altmode *adev,
>                 break;
>         case CMDT_RSP_NAK:
>                 tcpm_ams_finish(port);
> +               /* Go on with Source_Capabilities, as after an ACK */
> +               if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST &&
> +                   rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +                       tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
> +                       return 0;
> +               }
>                 switch (cmd) {
>                 /*
>                  * The cable is not allowed to respond with NAK so this m=
ust've happened over SOP

I think this section can be combined into the switch statement below
it. The comment
states that the cable is not allowed to respond with NAK, but given
this patchset
hardens against non-compliant cables, this can be consolidated as followed:

case CMDT_RSP_NAK:
        tcpm_ams_finish(port);
        switch (cmd) {
        case CMD_DISCOVER_IDENT:
                if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
                        /*
                        * Not expected from a cable plug; carry on as if it
                        * had not answered.
                        */
                        if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST) {
                                tcpm_set_state(port, SRC_SEND_CAPABILITIES,=
 0);
                                return 0;
                        }
                        tcpm_update_vdm_discovery_state(port,
VDM_DISCOVERY_CABLE_IDENT);
                        *response_tx_sop_type =3D TCPC_TX_SOP;
                        response[0] =3D VDO(USB_SID_PD, 1,
                                typec_get_negotiated_svdm_version(typec),
                                CMD_DISCOVER_SVID);
                        rlen =3D 1;
                        break;
                }
                tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLET=
E);
                break;

If a cable can NAK during SRC_VDM_IDENTITY_REQUEST, it could also
NAK during SRC_READY/SNK_READY. Here, we can advance the state machine
past cable discovery and prevent SOP Discover SVIDs from being blocked.

Best,
RD
