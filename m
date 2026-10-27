Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099184;
	b=5ewg0w17i/SeyuLdPt3BlGIfuA6z+oriExQCD0VaJ4efqPtnICft8BMuX8WqkZzda+OI
	 BFAmGmFRnjDhaTcRiRgG27w9WZYdbqSNKE3QY8GUJy9HPYIwJ6CGW0Tn060doqLftpUMo
	 HGLrh5KhcJzj0B/oz4KAUVkeANbAM2TAPqMh4NMhvfSjviL8T4A2tHmrxHhKq4c2eDZ7Q
	 tPgqyhSaEBL/Mrgl8ocnLjYOZYtj4bgnKo+yBU/ak3H4pJYhreZmWRrk97kPWdVUHoOti
	 t4xTuziLh+x9pyieuEn7D8jxHuKZbLz6K6HILX6xSvGLD6mOhBjEpjYI4xQX02RlCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OUuCOnLfKKTRSWCshc67FPxRhiZlMf4qzEdijvxDUEI=;
	b=iXYT04wga3H1SvOeWSJinzdRHEznf1byFgmXMRJGE4wgObRde2H1f/6doEsJiWbbeTKO
	 wCOdz0jD/HhjxRbSpQDpxZhX9P2sEOkoY2XAVSPzqixxR/VSUEHL3+bQcto6ajaSRm6qK
	 A2op2Sxwm/yUhkqILeaPGAdIlt0iT+GCyMF13w/fG9qaKUqbKxlOxs8ZDkSisvjvKwrux
	 Dba7Ds3o2xdYi5UzfoRANvPKFMb0vizBAzHNeLgEOfZwFa1u+eMwbwzMd93HEO+U1Fzoe
	 1RYBgH+k3p34lkhLRrZf5Ly1n8JA94BjiduMnBkzS9+nzSrP/+spsYvDY67aobrcpbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FR7jJopP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SwnvoreJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E05B606A31F
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E05B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FR7jJopP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SwnvoreJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxlp2458146
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OUuCOnLfKKTRSWCshc67FPxR
	hiZlMf4qzEdijvxDUEI=; b=FR7jJopPaFG8+umy4Wm07kD8u3SpE+wDPNDJcqlT
	Qsi/4nOChDsA/BkeAsZYlAN8tt1feuXnDD8fNTb+oLGxX9ipeb74FsjZfZ4cnAt4
	fv9kUL4Cac6AEArnlk2NgeZ5YL7TYjiUwrDX6rtB8dhF+3g2CAMEpHTgjj17X2i/
	96t0Vw7SDoLbV4DjDLnVPO1xE+l3WGxIlTbDoGzMdZOUWw31oR37x33N8eDR1WRm
	FVQ5Cp6Y+5cYE0ZkTJZ60EtUlgEukT3o5a0e882pUDjywB2K1WBtmybRO2KIusjJ
	3/GvCmMMSl8WdL6RYEaq0Nh+koT4eIWBUKLHSTtxzml4cA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9xga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:06:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so3699411137.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099182; x=1793703982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OUuCOnLfKKTRSWCshc67FPxRhiZlMf4qzEdijvxDUEI=;
        b=SwnvoreJT5/UFYbR+X+ab/z6DR2uLs0BS5tB944RVi6uGboXguphQIBEAFDfbhw6DO
         J3zJJgyd0kkhgXXglJNS9JpyxbIrFtryMxQce5C3YsDEf4HZGSY+riZPRP46lCkP/mx4
         d8+z4bWpq8xoa0fZBwX9KgsBvPlsjArd8+l1RKkgi4pzdZDX2etXEh5PC7vimhqgB8NS
         1ecrpF/dOiD1MX92TASOuNEo2PBqVXuj2waB5GHuTEeCFgLRFrGi4RxSdwTxcBe0+KoS
         MuqIx11t3RWLoCte0azw9haZOBva33OQlAMY856I4fZFScYFOkc0t2xFenv52bQirwjI
         3OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099182; x=1793703982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUuCOnLfKKTRSWCshc67FPxRhiZlMf4qzEdijvxDUEI=;
        b=jZrpUUo7XS1ASx+31zzn2deXmcBmB1rbXjOV1VcjB3RV+DBnLWT/eVAdWLL4cOnlZ2
         DpgRBR53UErL8gFVY+4hpIny+9sml7moONPj42K29aqUsaPomuXN2p6W8d45PxRbZcmJ
         hw7cdneazDlKlgNy0+Vew2NrH1vE0SI4cObSRPvJRSQ0bT14fcf7kJRO0z4Vv6t86xFN
         kK/dBQjJwl9z37Q64btFtdCfhx/V4kgO5R3HL2CIOKfIXuZHBxz0eODUWZDk9xoneDi/
         h5DZCt7GK+T7iTNdOXiTyguSbB2UymPwOSOqS1qNyJw42mnZfa6AfpUGv6U7jQsh7irz
         dU/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/R7HzQkd/YbIJeknCyvUF5S/XUyJaUrvQ1FivY3MqPhbZ4dCScKI2iIh0mD8tgeER34pSu7VlcS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH4/EN6plTjCbkfW0l5Jh7ia8qekHHKCNrR/DEJcdxFOfJt17U
	K+DYSIYXhVP0YsrdTdNTdLe76dp4v0EHWP0vcsFzU5koMrgkd97d6HYRx+vQhXrlr83u/sMc6Uj
	FDKmP5YsyKju6m/ArPvIcoLtJmboHPJxhcDHrFjUqBj2VSnUc/V5ss5UOMgGEqFo=
X-Gm-Gg: AYBFou3CStBOyBgtYdfxLsUsVs6lKLRbdTRUGRIJH+dVRfDRKw3rHW/p8B6emKQRihD
	E6OBOJXH8o2JfcngPGhIFytUOkAsFPdHEHPmgNo8wTYNHFUcVTuMO8V940ENT6761LrIlpibnmE
	2fhdEvCAccNK4R8Z5Sy53QnuVHcelYJZhC55dsjrVUVQ37ScyPC7qix9hUyMOqu2I5n49bfto64
	3K1S1zUlrrk/6nlZyOW8sAP2cjDqH/XPmF6EzqbVrNX45HSVZN8rnReIe/U3pAGGuHieCE3sKZh
	IC+Qe01H1Q8ec1anhHasdsUIxbO74xdD4xLQcSM8ZpVk9cnIqurrrN4t0kIMvqBI08OzbCYYpdq
	OPSTnOPR0sLLjA9GXHmgnCVV9JnC78A9LDQSnxNV+DN8BmkaDJcrI/jFDMZOoC1ZL3xvyAT06AX
	2Aam8f37XWx7of
X-Received: by 2002:a05:6102:3ec3:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7ce5ca0e45cmr3417609137.4.1793099182009;
        Tue, 27 Oct 2026 04:06:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec3:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7ce5ca0e45cmr3417591137.4.1793099181477;
        Tue, 27 Oct 2026 04:06:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm21668971fa.15.2026.10.27.04.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:06:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:06:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Filippo Falezza <effeffe99@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
Message-ID: <pudd4ilw5d7hgirwhmq7m5ezrmittfbw5lqjti4tbcjl5lf7l2@uynnc255niww>
References: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
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
In-Reply-To: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXxdKYcKHCmRsA
 E6FgS4D5m0Zw/avL1UPyebVvdsK017TW9M8KT1LhBorP2rMahFndpdAZSdXWzzmag7A4G1BQV+u
 9Tc8hWvN7ZMNbW+l6VJheySv2CZ2CLQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX2kFIH+I+87TO
 tg4r17MJiF+JyySyOf+OOr3GLoZuGfOTCCDCYknX6kTy+e/TjTuDFEMd8PEA7gRVUka5RLpyDBj
 JakkB6EarTfzIEia4DdS04lxn0cwrmzG1dO5k8Otju90JPoFNvVmmdZDfWInQcUe7GfsRzFdsFj
 wEeLXLcf3F2TGkRWg+Lu5FtY8U92XGcDDD0KHbQUDoReJIabeGeQh0IcXzwR537lSagSwl2+5Zd
 90xSaqY2qugVmCk9acLrGy7RVt2LmwuWb+jC6ujLhZsHHYTcr1xXcoXysMCzXpt7JgGJaztm3Cj
 Htxwn/OhPOjRpjs2z1engDPKwj7VBJpf2UT+Jcnno5w+iPnQtg0ZPubod57/SlwHY8CQ4rdImO7
 EQnX0D76HIXwnWBWjy+UsbVXQIaBRppsMARL3rY3bGvA5ojnVPhzz3y26dCYsu4llvNxlc24ojF
 trJj+04A+crlSV4NGfw==
X-Proofpoint-ORIG-GUID: xu3wFlf_dyAB2koUtMHhjucL1j27ttSv
X-Proofpoint-GUID: xu3wFlf_dyAB2koUtMHhjucL1j27ttSv
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae085ae cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=cGONFfNXx7BMzh4v7q4A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On Tue, Oct 27, 2026 at 01:21:42AM +0000, Filippo Falezza wrote:
> Boards whose controller has no SuperSpeed PHY set
> qcom,select-utmi-as-pipe-clk, and the glue then programs QSCRATCH
> GENERAL_CFG so that the core's PIPE clock domain runs from the UTMI
> clock. This is only done at probe.
> 
> When the SoC reaches its deepest state in suspend-to-idle (CX power
> collapse), the QSCRATCH registers lose their contents. On resume the
> core is reinitialised with its PIPE domain unclocked, and the gadget
> does not come back:
> 
>   dwc3-qcom a600000.usb: failed to enable ep0out
> 
> The link stays down until the driver is unbound and bound again.
> 
> Remember the property at probe and select the UTMI clock again in
> dwc3_qcom_resume(), after the clocks and interconnect paths are enabled
> and before the core is resumed. Move dwc3_qcom_select_utmi_clk() up so
> that it is defined before its new caller.
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---
> Hello there,
> 
> this fixes USB peripheral mode after suspend on a Motorola Moto G 5G
> Plus (SM7250), a phone with a USB 2.0-only port that I'm bringing up on
> mainline. Its controller needs qcom,select-utmi-as-pipe-clk. The first
> s2idle that reached CX power collapse broke the gadget: "failed to
> enable ep0out" on resume, and USB networking stayed down until I
> rebound dwc3-qcom by hand. Rebinding works because probe programs
> GENERAL_CFG again, which is what this patch does in the resume path.
> 
> With the patch, the gadget (NCM plus ACM) reconnects after s2idle, and
> the SSH session over the cable that I use for testing survives
> suspend; the phone has run with it on linux-next since 11 October.
> The other boards that use
> qcom,select-utmi-as-pipe-clk should benefit as well, but I have only
> tested this one, in peripheral mode. The legacy glue driver
> (dwc3-qcom-legacy.c) has the same probe-only programming; I left it
> alone because I can't test it.
> 
> The patch is on top of usb-linus (6b4b543fa187) and builds with W=1 for
> arm64.
> 
> I wrote this patch and drafted this note with the help of an AI coding
> assistant (Claude Code). The testing above is on the phone.
> 
> Thanks,
> Filippo
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 45 +++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> 
> @@ -388,6 +406,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  	if (ret)
>  		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
>  
> +	/*
> +	 * The QSCRATCH registers lose their state when the controller's power
> +	 * domain is collapsed during system suspend: select the UTMI clock
> +	 * for the PIPE domain again, or the core can't run without a PIPE
> +	 * clock ("failed to enable ep0out").
> +	 */

This better fits the commit message. Please drop.

With that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	if (qcom->utmi_as_pipe_clk)
> +		dwc3_qcom_select_utmi_clk(qcom);
> +
>  	/* Clear existing events from PHY related to L2 in/out */
>  	for (i = 0; i < qcom->num_ports; i++) {
>  		dwc3_qcom_setbits(qcom->qscratch_base,

-- 
With best wishes
Dmitry
