Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678828;
	b=R0i8r4DXdwVayXZs1rmGww+TKFofEuplVrYOBABoO5FBra+kUmScilQgVq/hAHdZCYlT
	 suDtdlC9MXzM/3GrocPG3sLhpPWkvugazR8qR4LYKdaqi8M1zBKNiT8C1wjK3DIlru1nZ
	 zSvXqk4bKJ143Vyh9tuJ5SuZucTy46L5z1XrY84dBBJE6m5Nt1wzzfp21EbbanTpng9kP
	 WqqRm+aGr4HsmDN2Cw+ZVgLq259AT1pZAylvaoCrs3mUb2iJqSS7/OJFFsGQgSJ9ySm6Y
	 npt5YwY3OdB9xbbXgdTYR8KqOI3I3EvwJ4Da++un7G9t+EbCsQRyS/URyvptEZVxmFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
	b=ZdJ05AukmDYpcYuIYchwmye9mya1Op4LTR1JmzOh38rm9MiNljEK0+vCehMXpjU14eMV
	 NxhF+5qB4qP00eQCsWhAsElPXCjvA7iQC53i5BhNikZt60+VYHx61HbrtQFU6KKapg80O
	 jfjb50j7koFJN+aMJDp8YKpwjNFM4juuDTx8GhHd6kW71837IUdfp5L2UjjifKNMNqFIs
	 SdqfeDw+SvaeUrNU7LbuSnhNncEQvW80Bz7zeo9dP1vLPT1Yd/Is5Gd2ed6HJS+d1pc7u
	 tr2DgXUuO23fUwFUBWd0S/CNa3i2DGeg53Wktwa+nK4bFHipyQfL38jhln1GoEeEa/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA37606A68D
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA37606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B1lU2175705
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXWlGCRC9JQkumWInitkE8i9
	IQlzJPF9vbX50igGRpE=; b=O3r9h3EosuF9La/6Gk7uOPkO4ocLiXnApEIAq0JS
	iwKgxZwIGDvt9pNdEIF4kg6QTVy+0uGoQUvInBreDTq5wxmPe4raq10qjgEDx7gw
	XRsbdE3bKZGT/zOH3xJpEzKRQZQBjwQnwI5VSPfaH3B+TNCEtOKrl0u63w8vDNGU
	SfG3Aq76yZ0r1PbEdj+aG8j5TTkpP9GuDPuHfZ23RdwzcTuSs0sY/twBfH8v2fwO
	xoaK+fDgSNB2OxS5b+AtTecoTxS88YFn2klbbOfsaBQmEc5swCkiiMztSbSLeYDR
	eeI6dTBfmkxJ2C+Dna+XftGJ3zlNETyh1RVjYs+/K0RVSA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuamj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:40:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so5784631eec.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678826; x=1796283626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=HbhqQaTtUpIVHEYSZ/lBnCTkaiQmQU9BVp4ByHYxoHK7iB5Se6gMVgigWKa2RsKXqp
         ajWpl3lojcKhFfRrNdMSIaE0yEUrjhOf/WPSaumhIs4RtgsFoYRD8y2GdrwZc5Yd7jFF
         4R4V684rPRqQzBf6sGySOFgQMKWEVK3FBMC90QVU4ITpgNzxcaNrn5eU9lxcouzo9iYW
         ok/Pc5mKmuY/sx+3IjOcON6exSgQkxe9W07ldnmYwx0qmR1UwrZ+o2yurcZOTRxeiACf
         v/9M4YPVAQTwOKp0jFeuPYPxoK+oHHi0XNFRDtaBF+3f42hXUFmUuNPKQtZdYj/YH6xb
         pQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678826; x=1796283626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=s6vMuFIgrgaTsKPj28fZm3p6oU3d2TC3Gk8KeahQd4rLGXLWIXfZzBJNYrFTHiReGs
         2mjRMdS6BHBprE30Gf32t+E18IqZA2CPKoW+2lghv4TmNKGSaaY0c2XxSY0JjD8Gyi0I
         RZSEmxUajmsDGxITcZ0x5K/WVh462e2kZaILI/0kKDLYr+bz5280835koUkIdBn0t7/c
         BvedyI4QLlBzG2jxicj2sTx6akhmsmATpiaayTftPaEeBOdDPRJFa0jRqzn0vaqX7ZRb
         VnkKxTjghK3GiT6LblosHKZnu+mftpnJojrzoGetXgtqZe1kEtOc1oz0hjfPTJ635kzb
         3Bfw==
X-Forwarded-Encrypted: i=1; AL+hErHe9lRFwREndTT2L7u/8ns0J2UbIrXu9eV3Sc1DST8YYAu1V7gJny+DOZq7E1kt5yZft5X1TJKYyDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R755h+bNvliygfx/aW1M7GlKOmOpTBvx9NGUHvdWYMLLDQXnw
	BlMrqD9kNFqIkdmINE4qsTsPt4w/DGMOgmsGVUGfT2ytLgSRJBnKftItdq0w2OEhVLqMBuDrhx9
	w1hpDVz60TAnhxHa67mhwqluHZg0Om3uvnaCIluKIoGZnFkqByCT4tEeVTdhtVqU=
X-Gm-Gg: AZFdTZdRpnze96h9bIYCIvXRQ/FeY3B6EJm+nJ8TxkIDaOLDkw5GYo1R7gMr6Jq+pDx
	Yx7FYDri5+tDpu4rWyQ6WQPo0whfxQRV1bf5+XKQuQSA51qm7kFAd2UKSCLxJM/tctgNKNV7Jjr
	oKFBzIjA88CCak1cyRpdXXBzXBzaPT1Gpi7xwCk7akAP2r4ttMc4pF11KvQxSqzXLJJLbFrgn1S
	HOZwjsO2g87uQXRwvNmVHZw9xRzjxzIgL1NuRKC1UCI6UzyUkq7vwisih5FZJssbafOd80DWq15
	dMJdQZ5tfQfg+1ELudGcRcDdoOL4/XqlYae1Vr7IchvcHNKypOpg7Gf12BF0/rjd1emZXUvjcYG
	RSQKCKj7X9f1FQWgCikAm9CavkGuXHME2iqwwyDfST94MuKpUoTy+Yj8jkdYwYh0/ehN/i5nA3x
	5phub1OgoFXikVNgMtZDT1QDs=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18107028eec.40.1795678825974;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18106995eec.40.1795678825418;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm47180909eec.1.2026.11.25.23.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Date: Wed, 25 Nov 2026 23:40:23 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
Message-ID: <awfiZ8IE4UMuiO7P@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: LNGXMQOOKNUbdtVtcZc15dBoBjKF2AdS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX5KI3pmTAHXbm
 cHMW+V9ffDmiZPhB8vOJ3VtTkXJuT2CXfM34Kjxl/tHv2GhUPHm5LCT8mo//j8Lzft6lXRhxPcv
 ukyifQPj96KPfLCWjAQx9yiVSl2r7Ss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX45t4l3iJU0bR
 8vtucs591Rg8eR7ejUHKqwBEVcA4xmoQQ26Cs0iLHJ4hBamFkDinMKAW3bHbGGVYqIatDH0rUgY
 jP1fvnlhSy8xi0GtljPBxcP28rC5jqdrBrj0Hg372IAEUd8VR3u5zTuPjIof7LTdWgFvGQS/Yi5
 PxLMfnuEPC5L9RoDV08fw7iNWRTZVp6tCS5Hv8tbo+K7Oam255suRetQGodvvV1kKqWAQPuHWfH
 3XjCiV9K5ZtGhA5PvqnDvL9yDA2AyTv5Z+G+C315mWa4osnkUXokqJRpg6P3rXEgk8rgI78DKDj
 ClcAFUFk+7lmbQiTn2SVw4zMJVSKg+jkxlXFou5uQTI5Vm0C2p4KEl/0xsbrFuBH2OdQyTCIxlu
 dTKbx/l+8CfqW3tf1msZaKsi61bIFGM/ycjnk9j5xqSB5VL3B81npQRCaj862Cwa/HT0pzh/5P1
 Q06H4/w1Pgp92+d//gQ==
X-Proofpoint-ORIG-GUID: LNGXMQOOKNUbdtVtcZc15dBoBjKF2AdS
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07e26a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=Y18rF2VYFuf4IdEaWfYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:16, Faisal Hassan wrote:
> The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
> handle both system PM and runtime PM paths but cannot
> differentiate between them, preventing distinct power
> management strategies.
> 
> Refactor suspend/resume functions to accept pm_message_t
> instead of boolean wakeup flags. Use PMSG_IS_AUTO()
> to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
> system PM (PMSG_SUSPEND/RESUME) paths.
> 
> Preserve existing wakeup behavior: always enable wakeup
> for runtime suspend, check device_may_wakeup() for system
> suspend.
> 
> Follow dwc3/core.c pattern to enable future per-path
> strategies like differentiated power states.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d44f093ac243..7a7225b900b3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +/*
> + * For runtime PM, always enable wakeup.
> + * For system PM, check device wakeup capability.
> + */
> +static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
> +{
> +	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
> +}
> +
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	u32 val;
>  	int i, ret;
>  
> @@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	int ret;
>  	int i;
>  
> @@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
>  	ret = dwc3_pm_suspend(&qcom->dwc);
>  	if (ret)
>  		return ret;
>  
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>  
> @@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
>  	if (ret)
>  		return ret;
>  
> @@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
>  }
>  
>  static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
