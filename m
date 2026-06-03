Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3237F007
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481739; cv=pass; b=sS564HTUJeVMgofsc7lZtxtqwqgYFAEkkkSpUFIno/4kZNepGMj3/APFfj04egxs+u3zm0XKagSZzVWl5JitdhCa/DOppOoBKNrlXnpeL6j6yCNKxqY3rfo8v5yIlrKFhHL/p52WVcKr2dl0EKfVv9WOzWg4QQZ3MyMVgBjOF/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481739; c=relaxed/simple;
	bh=ImyaRmLghxFwQsTJnShE9IsVAyUjBEQQdEnQ0b9Byos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhH1h2IcEwi1qU2JnKZIMh4XnTrRIMWMqSBcRO8ZOdivI/Ad7+iGT3xQP+sA1pATLNMv7+FPQc3MXIhEBHQ+fB1+6FOLLjo1HuExF3uGdSHGnXF7GoMdhceRFiQmbAyJ6abhCyhxsfWf8CBh6DsZLIBpJBPScw2BYSr/YULErg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV/ZBQBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EatizQkV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/ZBQBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EatizQkV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395qJf780719
	for <linux-usb@vger.kernel.org>; Wed, 3 Jun 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=; b=RV/ZBQBW1Gz7WB7g
	C36gOhNhdL+lLAmqQlpap6noJbbxHcrt5EIxi83XQdvwRajDeMt1YFcY+H3mGLXT
	9XatmhW6r/yTEhIszMkIGbMkNaO+fyhhVMzwIGL7bcpZ9ReeDX5jEpLuRbcstKSQ
	YhnhXEg7Vp0lJ0rPhBLgdWq78t4NPOsw/LugKMhQPSnThw01mcIgA9my3R2A/CFD
	SMxSsEToum0RhiBvscPxkFsFs1FxqjfwWOQrc5lvshnJbrHXt0WtI8psq0P5nZyX
	LEs1LzosAOE89oi/Bezr5wGe+ccK2iGDRjqfsqOH5hQOImzaSe/nMOk3SRXe02I+
	vbBXAg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0a24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 10:15:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccdfe1ff26so85824806d6.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 03:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481735; cv=none;
        d=google.com; s=arc-20240605;
        b=kKvSmfbEWuyMgceX5F2ucJsBaCI8HK3g0M5mS1LU9CFQZCexaAOYu23AEa4HDDvIFr
         QMQY5UcVLrwroLNft3vwcLTzbg/fBFN5SMlye338d8EX5GQ0FPm16N00BFa4lF4/72O/
         iQRg9OALq2qoVEelu5/aR/iLy7xhSWSYm2A5cKGMaOBkxj0yIcybfVBIflVa5dOUSYdl
         wl5rTmLgl84aZcXahuOIaVuQ6l9cgV/kW1LjkMgb/fk0srlKrxMqHl6LA+sNnBcre+pP
         UpXjU9a02pAMhlhLDPLPQANR64iPQR2qfullchNB16toppUguE0bO+2YbZOugMpzWidi
         sG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        fh=MpwXmTy0Y8t7vSnzU0PX69e7kKCUh/MPtJmbOPWIb2g=;
        b=N88jPq6++8HHu0UyDlF5/vZwQ8S4B6D3UaLeQc7wZcGmRepkJexw9rXMI4BMm1pj+w
         hB1PkKVOyWQ6quu/LpIL6bPM1rR1iTeUKqhg5mtzIytxRIOjhexoI79BmP9/dMcQ7p2q
         ZvHC3oGCdzjCRymnnE/djEf4NnMnE0bAtQRo2Ujzk3zed1I8cLCGkCliOuNntMINjhID
         /kIf+AmK71Qzyj9U82Xsiy1iABFGuMllrcuZXjyHUFRUmFmx9uOyI2fCfv2T4UHj3RyP
         knInJJVLEGpu2KqWAufALOzYxy9H0QaOXgSuJqu/d14u0jx8rBHLw26ajr+DVZxHSgl3
         SCrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481735; x=1781086535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=EatizQkVu7YoBqs4qPwuLBDMEpEcTxnuqziYKDt0bPh9McXDPanapbct+i5amdkN3F
         Jajg9ZgkfC1/+jaUiPBGfN6wi6ZRDxc28EKDs9Erk02sliQ3TkNYnj7U7vizOnqwEO/C
         YL+eKxv0jnupOirDhq3mpKzt7RP7ts656r0cFVfxymb9MP41VbGf3AYdNhieLGJXf/ze
         2xt13struA3s6xht/UE42oQzJerwyunWlc0ifNJ92XwPKl20aQ5CEi/YveJoz9H6LDTW
         MuDA1GKISMtvP/l6g9fsxaGNmZ0xSQtsPgWMp1+c/FBoZyfq1TPeGfZiov1KEMegbzp0
         3nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481735; x=1781086535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=JbR8tjwK743C3tzr3YMAcVthkjNWAm3QAbsLXpFOjmmj4U/YRWYrtUvq0/D76VfMjD
         JQqT9RyQmd9KfzBTqznaX95ZxXxEWOCfv0DMVJOHXdw841yNzWz1+hqAmSDgN6saZeg/
         wciV4usgwXe35TRzmGX5pYhrPoakrnNHcBgKNEW7Ct8VDP3DxxscMaHvYatL0FarzJgD
         MicmVXDEbsYqQcl8896vI3gzsuN5eB3nSICzskxUi73C/B6+c8ilKGkJQrjWzaiSAKDP
         ZrnVljMUelLLknZ6jJm3OpSPgVtepHNm/CUFqzcX5NX43dXzzOFCvvUKLP22xCSXf5uz
         7zDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zPlBtZW4lrePiTLYB8uB1gYyuOBrtGXEv2cZpQnLs1h+nHdf2HWnS9TbGV/597TV2Vre9OTF4WKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeuDgrpQQM8ywQlhHqYM3J2vUmecTaaaqubmIRYh3uM5pHR+vr
	rCTy9WZyBOjgD2vdYiugoD7IjNC+uOd3VXKp2pfKGOR29aJR3Fu7GOJ+beUwrXIvyOcOK2+KxfI
	0t7CrDdR5/DU7V4/FscJ2cjBPrfs11OONoueSL+eS/ajRli3B/1kz9iqXxKh5KuAUxboT0M/RQf
	4U7vJOVQNAcy7P8Eu1s45Sj25MncipJQmjYbEYvA==
X-Gm-Gg: Acq92OFdRUZKui3o4T0bO4JPZOKS+G1mYy4LkC6ewbUQCJg+JgEwN2c+NszeXrYhzow
	hgSpQAE4xVnPpvqz4sm96JnJDpn/oygkb/A7MW2004d7ovpEjRL/xMogvAlWFmAkZgaPKRMKxXf
	p6nYMibGyoPAAhu0XfHC5xZqrH/43VqwTAyzNEHdAgRXNnhTq5/7Pzm1coKy/uNNtkXC1tK2bRR
	VPXJJUtwG+pcckn
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id 6a1803df08f44-8cecdc03682mr27951586d6.9.1780481734728;
        Wed, 03 Jun 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951226d6.9.1780481734358; Wed, 03 Jun 2026
 03:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com> <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:23 +0200
X-Gm-Features: AVHnY4J4K5UzPNs1yW8q3X0LoIQq3c8UfPuD4kHDjf5PzjApCRf1PSF1rlsmtoU
Message-ID: <CAPx+jO9iJBx6Yifap55NOhn5YZk8Bbwpnk+aeH+0PgYuMxke1Q@mail.gmail.com>
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NNbzmM9k-17YGN_N8ib2zxcQALlGZs3u
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a1ffec7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: NNbzmM9k-17YGN_N8ib2zxcQALlGZs3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXwpYhUpT7lRN5
 4G/AdRB3NIBRTfQ5bI77oTjJXwnV9Y3E2+JXuw+CZjLkf4kPdIzOnsjJ8rKq6MTCkegcAPFMPVT
 Dcw2XA0eiTr/HSWdc/clKKdU+AZK/AHNnkkYbg7cOtVIhDvYWa+TskpmrFMc5l7MNcF8GyNYiQz
 WiqsO7vitmTyijcOIcJWzSCI0KPV1JS0FTJ2Ohgp7nP78XqMyeekk4IerOQC/AVwvTbl4vti0z6
 ULChqs2MGATpcHtKMlf4WLijKXlKCK7JPsyDFhBks0+1to26blpnhzvi8Ayl3z+E4WKkP6qK0Ei
 1y7zsE8glEgx2bSD3EOyIE4LzUOeynpFzd5yBBkPbeJD77zJIY/5eWK4EH4sQPLJg6+goVLsNsJ
 DvlBYQu6YYNFRl+/MwgOc6qm6d0Ln0w9oyasQF6K880+G8m/ap+c0yTInTatqek4KWRyo4XA5V3
 tt3LJq9qFFUygCOyoYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097

On Thu, May 21, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> for_each_child_of_node_scoped() decrements the reference count of the
> nod after each iteration. Assigning it without incrementing the refcount
> to a dynamically allocated platform device will result in a double put
> in platform_device_release(). Add the missing call to of_node_get().
>
> Cc: stable@vger.kernel.org
> Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each O=
F child loop")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d=
4eb5168942a893c 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D np;
> +                       pd_pdev->dev.of_node =3D of_node_get(np);
>                         pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
>
>                         ret =3D platform_device_add(pd_pdev);
>
> --
> 2.47.3
