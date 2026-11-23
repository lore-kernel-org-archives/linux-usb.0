Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470336;
	b=1wiFuYeWurxvp9zD0w56G2GaIxFBHPp9WF/EKUaKUV70KB2AYXi06ghncSZLloIGS7Zm
	 vieZo8LqgwGCKk5Wp7zyDOHGE4IprzvCp+NPsorLFwyttgJVhgybD22+SHeTuH8zZ+NOQ
	 FZI+JZG0o0kpEehYLnUIpLt7ZOslJnoDtUGb8p4nN6WK5HZRbPWOtC3KfraUyHuiQuS+I
	 n/6e1fv+2JFn1sc12ovfTXA4WZBc9ubJZ9nBfkhYwuG9rrlBmOISehfzEp7sZ9K/1JTHV
	 DteBM38/dCQkt92DG5g3kIz1hJfHvUTN5ikf+9g4hnSN0o91AiXrT2c7T8nvhHPPaEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/W/kyBuM/G2Kc8E0sOqQ58g1FYQNe4U8K+/gThE1IrM=;
	b=Mb8F/9IgRufAZQ/gk26lXpZkefUIJ2KqZzuhr2qK7wCZCmPcoeicbTn5xEvQl58QJe69
	 1ljxsbqBhVAVWAjDaLIG/5caixlN3dSKx+lAXCUwKD6FJZq21OWSr1hUHVQG8FGWKCeen
	 Om9nSBOAljMAM7yQPQUgUKa/18dA2D5KTRS9f8qHvyFbyxY1pMMAHdWj3o6dkSYU72ju6
	 8we4tyljvXGRpbXBlTczkv353emUrko28gjib9wZYKG7rXVZdJZVlMHoc83GRafj8kMcD
	 nGJwkDeMtd8TjcHEka2ZisSEmuph4VYu3XK/HKEd67X/HH+zwWvbypDtZtCJu4kKRyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e0vKXoT3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0CA606A321
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 21:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA0CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e0vKXoT3
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b28d9537bcso2579933b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:45:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795470335; cv=none;
        d=google.com; s=arc-20260327;
        b=lhLTc9DG9gPRa2Uegj7ZkfonBkmZyM4WH9PDDkemNEapacyNlkmSfXxHifRGXlrj8X
         xo9bSKCzIHwsfsNgP6LSG9vqNcD8G+jPun7kW/0F7bZBMhM12ovxPn0xzzdfCyIue6L7
         DWlsoI5WI7D+MApEGmEquln0gaoXEgb5QAtV0F8s34b6kGaLQzec9Pfrgb7fTCgcnjLT
         qV7ChID9SvMf3KwnzwEKM/QissmCh4IxHTmFXvcdTjda5IxJ9t0JOOmsvFV2EYA1ee+l
         +7pNBRTB+gS+C9jEas/iODN6z8orBHYUzrj9lcx37WLKg//oGP3VKdLAgqBnMsR0TIw8
         p5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/W/kyBuM/G2Kc8E0sOqQ58g1FYQNe4U8K+/gThE1IrM=;
        fh=p0nPWHWHr75bWN5Z0es0n4Z7robwJ8D1pYlvB+zjwn4=;
        b=em3ZGFTLmoHo0HBoFyMkzfhhHSARxPLG0CcUydQn0croyLz2YN7+lfccKaT6syksed
         AGG9aTvgTVOaJwDq909/3VtGYbb6xYqDOxLJDn1j77wtUkV44f3xFPn7L0mgbY8PW5dz
         1e3cHYNpH2n+29SoDnpupY+k2aQFC8siURVbwcdXYljtM3/NAnQXZA1NZcZw3A+GqUoa
         /1QN+3d7/voA22E4oUCWXRkgehc3ObqhJbhuHjrUe1u4Rn3G+HkAKga3X0MKQ2WM/PU1
         xi0P1VwIrmfYYoClspPmV4+Axl8YCPDAqDl1D59ywvZOqW0FRd5MnQCIqULbev47PBTU
         r/2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795470335; x=1796075135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/W/kyBuM/G2Kc8E0sOqQ58g1FYQNe4U8K+/gThE1IrM=;
        b=e0vKXoT39qoBUGT2Z7X+tkjOR8/sWY0nWnU5t/ZdLGeoH1SJZl7aRbEfEapNum5Gsj
         eoxOgHTlunYj3325DTKM+QnBn9cU7ee/Bo3TV8n/GFIgsQ7kJ9Yu4+BA6yatn6H8nXpd
         gLEH1x6kxGejwLH+gSNmzRMzRhD8eQj2PocxD5kdmpM17vuUe0eYjAW1P4fxAN83Tcvc
         o/yNX0HIy6IUxIlaGFgd/l34Dx37hFoBIUkxwZMOms+fhNoKwZDMYu1bcPpnX7GCjdCA
         5f7Zj3q6OApIP0LPIDOAtjahOyPcwKtw7fz26HmfTiTbmy2kXyfYnA/knkpy6vIIaP8i
         4+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470335; x=1796075135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W/kyBuM/G2Kc8E0sOqQ58g1FYQNe4U8K+/gThE1IrM=;
        b=LRi7NY5Sp5xcluaHFsiPjXhiKxRb6GukHJouIx1RKLbFOCWTdYeKxcfuhGTcLNkG6k
         xqlTtIZsUwwDV2ORJSqszzTvQfNF7iWLz23Uve+Nrx5JG01YXoiFJwRTYvXP94gtKZnR
         6AlcHsIgTOIo5stJLbhdpX7bXmts7JBg7r5ds/mRHFmh5CHS4h38P5Gy1fWclAN7RUQz
         ID+wcUJ2u880GpUpG0mGdPnDf5Fwec+krCEU+SHDyoDDCg0BLNjc6LrXWRjklqiXLWEA
         hL9iE0fGdmaqWGYM1itnE/Wa5Po/suyKrNwHMa1shd7+9oa4MEISAuXpv1MV31/Pyfp5
         bdPg==
X-Forwarded-Encrypted: i=1; AL+hErG2+jTdR0Fj4NoTHO3VW6dMnFCEqkDfQg1troR+ui49l5wF6hnHQoOxIik9lGB3GYUO3T8hk1bYQyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z98ifOdikRfHw8vFv00xtrXHC+teczZv5dWuUWp/HSCAmpRnGuo
	emZ5Mrinir0G82XQVVu2seTPqyF700kCwB54TSpHibrH8XtVaWOu7MrmR5aOoTmlX4VfI7VYA0z
	+GditsOqCEFbWTKgzXh64Efz24UL9yeJup4msOlHA
X-Gm-Gg: AZFdTZcgIjlOJarWY81uHCZD6ng8tlTdtUq+g8oXvjtH4IC8plWQffxGnQ3qqH4eTdl
	UXVDqoDuZ47YERiUhLrAygDC+sPLN/dmBD3NDsmpL3yoVUbYOOdfImSkI+gzmEgFTEbXm5eoGWG
	/Ro6hhO5Vzv0IO1yUNf0Sg4R+ItWXmluhRGJCe3l1R+gQW+9+UokWF4IRs78aSR48hJzP7SlAuR
	+q5zqMNitmXWK3yq0rqJIOSS1j7pFrYSen1qXFsMiapxF0hy31t+A5noW1oZvqw5b71RBoL6CPg
	DnTzcliObaUeXp3Wm3Vq9thBIQZFzy2LQSEBw2ENFpAC9125iTT01cr7msSTOiueH6cI7AQOQbl
	7bWSJ4Yo4LZy6Vw+P2JP4OSsp+bjK8WYz9i5E+YDh9VGyCTvFuInhHHFuMP/Zyqt6zGNImYk=
X-Received: by 2002:a05:6808:448b:b0:546:306d:45eb with SMTP id
 5614622812f47-5797d6af390mr9825142b6e.35.1795470334202; Mon, 23 Nov 2026
 13:45:34 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net> <20261118-tcpm-soft-reset-sop-v2-4-b6decdc95e66@flipper.net>
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-4-b6decdc95e66@flipper.net>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 23 Nov 2026 13:45:23 -0800
X-Gm-Features: Aa3M54q5Fc-B4ycY75HtIWH3_nmK1gR8tSDTbaD0woVGm0YBOPCVMsLs-Rn12Dw
Message-ID: <CALzBnUHZb24TcVWoZLbKjQDRgHjmBtjJfa-iCyAJ43y=BBKwqA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] usb: typec: tcpm: Keep cable plug messages away
 from the port partner
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 17, 2026 at 11:27=E2=80=AFPM Alexey Charkov <alchark@flipper.ne=
t> wrote:
> +       /* The Soft_Reset in SOFT_RESET_SEND went to the cable plug */
> +       bool soft_reset_sent_prime;

Should we guarantee that this is set to false after processing a soft_reset=
 on
the cable plug; i.e., should it be cleared on ACCEPT, entry into SRC_READY
and SNK_READY, and reset_port()?

> +{
> +       switch (type) {
> +       case PD_CTRL_ACCEPT:
> +               /* the Soft_Reset after a VCONN Swap */
> +               return port->state =3D=3D SOFT_RESET_SEND &&
> +                      port->soft_reset_sent_prime;
> +       case PD_CTRL_NOT_SUPP:
> +               /* a VDM, in the ready state, which takes it as the answe=
r */
> +               return port->vdm_sop_type =3D=3D TCPC_TX_SOP_PRIME &&
> +                      port->vdm_state > VDM_STATE_READY &&

Would guarding behind port->vdm_state =3D=3D VDM_STATE_BUSY make
more sense here? Similar to tcpm_cable_vdm_expected, the TCPM
should only receive NOT_SUPP when you initiate a message.

Best,
RD
