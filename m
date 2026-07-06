Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F239B960
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333832; cv=pass; b=JPw77hazOJ8iLKjZOilIJGJX9tXvJOH94AkAShR6xgvS+45vKrouZaUnPCqJTXlTDRiKom8gIqtJVZj47taD2XF0Gkpp2H8LIoBrFrSqTxYl43b33oz4ysVnveTWNDF3OdO1TNi5hhMRMV2FLqK3m9afpu212BcSBXkgsdMxcGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333832; c=relaxed/simple;
	bh=6Ayca8qLGPKxUsIFjQxpWalPBGZaUIXDglEzs9D7DBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z76MaM3eHZszoRaylHmA43Le8dJn9qw4rv9luAc/XrNftqHH4BHPHObbFJGXap8jk2iz7Tet0T+YscE7HnNeuFjftKSuf6OYNf5TkWAU8kix62hVXObOB1+acbQb43Za3pTSMdC1B2AfBYZvDFur8JViz7lP8G5lI2Q4WL2J+kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EX4qlknn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpsGMuZC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EX4qlknn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpsGMuZC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669GsFK160050
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3UbmA7EX72PxXWjZzRHV5fuh/MSA7OywU2pO5D8f/g=; b=EX4qlknn+baYDBNq
	mqFMYeYf0Sl3nQuUHxNsxaxCJkg5UfYzdlRYDERlLr8WBuvl/KuUx6Qf24ztD3tU
	vHxEpXNxkeiM73z2JX4Fh9GJEQe0ZplXO7XmuVI1zbmMaQHExO96I7jK8yH+th9f
	xq/9mG8Y7IisvKHuUuC3/Jqr7Z+Jq18eBVO7ZhkkL/Z5GeXYYAad4uRfwXivMBea
	bdFRXFto5FIAHSgCUiKDPbt3SX/uFbRGIyV1s4u0x2N/KQ2o/+UrwkTJ1Jy7UXwt
	lPhp+SLDROr6F10RheypMP8DNZ4SHc9woUXgvb29U7Ocug/Qlc+oTobc4Cf29Wvp
	/aJUoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 10:30:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so60770391cf.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 03:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783333829; cv=none;
        d=google.com; s=arc-20260327;
        b=AN78XhpDhy22ewX98aIC/PmF7vzHKZPhRCPa7ETAh6EhHE3a9HXlcHN0XIMGYspWa2
         srzlCByMyy1lScGEbNj1cRq1E31tR9TkQMffBsHbuu3mdMyr5HZDe0Z9PwUqywlwD6N0
         YhKtpi4KRQBBQQ4r/ojYRvUr+5SMQbPkLTTrLbCx1Rhoh96eQQ0KjZJEHXNIJeyKvYhp
         Kk6PxUTYSv0zc4+SHdd0xWJfROuRnCNp5gZZVd6fy8DuwCkDvxW8vpOoWLEWksPoetGa
         GLHdu/kDFnUaFOd5LH4/a0L78C+yOWU3BNS413BNTOLWcgoFAYmLCU7WLXUp+q1pb9F+
         RWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3UbmA7EX72PxXWjZzRHV5fuh/MSA7OywU2pO5D8f/g=;
        fh=rLROKZK4MnQatwxIyaOYB3IciIzTvW4Mc5ejYGRxEGA=;
        b=SoYCMZIVra1KxjmikACLns7Gjth58nDnpdldSClZpJQ1+KxNPGQxZUJXrMBQdzaCa9
         DTSeweuhQ/aa2//K+7juvHpHdFj2k3W1obVeClLUGkLd+skhq96/cShmfS3QWIeFVCfy
         67vw1T5Z0ZTo9wyTGtbsdGk50FMIzjNcOQQDMN0p2Fdxn+WNwlinN6WgHsYmPZfQC6kb
         7uYnqdqNgedHwOAR7fTdz6lMrqlD7RKEuwGxKSt94Zcx26zWbPQ90LogV5E8Eb97TQkg
         aMkZ2Ji/OazqVv2fgQCxtcL3oEaEkz3OtjI3guuM3Rhl3m0/6VbUz2gDqapdwrMVnWVH
         E5dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333829; x=1783938629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3UbmA7EX72PxXWjZzRHV5fuh/MSA7OywU2pO5D8f/g=;
        b=BpsGMuZCbxUcrogq5ioEsKuaxg6hmGzUGlAtkxOYHpuAtpqx1+kWG6VGbq0RW3Hw8N
         xL5UcwQ2swnWcRsHRjfwesVv0PKTSGVqT5+l5GIOxkQcJkIQRFm2C4v0KK7VQqYnKzwM
         CIgPGBXX8CNzuSPIPCEfF2IylPAarcoCach1zE4lTkRUd328kdEEAwOSsXXNgY85F4PA
         fh8AbVSknlf3Ox5ij7YQOuOEfKUCF+pGgk1IQdXd0IRrLizTv37iPfMSw2Ib8o/sTWab
         wEBe1m4rb74/Vxgzx4NGi0/SblF2/jXohMk1ErkgujQhqW1peUhD34yRyvSE0i2epVlv
         gv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333829; x=1783938629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3UbmA7EX72PxXWjZzRHV5fuh/MSA7OywU2pO5D8f/g=;
        b=AeUyY1JwS1bWoZZh5V9gt3vaR82vf/Z8AMbFqkGdvnEVbzOoBZbUXcmEhff46X7R/y
         SrE4fZJYqkxzv5BCnY2fhq/iSfeZcmcENxUJ4xPawA7kWPlkPkAdzpfMb3TjdeFyNW4q
         Nmw+DbStZ00YCKhHFTml8gLPLdI6nyrh4NJltxfKK6XkVHe8myYBweXFGNltTXgFTDQ2
         MJoxSicPPWAG/lD3MuHaWvy4nwry70MIeESul24umjqNZB0Vk+PezMZ4kyF4ysF7cOh1
         QGcbbj+e/6eH/SrmwTIjwx+Tdq3PJtVs1z+erIqpCUWzBDyEqpTHm+b9Qhs3p2QByC4c
         siWA==
X-Forwarded-Encrypted: i=1; AHgh+RpcAT4dSKRQrLDQ+7LbDEQMjmtMOcrdDqvomNjos+Pc5GEJ9SQuvWBEfo98ZEyyVLwyyRzi2zQvlNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjvtaL6mgwR1Uv49kRSeoCmgVKbU3yTvw4ka89eD1UxtnxN5y
	4qSLM9Q+fH9pSXWug5ZWK0sLZ7YIMJxa49/a24NtHvs0852uOL1HkHq77qji4H2SGJVZp3My5su
	DQLB52A25t257HlZ1wWHkaxj1hgL6P0hGJUfMaAGxby6oNlWJJRfii5BpyzsvRr2iQrPacto1MN
	bMZCTO6YKrfT8zgynNUkd7zd0ifAxxcRFq94qTNQ==
X-Gm-Gg: AfdE7ckxrpyjL+Ubd8FOY1VSCSF9aXVXmNiHXxx1++NnGzI469VzuqpyGXGmoXLGBmt
	4nXro4U1pfKMKNvC7VA72dcYBVHl3iEjB8/CNWGAV+SVHSUF2GPHPgrlLvFIN6aO4vdDF5Hu82/
	DZcK8tYFYphjzUSZ1pjhpbRtnIhoaMjmNAWj0dgRihPACSyCzTMhCY+1LRjQLVnQ4Rkqeg
X-Received: by 2002:ac8:5d14:0:b0:514:9ece:a15a with SMTP id d75a77b69052e-51c4c2d1bf5mr140999131cf.45.1783333829212;
        Mon, 06 Jul 2026 03:30:29 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:514:9ece:a15a with SMTP id
 d75a77b69052e-51c4c2d1bf5mr140998741cf.45.1783333828803; Mon, 06 Jul 2026
 03:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776080528.git.sean@starlabs.systems> <95a293902585bd43c6857b79bdcdb8be692ff687.1776080528.git.sean@starlabs.systems>
In-Reply-To: <95a293902585bd43c6857b79bdcdb8be692ff687.1776080528.git.sean@starlabs.systems>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:30:18 +0200
X-Gm-Features: AVVi8CdB5MkOPhKcT6X0F1vQT7djuSsQ5aVdQBtoqYS6goKo_LfVx_GqnZHDEx8
Message-ID: <CAPx+jO8aDe2MP_2B1zu7KP6WWj0igvP9u5tpoqMLSyixEjPeBQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rtsx_usb: hold runtime PM during transfers
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Ricky Wu <ricky_wu@realtek.com>,
        Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: qmcUCfUWWuYQpLwPx1_51QQrIo0mFnGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX00TWj4bsn7tT
 PfTIkMNbGddfRa1NiIRyScK+QGFNL8kPSW/apFsfOp0p0gOCLq4TNrIhvgH7H+MiqSZMJaNh80y
 kLDuJ31VdjfQ2mSlLpqBHRD8baEJV5kyovkWdh4Lb85qYtH7xd224hfBx5wJlS5lPSRbbpulUOP
 d0rgbqLZ8pENucArOhFWPfzKq/Rnb0CmmQX/Q1oc5k6ZlmTtowDgFtDlvm1LhuxEjbHKJuxU21I
 9+6MwsOKSP/NjUGlVO3ltCOz93DKmqvQ/fcivACkRQLckPuqq1VKG1+Wuxpg/8hHRMPjjVYcqvh
 e8aB0YgAP6nf+X+IBEBhiuNQUTKQGMVbhzVjm/kQTb2ZHzHAX5eFs484NlRvkOEbxc2MOaci5CN
 dUiI/NIst122OUyLlad67tEyZyjQ7SCA3fv2MO5Ma1EwyMcfH8tEt0E6GboZD5ozeoq2Eyv5Gd5
 xhRCYWe0gAxARKAuBKw==
X-Proofpoint-ORIG-GUID: qmcUCfUWWuYQpLwPx1_51QQrIo0mFnGH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX5O5SKTKlfWn9
 od9d0wPxot56ungO2u0gtW42LStzv29f7vvQ3kKFEBVXrtDO6ItmmvTc3ZE575esI4b2piXnc5z
 WZSS3qPoBr9SPEtTdoyIIXc7eeN0iIQ=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b83c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=DU1fBQQ00hOWpVFU5jsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060105

On Mon, Apr 13, 2026 at 1:42=E2=80=AFPM Sean Rhodes <sean@starlabs.systems>=
 wrote:
>
> Hold a runtime-PM reference across bulk transfers, and mark the device
> busy afterwards.
>
> When runtime PM is already in progress (e.g. from rtsx_usb_suspend()),

What do you mean by "runtime PM is already in progress"? Is the device
in the process of being runtime resumed?

> avoid forcing a runtime resume from within the PM path by using
> usb_autopm_get_interface_no_resume() unless the interface is already
> runtime-suspended.
>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  drivers/misc/cardreader/rtsx_usb.c | 38 ++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader=
/rtsx_usb.c
> index f65acf4d1164..c8badd0db87b 100644
> --- a/drivers/misc/cardreader/rtsx_usb.c
> +++ b/drivers/misc/cardreader/rtsx_usb.c
> @@ -12,6 +12,7 @@
>  #include <linux/usb.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/core.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/rtsx_usb.h>
>
>  static int polling_pipe =3D 1;
> @@ -65,19 +66,42 @@ static int rtsx_usb_bulk_transfer_sglist(struct rtsx_=
ucr *ucr,
>  }
>
>  int rtsx_usb_transfer_data(struct rtsx_ucr *ucr, unsigned int pipe,
> -                             void *buf, unsigned int len, int num_sg,
> -                             unsigned int *act_len, int timeout)
> +                                     void *buf, unsigned int len, int nu=
m_sg,
> +                                     unsigned int *act_len, int timeout)
>  {
> +       int ret;
> +       struct device *dev =3D &ucr->pusb_intf->dev;
> +
>         if (timeout < 600)
>                 timeout =3D 600;
>
> +       /*
> +        * During runtime suspend/resume callbacks, avoid forcing a runti=
me resume
> +        * from within the PM path. The device is still active when

Sorry, but I don't understand the above. Can you please elaborate?

> +        * rtsx_usb_suspend() runs, but usb_autopm_get_interface() can bl=
ock when
> +        * runtime PM is already in progress.
> +        */
> +       if (pm_runtime_status_suspended(dev)) {

This looks odd to me. Should it not be the responsibility of the
caller to make sure the device's runtime is resumed before this
function gets called?

> +               ret =3D usb_autopm_get_interface(ucr->pusb_intf);
> +       } else {
> +               usb_autopm_get_interface_no_resume(ucr->pusb_intf);
> +               ret =3D 0;
> +       }
> +       if (ret)
> +               return ret;
> +
>         if (num_sg)
> -               return rtsx_usb_bulk_transfer_sglist(ucr, pipe,
> -                               (struct scatterlist *)buf, num_sg, len, a=
ct_len,
> -                               timeout);
> +               ret =3D rtsx_usb_bulk_transfer_sglist(ucr, pipe,
> +                                                   (struct scatterlist *=
)buf,
> +                                                   num_sg, len, act_len,
> +                                                   timeout);
>         else
> -               return usb_bulk_msg(ucr->pusb_dev, pipe, buf, len, act_le=
n,
> -                               timeout);
> +               ret =3D usb_bulk_msg(ucr->pusb_dev, pipe, buf, len, act_l=
en,
> +                                  timeout);
> +
> +       usb_mark_last_busy(ucr->pusb_dev);
> +       usb_autopm_put_interface(ucr->pusb_intf);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(rtsx_usb_transfer_data);

Kind regards
Uffe
