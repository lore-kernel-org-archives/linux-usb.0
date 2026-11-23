Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413701;
	b=f+1JtD8BuyCEu5KeQc1x4mFMK2EuKafXNCLeJ0AB8+7tQXRE8twGLXYmyayAWE4ooojP
	 0ujYPc4u4kKGN4Sq/8svzH8wKFROzje2JWqwNlHwF+nq0rTWROggvwzAsowMIYI1eWzbp
	 Sb1rKIgBbwYYgxd6CyOQGNZAOmtEILMnrC0QnfGZA5Wdi+6APvIb7RGH+Q5ncScZk6rLg
	 EIXMEog6EKlDlGlHoih0oAZ4s8V/snP8+5+DGWPOHJ3SrlmapOnh/+bgTLPbc9oTo1Iwa
	 4VoExcaH1ZVO04cZHEzJKcfiXRarRrHrm14gXw4+/us374kAnGwr8j+82dOvkDcraqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=;
	b=tgNDRrT7H1oKiqPY1F0jrkrn1E5stpdd7Sty+9maYHnMM7Q8EJ1y/tQxeg80xdPugvor
	 7ETSzaidO4wC1XHqXdB2zkCvFP/tXDClQ3t2ietaoN4Z8lZnA0WkuvOJCO/gsq4E4Yr4X
	 ANJ+V0NO1+fUBLGuzVaJtkE1LjlV+GsyaCGuIZUznvOhv3AQMX3M8FbifogzdqIcCvcAU
	 RpwQCubtt/DounPz3HyTgsPzUYiK9PQE7U8rmXxdfqIuD8PmdLNi/Ga5WQPBv5WVORUI8
	 4aKh4wPMPsV50p89a/6InpTc7ILMtxS+ifGQmeCcONsaQ+aW6r66Z9+ui+4OAlGQeZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtzaIw8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/n8jnEX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC9606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7AC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtzaIw8r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/n8jnEX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN518M1355650
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=; b=EtzaIw8rGcQzh2Dj
	wnTXDofEbfY32bwsYU96JGYvM3ZpOj2EVzHDzsqeBtXyPHsUHcxXAlTvYvLqXkbu
	W/mp+iw9BoNrf6drGbyHMhWHbpZQ7Xrl9EEkoqUkYAycUfY5cZ+jGCpdBF5HXIGj
	WoelSNpdAKjQjAs5jFec+L+duXBRuywvbcyp+PEHc6MV2vsQLf4cPlbfiKWnmaNk
	cNxezMT0xV+T+ffNOfCa9jepjzs9d6o0MfonmPFhnsBxH9B2o09ZiLa9o9XwCY4p
	KbN0un33j4nTpOAf+DFpbXSMFdVww0vFtYo/OPrv6x0Jr1D3njMweBDVv0qwJcEw
	9y7ymQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka583p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:01:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so4080187a91.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 22:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413699; x=1796018499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=;
        b=U/n8jnEXyU8oW34XNpcZjjP1qGZM5Dv5vPouYXcRFjk8ZzyB8JMPRdgVuUJfqku9yW
         xmlLxOSCqeYK8tejFEA4AtcxgLd1tAPQ28K2Tb37FP4q43X5s9HjQxZg7Fy6eIKD30Gq
         RvrIT5IEFjH80A3J7pmVvEdj0keVgDf8VcRhz+0KqMja1rlKLetkl3Hv7/q89G6zR68R
         FGjQbzJlP0ahNAms2oMW1E0CUPv1XMr79sOaFNZ7MCdEzEPAOiD/QWosTYbFn2ENIEQX
         exg2SIQg76v0XioOXu7++PBX7WNXD4mgBh9e98whnei0F+hBbPIMiVCbwDMVBw8OjXJg
         VyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413699; x=1796018499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ytng5MtYFwClnFd7WOkPlR7X/luEj1Eg5bipar2EOU=;
        b=NVSU7qPapue44+EnFGZUQ58Yp3BqGI0MOI28eoTAZaaJltGQLfukbPOMBQUrT6gWp3
         iVPBN1ow/B/5tevHiKR/yi2BEwW3tF/uqUIbGpGasjfBiCkeIioeatAeGW/iWTi4HUu8
         Xiqh5pMy2QnhG1DMKnsl9f8+iSYf6Soo33YdDTFh70EgTR9FzXZiCU8dZfpyGl4RgF3m
         GGyUdYZJlzbHK0USFm9b/q8ipdLNT0rQKT6ezHgfMw3Nb9HFI9YY6pwafEaqy8g+V8UD
         GFgyI/+Cp8iBbbX/NqXUhaSuV7+fifHYAKqUDjEHprYyG+8weGzMk/WVEVO6wOaRiR11
         pRCg==
X-Gm-Message-State: APuU4Z8lSjfD86JGkG00vBsp1GSR268D7FzFPR++hTJxVDGdhUKJV+z6
	Rcm8S3p822JdUX2oPOy5IIaaY2W5q+eiv5d2KEoDLXinL3TS+pVqNf9uvP8LXlHxwFCiM7juY15
	tvVcW7ZAX/4hNuEg/oScN+SKWctls76AS8Ia62nskYZKdSwRFWxARebIsyNMEWpBSxmqfytU=
X-Gm-Gg: AZFdTZeiMP9ITBiLCAZiMT8XMzECgSRXY5mM3IJmXIJJr9zdFg3R+FoPdkKYJb1H9Gl
	yDvy2lXtQd2RxG5iKYaHuSeAQLhvqtGinb7SMopLatrDrRNw6VgHtq+PYJ0uUDQUr5n0edTD0y9
	1EtqxDLUYP9yzKjIaJxS3xzdMyuZLJRZltQIKqTvBg2NbaXqWOiWdaNo/NcWmCt90MlBAJjaEmT
	/uLEbcufhoIXjZuJ+kKRq92HB3qn96T4YjTYbToPOVraygztCefxiqi1gme2SZe4Fq8oEiV2gte
	+5X6ffPj1tdx4Cl70fdZ/gD+XiZc2iylWu6vmEf02TzQAI6gkTcWt4j3TkYZo8GUcM7m02vCDGz
	1wRRkiLVD2lyrTMXrb4pGQZeoXd9hBMRMQyvk8pAInVkm6ITgC4BLp8VEQn0kF5JID0Kg+RHqrU
	h7
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr10028682a91.30.1795413699305;
        Sun, 22 Nov 2026 22:01:39 -0800 (PST)
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr10028663a91.30.1795413698817;
        Sun, 22 Nov 2026 22:01:38 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm19210477a91.15.2026.11.22.22.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:01:37 -0800 (PST)
Message-ID: <1e2a8c71-61ac-4582-971c-15beb44e8675@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:31:34 +0530
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable <stable@kernel.org>, Peter Chen <peter.chen@oss.qualcomm.com>
References: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20261106051605.1398445-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX2QF2zaUOhebK
 WaA1+0CsS29rtBc+NXzE5r6h42fMjg2BDnZBgZ3vzPgBTQMWG82MhB/hxEQYmMWJ8eDwrH6KATN
 fXubB8oDFOu+2rTaYmsk8p9tU8YEkhB1FTg7Amd859Ly/5ppT+HgFaIEb9ml0fU93vGEePpkeu8
 Gs6yOmByEvxzvxpn2DPxIq2bLJeCl1LH5TrZl8UWRg/WupI71i2qaNerGDgt8Idz4NDihDE4Byc
 LhO+hhkbdP7jarDVQ9tj8+Yrt73eb5Kd9ijVCjrZ/TljBXibEIvrbW8ZOZHD1tT8GD+A2dSYQAM
 oeEvh3yf3OhCn09U4NDEWi5GRYU1Xmtr6TpYvCqJIxKbIACpcozpYWJTDN97ondc/P4X+x3ZuiX
 br9HluCtb2SuOOaGkMTAMnL6AkrT5sao5sesvse7uapL+LtzS5toJ+bzL5sIyl23js/oCeMMqk/
 pChG8bPKuI38WC+8CuQ==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b03d6c4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=DCMSvNR7CDFSMyVHwa0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: p8YGQQLKdIcf58yxz7sxkZKmGyj3Zl4y
X-Proofpoint-ORIG-GUID: p8YGQQLKdIcf58yxz7sxkZKmGyj3Zl4y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX6NCArlm44nwS
 ryLLZklJTnwUZZwhvH+A1ryOs6VhTNBdLhOP6bjSJ5/HwPT9VExgMawPdfyzaVmOq/1TxtJUT1m
 VbmYeojyWIqi7P5Uk4zo3sVDk8bsJPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230023


On 11/6/2026 10:46 AM, Prashanth K wrote:
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
> Cc: stable <stable@kernel.org>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
> Resending with Cc stable tag and review tags.
> Sorry for the spam, Greg can you please review and pick this patch ?
Let me know if you need me to send v4 instead of RESEND.

Thanks in advance,
Prashanth K
