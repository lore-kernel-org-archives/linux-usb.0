Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639359;
	b=1XSosGtIWLSoVjy8CR9s12MyOjhIS3jfW1j2C/b1xaqAf8DUoSN5qjnBRwhLURW6JU01
	 GLnp+EN791SJNwed//qaJUVhFIfDphpLSQVgUpStrGLFATIvBx/UqrX0HzHB4r/nIbzEw
	 A8xCr4omAdkVHAQ8HuFtbc3R4lwTqsMWiULy7EjwpMYFiN/UrD8adBLJOxoCVmmsfdblA
	 dbmQJiaL+x+9GUi59oIJ/OeyvnzSccVvzgth+LnRW5HLoMBGlic4NlibQZwlX5RzPqi3v
	 VlS4WugdI/tNEHSrRAN8fdR+Hatg9UI6UavWluGz09hPCi6vJtr9DrZDrmLQWB0X9nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
	b=uFh0jE0iubquI4i8dFdOYIdPlpUZ9/49qNvwfSsSGVk6TKaMGZUp07YVg3cD909Ge6sQ
	 JXxInjo84yUD0wHW/cHTiEuqaC55qjkoHQU6UNZQTAJU7pPNR+IfgKz0B3dtYPyyLyjrN
	 GXS6i9oKokgyyxRS1cJa8YrArTpwMlSi8bmiSCoAH3+/lgkvaXZcaDJf+nqHvGvXSRPk7
	 KMyZ91X8bcHNn9/h5Vl9Vc9tm2zyEbgbcn8A5ePoviBq/y2txt5s/tcw3PwB/9MSlKZDD
	 gFSuG7v4zM5cRPhFkgziz+sMdzQyELcts6yigIo3hhwQVEibpZMfoOHAhifkGzIhVTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClalfCpV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkeyjU8z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12260716DF
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 17:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED12260716DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClalfCpV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkeyjU8z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZEmw829750
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 17:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=; b=ClalfCpVKYgZwLpG
	o4M35d5UPvOB5NX3PCW+UtWCe/zCbiDgH2TXEs454m/ZgbYkfA2wN5QKBrMmwhwp
	mW+8EFAvJ1QYqYQPZux5vIuc721PJFh5wWqUOAGFhiqI/T8N4LFG3MKtT7LFjFCd
	3EDEi0Hn8mVC9sZ+OnlZj4GD/eJGFenVIGeomtnUNt8G/dKREKU3nEVoAcS1NUS3
	U8PMouMLQlhGA9FU8XdmrIju7alWNd1a7Y/ZQcVXQd11BTcuff0EN8SgCDh55Rbu
	8z4Rkjyx7U7UMEpUYKcwf2UDODeyyzSpiZNxEhXj4yFunj29HlC5NDz2SxcLrNMk
	jrlTVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6sgn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 17:09:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso472410a91.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793639356; x=1794244156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
        b=XkeyjU8zw5vb3LRIH5CoQoTEUZwAtCQE23Ian2FZjZf3jIIZF6TkUg5bG3NZ4OOVYX
         U5UbmuzwBz+jYj9NKGt0WN+uCgjsYLl6X6vbpfNi5b0oNR54ziPnegaNGTmbPX76sOAh
         Ook5snab4oqXo2nuwayn/ht4HAbJ7+GaCWAVCBYEkn2gL60msMd5ld4ePGLq0fQwR9AZ
         o1DcF2mDc6zQs+tSzfl3m5Iph8MTxHfEOCjv88nJXzxkEjKciD8/m96/O9z8mVItC/xI
         Z5mSs6ctD7HinJ6iVSWXmHfGba+tHb6TVmGuS/KpIPAg1NgdQ8vGbGwUUcWKjGzAqg0d
         MOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639356; x=1794244156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW9GTkHRZwsz400fm+diDjo7fUTHQ83uQseXVYo8FMo=;
        b=HTrlPABmrZnah54eJxA2cQstlaaPyNGLlLCH8yjkN6LHunXT5C76wSP2q/qRIBrWJW
         RWmxekutRUz7X/eWr0vBwxmCg7K6pM8L6uElf31Kf1xy6A+1e+xjNXrAC5Ywf2X+lLIs
         eqeEBY2FWMTNMgfekIvkgUXKhSKrf3nHYZiYBU6gig8qj6iYUyGd/KqJ0Rq6YKR2s0HN
         e8bvdF1Jg7DvedcAr5h6tmQWGUi74dBe9dgtwRQhiTsZRstbWHn/+Urlc7rlDaW64YIC
         a4scAeG4YmDEqVS5uWMB0ufyJI2pRGvUT7tTCCXqaEPYivDG6JvW2Zoy+HcV3txrbrDl
         tH6A==
X-Forwarded-Encrypted: i=1; AKwUvBzvZ0UMFgTIthAqOQtfKaStV2vI/vZeqNkhbgJXm5dDhG2FSVggQrOWL8ml4L/gS2XDSh7EkwF6ERc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RaMYS9G0yie4OHBYjHp+wAaIJvCV8L8ySEIl8ieMEsRN7egM/
	x7lIx4kLzoTkhyvvU7a3HMdxoG7s89oxE5ta7YpBLyoA7ciubj/KooBQEK0xkiwKczihUXQbEpf
	SzhinqwgQ0RPZ2yucEbBSUMgF+85Ts7wThTtBf2b/uit1oHZ8pnP4lWK/wf63Yss=
X-Gm-Gg: AYBFou2etdhmX3bvKb+2mNk8BsnYj5rPbHSjkTcYF+Gkwil3DsdBBfV++/DEOBZu++R
	NN/JWnotT83sX+PQS0EBFoYbCdgSs4Rt+Zynx8unCtdDShNKssS0kyUMdsFc+52R8KJqi/N+KOT
	KBw73pDTUEk0TOOuhxJlV95WwpN7v20lbLO/mgnFFI9Kt3xy3exWT/HYg+6DoFx+T8jc7inY21I
	oePMCBgEauhCZIqpCRdRWC0HPE2WIwK7tc4x5Iqbqhv+zVvXMhGkVK+t4bkolKShzJRqhVN2kXT
	OwejRjbqCyhjT5YVpdy0m2YAB4LYfE4Gr52Rtv/OUE+qRW8hwdsU9hRieqUma6DjnfKyVL6z1Xc
	QvzdEyi40g6dNmrpdp0sWf4BDBXEbauptUqYHd69qkgQUL1AzUYMEKXHI+5vvVUcFt9g+nlmupf
	dK9Q6xqyrtS9KOT8R9zlcMnmTFNFNLE3Ig/Zl/jwI=
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr4756788a91.9.1793639356396;
        Mon, 02 Nov 2026 09:09:16 -0800 (PST)
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr4756766a91.9.1793639355846;
        Mon, 02 Nov 2026 09:09:15 -0800 (PST)
Received: from [192.168.1.6] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6c4259sm35635a91.14.2026.11.02.09.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:09:15 -0800 (PST)
Message-ID: <3da347c7-6c7d-477b-afe6-9dbb37208438@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 22:39:07 +0530
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
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX2xXgOSkl3eq2
 5IpEAXuYY+UdkEeO6/ULWJZgY1iI3jqAo1rEXZSd5PMHnQRiGR09MihD61gKDI4PadriGuVFKpr
 eZUB1tGMZtMOMSLbFzqvdYy/sCVnmub0T9aPJwHZg7XtGQPxOzlb5U/aotK1Ggy1UfyFKtBXR3K
 xl+C+jg56D6bdM9kbpVMJHPnL5fA4Q4zy4kn94v8bV3gCTQn3s9GQfLaMSUJd7HtLpA/fu3g6bV
 X8aDxultrFheENBvjQGpHqwQzQLCPCM0xWLppGVK5O5U0AR9Mwe2Bvew+rQGUWCzd7AqJGgZoR3
 R8ZDcWIEr/93zIcDpx1m5tRyx6My1WbcVEucJFkpDdyXLP/ef/QRupNDvdKvm1D6C6sfeh9xDXr
 x+baDtM6qsYnBPoF0PXoZ+qnCIliFeOrrXVPdVxT9Ig/22alx/EXGdLEuGI5SJAHfZGr68Xym3x
 RKlDe6+fgkmylnv3DRw==
X-Proofpoint-GUID: _a_Y_g5o8T2e_cWe1kMwkips-7ZIbWNl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OCBTYWx0ZWRfX07n5K493wfLF
 lA9stHM/mxc6RHAUnOSB1lTsAxW8vfMhGB8y7a2IY2TrQk8CYq6sVLjwHR2wMVTMzsEy4WdWJAI
 gVa2sIh/Gu40n3W2PXgxr08m84BYVX4=
X-Proofpoint-ORIG-GUID: _a_Y_g5o8T2e_cWe1kMwkips-7ZIbWNl
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae8c3bd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ptdc_f1R2aCmbPsLd1wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020068



On 10/19/2026 7:45 AM, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
> 
>    echo on > /sys/bus/usb/devices/1-1/power/control
> 
> PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
> "port_wait_reset: err = -16".
> 
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

This also fixes one more issue in Glymur wherein the HS Pendrive 
disconnects after exiting pm suspend.

Tested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269ae6e10ea..023a8448449c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			usb-role-switch;
>   			wakeup-source;
> @@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			maximum-speed = "high-speed";
>   
> @@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
>   			tx-fifo-resize;
>   			snps,dis_u2_susphy_quirk;
>   			snps,dis_enblslpm_quirk;
> +			snps,resume-hs-terminations;
>   
>   			dr_mode = "host";
>   			wakeup-source;

