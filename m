Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A493E6DEC
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 04:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753827; cv=none; b=YEauL8A+Qv0CJjBXU3TzhuF8q6zYrSmvz8kEeXv1DZ24itul5dc9SRIC4GtMwxuVyBCSJ2lf2WjFhT7WsAnQLALUOjNSVTj0h3JnfmonPKFczSfgyCEkDAeLRp1rZB79FRKgd49oee8NX5QIf+6FPLzo2wlxCLcoNoSwsf2CBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753827; c=relaxed/simple;
	bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EixJaOL6mmnhJmOBeQmXmt9Y3pRYnDXuUPJvSiw7egd/rEj/FzhWX6qzXdtLo5MAxIG7rESb/RzlNcP65TOwtDFKGKo+2rv5v0jgB+dhTKTH9SRk39Ja41e3OSm8SXLPvE7y+CJYmzEnuCiVXE2MZ1jSAIDad2XtJtmIxN7iNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBIuitbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IunGOKcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBIuitbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IunGOKcG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lD0w2903344
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 04:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sTKj9Jv2t7/BXQkxDF3ghvbi
	kI/mjUGSNZGW6c+GyMU=; b=MBIuitbwxT5zwJkvMtLMB8s1RXqa4SfhuLJoqZX4
	8YfpmR59vTCoR8JsCiCygO4Uci9Q77oYkXsSyfRG0KAHZa+h0/Cp7//j6GHgUK6g
	VSqObHE9odCpKinaFNtNkxqJr7+lBeRE8MpqcnZL4TehpE6WZuzyPAwXtARSFQY7
	u9/WJV/GJNo8J+u0zuJC7+pIQ4V7+3wrdAG1/XHNv2ifDlS3yz1r3BgWtSkEFTRM
	zeDiW0FnliI8rmFylZyvIxmkYAosUPlzt91D6yGiT5rj9LWwlvqkPNjNpRKPHL0v
	2aX9ox+us0J3/eajvfvWuUy+2QGaxI5V+jbiCk3WskEdyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq5dy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 04:03:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso5792683a12.2
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753824; x=1789358624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
        b=IunGOKcGqEgKF5b2Qe4MZYzJseSFkCkQm+bZrllDkdmr8g3yVwLUZd1Y60pHeQPjOV
         YvtDrDCYllfvCWnY4shXvMXY4aNwwoXDErvpoYbu9xR38z046clTws2dATKb4qnPI2Yi
         XozvZTOn4mOSMHMM56q4LKp96lZktQwtugk1qPGXoCRxUrhNwEx2n4PjtU/6FwsmaWOc
         H5g7jeiw5S1dZ0FoZ+N7pb1Sw4TreJQ510AkchVD69SwTTfMZ486oj2o04Bn+Xke2lP2
         pBPk/rfxpO7KMetNXSDfCih3G/aSmA7AhoIzUgKMoYw31gnLfRQAOPtTGPT/sbrDsElr
         ogcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753824; x=1789358624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
        b=U2kgTaSWGiM+8pS7mnAT4XFl1ae4ti9+UPDD0PAMEjLY++FhY1F3B0n2OMl/memgyc
         ThosIseGljPKEBWZVkjvtGZl2fULduTRddKMpYjKbQLWU6eENY+Ae8tLtOuRJ9HDOCUi
         GcauCDL26d/H8LcZVYO6Rm8+ep2XoFMb8Svvg2nCCVvVK6VAFG1UwlzGF+4ojCjd0L+x
         nS1jZVkDQAuX/mVx4/T51BGlGBjt8AAn/jhUw9Cixh8wp+yaBWTnGNcCqTVZZIyNzG8d
         vtvIhUy74yKh4navSt78CA8kcGkWpwWKE476Y/aqWpmwjzjGvgmiPYRiW4XSt41chTl3
         N9mg==
X-Forwarded-Encrypted: i=1; AKwUvByOt8E7V+zyMlxZNZS1GrtW5zeMENyECq2PzEQol8iwg/VJ7yLzqjemf2G+oC2ocsMO4X6bYyRz58U=@vger.kernel.org
X-Gm-Message-State: AFuF++lPocoapZCL+gmbkeHmdyQx5s/uwA/p5IK9vKcM3OaB+FG7VpcK
	IwaaKLGEfMgLesXudezlj6N+Swd1NQ11E5bnRhfXJM/B2/UdRh9f/toJ4CBzlcC05OiKtFxh7o+
	iD7VbvnpyZVGpC7LczYW0tm/XAD3Vz+f22Gq0iTVohINyJMowZEyAc2gsjEkoiqM=
X-Gm-Gg: AYBFou2ovB37HpIuDL+YwmgKNDp/QoYM1MrEgywnFGOPmq+/GFeBCD7vbjJIMdqCQUn
	ZnebxQmzHmUvjGYagb4/0ytCI44LU/u7IhSY83XAzhQX0L57Pz9CW9UnkajtZ/XZHCry0VE0cLH
	JC9eYOHFls43gsPmo5oN/UBZjGy2TtIaDIJlYoeVGAgF40XsFWDUhn6wXZ9wf3ZN+MfwftAM+UR
	o4Wz/XFZsSnm87GbkU+skPH/waV7a7p0N9mdWPznmiwKHw8vjxxAk6EF/apzPA9lntCPsGjz+Co
	u8VmixkmP/ZyhMYjRuO4vEVY5IAc1zQunSx+wCBpRm2y0z/unWWzvQ1igJrfg5KxF5a66qkBzlv
	xccUpuZxP4/zTIET4etg+WIFzZP/2w6xLKr92MKX62u46Fna4Cr26vNHuclDi6h9MMfDzbh2a/m
	qqX6qNCPyMeD2cqCaGg8AhDQtEE2J26Q==
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr30401138a91.9.1788753823957;
        Sun, 06 Sep 2026 21:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr30401097a91.9.1788753823505;
        Sun, 06 Sep 2026 21:03:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26399531eec.2.2026.09.06.21.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:03:42 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:33:35 +0530
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
Subject: Re: [PATCH v2 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Message-ID: <ap43l807O12nnw/T@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9e37a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=6e2pY-Gdj0T4IznGSBUA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX4TpGuEX4dne3
 uM4kxgrlsOvMMGqIlCAS+n8pux6gloMJ2OhUsF5ds0mtd2L3xlvcbivsBXS8mfj4yU8SQu2jOjV
 P72IPXJe2JLXaAMXDTy22T9MeSpkKoc=
X-Proofpoint-ORIG-GUID: 9tL4h6bPai349H0RLQP49EX82Kr3MtPE
X-Proofpoint-GUID: 9tL4h6bPai349H0RLQP49EX82Kr3MtPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfXzTNkc5gw5hYT
 EEs42YlCjow/hwCnomRP7cRpCT4nTaPRU06GEqAtnCqg34ezu+OOli0n/q+IO6Sy3RCrK3nOffF
 uLgVagPtKcdcs7+s32savduLSVDOem7aZ83BHU+ETOVCDuOPlnnwfASNCWOzDXXvDE9LJoJu7kU
 21A5XfR3QDXUSuE1Ww6oZrRszgYrq+kKos4V54q6HYbUA/4MecU3gZg/G+l+kTJCjifVS3bzFUl
 cNPrPgXR8RnlYTpD7ohUqK22ff3hjicTk9kEXmoSWZkaUUsOZqJ5HHbU1H0kC1kFnLFf6eq+2iA
 W3aB516Lz/rwcm0ILyvYwVCevvT1OKsT3+ySegnJu954qF0JKY0mZWwWCEa09f3wROg9IJkUeUU
 R8CotAxiWozDV3aAD/aaz1bB+xvgO6eFKa0RBiq7S3lUJToSeAzZArWJI1H7myFNdPHOkt3h2wb
 GLq3FNAXiiB42oEYy3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070039

On Sun, Sep 06, 2026 at 07:52:41AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
>
> The clock rate is used by the dwc3 core to compute the reference clock
> period and frame length adjustment. This is needed when the reference
> clock rate used computes values that deviate from the hardware defaults.
> Above mentioned SoCs require values different from the defaults and, as
> such, the core initializes with the wrong values which leads to
> non-functional USB operation.
>
> In Qualcomm chipsets, if available, the UTMI clock is used as the
> reference clock. Therefore, acquire the reference clock by name
> ('mock_utmi') and pass its clock rate to the core using the probe_data
> structure.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
