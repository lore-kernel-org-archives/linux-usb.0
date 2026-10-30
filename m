Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352554;
	b=YJF2uJJyRw5d8hivse2T4Mp2FIpqg91j1+eJApgJo78H5MNmfegTPNy7zx8/DF4rxp2I
	 bJ5ZgigtoXKBPkKYAohWvsa4GBxTHFhJvXXl1ZQsSnk7rbUJf/ObLaXlrJx6GNEq183tX
	 cVHE3I7w8SHEniALvtIhQqBxZAlEecv8e/mfPX+t9WOrrjU664jnN9r7PKfnz9qGbwUxA
	 XK8du8vP1egJ95AYbx8Jlt+R+HM5mspi4AuU0T4vPUVPOZ75FAIjJ3LAjAHpJbTQjnWyf
	 PbvfiZZGJRrj7kDgLtuGmiZQ9POp4imyqzVicFbSbyRPI6Ac7Jnh9sJYe3Q1dgjsp6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wXZHQUfqjVTSYiMFo0bGuwr+L4meMVtULMlFeF9aVzc=;
	b=tlDUaWwkjEkcoxLjxAnwFyFRopO0/DZvYZdmIFcBUSr7+M5FGjsYrT+XX8wmo0G8puH4
	 VtYCuw2/H5BEQjg4rQScXXHWaGocmRDSQeLrLW6jflWwirFvSXVDwSy+ZzSYrkQyzqUEo
	 5reKm+qNvzWD49PfwY05waiqnWQc2qPquDFS3wTeYvCP3z7aM/XHgCVr5AHVn33rOO02+
	 rylfGWOcDIUfP5qHZmQJKOfkVDI2I4kyxJdN8h3LWMbDF18ae7RM39FGsd7GDBSUMLUoz
	 59g2xg+UyI4MPFA56ROFiWzva8sXvrOWecwA3uIqTqqDGmjDpo+hCKR56JVeNRJFeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6rAJI8M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuhFb8Td;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA1606A31D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EA1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6rAJI8M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuhFb8Td
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EuiP1761689
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wXZHQUfqjVTSYiMFo0bGuwr+
	L4meMVtULMlFeF9aVzc=; b=j6rAJI8M/Zb2q2sFnpAsacQx5LVbo5FrtFKZcNLa
	fcmVOMPkXIJ95L5dua4UstTqzDE8ZHXDCYWFc5dOUIbvTw2dRnCTbiRvZhP+Bsdm
	jFC0bRu+cTLWEheX7rRHWO2F+eMDBMsTrLL/MpvtRIL7Y6FXxGdDdqB0i8V5Bq4Z
	u2EWBfEYJ7w883hhqiJXHIH4SCbvoIDmOlTw8Fy00gzSqiPLc8egN3vwvfQDhahs
	G9R6kAJm2IUdQm79On+nKKO6gkbCTilJlJxq3Q7K2DmzS4lfn/pWfoiQ2ywZKoGO
	/ylo/dioaTXDpmTxDurB3Sf4AuNHK0uVJ9e/zd1D1aa1jQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa6p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:29:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso766661eec.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352553; x=1793957353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXZHQUfqjVTSYiMFo0bGuwr+L4meMVtULMlFeF9aVzc=;
        b=NuhFb8TdK2dYYULEnJQpkAohXw45a0hJPRFoStFBpDp1NqrLaE4x+zOk9TrMBnbQC+
         EdHgr2G4VZG57f3guQERO0JldqdbjWMpEaWc/eTq+tbvnL2t1XhxV6cw0PcStD7c4Ty0
         i0GiyKx6K2karJF9sxlxWkrfYo/ZQXtlxNt1Gk9S1PY4SRxPf31ZVSdd1B5/QSNCWcPd
         /PBjoaddUr4vb7jDaOI6nbQ107kTuoepKrzRQgq+9ELmEMUguTYpD8ii80yZr76OrkGV
         XyHozM8YYqqbWSZQ5g8QC94lE+k5/t8qb3wVqDUK/8bwsujR0E4gke56o2iY5PCsbbB5
         WWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352553; x=1793957353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXZHQUfqjVTSYiMFo0bGuwr+L4meMVtULMlFeF9aVzc=;
        b=EQmwImDuQJ8aqpe1ZSOs39StGevbn8h4kWhMdlT2uzlqDcKg5GuqloDtukDFnmMdl/
         o3gl93LMH8SbETsws5nlEufx/K6NegViPXhSCVf46ghd5Z0zmr2rTRnjVgZhJdi/C/Oe
         xDJB99CQ2f1IR3wjibN9OshKLK9m8/9LXg2s6nJ8J6pkU8j/c63md+LJTH1bDk3EeVxv
         bwGQ9Obb7R8voc11a5BDPs4fNO5lG/SzJvvO7axkGS2elF818PYV8e9zsqnit69eXpdp
         eua7vWOtp2FDTIQYMlH7QH4MRwQn4Mr5vqsyw0BNN2+w5/+66H8c97jlLYiNOtuu0iv2
         fsXw==
X-Gm-Message-State: AFq9FYI27JyHyuP0tr7meMftivQThOwqF9TJMlFjybDoIu1CBE9ZEyI4
	auKN3PvP9dyn55xMergQVg4HDxtJs+4FQOCrsf0aThcILWkOOM5B0oJXmXbJAN4KZGOXnz7hA9U
	9GSVL6CbOSofM0pEzCzdlRA1u0OGQKK8GTSOokY/6YtFbIqp3WG6vlX0Q/qOSaLo=
X-Gm-Gg: AYBFou0e4n6rzsH5jgO1OfM7nfz2W7UdSAOqdDwqSrpTjt52IDsH1xEvItLd2KXnqcc
	9T68GUllWNPb4HPHDwe5/NDrK/pvI+CBG4Iv+P2+gUzbJruURMZB4e4SF7wXw8Zzk5M0f3RZ+p2
	HLSm9Z8onJu1OxarCbQ6Yh670jmLG2rSeWDH77G6CI6J7Mtc6Lft3xwBPdagflOrTG7MLr1XlUQ
	g4GYb01oEDfdgJTAbM1T8Sk+L28TcgjZWU0QOm8IbEadEbtGqzGSnnvurXBgYYFa+xiQi4tOesN
	l4l9nib/rT7JCsSHHimDs3FDGHKyN0NEgc7+5nwQYT+IlBK2s2Krsa088CoMEv/vhexjbHstr5Z
	dCgss0ZOORV5IhSdEmtY9VXnlRZ3aX+EMXw/HKtkeKBps57TwilUtcoL+AhIN8zjegjIWJ5FeUu
	IKHA9xHr+2H74Xq5tlYVFo6w==
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr2726553eec.13.1793352552524;
        Fri, 30 Oct 2026 02:29:12 -0700 (PDT)
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr2726526eec.13.1793352551752;
        Fri, 30 Oct 2026 02:29:11 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm7970406eec.16.2026.10.30.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:29:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 02:29:08 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] usb: host: xhci-plat: Support
 XHCI_RESET_ON_RESUME via device property
Message-ID: <auRjZCbhL-7aubN6@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <6499d6761ba6f338544fc8a90b4a96e55b5b4b12.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <6499d6761ba6f338544fc8a90b4a96e55b5b4b12.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX2LpkY2EFiZO1
 j7TJhvjWUjNf8tRi0aXHBjKJikFF3lo/CCmrX1T3A6LmDIu3+OaRUfC4SJTueDsOiQ1rPvyZkr3
 077xhrxFHxQrob3MH3/IypA0Tg3uvvBx01GALjesRHNGjHKREKXks2e0p6PvzD17crY6+3fg6vK
 scKBoeWgh0YK+MLO9uJx0lDtEEF0M9bAi2QunyGA649BHUsmdEP2axZn2se04hy43OwUpOYVpYK
 B+RsCLBqOh5MnN/VYjhuyyEDvWye7jKPPrSNaEQPS7zm6XwwQnMxoFMZ71WOFKb7H1kHMtgTqTF
 9ckOzHRM32cPiuH/FzYDWoViCljTJqa3cVo+mIvMSWOpDPoASuDDDRNd9qvThs2Eh3kFmBNgDhi
 UASw5WIDLZPVZHLtQtQe8OejtZzEn7340Hxk/pANRU1IIQc/UZ2HyvmlyZ9yNHoUgJaAmNiJfPX
 4n3QJX/Nf4CxFdzM3Lg==
X-Proofpoint-GUID: YarH0oLTIpwsUfQ-LnS2ANUAIEoucScH
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae46369 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=456oqEKErFOAmiHxQ1AA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: YarH0oLTIpwsUfQ-LnS2ANUAIEoucScH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX8K5wunFofRpn
 xKwYFTlL/xt/yZUMtjLqVD5AqAsWG25+2OkHB/ecCfiTCgrI77dVQxUNZuIuH7AIfcslwGx1VBE
 rQFcwlrqiW4AJhjMNXNH/1JHUgSEr9U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300037

On 26-10-29 00:29:34, Faisal Hassan wrote:
> When the USB controller loses power during PM suspend (as occurs
> on targets like SA8255P that fully power off the controller),
> it generates a Host Controller Error (HCE) on resume requiring
> full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
> quirk (introduced upstream in 8b328f8002bc).
> 
> Read the "xhci-reset-on-resume-quirk" device property to set
> XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
> to enable the quirk via software nodes.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/host/xhci-plat.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 6fd595f81a30..0093ed24ac3f 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
>  			xhci->quirks |= XHCI_SKIP_PHY_INIT;
>  
> +		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
> +			xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>  		device_property_read_u32(tmpdev, "imod-interval-ns",
>  					 &xhci->imod_interval);
>  		device_property_read_u16(tmpdev, "num-hc-interrupters",
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
