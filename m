Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224B4418E6
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830953; cv=none; b=cSqH0tXdyM9xdYQZiBvUPWp77bUObw9Q6akihzhnBYGmryTfI1ocgUrNT04xuQG7gEpiIYa2VzwJrPx6cT9jWznSKfn+lL2YdlY93/YCIOmfkOCDmXL7bTGHa+koyDpolcqeKjH+cPAIl0h7KKQKs7Ej2bFiamdCyYt0fTyVQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830953; c=relaxed/simple;
	bh=HfczaBEIeRcH5RSOIJyuVs9L3ILxl3LXvTn5FoFJ760=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oc4EtA/snUsggosVfcqDTtXnvoDfHfyWLebakPS1Cplq2ByWw/l/qS0msvMo1TxQM6tmZRCgOGjqk6EZ3O7jNi3P3GqgGIhb0bjdXKcH42Q9Nsby7VO0IS6Kxw6OrL09Cxko2mIPyhxo9VkIQznQUomc28wZ4B4ruivGYcWropY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5skCl0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXOKGSVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5skCl0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXOKGSVu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9IKAp2462779
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 11:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1wwrKlt9+TZD++ZfuGZ3Nrsi
	+gQaVMa+KeHyXcEKbLo=; b=T5skCl0SWih5GmnQySXiFpi+EyO6eo8VFqon8BOF
	yTVKYWPcXAmWwRfvwXsQvSp/CYfUE9vTp50RgwTrLXTAFqWxnDSEhWWTyl/Z1Rrp
	8RWKq3BAgWRpC9ccqQd1ogTHdpHgddkfbuKiQUelC2+zmnLW9qMMO09bbgKgJNpg
	CErPxvXpuEGm/59wua+ZxrxUD1FL1i3lwXXyVb5pqgvBq67oClTeYnokh/S8zuw4
	T+C6rh941paqNs/uh7tmj/OaLrDEAZA+NzqLw2R7rB7hUSwPm2F+q1z5/S24w3/c
	QQFGlhbwmwM7iwLKI5yhE+tTgzRSCgqcS2UqsV3LtysU1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bjb7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 11:42:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso3993145a91.2
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 04:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830949; x=1788435749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wwrKlt9+TZD++ZfuGZ3Nrsi+gQaVMa+KeHyXcEKbLo=;
        b=gXOKGSVuCqQ8IXnUGz7rKGOZBloC/V/OnxYXEW6XZwEKx+yniImhL00Hu0djYIKS21
         TCV0sgqzmj4Jkh9FSPJw8LN110LenSC55WPMuFzaTyniaaf/Hd2fEVlLejK7UpLILcl+
         2pMD9bZ4AJkY6vrBQBiXOZ2zeThKeVkisLYry+kGmZ15WTI0OTnTs20fygY6UNpEgfCZ
         IGdre+lsCxgtlqPmK35ds1oTcf7RWXjpwqdp5V6ipp0uEdF+ne6j2mG963EZMmDYZ2iJ
         zvAl7xwWHDpxidK3tMlA4I0kIwmYEAd0l667S7VM6Bl06oXivw1SDHM0sRICCdFlACeb
         zo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830949; x=1788435749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wwrKlt9+TZD++ZfuGZ3Nrsi+gQaVMa+KeHyXcEKbLo=;
        b=p8owF2F9Mt49EOolj8Llc2uEwMnrbLB/6JZVhublW8miK9OPOy9OJ6MwyK0Of+lhDY
         RLdoP4so6QGlFSsd3ylLTHmw/Mw7qCDP+t/adbid3zNa+Yu5vBjeeoLVm4tOsXpqRihC
         6lig2cZ/ITarvC2PRiOaUS+OHO/z04dnBKe805+gYe5L//r/jxQiRhvt31RY34rUTRyY
         m4gvnTViK8crUZcn2KuzK4WAzWy/hcIv48t8HSm/a/acFTkzzFoa4Q+CtpmrXE+XDwzp
         q4L5gNVSVXqDfm9WK9Z+0sET+Z1clHWXfC9SpwO5pqwyt56khM0x8llDhgL9NUiM1Ygi
         YZJA==
X-Forwarded-Encrypted: i=1; AHgh+Rpndw9kvch/txrPGC9g3iylVFRfnFKDsyay45cfvvryWO7sYuW5x9XKZbIdVnIAh98aD2W3NVHK0KM=@vger.kernel.org
X-Gm-Message-State: AFuF++m72N3MK2YOx3yBFpCnW9+g24VJuX2ke7K9wGDKL2lDIVKp8Rhl
	+7vQ8iu1haY9z1411Asq/t0O/hT4BWQaekDKzvoh9bkkwqqqh/+LL/Z5G991W+79KB+JbLZGaSa
	YtaofMBxgV5qZX13ARDBJE6QCt9CTbGvFH5knA9v0wc4LRRZpfjkeGOEWe2UiL9U=
X-Gm-Gg: AR+sD12AhJx+NEk6rd0iCsstv71DMGf3ykc3tyP/NQdABAEpTTUtm7INpsjM6b6cTCa
	t87FYF+09irsgSX7+KnCD+sx20zi79I9SxokIrJ5w2lIxnbuI0lqT4QIH8StdPCi9Q3xhOSrmw8
	TSKrJjfnkwRr4y1ldNKtMbQWZ/ujAq5MRqFP6/Q3R9hjJ7Ze6bdtmRnolT9OgO7jMeudl9lbyv5
	PYH3P46SzAz3RU84LqyIwOV+Mqa5w+WW0BRuFCHYYtn1G6Jc3d4Ko+GmAc2NP83rbOxMuobw81o
	xZXpsGxzm6j2A4b23os0Te7XUdlLUdODIxw0GgP6DdxYO3qziHTXS8bgdOIdET80sKX1lg4UOyd
	CcqsQLbCIML64woZnf0scRCe8dqhruoXJpjvTSYfU28J4sB9TDOtebEMQ2rXscR7FHObgJbYXD8
	k8efKPzmyWEsGjnggAvf/B2/OFCAAfZw==
X-Received: by 2002:a17:90a:e70e:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3966d4503ccmr30898826a91.13.1787830948915;
        Thu, 27 Aug 2026 04:42:28 -0700 (PDT)
X-Received: by 2002:a17:90a:e70e:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3966d4503ccmr30898684a91.13.1787830948341;
        Thu, 27 Aug 2026 04:42:28 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm30723893c88.3.2026.08.27.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:42:27 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:12:20 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
Message-ID: <apAinJ1TEFL8t3ub@hu-varada-blr.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NyBTYWx0ZWRfX61UCouUSrVn0
 QIU5Bl1agV+1Yjbey9uiGrg08loqi8CGfdXS/WoHxErhsWqdYY8XAiqw0z3FG5w85UJjXOj3Kvz
 9bN58d7ZjtSucNyLXHF84h5vZtK7ZX2tAsuHpKsaEd3QZvrjH9xj6VxK4ziVM8SqpkEEQqJhliL
 AJLvN+uVup6K0A3pWHBhRrxphBsBYsQth8M7NarZ02Bb778RRleY4xr3BNwA8mMNZyCT/zg1ImG
 1e6Fl893t9BkylTaa+uwZsq5fZZJMDAGvfPX5TF6EMk42BQO+VBW6JAdWXrzWo+Yk8Pz3l2JZ32
 Z1zru88u6axu9NHdmB4QDvBZqBtU+cY6uWjUXaqp/6OU8vT0EVs8eSU9M5u76F5lnBkS2S2yGdx
 ApSWqMR+KwZdUh8VKTZ7O5rn3tJ/w0KrXYbBwXmZp1kqgRU7mfM36tkIyBIAoJTPEZudLq7+ICi
 XKzhwrY9m6g5Xi6YoqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NyBTYWx0ZWRfX20fStD470et3
 Od2rFGQMFmLYQJW5nad01ji3yaYlnZUTGMqkL29t11S1EDNRA2YHvMXCDiw5HsL6LDaru/rPvFo
 1nPfOo9ly/mTdCp6nHY0k/lzsdcdTFc=
X-Proofpoint-ORIG-GUID: CjAxdMGf81aPiG7so3ex7CNtvA9zrZ_s
X-Proofpoint-GUID: CjAxdMGf81aPiG7so3ex7CNtvA9zrZ_s
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a9022a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=L3BjEaeBWuRv9D3tqyQA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270097

[...]
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..17292517c594 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -617,6 +617,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	int			ret;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
> +	bool			select_utmi_as_ref_clk;
> +	struct clk		*ref_clk;

Any reason why glue layer can't send the ref_clk_rate directly?

-Varada

>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
> @@ -698,6 +700,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->current_role = USB_ROLE_DEVICE;
>  	}
>
> +	select_utmi_as_ref_clk = device_property_read_bool(dev,
> +					"qcom,select-utmi-as-ref-clk");
> +	if (select_utmi_as_ref_clk) {
> +		ref_clk = devm_clk_get_optional(dev, "mock_utmi");
> +		if (IS_ERR(ref_clk)) {
> +			ret = PTR_ERR(ref_clk);
> +			dev_warn(dev, "failed to get ref clock: %d\n", ret);
> +		} else {
> +			probe_data.ref_clk = ref_clk;
> +		}
> +	}
> +
>  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>
>  	qcom->dwc.dev = dev;
>
> --
> 2.53.0
>
>
