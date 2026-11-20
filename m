Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795213575;
	b=eHBXRB3yUcZkAwxtdXxAIvFrmQcG+UQ44f4COmZzhMbyYs62pdHK41dX7O+Ouowa/Zfx
	 BMWGoYb9pTWpdtmy9wogZNPOCdGMBWhzW2fI7TrsI7lQSuXM+yg/eohcHzFbzddpPnsAZ
	 GGDGs5yTCfiWpte5VoD8R0xzbT0n03+/iIiK/GuWGeqL736coVcD95Bt+GEos262zILND
	 HVRfLLOvlVn+TD/KX004Ua0Pecw7pv9poWy6iFsYaKirW6aZBLGOBa6Urt1RkORXdIpzJ
	 kOvlHicxeaFiXpoxutWLl2jGFIvlpccGd+Ly+rxhERmFqNnr0LJXwzOGNdaDgcCFF1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Tye7LrQ4gNYOB2WmBMU3D2E2j9Fo/YYB1XWy/GBCLfI=;
	b=3Vl0YFIKMBc1uF7gz/1Ef0Ke9pcdRL4eCMYJNQ3NSfwYy08mJn1LN+AzC0Ytv0O1ndWi
	 qwUcD7TINPGTbzCxyf2zB+TBlTtsSQNbb/aEfgb1rG879R1HzUVXi/msJV8xhR2JB97CN
	 p2lBQ34lZRSFm2V+uW4NX/YRcubtIITY0E6led3sQSn57YdbRFNljUYX8a9wSqI7QBuLF
	 khAXZxTi62/XyHYn3dLhlfrF6KRhESnpJN3SHS7iV2H+kwvmlR341YlFFzGotB+YjEPg0
	 hadjowf//LGbu++Mzsw/qoOmA3ah2PrxrlC1lCwAbaYuHLLF9STPxB0RgZbk5dU8VJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j3mZjb1k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B996606A686
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 22:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B996606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j3mZjb1k
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a76f63b243so2037590fac.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795213574; cv=none;
        d=google.com; s=arc-20260327;
        b=XqP8jOwW9fO5VtEPNZc7LH2N9vHUPpf1t23bXphaDGcB7XUibkh5McvQr6YlH8v1GY
         /BGIx5+LnXaNSAYJ43xhE0jRHgwOnXxJlp7iSKDKimyoAWUGYmuiKyCgkr2d4k1wt9EO
         YeRCljv5RApTxUh+nGri6M+XE1XiTIQfpyZNyumd78UvJI5YzvSpzOMuMnQ8T4oeu/7x
         xzGOmMvFRD2AvP1PXvKGerZuxw11tsnOalhI3QvPsPkcBvdT2BvSXWjKG8RMHDB5SkAx
         i26UBRvkdzFCEVK3oF+w+NIFTJYDPLtRe4oQfx2/DFCBz3SXrKXF0AfVA3M9yQHYPmF7
         gSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tye7LrQ4gNYOB2WmBMU3D2E2j9Fo/YYB1XWy/GBCLfI=;
        fh=roLbNjPXaVOM7z/aURKTxEzk7No3LiPkzQe7st2DpZ8=;
        b=Bq2gA+gp/00Zyzb+jn1wKjTPdhzRoGD3dBv9EmH2c3MZq/XkNP6v0hNNqCqqJAceqx
         Ps8RkzFiXjaJEaMYzH3EMj/Ytw0jlP5z2SUS/Ei972S+WToD9hGfkE80DUUBhbomh3NH
         O/fmfK3DkaOru8s/c1tiWjULJnozO0fFlm2xsDltRwfZL9rBudJ3P3lfIkzJELg4KGew
         wnrLbUBAyVHoAo+K14N6X42l8GM9vW2q47jZwAd2OEXGn5D2FwHnOUUQVYsjtX2TVp7Y
         Z+Ys95Xzdh2942dEjKUiADVUkp+qmv874sSyo7pCTQzXWMUq90w9LaAcBBEgHVznVDaM
         OvnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213574; x=1795818374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tye7LrQ4gNYOB2WmBMU3D2E2j9Fo/YYB1XWy/GBCLfI=;
        b=j3mZjb1kO6H0mL3bzn6Xjf/ysp/IjwU1PXPYeNPXZBqIe1cpRmCZTskCW83KGieb4b
         ximN4i7a0auok0eVqJPGV126AXIpMRJanH0TQYao24LNm2p3nTFxc+ZfsXzDELM9AiBL
         DuqKRczUDUDulGpnU5hmqYyL4lQrBvgUJbI8aQMm+veQrTheZBXexfeD6U7h1dM2+LGD
         0KCr+SrlW19veEXwLgA2PFf+hrVqJCLTMsnsirtpPIqYA+40Wn0lcV6X8f3KMu7rzKa8
         E3rMwsbrBOKLJf6tB1VA0qKeKnzSyAygF1xHBuA/qL/8bxQmIpCSi6aRHQTAJ8PuagNJ
         0RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213574; x=1795818374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tye7LrQ4gNYOB2WmBMU3D2E2j9Fo/YYB1XWy/GBCLfI=;
        b=1kkq64Cw76yJ2Ia35ua+mmLjn+QbCdUZ17zTDFHvoiQOyz0qJw5b8hwXpyp9WIujSj
         GXHLzlFk82VtWIIjWjPjnp1T8OpzCn9gtbPSUa9m5mUOZlwoUdl9GkgEQ8eMoOPVB2FG
         yi/vrBZ9ALo3Op0xovHfANGXuQEa8kPH/jVhrIJ6VFNNfHCBU98fE41dsdR1B3AiG2OD
         rrlO50ciYLMfZuqFVxhwxXB+jNjaEQvHfyZYwNk6Z4aWScj/SrR06RVajmhU7iZppdXV
         njvjmF3U9MCd6Pgvzb9jzLRaljyCwDVLLbvC89H5GfX0rFFYyiKzLm5/VpDMrxH7veDp
         0izA==
X-Forwarded-Encrypted: i=1; AL+hErF/ALxGcQ9+8dI6WS27G9PfSxBiI8K9XOFpRmNYpv6EGxgfumkd7HvAZ1Z0xiEThcZAzBu1N71IS1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z90DHUbwuokMaoNOCQ160WxWVEL12zuFd/CJibsNmmqymp2PhrQ
	JV6fXTAVlcNE/AxhRUkWvZ8WehlZwi3Uc7ziPE1pkWUkfSu1ADYqrh964katmsSQ5lkn67LNrrc
	Oi/C7XmrflHOOitcjqGQ/QJRSWVghDaPkgmwKQElZ
X-Gm-Gg: AYBFou2fhjCwd8wsZg0RQuxiyp6sZxogIJjCLDJRCqw58t+A/FVi+bj8BP/Y68dbPZK
	M53uZ5kIvxj9wwXDjVKDmJuonq4xWn5A0zmPUsX+DrBa06KsJ5AWbTUWOfIJE9Kldm/HNCk6kZj
	4bXi2y0lFV7nqvLLr7lQwO0t9kv9vFj+YLWbPFwrnPr/TXiHakMDCBGWQ3LPJ5UVfW16s75APIv
	MQd9d0oKiUa8cgK9ShnJdLoWO+fX/6f/Av+sZSOFDyXo+outbfeJ5r1BT6ZypzWj8S9yLPDBA3P
	C/BJF9RgNuySFk1xYtmpE3KbCH9v/muK4TI+nE4LkY1+rCSKKdfdLoAq2h4kLzruoAJ8FVDa43R
	CdhF6makq0GQUs7tfhr+YDSHCDnAGMyFeaJqSBo32UUyhurRVLg8AH4rqCegGAUvKF031OQ==
X-Received: by 2002:a05:6808:c1d3:b0:53c:4502:971d with SMTP id
 5614622812f47-5797d6af383mr5058486b6e.36.1795213573342; Fri, 20 Nov 2026
 14:26:13 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net> <20261118-tcpm-soft-reset-sop-v2-1-b6decdc95e66@flipper.net>
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-1-b6decdc95e66@flipper.net>
From: RD Babiera <rdbabiera@google.com>
Date: Fri, 20 Nov 2026 14:26:02 -0800
X-Gm-Features: Aa3M54oI-5EGpqjWcL7_ouoCleZ14wJ8wiVioJZkDAZdFUGMZJh-W31xizK4Ug4
Message-ID: <CALzBnUHZXuV68o=Y6aDAbG2b=u98aNJXvsP0fi8ARArpUPupBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: tcpm: Keep the Soft_Reset target apart
 from the VDM one
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

Thanks for submitting fixes here. I'll have time to review over the next
two weeks.

On Tue, Nov 17, 2026 at 11:27=E2=80=AFPM Alexey Charkov <alchark@flipper.ne=
t> wrote:
>
> tx_sop_type holds the SOP* of the VDM being sent, for its retries, and
> SOFT_RESET_SEND also reads it to tell a Soft_Reset for the cable plug,
> after a VCONN Swap, from one for the port partner. Nothing sets it back
> after a VDM, so once a VDM has gone to the cable plug, such as Discover
> Identity on SOP' before the first contract, every Soft_Reset meant for
> the port partner goes to the cable plug instead. The cable plug accepts
> it and the port goes back to its ready state, but the port partner never
> sees the Soft_Reset: a source whose Source_Capabilities got Not_Supported
> is then left without a contract. The VCONN Swap, in turn, overwrites the
> SOP* of a VDM that may still be pending. This left a FUSB302B-based
> source without a contract until it was unplugged, after its partner
> missed a message following Discover Identity to an e-marked cable.
>
> Keep one target per context: vdm_sop_type for the VDM and its retries,
> and soft_reset_sop_type for the next Soft_Reset. Point the latter at the
> cable plug only for the VCONN Swap, only once, and back at SOP whenever
> the protocol layer starts over or a Soft_Reset of the port partner
> starts, along with the SOP' MessageID counters.
>
> Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to so=
p'")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Reviewed-by: RD Babiera <rdbabiera@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>

Best,
RD
