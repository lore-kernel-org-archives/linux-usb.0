Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686979;
	b=x4T4KaCD1TBwZzS3mx6FCnpSfgzvrzRN9eATsQEvArpMTmfenAZ3iYkVbYvoJATy0h9X
	 IgTGfjQkMKKm74g3F8xwLqzRwg4/6QEo17hKbz6IvxKNMo/hYUf1cRb9bjXOmHO9A3Lpn
	 8vGO9Zd1CxbcWXG6lT9I7vwYxp0X+rK0+foJSX7rYqGlQOyAsGuy5JPy9eTamWa51Zoko
	 Ei4cO+UoqkwJ5TXsGojhslcNaj/INeH0uCF6qkcJV99PfHyK/9Q5NaDtMzv6ZBtxkplf6
	 gEJbUdrIBrLk3VU+U5oSmR6ZK1JvJPXZLjfJVC25K34cMWttIBn3bilSgdoMOn4UqvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
	b=3MuVC6hJYGQBsuyYbmT7TeXVAcHAHDCUSJB271HKN6vTf0ARohvjI2uJ3cA5eefW9EKj
	 Cwf4wtivcsJqqE0Yt43gDQB/efSKxBe4qJDdIX/Rczav0FdxZ4g9lD8MBynWCp+gpo2u6
	 n4wfwyfQJRjblsKVTVhPt5wpKf6q6E5n5BdAJ79keakNDpbz3IWH4xh1PkvLEb3YndV8o
	 HqZDXkf52j/YmL5WMQN5cC1doyFCICsai6mZcZf7ooTHREc8pKzHbz1D3kK0GxsQH9wOP
	 WjLBIGv+U3qm7I3i8p3bE6XlU3IT/SP4KDm5lG3ceosoJZ6f1RSFeSKAtTMLJi6lPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G/Z9mgt9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C6606A337
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95C6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/Z9mgt9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4812595115
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GOcHW9tjnWPfy3JGXVh2ns2a
	T+hFNZ4ZuKMYEvOVVpw=; b=Xc2GvF+vY25WDOEhoJkPfrYHO+KliSW7FhBBwGbz
	lp/Q8RwpCWg2jS99vjSCijjKDNdtLH4cXHmH6qyGflt3RI1nv4Kt12YL6ivyfwnB
	Aoz2nu96rAoKH1PK6cO8a4K0PrKHiqohWchFDwn29ApJuNBaoiAsjzDoRLcjiBFZ
	AvTaGyGMe6F4bufKrpm+ggWroLaNtRw7PFDjIIIyj/piBxUoy/c6jnj7yVZs5e/R
	8Vb1nLuuHaC0ZibjLndy6qOSagAyrEaQW4GDDNKlA99xtaBO4ppl0ZHxjD00KVCd
	vLJFCRrKcPtTzayHdz8WYXNmGrGF/czJReEKfuR6JCofoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sak1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8581168eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686978; x=1796291778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=G/Z9mgt97fMagk0x7M17tFwcAgSxSSMPS9tmvT8hl5L5HG4RMFwKhM4tR8uWOtJZI3
         sBZ26l1va25YCs91zS3CZiGlK3aSGVSGir9yee4SLJh+pqdt6SxSefc6BT5MJTYMEwmn
         tLyziWBJIvlcGG8ruAfejVT95Qf6dEO+W9oZ88KuL8X57+634cvY5ygcsDDX8h63b6/o
         KJj8jvqO4Ee3XTofNv/IReA7bdJ4gj8iZDBkDqRf73CdocoQ+pamO8jGcms9MT60A9VC
         VrH0Dd+mRjjGOzMdNciuHteMpUGiC4uyOjXCTzqTPDstOoiD09boDNp5YAG18GQ2ODve
         hiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686978; x=1796291778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=PTh3RJ0PDEWGtZ/mdn98gcqS7bV+t13kr4vq0Giarl6zTdR36uZnvCEbRBUYkUMyhE
         whzL+u4nt1R4CMGdvi+3i6Qx2TxwsIcePG/vRq80XzBRVPc7wCVMGfsWRuAXcZOFOkkK
         AC+DTzf8PLeTuoD+aeFhF5aFdCclgybx+vmqmSPPnKPpehbyCOmS5MyaUzgKH4oTd+BB
         ZxePFgxDowaaurgpbcUp7yqTh831Nkdly84CFJepCGWfIr3/bzYcXfQqyLJmk+m5Ce1m
         u51DQ0oem4mD90Kgx0wesEBIpilMOLzJeiHJ1BK7Y98fYyfowAmFQ+blTZHxr9QoMEnU
         TFkw==
X-Forwarded-Encrypted: i=1; AL+hErGaMJQL0Xe/Yb6/jTN1U9OyIqpkMD4EsAYBxwc6UcPaBke99QuxbpInoR/r1PWA6XsYpsxOb59dpEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lt0zz7Acrx9znKcN5haDnRvh7fq9D8Q51bc4SG/HuIm9n2vh3
	Zu67vIOzsQ42jwku9ZSWT5wB+RwhxzVuct8Ss2OCnIaJMzLbb9U12gVrDBsWmA4USWP2/IGHGJ8
	N3vYCuY552YhWyKqxBsjw5AsfDhB4wx0kj6UkRHTBzfi8G3F8k1tLHOXVXCV5WWg=
X-Gm-Gg: AZFdTZcV26Fd/mg+G9Zue8pdZWoDigHhHzW5sVxf6hMpOWRdXl5AdHPoMqsvA8HzjHE
	S+AE4MWXcqyrTZ/aeqehJlGwx9kA1iJuOvxgMbbEfnvgEm3yfdsQYfN/r4tkPoyWOODwJlbVhbr
	tVsqe8vQsI9TVij4QhDHUq3RUqlDbuaM1T2NgNrZVJDEubaQCWYS4trgikpx7ST1F5THZ3CnS2p
	JaAE/N1+8HprtZu0zO9ZeW0mRwSu4QlG8GYgQxN3zij1Rtj+8Mhk1mU6l8ShlS78ZBPWZKOsN3P
	7XGFqa/J6PCybXQIipAU6iBs4lOeF+bzWPmZgtJhwKv9Dbk8btHvSnUCagilr03dYKsCsol4w6G
	8NVcEMVAZUyy9KrTjUrUF4U0K2SAE/azGNIQBJ7TO/uGhDK99tx2CrqtCB6swFFgeuIEo739B6m
	Rux+dbRCyTXu5krsKkqrvGfg==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926696eec.21.1795686977562;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926679eec.21.1795686977053;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm33923950eec.18.2026.11.26.01.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:16 -0800 (PST)
Date: Thu, 26 Nov 2026 01:56:14 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on
 remove and probe failure
Message-ID: <awgCPsPdiQDgPUR6@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080242 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2DI7WhOKpHI9u_kDJrMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 3emiNWLvxfAwC4H4u2OWh1qBlFA_kG8P
X-Proofpoint-ORIG-GUID: 3emiNWLvxfAwC4H4u2OWh1qBlFA_kG8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/I7bs3NAICXj
 D3lg/He5/i1c9V/pRM3ZRlxMA7ZGsDf76owfXzk5nwMcH1QgvXZJhwGyIcb06aqBbPH/2Ot1AOK
 7Q7zWbwkK8nUD/ctdAhdx1wYmpN5GV/p5yaIY371xgmd2VxEebe2VbjdUsGqh/oWOGZQUxNfzSP
 BJGkLcOF6AboEtwxNw22QlCKsOl1H46XJSG9v6dbeh7vlEAA2S3voe69m4POOMN7q3/7ZaDuk3h
 +oIgq3wsAseQYzm9YoyBcaBQdRF/+m0c2wiq3u3zfcRqn0LjeBHc8lxyP8ao5lVx8kDiaeQpLaj
 8cpYtMqoZnnFh61MhehTBBDui+VlMwmqA4aY3loR2Qg7bIOJ2uVl0++YghMyQlznxnfMZlwHsz4
 R1zddGhKU8DPCpmH2RNL7H1TtpWZiNLpAc6RqYJz+eUUhbTCvINwbgimsf8ai1aKIZEIQwefT10
 F/jIFn3n8dj8CL0lJyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX1mqSLjONXYhs
 9qH7DK7IFNtvBunYlRx+2JE/YeBj1Ga+xuDLtuIfIIYO6ggpuxaR/rRELpMlV/z4yb7RXxysyJx
 dUM6aiDNz3b1YnUhgHCz88t8Vyv37ak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:24, Faisal Hassan wrote:
> The controller is taken out of reset at probe, but nothing puts it back
> into reset when the driver is removed or when probe fails after that
> point. The controller is left running when its clocks are gated, and a
> later bind starts from whatever state it was left in.
> 
> Assert the reset before disabling the clocks on remove and on the probe
> error path, so the controller is held in reset while unused.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 50fca06c83d4..61a3e3c38f59 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
>  	return ret;
> @@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  		return;
>  
>  	dwc3_core_remove(&qcom->dwc);
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  	dwc3_qcom_interconnect_exit(qcom);
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
