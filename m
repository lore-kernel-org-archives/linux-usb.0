Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654637;
	b=dhni4Yi0sJUIJKO+h3ROzHqLKZ1B3/W799oe5cZVLxir3qdEI/D+B0QpRS03ud4WowW6
	 lcUs+I428yYS5LRThqArqFff249IgrIZKAeGxHD+z1h4/ixsmll8s4QmYUTONeV9JT10P
	 m/JDv/G9DswEUtKKiwIuqexoKspwr6OLO6+6tU3RUoQUK4I83HhSRBcTyqmxBQ2wO/0f3
	 UxblOOQaHnYLcCOFcik5FcM0LQcyyO/5Ul+QGnbAgJiCSb1nZmjrcfzVi0CS3ilAISGoB
	 IKLNbZxqHGX+shtUxcwj3gHs8l1pqWUcKJqQlglgArDqfNOFSyJg4vNx4bMVXJrpRCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4hYc9omMporgQ8o9YFrSac2Ru+5Zr0Ii2QHfzgUBX1Q=;
	b=eKtN6zkvDYIGaagWXHULe/CcCBiuRhiJmzwRBsLIjk9xuF7RVvSdvq438aIbl+8uRu1P
	 7s91Y3kVUaXzfX4SQfMMvFeEbbO+flUtH7buJqKjvSWVqWvrpttAY2WB/utQCSPXQXZB7
	 PMXlBHUTDWXjr84Jarj4sUEei71OSXtayfRHtKoSygH59woDL4OCDV9PjhEaxs1DN7/K1
	 90YhnYPGxtedN/yUaNeDp3thZsK2Tx7ScvbX2SmBf4sMxtO4A6vePIcfivmbmHFLBM0yr
	 fcqfPF2rL3PoUz24aOFtAMhOv8HlHeDk5igTM8/zNJ8W6vZVJQVqUsdpIF1iBZ6/PRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3RGPXIO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ZSyVl1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7518606A325
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7518606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3RGPXIO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ZSyVl1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708EO3517468
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4hYc9omMporgQ8o9YFrSac2R
	u+5Zr0Ii2QHfzgUBX1Q=; b=G3RGPXIOEp039pvPfiEjgsS4JmCjJkF/YkT/H8ub
	8az5KUEWnNL+K6ta1ZoQU5mV501ev6ddGysJCV+Ks3zAnC0cPII3Uxtlb4gu2hNJ
	ghZ/e8MTaXnwz1VybzA609unDE8JQkz6eYSxpnARo/AcdweUpEdEYn9dvVX2szX8
	WSbnvELbP1Q9YbbHPqYCvcbwQQUP15lMh/m2yH9KfdiUzlT2HHbE5jya/GKzHtPq
	0tujhwBeHY29Ul9rIn4XUOcI7tlK4VqKcb/uc3zEsnEsm8RHgpJbOuPumqtEnFAX
	RG6OP/e9Ocecx6m+8gHgBAwB+b6Fs/M7s8jfXeRQr8X2rg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bh7wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:37:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso5916201eec.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792654635; x=1793259435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hYc9omMporgQ8o9YFrSac2Ru+5Zr0Ii2QHfzgUBX1Q=;
        b=i1ZSyVl1jqMi9yF0VT+d/bujp3iX4rSC6WQctBPYvCw5dlIIfvRWwlACEx7jCUGYQB
         szV8B1UwjEwBekRqRPx3JWL3+TK+0CKVZXfYNiiJloBESNzfo4N91XxAqPOM6+WldqYK
         ZDvn9syVEJEw+bx9qE7YEfmoSDC9xo24G2hn5HayVUTaR3LcKfUpPOfUDrLXPhcHWsyv
         YVsYZ0aE7iO6NtHOfp00kpafH5Hy3+l3J3xfyo9JcO7GNnqk1PECxu+F1hY8361YddMj
         fAHNLS04MLKI4yZ2lWl6RcuRhGFoq5UrkWxufQ+w6YnQ9/fEmtKQe7FxpdQgpiWFWY44
         2a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654635; x=1793259435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hYc9omMporgQ8o9YFrSac2Ru+5Zr0Ii2QHfzgUBX1Q=;
        b=fiFdlR6suEV/xG5Jv3y8xFEJ4E390pV/ZWiXfOQ/N52es8oKn1R4l2hpll3AAMfBiR
         6Nuk3wVAjFwG/n3EvuA9pkzSon01RkYbgEbS3NrHAougqoa7HZilkvGATRehKPjYiRx9
         sD60k3rVqeMiWXQI5UPoMpOq9aSdjXq85GGIhLGw65ykC3BdmooAGhx//uAfwxlvxHKm
         YfOmdtNlmUOMzYvdvGrDcMscc9YMApJqgRPY4G587I97uijBQrODIBPNvcrsbn0nVpKn
         0WEnqZqsSG3UjFBQbVwoKSBFsnUMTVZgFAK2g1j+gedN7RF1ZyWujkcbIb4zF2u+wTsq
         S+XA==
X-Forwarded-Encrypted: i=1; AKwUvBzNPr0sKexDc4p7mEPXgsM2k+KKb9gfeoxoLoCmudEgglYxa+WLDMGX61SbDYvSGDQD30DE+hzdLkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqzXg+Wl7NRz4X9YDUAs3hcz6qOlUAaV/c1cy29Wx1Btp/5yBg
	wHbbI/sHHzXNFL3T5k+4dSEVqTA2a0YAyKfgliMmPWIgmfemy+zPxsqSUnCruc5g4PTLXiRiyVY
	GHPL3FLeAFY4REy48ybjybq0SzUCL3qOo2csIDaCy+JYGnmy7ljmQYJGnouQRZG0=
X-Gm-Gg: AYBFou25/JO+UVwH5gZr9WkZA3SzsoFJuZyp98TOtLPa7vbnhSSJXBcn0uHSmyaMk9F
	V6j1mEs6pQDQ3vB2E9wxGNiM2t5DqkotPJ5Tt+n3boykzBvcMN+NmStvpgOnVM53mBmBvY/yDbS
	kVLKYsyA5/+UsmO7ZmeNydVS+jFQiCLq94vtVzslM4kjZxIu1lOZnBxiDD8rl10jwHculezXvfM
	2c3G1SmYlgxZD7lJgYf4cQzI9Nn8fPOMSn4axHQRCAjWgvzybcppZLMaUshKvh1ygDJYpuw6UZ2
	symkoDZ9/dGR2oYBFGFBUjC3c245GGrbwzaT++YcbbN80u9ZIUtoNw2HhmHe/2m1fuaDLTzbJH+
	HnsNJrpGxeOowWGascL7X1tYnJpJCacXTwqJpkzAgGeQsHNTl3g==
X-Received: by 2002:a05:7300:f80a:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-367c9ad42d2mr4506139eec.26.1792654634708;
        Thu, 22 Oct 2026 00:37:14 -0700 (PDT)
X-Received: by 2002:a05:7300:f80a:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-367c9ad42d2mr4506118eec.26.1792654634161;
        Thu, 22 Oct 2026 00:37:14 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm10507642eec.29.2026.10.22.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:37:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 00:37:11 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Message-ID: <atm9J7LVKhohcINl@hu-petche-lv.qualcomm.com>
References: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
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
In-Reply-To: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX1+u/2auxCFan
 C2yg9xH6sLbetN5J5esVWd5rPEX6NKrJZJgv9SdC528jFTffxqlnd07TT3uq+wnEiJh68UvLC3y
 vz3SOPgNLVxnt4xaKsNvO4JnNH9T8ZXA+GNZatz7s3GW4cC6we7eqbWzkCq+f43rPillz9UyDOd
 rNHyYAI7uUI0AK7McEKgflgFWeQNsOC22qcYpiuXKFoyUYYn8PBZKZmwoSBkfJwfkHlb2JmP5ty
 vdVsph0zWabqug+76K6Xt/LVeziD2cN94YiPhCkkJUFldP++1ZAD316JXhJOY0PBF52cu9zZofj
 A4JLAMupLD4/2sj0tFX+xxPa+/mpEX+3de0mVHgy0KnHR92sCAdEz4vv7mlylKMPJB4cAfY8qGD
 /TB5RaLWy02+urolHLpmyJowhe+dkDP3qsSv/75n/0K88HF82ouhkWz4LGePMV9vg2qUsVOOvcJ
 Vc2iIuZUaZ1GOYCEW5A==
X-Proofpoint-GUID: iLctaUTZg5vLzJ_dyUakabNeh9nU4emT
X-Proofpoint-ORIG-GUID: iLctaUTZg5vLzJ_dyUakabNeh9nU4emT
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9bd2b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pciwyVzMXmyOzB9NHcoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX0fBtj3oBmDQt
 YsnYYNSD/YVF2t0LFsBO6/PS6H3bx7QmQme9PSMSm94qFT7uzEman2B1MJSLBrtUMlIgiKDGkSz
 K58EARf5g71AayqyARpaxAu9ST91N/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220030

On 26-10-22 10:56:02, Prashanth K wrote:
> Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
> system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
> xhci is initialised. Since the probe failed, hcd will be null, and the
> subsequent access results in a NULL pointer dereference
> 
> Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000058
> 
> Call trace:
>   dwc3_qcom_pm_suspend
>   dpm_run_callback
>   device_suspend
>   dpm_suspend
>   dpm_suspend_start
>   suspend_devices_and_enter
>   pm_suspend
> 
> Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
> before accessing it.
> 
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
> Changes in v3: 
>  - Initialised udev to null, as suggested by sashiko bot.
>  - Link to v2: https://lore.kernel.org/all/20261022044748.2303528-1-prashanth.k@oss.qualcomm.com/ 
> 
> Changes in v2:
>  - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
>  - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..e4bf0d5fc9f1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -231,7 +231,7 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>  
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>  {
> -	struct usb_device *udev;
> +	struct usb_device *udev = NULL;
>  	struct usb_hcd __maybe_unused *hcd;
>  	struct dwc3 *dwc = &qcom->dwc;
>  
> @@ -241,9 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
>  	hcd = platform_get_drvdata(dwc->xhci);
>  
>  #ifdef CONFIG_USB
> -	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
> -#else
> -	udev = NULL;
> +	if (hcd)
> +		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
>  #endif
>  	if (!udev)
>  		return USB_SPEED_UNKNOWN;
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
