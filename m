Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476247C106
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057283; cv=none; b=UxPGrZSBeN63ZNRQrj9i42rNrMCoF8uwaRA7qg0fEcMDA7YHc/epNarwUzcXgUNN2gzpheSN/8wC94b6Lkw61MKCOEi75iN5D9xSKowRIXLc5nxnWZny8BkowTVvfHuYafbVP8tolq1nGhAHDpO5yHGRlSu2pGR2g5iMbwimr1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057283; c=relaxed/simple;
	bh=TsjksUxXKFFsreOfca4fOdpKzMP8qDl62PC6F9oMCc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwqE3JnjxXgKh8oKHjorXYVcA7VviwnJaWvvWQNluLjLmauKY4LZV6NbKBO8lo755kIWuizqXCumDodrbEJgMxDLgPrSqgF/c1UeQ1XO3cFMp1uGJweodhHSz+l0PV4Lv8F6xL7+fGAw/L6a5OILUM2BjRg/oCDMJgrbS25EnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGZFmFNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGeLF3DS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGZFmFNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGeLF3DS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4Mmcc3382918
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpV6svO/AXT8Gshcj76FhlEF4GnEzpUEjZJx1Qturlg=; b=gGZFmFNQOCOg+iGu
	jMQdfPWrr1fDX3TdF2ytEOLRy+7Y2t4kqhcznQHxmhWuANB6d/DH3ffb/pR9e5Zk
	rp/9lwahxlxtLJ2wgH6VWjr5KISEWEktvvJ6ZV+ew7jg8RY/HpRhHV+Hf8T6Hb2K
	gTRvhIWRQvKhhwjX6NkO1k1ymhsw8Icy9mc0hBgbl1T2vVh46XHLF0cPEZ1jbsRA
	Ut7+1WS7K+d9OQpoAwzEGvWDuECPZ4HKovA08qh3GRvAbWQjgL0ht4qCaL0NW5vq
	vv5BU9bMpZFczRDyID5bIAkeWpHadphu42FDsV8NDX/O1q29g/+UCeHN+QI2vmfs
	fLXJtg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8ajx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:08:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso5126740a91.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057280; x=1790662080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpV6svO/AXT8Gshcj76FhlEF4GnEzpUEjZJx1Qturlg=;
        b=VGeLF3DS3QEc+zCu46UyofA9WojZskczFC62Pqd4Ytb5xYvU+WI93E/kMqa1xEOoDV
         H+C9r1Y05zcet8laIMGuLapUwlR82r+ycusnpXJOaYrHWX/x6gilHvhANtv6KC64CJaV
         2JnKN2XPLVF15BUFnogT1VN4evYMe1LnQqJi64a54rzdk4IVn2tckH3E722f8tRFPFj8
         pjL3ts/SBG2osDvYDe4G9Eko+BCQ8eSlWaK2PGBqggt7EkAAK5oe5Y/7c4cLdNySowpv
         WEi1THu1HY2yrmgtfofzozsCjl/TASSSDJJIAl888fldLA15iuX9OYZ/I77SogMg6kl9
         sCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057280; x=1790662080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpV6svO/AXT8Gshcj76FhlEF4GnEzpUEjZJx1Qturlg=;
        b=augzHpGToL1jFIT2VaAIT8CLKU6QnpIhh1iTgmFvTTFsaTBj9LFTjzz1OORi+bB+Ur
         mB75NVP+HhQAp2a+TYzMUeItmunR31xrcrUhoCc8vLTA3Nzxb7RzzYJdRzm420dDDoRx
         EOcT7g5XBPr4JfKfopy2NjV7fRugMUhHtf2d9QvoxTS9OnMNv0/gj5Yf1JAiRdNQryG6
         +j39QveT500vPXL8xc34YmyWH6QlB/OoeZmKR99sfNG9UXl1Vjjmgeos+ycQQWTM3cSx
         s2G4vN72qGgQ9pwmZ+zBkod2UDypnVyWvu6Fy1z1JlizscLEbO9KRH8B3V75cDh6Rdkl
         8Ayg==
X-Gm-Message-State: AFuF++lCWwYclRBmCMfsYs4z9PnUv9sZ0o9dKbSmR8X4YPLdxR8LVCFH
	RAOdhsLwM+fcTcq3v3Tl3z/tXyvp8+QXUjEhsgPsi8BUKxHiuqtwmHLya2Bp8mVJVykH+M7vx3g
	MLdMNXfDL+jBRHOy9kzznQ0fl9EbeXxzQS8BZBkwvHYzxljN0u+C9Nyp26coxw/0=
X-Gm-Gg: AYBFou13I0KAOmg1Vsu/iL+CjW5B1bSnYzWDUUuV2GFbvpBstl8PyOusYizywDRlsCV
	Jc/8rBz24Z1za+xopi73DJPWSRFsWV6b4P37tLXG+cM3GyhRYrDnuKS3ePN1UPEnLecA9Ckq6g2
	wHMkrnz8vJKQrBDkmo8D0xmdXK52kYRMDlTkigMQ/GBu8xijwM0nTQbi5bl/o7XGabbAxSN0tT6
	sqN6VYlizeUltsopJLv3OQlmkadfVeihhHF2jCkmLXPjtI1aSpKOB0wInj8IVIp1gE9NhuyWMU6
	j6R8g2F6q7umsmO50+dGCLTDRWZyzP+BLcM3tOD7oxSHG7MFb5foyv8YGKfN9suU87zPRCGMous
	wEzJQ/oc6xgmuy3DgBygr1O+CZ5ddyw==
X-Received: by 2002:a17:90b:3dcb:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-3a0730e42bemr124852a91.20.1790057280173;
        Mon, 21 Sep 2026 23:08:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcb:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-3a0730e42bemr124829a91.20.1790057279650;
        Mon, 21 Sep 2026 23:07:59 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29f89c9sm2210384c88.6.2026.09.21.23.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:07:58 -0700 (PDT)
Message-ID: <229c67e8-aaa3-4898-981e-d15844895b77@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:37:55 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
To: Daehwan Jung <dh10.jung@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <CGME20260727051638epcas2p11f7b91e0be7604331bfe0f46beef9ce1@epcas2p1.samsung.com>
 <20260727051335.1745955-1-dh10.jung@samsung.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260727051335.1745955-1-dh10.jung@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TNzmcYOSWenNNe1dbfpfUw3n3nQ-rb3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4NSBTYWx0ZWRfXwtAHhiZ9Cvdh
 DGJCEzDlYgM6+nJBb8ErI3M9ERJRQxCMFI0EK+X4Hmw+uI3fbte/n5E+C/MjrPsEGoPuvYFJ4qk
 bg6Mm4MofBYwdRVyFgc8UkKDN/On/onWPl3x+qeBUW0IbllYIYahJDe5yr5fgD/G6wPtKEhsCFN
 v8ebVKOF4NE/ThCt0F5lhlqBU5iKfUHxDnxwf+t2PhPtRkf3aooLxPMtHFmDGveuInmVQOr7F8Y
 5TwqAcWIAGC0B+a+7ESYET1g9dLR4rsdGfW44ORt3yDqeGiq2jIKllhsUxSrovaEqsffEhSyKG5
 G4t+HBEWFszTKAwETNbgGlSq22epUTwSmkwbYj8OQEhOrqiZDTFenITTDKZQrtJ3gQ4T6N7tm/+
 ZBO/d9QMEcgSMzITgQ8zIuq2SiSNaF+bUaCY8D8mc0CdFIlqlSHztiLGmRo9EyzP8gMteUwTt5u
 jLy7nBs7rvXn0axQ/Hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4NSBTYWx0ZWRfX0XDygSbl/e84
 138IfnJ+AF2WiAuyAftvS4ga/z3oJBWBGxfHPDfIPfNDUmJzMC1Oj2l6XuVH0AoL/j9BVSK+xIf
 npgC5kmxiSXrlHN2iLELSuCDA+HD+Kc=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab21b40 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=YQHplO5-d9veupG96P8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TNzmcYOSWenNNe1dbfpfUw3n3nQ-rb3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220085



On 7/27/2026 10:43 AM, Daehwan Jung wrote:
> When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
> arrives after gserial_disconnect(). These stale requests then accumulate
> in read_pool via gs_rx_push(). After gadget exit frees the old endpoint,
> req->dep becomes a dangling pointer. On the next gserial_connect(),
> gs_start_rx() queues these stale requests onto a new endpoint, triggering:
> 
>   WARNING: CPU: 0 at drivers/usb/dwc3/gadget.c:1990
>   request 00000000e6e350a5 belongs to ''
> 
>   Call trace:
>    dwc3_gadget_ep_queue+0x158/0x1e8
>    usb_ep_queue+0x60/0xe8
>    gs_start_rx+0xa4/0x128
>    gs_start_io+0x128/0x254
>    gserial_connect+0xb4/0x14c
>    acm_set_alt+0xa0/0x114
>    set_config+0x22c/0x384
>    composite_setup+0x37c/0xc7c
>    configfs_composite_setup+0x5c/0x88
>    dwc3_ep0_interrupt+0x6c8/0xbcc
>    dwc3_thread_interrupt+0xa0/0x1284
>    irq_thread_fn+0x48/0xa8
>    irq_thread+0x150/0x31c
>    kthread+0x150/0x27c
>    ret_from_fork+0x10/0x20
> 
> Fix by discarding -ESHUTDOWN requests immediately in gs_read_complete()
> while ep is still valid, preventing stale reqs from entering read_pool.
> 
> Fixes: 937ef73d5075 ("USB: serial gadget: rx path data loss fixes")
> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> ---
> Changes in v3:
> - Add missing version tag in subject
> Link to v2: https://lore.kernel.org/linux-usb/20260727042632.1726391-1-dh10.jung@samsung.com/
> 
> Changes in v2:
> - Correct the name of author
> - Modify commit subject (panic -> warn)
> Link to v1: https://lore.kernel.org/all/20260721013509.2327242-1-dh10.jung@samsung.com/
> ---
>  drivers/usb/gadget/function/u_serial.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index cdd1dfc666c4..97ee1b9cb065 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -459,10 +459,22 @@ static void gs_read_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct gs_port	*port = ep->driver_data;
>  
> -	/* Queue all received data until the tty layer is ready for it. */
>  	spin_lock(&port->port_lock);
> -	list_add_tail(&req->list, &port->read_queue);
> -	schedule_delayed_work(&port->push, 0);
> +	if (req->status == -ESHUTDOWN) {

Can we make sure this happens only if gserial_disconnect() is already
executed, maybe checking for port_usb would help.> +		/*
> +		 * Discard shutdown completions here while ep is still valid.
> +		 * Returning them to read_pool after gserial_disconnect() has
> +		 * reset the counters causes stale reqs (with req->dep pointing
> +		 * to the old ep) to be queued onto a new ep at reconnect time,
> +		 * triggering a req->dep != dep WARN.
> +		 */

Nitpick, please rephrase this with content related to u_serial driver,
we dont need dwc3 driver related comments here.

> +		gs_free_req(ep, req);
> +		port->read_started--;

read_started would be set to 0 by gserial_disconnect, so reducing it
here doesn't make sense. Moreover it might cause underflow in next
reads> +	} else {
> +		/* Queue all received data until the tty layer is ready for it. */
> +		list_add_tail(&req->list, &port->read_queue);
> +		schedule_delayed_work(&port->push, 0);
> +	}
>  	spin_unlock(&port->port_lock);
>  }
>  

Regards,
Prashanth K
