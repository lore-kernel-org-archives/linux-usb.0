Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D124466B1A
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323203; cv=pass; b=IpcTL97mqv0u+d00rIh9w3zRebiL2l94FOrOxsgQSSBdRhEeA7KH3pfxs97Po8gqZwDjaFkIEODJ7YX6m4xB2p9jyNY7SRVOIfNIGngIGnTUipa5mytSp/f0hw4AP//QxC+4xvax8VpAtbjXMnr7rkm590UnD8KS6cVaIOgGf1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323203; c=relaxed/simple;
	bh=YQpyFzYuFJ7F0ZueHz4NBOojoYTV30GESlmU6P8CuI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=To9gWqy3o8X07DOv/SY9n5pvSrYZw7PcuclayYxFWTHIsOa2gJilbKupHo0uoBaFoLZ31lMfCGNvQGAmWaodxhew2a2RJY6lvw1zNvP5IApNr7qKq7jTapPEmpYRoNhQxZjmdsz/lPUMLwJ7+hlXx2ODf2fYwhHLMI5HNSS/sZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifB/q270; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiCsivRB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifB/q270";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiCsivRB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yff23532135
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=; b=ifB/q270N8HZGNGN
	rrhUgJLb1DTsCo/Q2xbWcEu0faHe7ndbWuYQm7o5h/XtZ3S2lPtTMidKI3tixGEv
	6yNf+nuEDEzkdF39DApd21AfvrHmm3IeA9mtuP09PaSwnaSSY7qqJdL9kyxH3sPI
	IqHE55cmd+Li95koIMYp7VQz3Yo/1fMeYtIiHfjJFebcrgQpzViRxkBGiTIv7Xtg
	TCOvvhuCZrEUwjjGkHFYskBHhIlpSLn3G8NgQ4sokbajPrr45ZMNiF/8PlIyUqGa
	tlD3LdILYI/ulQQxJIA1tVdR1xEy93E0m7XHthJ/Qaat1VJ9/MUif+V1qA0gHdr2
	GfAsFA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kaa6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:00:00 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a352f00e6fso9713527b3.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 01:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790323199; cv=none;
        d=google.com; s=arc-20260327;
        b=F7xt/sIJWUHMzo+NG+Ns/x+2XI+6N87oQG/5BHpdGwlEhuaCRp5NO6NcYX8zZrS2GR
         2Shyk9KgfJkDu+O3mQ8orjzMi887AkSKuav2zIFwHdgn4PYn5Sz54Y1zy1/TUbA4Brg4
         eIZHE7Geav8sAse5cs/SRF+kmoCprOzdZ9u4r9V8uJYNGn75k+xR3dRjx+lc20rcenCt
         Ce48WpYOCaFOt20RPsiVuJbS2Kc/ZaqK7lkgL8lYid9MXJAbYqqcuZeAcw4lA0NVi1ta
         xGzZfFILpvpG9EbHrhCxTzH70HjoQmtXYAxtMz1oVH1OzMyst8TbKgf//KjIHSt8WK4f
         Paew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=;
        fh=2ijbuS4a0pf9hwj0MMYFF9LfVRFxeofDpV45KrUzEO0=;
        b=i5ix3kRDmqVeXDFeX9NFzZERjilEUz+W6oNezUFjOmyPnN6RlaC3ZkwoITXHKbRGR7
         XHtW06mm9tHzp776JB6betmibEd8cschjeSheSUdVqVvNmplhPF3M234Iao4tAw7Luwg
         1bT2fI+g48TkSDWtehxMKJe0F8jmGcKvCRR1F3kUI6FQE1Y5UaRaBFP8tyzeoUA9NyI5
         wCZZVlRHlA35KZUDJqM3WKkDLlthQ9Loy+g27vGTOYbbtvorTpM2nW+8V/4xOwU1hE4i
         +x6qnvi1couMICl2qTGDKCzWpNpL+XxWigpIfsk9jpPdtW9Fnl271J+BYEy2gwmtzeUr
         VfCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790323199; x=1790927999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=;
        b=PiCsivRBXKdUE1h7sdAOdcyhQhJlZt3gqQHadJL78Y1OyD+GeToiEP/4ZKWeAfzke8
         lIc9PayOSzUkkitfZLwNGxa6OfZMG7IFlPWnkHomWBAoVduvaBYYXtm15JFeHhGjLJE1
         0PKlcOfU2ekGv3kszT+BYis0Cq4+7JxDp/2Val+eA/CIyzyXgJqK5V2nUWOE975tJTMW
         2sR3Mlez2C9I2tIDODCTBQI+H1aCBkbnm/mnmVKy2nu1qMxS50050I/3+7F5bZ8hZlwm
         IksdNvWo58JhukS4enZJjXIbvbkWd4zDdpbgX+I5faAY67uMY7YXT0FPZHk8TV6BJiIt
         erng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323199; x=1790927999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=;
        b=KKXhiv+09JFP3LOS5LCie4E5wwAGK63czvnoWvJTOzBfqdnW/85wUCqDA7LFXlnNHR
         ViJrdU0xaDQMuVLC58dwO1+NI+gprH9t6zZxNMXA8yOxL6AQhWexTXwt5JQgsYfb5qV1
         bbdRN8qgUohnLGoNgRzHSYDK3kg8pP1woeFGhRUlATit56EZTQLx6Dhzv9lly5VrgsP+
         tciYHZCHl1U/4K4wB/TogRjt6wX0DIA6alCf9KB/VddrNOfYsc0l3MTRu1KGGUXnTrH5
         busZHOnw5DkzYdvbBbzeSTAZPvfkMd/tBt79kJNFpmhWN8dWXToq/dns3hf1cc+kumr2
         geAw==
X-Forwarded-Encrypted: i=1; AKwUvBydtQk3mtqgOENcAlZant7MQmYwnZC9vklCTEA/aT+d6S/vdigDnd18y3kwqWUURgIhqVLiigPM57g=@vger.kernel.org
X-Gm-Message-State: AFuF++kXL+HaWC3pdZTuitjUZDCFeDzLO1qDZUqJN29DyNGsRsRkpaI1
	jaiQqfjX46RqrJgU4J5YZhJ6idN35tueobHfSpYoxQm8YBWcl4pMkVlXjk4HNcjbswil/YeFZIU
	zIAWTmaYuIlIHhmvWO4ysZqd3uNqooBxbep+j6FlAh0tHHMMHYOMV0zN9aTa2cZrDlnqnKiSqcG
	L+3wVCzo9wNbhxlQOlqEmSlLWTN96mDf9c62UZDIP74nBwRAEF8YU=
X-Gm-Gg: AYBFou3kNcmLjVNWg+Q7EwCxLi1yOYFAau0uaBIrL7dnx2mFrSfNb1cb6iguZTLD0fl
	CPbnfBmPWTBl8f+vJzuCVjHbGao07c4aWw5B0uJexMsHJDGd3ljijf3r1We+B7YqY0T+NMkZnrI
	X7ZZ4DQoB+7TLG4AhGG0R4iBRACGuuyhlQUzlVNBK6WN+2CELtHdoLmNOzhg==
X-Received: by 2002:a05:690c:94:b0:89f:d85:f31e with SMTP id 00721157ae682-8a6490b6b58mr24382417b3.84.1790323199383;
        Fri, 25 Sep 2026 00:59:59 -0700 (PDT)
X-Received: by 2002:a05:690c:94:b0:89f:d85:f31e with SMTP id
 00721157ae682-8a6490b6b58mr24382327b3.84.1790323198905; Fri, 25 Sep 2026
 00:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com> <arN-mTL7YwNSJKjX@hu-petche-lv.qualcomm.com>
In-Reply-To: <arN-mTL7YwNSJKjX@hu-petche-lv.qualcomm.com>
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:29:48 +0530
X-Gm-Features: AclHuK8zdLFfkFZIJHB-nPGrdwt0768Gc7Z9R6lk2WXRej6W3bqG0Ymlo7E3VoE
Message-ID: <CAHBxaDc0_SvyX5Ok4nqkPZTHoPJRyjHrFSLQWK=nMJ5piJAoNQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Set ucsi->connector before enabling notifications
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab62a00 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=7XFAkDuODWGRFg0CrWoA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: DkYWPrcFSSgGX8XPWdV_kGgB5P-AjJPI
X-Proofpoint-ORIG-GUID: DkYWPrcFSSgGX8XPWdV_kGgB5P-AjJPI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX74o8LuRI+QIc
 LgMs+xjqw/Uff3aLCvsKJ7iwgMy4L5GwRdUv17XKivJg3KD3LFTwIuyUCe6K+GgT/QyPT4bQ6OC
 1McAAGNXCSFe4WzpHB1tQJNnOEvkCLUVXImaAOT7RyJ7v8I6GM96G6vNCSKiU4wjjxna5MPLcE/
 WQJ4eFWw8VJjK7wXhm+tB1MvHg4aXUrpRKSTdoA0lZMqsBKoncpejlcjzKjbXpoNzd9XIJnQesR
 Df+Hyqx98JUCYMwS6XeOoXs+/F08T9KNUOP3sWvLwuADkH0J0cYUbXQjlBhHgfPhdbPrb5medyV
 2t3OWNzdFeo6i1TLdYwpYo25WXIZNf8e+udsDB2yIFbVNmedx7TSCb0U6M3BsbRJONeTT7RsMOm
 kprggChoAH9dI9bbI/KtUwJZavnXxnWEBqyBBA0llG0xkbfdymXGx5nu09X6dQSmyVntR9US0Nc
 oytkQ4RxTqV1RPUoZvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX6MzitPvk2w8m
 h1bTD/5F1DEPWiR1wmd9hR81DIuGqbI5DwavHkMZVTkymVKrfuLxIcaxDGCtyrRfNgXYrmpGNqB
 m7/bei2oI3B8LuXM+k6jEmPDLQ00Rf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031

On Wed, Sep 23, 2026 at 12:54=E2=80=AFPM Peter Chen <peter.chen@oss.qualcom=
m.com> wrote:
>
> On 26-09-23 11:34:34, Uttkarsh Aggarwal wrote:
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
>
> If you have logs for it, you can attach it.

[    9.344626][   T12] Unable to handle kernel NULL pointer
dereference at virtual address 0000000000000038
[   10.264527][   T12] Call trace:
[   10.264527][   T12]  queue_work_on+0x24/0xcc (P)
[   10.273545][  T558] [03:35:41:266-E][
558][charger_partition]get_charger_partition_info:684 partion: sda
start 519(block) size 256(block)
[   10.285497][   T12]  ucsi_notify_common+0x6c/0x150
[   10.285498][   T12]  ucsi_callback+0x1f0/0x310 [ucsi_qti_glink
582e698363365d861463162e2b10d3a93557b748]
[   10.285501][   T12]  pmic_glink_rx_work+0xe4/0x1d0 [qti_pmic_glink
9f1cb39181e1207dca3707d04498cfe86db1a757]
[   10.293012][  T558] [03:35:41:285-E][
558][charger_partition]charger_partition_work:1389 get partition info
ok
[   10.353543][   T12]  process_scheduled_works+0x1cc/0x46c
[   10.353544][   T12]  worker_thread+0x204/0x2fc
[   10.353546][   T12]  kthread+0x14c/0x280
[   10.353547][   T12]  ret_from_fork+0x10/0x20
[   10.353551][   T12] Kernel panic - not syncing: Oops: Fatal exception

From additional logs i can see there is a block for 11ms, that means
the call flow ucsi_notify_commom  --> ucsi_connector_change is running
during this block
>
> >
> > Fix this by setting ucsi->connector right after the connectors are
> > registered, before notifications are enabled, so it is always valid
> > by the time a connector change event can be delivered. Also clear
> > ucsi->connector in the err_unregister path so it isn't left pointing
> > at freed memory if a later step in ucsi_init() fails.
> >
> > Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
>
> It seems it is a bug. You could add Fixed-by tag and Cc to stable tree.

Sure, I will push v2 for that.

Uttkarsh


>
> Peter
> > ---
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
