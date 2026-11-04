Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779033;
	b=SlHfD2v2+YVPLmvm6KO17eAr11Sai/R0E4gcAUYlfp9GmVCvtFC2QtcmngjfnOl6ajVF
	 FPaRD8r+qgRn/FWi9x+OuYsi/FTP4bKE+pDGKpz9X45LNSBPM4mCzzVv+o8IBmqHzWqmR
	 ZOUOthGkaNxtuDjl7eMcTo6nCUFnWhAVXPB/yElCw6IyoF3dCBKdvQR4v2OiNmDu2onvA
	 3TstlcrapphvrU2koslfYUBAR7ITD2fuJGc1Z0Ozk0bYMKAuy7Ho7A0K5tKpS63gYpoX4
	 KDu8cGW15bUetapbcv5vpNc1Nuuw4FG8tohqCrpnqyWyuuLscCuAL9jXXjTDYjrqKsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ttnroh28AO4aKkYL54DkNK58IcQvoFGluhwEM6k8/vk=;
	b=RpGzE+1p3KDytmzR02wC48C4yx+sjtVcPfsxjvQtMr1uckS1TKARY2wf41jAR3Qc+XNz
	 5BU6Wjeai/eHIoxNJPVYMAqI+PBQWYrw+Se/4NqPYM8hVsv2wd9OXhlgP8TMRtSWJRs0N
	 9Qh9Dfn0hKHVxpmH9h6Yx9MHz0eJFICC3pYJd24DcPNDre7r48391k8LqcMp/zQ5ro2te
	 sDRLrTQjGd4y3gLiwqFlB0U+TD4JiWQiO0rd5ilGGHBZC+ow/KIduj1spkI36DEt7RD1q
	 tfcOKDHm3VFbv551KZtQ4bhg3eTHivrTidA8xEiGMCua/ess15SoyHpQK05atviJGBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OPKqqp1x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Itu4ibbf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675D9606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OPKqqp1x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Itu4ibbf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A442C023300277
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 07:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ttnroh28AO4aKkYL54DkNK58
	IcQvoFGluhwEM6k8/vk=; b=OPKqqp1xjyEIziVFbLcjwLqprDFGBkn7q6YlW03a
	XnyhF3Uv/dHUVsvFy95Llb9+RsdNzxPXRowD+tTpbuNQmYKejR0FeLxhChZCsp/3
	NAmWuRr90kjEgR/1tZU3n9TGgK23FYmxALWMJh6U1UBgD7kQ7fR1LDvgnUDNp7Jh
	vFlvA6FNWdiTXNIeF6d7eAMkmizE20QCzT6h7ZuY2Y1jbkKQPzgNMS0cXnqLIrXT
	bPOuFClwETXpU8dCxMVWbRkvamdtZZSAqbjD6OqwL3R119Y30zkdRgXo0eIYX5PR
	h7sfJFj0wq0vaKEA5VX01UD5MzRgQuU1S+TtGNSDnoOdAg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb08vjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 07:57:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1069423c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779032; x=1794383832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ttnroh28AO4aKkYL54DkNK58IcQvoFGluhwEM6k8/vk=;
        b=Itu4ibbfUwLMv4DTPD6iDbTy+XYv2BjHcBJINyBMvKI4kJLikOaFvhI37pbYuRgNFC
         kY8VvlZsXzmGgWzVjlXMXnJYZVzhCRfLjYedVimMEvyneubL5MXrFzTeabWmshm13xWH
         wjMpJLEW+Q89oNw/PmT6It7MuVL2P3x1bWWG68WoYZNtRzEQuBDV68lndC5MrI5LWVlP
         dGym3eUtfW1bASBexvBkUzo6W+6/CR2B4ySf23+GA0eitguWMSddoUrpc04t627GisLy
         GTJlLBKx4YpU1eLPpvQQayfTB70EsmVZ4KnNUeNtMO3k08yL7l3GBpZyXBsZ59bmPpl8
         UbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779032; x=1794383832;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ttnroh28AO4aKkYL54DkNK58IcQvoFGluhwEM6k8/vk=;
        b=T1BwziJ6wkUNh3sGHSq2Cu3eAg+qXBH5fdbBoXLhBBdS7AjcIvRcPNg3Q+AVwjdNxL
         qStXY8s6/E0lPaq7jjqyNg94fBjIoa9lFLYqhFZZ2NP/isILzZNIDpI2oaVy8TywTb50
         UpDl46L3j3W/4Qj60dAxXzr+AOyyij164SBP2XnZ/VGziL8KuE/hVZZhlH9IDd+B0ylX
         QD+G6j8JlW3xezkSgi+4IzJ0cDbDpB7s4POjmQms5d2wM2udx3FLPZ7A8ts9Ihn54ynn
         VFOS2ChBaQo1rVMhLu5TxZqa0XW0ECaVHujk/RZI5hyTj6hFyKLYh0LEYt62qrMYAqqr
         LYqw==
X-Forwarded-Encrypted: i=1; AKwUvBzClu5mZvv6g9xjGsHwQz0ZvMPWK86qHPGabtwo0fH076B88zZRjiIkr3v7K2Zg1PINQixp94txWbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iWo63LbX9SemqLu2CiHt9hagnJHpMHWcVqBdfTht9+8l90iue
	VhlpB7WCz3t9BHkinVpHD8YjAr9CgLivzanHVnU8ZFzbDg0/pwBQpHdmXMsrM2+J6PcBJ/iiyrK
	TKxKizagWeEZAXBstvOpWeFG6rf9f0RVFXI2KBpwNVvUp+uAi+KW+onLu5LBKa4w=
X-Gm-Gg: AYBFou1XJAm6dRIxwKvVRbOfpAnhHHhd9iipmuqjFXhFrf6fUVSGxdLXhqkR7IIohn0
	1LN57ZrETfqJSsBFyVNevSjFRBN72pbrx1rXcaxrL74MRbRc+3p9ZaTaGzesyieR06bz4pGPod4
	ymC4EQrmKaFG7b4Q+h9W3wDtGHx/E44yTXQ/qDrXGgiNZGQMmIKdIirYpzFJrqSvRZQyvRYaukL
	/d6D1/E/V1CqQYQH+RaOROLcZib62hFou8P7X18ugHGs7rOa0rBBc2irAlSkHM6c2ERSLzskchh
	A8GFthLtb3NGMcgRMVbEyqjuTOiwTd7fYhBaVkHxyEKdUjqCW6xDUu4xFnCjWsrQQiZ+8yH832d
	EmJTK4GqnipeVTMyOHDwSDQPNsj8wjj9p7OX/93jwTeQYFIFfls8uBnHFNxroc6ODwxvZNcSFtu
	DGvnVHUOsOhGwjmwMpr640
X-Received: by 2002:a05:7022:2606:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1ac5d0da4a1mr25716904c88.21.1793779031677;
        Tue, 03 Nov 2026 23:57:11 -0800 (PST)
X-Received: by 2002:a05:7022:2606:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1ac5d0da4a1mr25716858c88.21.1793779031125;
        Tue, 03 Nov 2026 23:57:11 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm8048795c88.17.2026.11.03.23.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:57:10 -0800 (PST)
Date: Tue, 3 Nov 2026 23:57:09 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: drop the second function reference after use
Message-ID: <aurlVRFxoAWDMGbg@hu-petche-lv.qualcomm.com>
References: <20261104021453.1468443-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104021453.1468443-1-vulab@iscas.ac.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXw/rfi4sZXvOm
 w/cLL6NjUAci4QV54lFTCNzgOg2KVmyYDoTJV/6z4Xflh4Y2gg5DgBRnaPwXqrmjkJPINcDlzrP
 Np/fNShqQFDkennQIpkbX8yCHQqTvIU=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeae558 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=rJkMBQCS_aWmBkIL97wA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: ebTjr6ieC_rN0Fy_aHUlUmp7gOaV3clf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXxzv/qtv8AHAE
 BRUFKTJvZqVfwTlbK87hTLE7gHBkN0KkarFWLocGYlzdB5bdBidZM5v+TlA2welrdqarDm5nefX
 FirFwFMjBb7BGXj1SxTIg58oRN2yvBBl8xQ/PoHhc7dTwsckPUsOGQUd5bXiGyyytdj2rDx1IgW
 WXZQO7FEConbEso/XNCNMVTHdzcQoLJNUDYxcn9tffZI7xkJjH00bX+R4Sn2V6L2u/Ul0aSICz+
 BvjMMM5HCu+b7jYTcKTl9erbQ/Xnuam3wE3y4xQs4XrrDWI/bz+Q0cHqEaI6TC5LNiXsfTFA9TQ
 NhKy29TPoQ2IxhzRgUR+DlgJA7jznCiycFbDLxV3evUu07aJqY7nBvNdXhtMnKFer/fjHDkyNiO
 sqMujJgTWHt1SNrF7aR/5mOboBqGGeKafXhDASK53cWmPT5tIhOSfxYfGbjQW8oS7v/aoyfoZq/
 87qvNPWXsd2+em4wB8A==
X-Proofpoint-ORIG-GUID: ebTjr6ieC_rN0Fy_aHUlUmp7gOaV3clf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On 26-11-04 02:14:53, Wentao Liang wrote:
> cdns3_get_second_fun() returns a struct pci_dev obtained with
> pci_get_device(), which takes a reference on the device, and both
> cdns3_pci_probe() and cdns3_pci_remove() keep that reference until they
> return without ever dropping it.  Probing or removing either function of
> the USBSS controller therefore pins the sibling PCI device and its
> driver's module forever.  cdns3_get_second_fun() also leaks the
> reference itself when the device it finds is not one of the two expected
> functions.
> 
> Release the reference on every path that gives up ownership: in the
> error return of cdns3_get_second_fun(), and at the end of the probe and
> remove callbacks.
> 
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/cdns3-pci-wrap.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
> index fd06a3d8e638..4891802a2567 100644
> --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
> @@ -59,6 +59,7 @@ static struct pci_dev *cdns3_get_second_fun(struct pci_dev *pdev)
>  
>  	if (func->devfn != PCI_DEV_FN_HOST_DEVICE &&
>  	    func->devfn != PCI_DEV_FN_OTG) {
> +		pci_dev_put(func);
>  		return NULL;
>  	}
>  
> @@ -89,6 +90,7 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  	err = pcim_enable_device(pdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
> +		pci_dev_put(func);
>  		return err;
>  	}
>  
> @@ -99,12 +101,15 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  		if (!wrap) {
>  			dev_err(&pdev->dev,
>  				"second function not initialized, retrying\n");
> +			pci_dev_put(func);
>  			return -EPROBE_DEFER;
>  		}
>  	} else {
>  		wrap = kzalloc_obj(*wrap);
> -		if (!wrap)
> +		if (!wrap) {
> +			pci_dev_put(func);
>  			return -ENOMEM;
> +		}
>  	}
>  
>  	res = wrap->dev_res;
> @@ -165,11 +170,13 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  		if (IS_ERR(wrap->plat_dev)) {
>  			err = PTR_ERR(wrap->plat_dev);
>  			kfree(wrap);
> +			pci_dev_put(func);
>  			return err;
>  		}
>  	}
>  
>  	pci_set_drvdata(pdev, wrap);
> +	pci_dev_put(func);
>  	return err;
>  }
>  
> @@ -186,6 +193,8 @@ static void cdns3_pci_remove(struct pci_dev *pdev)
>  
>  	if (!pci_is_enabled(func))
>  		kfree(wrap);
> +
> +	pci_dev_put(func);
>  }
>  
>  static const struct pci_device_id cdns3_pci_ids[] = {
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
