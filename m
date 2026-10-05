Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B747255F
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194654; cv=pass; b=Abn3L9pPcz2V3XJqrv9GkRsZydq0ItM4B1yT8KynQMckuXW11NyrxLs77xUheBbpGHNj1fVORue1BqfRtjmzSJnSnZkhX32kdEkN8lHEjyD3UhgX8hs6az86poHip1u5chrdH3pQooxENGHCdxKbcAzc3l9tFsKhearca4gvwik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194654; c=relaxed/simple;
	bh=k2spEhPKKDs1hsoa0+BsiKrY1mHQ2Y7FvSFpHY4YUxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQ2ZrHTiD9h9nwKONKczgCx9Wx3k1G3bDa+ChTxo5yFs+AthgA9fVz2tsEpY8nyRfiePO7f2fO/tehE3IvrLY5xyb3JPtzLPUxqUYM2P02SYFyg3lOSoaDirCTz6X580XeSnZC7/mIIb/e8RA/h8IMzZWjy8s463DxReUr5t1qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkX5UsVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHHL/Th1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkX5UsVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHHL/Th1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xQXd1502290
	for <linux-usb@vger.kernel.org>; Mon, 5 Oct 2026 10:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=; b=XkX5UsVyg1u3Q0GZ
	KYC0Jwvkvw7s8pazgeqorwlp/VselmEAkfKgWvnWkLPezyLE2Kqr0/xmwc2P/mC8
	Cc+k9tgI/m56FIVgPauEGISOam4c7WOJF/njkInawNRxsCD3A2rcKXonm9r8yV6h
	PFuFwcMKS1CPxe5vsQk9K4Dpyd3Tpd0jQNDvV7gCrdFeU55xbiP1YMgdK3BbP5Ko
	8b0+t+NjBy1T9iLZHEbycfK3GF51lFlhB4Fy/CxpwBJnp0Oq+PLKofgV7juxTzKZ
	e1YrwottOZOGhmd96nDWHLdkr0g35ZKQOIoSoRZ77dIn2oXzk+OkGqAvKFm8jpJL
	VCQTXQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgysmr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 10:04:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-895241d7405so17709267b3.2
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 03:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791194649; cv=none;
        d=google.com; s=arc-20260327;
        b=YaM8UipOC4oPxVlzeLPuH91JuT6E7a178jp3kLjUfrrRqr4nNwEZ0sgI+IDBBsWh90
         CUo+M0FB2AMhwi64JV+BECVxgSOI64oCGH01V6pXuwICAqLjZtjSNUNE1358Vcx5hE1j
         7vrnOM2KVwv4FXnT6oNXjjlwzwjDQW++mFbBLGU6U5JAHzGoyxO7v9ip00mY/0WTtmWl
         5C0QEvQqSEKg9NuwfTfGznOxPvLg0gt84LUBUNIkQ9R3U4URWPJOLk2Xj0J9GuwMZLsP
         fbgoXwB4kLyZKU/oS/kFBkAdzvRjRXfJdZ+R5+YwhUsaq2wdNZ85qF2ANuR2cyvHHk18
         WLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=;
        fh=zxTh96qOvqUhmQEaaqybyLfhpAh+ObcG5wOkpgGeYJE=;
        b=eOqMWxammVE00a5aXdi659hWwlg8/zTCgrTPP23p01y3G5+jDzwbA6ZH3yS0GA233N
         Z7tCnHJN6tX6fpoN+1s6EX3vF25YmgSRcYS5d1dWucpTpImaA5ZYSjUGBsiqG6wobKMc
         oOuVYlTlrF4WEB54/ZLmZXf4IYyG/Ub5rFWzFcNh3pE32VN4A4xhMT+bIf5EGscofGoq
         wPiOb06s8LwOGSA1yq8VR/YJajKlirFdp3vh0cvSEAoO7UFLX5N4yO62z+ytUxJcw8Hk
         B2f2YUgbq9FpIguzu31v78q7dOH0K1pi3vKlbpk3LdnI2HUldIqJExo+Q9fojCUIYDaB
         lQQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791194649; x=1791799449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=;
        b=SHHL/Th1VwxGCqYvg5m4lEwQPab1n7yG93x3r+e8toSNy+udiN1BCZwDJwSNP1tAhV
         dma0eNfCzYjEIxw8csc08dnPhmsOIgw8CplT1ZJA7GBH1Vz7R/OAeFxuHV30qizUh9BY
         dUb1vbA9eno+n5i5T5hAul549V30pBeqB63P+qnq227kCldXCTdVa/pi6TyCGr9H2wO5
         ttM2ASNj/tbUene8gbXYinwZIXPNCpqiz6vX4iSN1lBdOzJFZE7rdTPoAVq//ESg4G1g
         BszMaFp9Tae2wqbR0y5dj4TQ+Uxr2dPI82/0mq6KhqCsB2EoG2SKW+Waspa7hi2ZKbHK
         VW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194649; x=1791799449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=;
        b=Ckg9x1JWPlEnxMQZDiHvcGslhcT2XUpXUjNahyn2+HZURUWKjQEKjOyIOWeBb+1PBL
         RRzNPn+l/tQxuSvbDeMW4c+O2zeZISWkkYaG/agupRjiE+ceD3McVsY9ZHYw/aLr9c7d
         yVEwBWJ7ean3JLYbCNG3kOiqWdXktXouE/dwGKvG/qpk45Ny7mxqP0ztQy2JSkKZosR+
         gTx76hbU9UCAzx6ijqd0LlBZ5DJZ6omX2jdRPI09MC5QeH0O1OXstUgIryQn2U1fVfPU
         wPYfOGQwug9RSpXQ2l3Y4pAK6rNuVbEyvjrRQCmxvel9xMXulFTRWnV0NIupmJYQCsKa
         nrgw==
X-Forwarded-Encrypted: i=1; AKwUvBzHyH3arLD901IGA4PoVCBAMHETplJE/QiQISa1LAdNDfr8zVx5cH2KgQPYrGverztVoFpXw6fS/qk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHXN9QCCelS1pSjzl8V2l6vx1dzq98TL7tqmys0WJ1BEm04Pdq
	I54yEpO8TfowzPKwJLt6zqSXT1zg15gyyI2iXo8Ap2Ny+zUN8i7mZcB0g+6S533asJRmCh90qZU
	Jz8qVP++MXfjUFojM7eWQz+jFmSco8C7ZB1LxVMXpk02xxbmhEwe9Iavm/pAtSff6yKT12istax
	O523QIoF3Bfqve01HvpEuclfuCFc2eewqJou1ftYme2uLGJ+VS3mY=
X-Gm-Gg: AYBFou0r0nfajFjw+fb4Vanavr/g7hS7ipI/Ad14h615fznvBbGYhOzrvRfNyZkHq3I
	cwHznLVWcKSdNuu4v6FGszULrClwQnEzRgpR8bnfoF9n9pFGlUUyOGgp/4sQrP7HNgXdIYypZfJ
	yhmYCBsk2EsQ0XtlAXgALX4xoByK76PUCa7wI2/4fJS9ug/Woti7yWZjUInDI=
X-Received: by 2002:a05:690e:4808:b0:674:1cc0:3523 with SMTP id 956f58d0204a3-677abe3a67cmr2176026d50.10.1791194648673;
        Mon, 05 Oct 2026 03:04:08 -0700 (PDT)
X-Received: by 2002:a05:690e:4808:b0:674:1cc0:3523 with SMTP id
 956f58d0204a3-677abe3a67cmr2176015d50.10.1791194648059; Mon, 05 Oct 2026
 03:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929092939.1806907-1-uttkarsh.aggarwal@oss.qualcomm.com> <arzNOP4jBd9uqnGv@hu-petche-lv.qualcomm.com>
In-Reply-To: <arzNOP4jBd9uqnGv@hu-petche-lv.qualcomm.com>
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:33:57 +0530
X-Gm-Features: AclHuK9oHSdFJXWHB3qCGwtJHa-TWOaryqpxlOsBriiYH30mtE2nCh7iseTF7SA
Message-ID: <CAHBxaDc+pZ3+04iZsQwABrTEnbcFVi8oD7H5LP1ecyyOqQrziA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Set ucsi->connector before enabling notifications
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Rv30eQv4UgeWroqFheLGWW7x5b-mAuAu
X-Proofpoint-ORIG-GUID: Rv30eQv4UgeWroqFheLGWW7x5b-mAuAu
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac37619 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xu-oKv-mTIZ1_Gn-t1YA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX+l1dbMw9BcHr
 9p7FNcG16h90q8NkWUEmGGkTSMwEyT83uAAPRY7HRanISSrRqJlHADO5l2xBq3s7O2sr/nPpPJR
 YZhXnQ/Z+GWZ/pUqxwmpLW6qM3VlFCByUr0ANhUEdK/x85rS6iu6qt/zSzmvuX18wNk/+UpDzhy
 KzKSuEYKul7hoQfbmG8Apgvu2LGtUqchW5lEPOpupPxMnton5iZAB7UZ9jiLWjXON6H6agkft4p
 R5WftvAQH6pG25X8E8h54mm8TvEKprlkyOgvYdVWuiT0Bh3BG+eV6tq6lGGUItZiFFSw163TP3T
 v5jMV27KeE6spF2K/pAICw3jY6+apop0R/detSKJOaVY1NafMCULeFIcqbycpXnBQmtnlSm61Nq
 Yb9R+84Cfx2GMpQNt3NceQCrmwavi6PToo+gfbH0f20+5z2f+ea/mKrosAEWTnmi/gssCNAZBNr
 t2Ni2x7Y1aQpOlr4HCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX13TVMg9SibLU
 wAoUw0gPLYG6EbUWyPdaXvkCDvXpaSwOI9mH70TJHzWNkbA9XWLBmmE4PHt081ddgnuuYGh0mDI
 uIwHJ+gjWb/JTa3Cca6jfrO9YlvQJgw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039

On Wed, Sep 30, 2026 at 2:20=E2=80=AFPM Peter Chen <peter.chen@oss.qualcomm=
.com> wrote:
>
> On 26-09-29 14:59:39, Uttkarsh Aggarwal wrote:
> > In ucsi_init(), ucsi->connector is assigned only after the
> > UCSI_SET_NOTIFICATION_ENABLE command completes. But once that command
> > is sent, the PPM is free to raise a connector change notification at
> > any time, which is handled through:
> >
> >     ucsi_notify_common() -> ucsi_connector_change()
> >
> > ucsi_connector_change() indexes into ucsi->connector to get the
> > connector and schedule its work item. If this notification arrives
> > before ucsi_init() reaches the "ucsi->connector =3D connector;" line,
> > ucsi->connector is still NULL and the driver crashes dereferencing it.
> >
> > Fix this by setting ucsi->connector right after the connectors are
> > registered, before notifications are enabled, so it is always valid
> > by the time a connector change event can be delivered. Also clear
> > ucsi->connector in the err_unregister path so it isn't left pointing
> > at freed memory if a later step in ucsi_init() fails.
> >
> > Fixes: 0482c34ec6f8 ("usb: ucsi: Fix ucsi->connector race")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
>
> Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
>
> It is better cc the one who gave you the comment :)
>
> Peter
> > ---
> > Changes in v2:
> >  - Add Fixes tag pointing to 0482c34ec6f8 ("usb: ucsi: Fix ucsi->connec=
tor race").
> >  - Add Cc: stable@vger.kernel.org.
> >  - Link to v1: https://lore.kernel.org/all/20260923060434.2599545-1-utt=
karsh.aggarwal@oss.qualcomm.com/
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index bef3f9b71d71..8f7b73a9f4f4 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -2122,6 +2122,14 @@ static int ucsi_init(struct ucsi *ucsi)
> >                       goto err_unregister;
> >       }
> >
> > +     /*
> > +      * Set ucsi->connector before enabling notifications. A connector
> > +      * change event can be handled as soon as the notifications are
> > +      * enabled below, and ucsi_connector_change() indexes into
> > +      * ucsi->connector, so it must not be NULL at that point.
> > +      */
> > +     ucsi->connector =3D connector;
> > +
> >       /* Enable all supported notifications */
> >       ntfy =3D ucsi_get_supported_notifications(ucsi);
> >       command =3D UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> > @@ -2129,7 +2137,6 @@ static int ucsi_init(struct ucsi *ucsi)
> >       if (ret < 0)
> >               goto err_unregister;
> >
> > -     ucsi->connector =3D connector;
> >       ucsi->ntfy =3D ntfy;
> >
> >       mutex_lock(&ucsi->ppm_lock);
> > @@ -2143,6 +2150,7 @@ static int ucsi_init(struct ucsi *ucsi)
> >       return 0;
> >
> >  err_unregister:
> > +     ucsi->connector =3D NULL;
> >       for (con =3D connector; con->port; con++)
> >               ucsi_unregister_port(con);
> >       for (i =3D 0; i < ucsi->cap.num_connectors; i++)
> > --
> > 2.34.1
> >
> >
>
> --
>
> Thanks,
> Peter Chen

Sure, Peter. I will take care of it. Thanks for the review.

Thanks,
Uttkarsh
