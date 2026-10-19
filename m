Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B23E3D98
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405662; cv=none; b=sPHP3nR2Dp3r2zCnUuJVkI/xMbOxDPWPu8kaaMaCjiFtAPmFGq1g7O+KwmyISIb5bw0Fc2lZsJ7Hd8yh+RHX5nakgCVd04eKk0zgj0xtnqmsnMLbbcuBc+eEAifEQfl880ZzuF3L+QGlQjkqF7h+Rof6VBRjqAPiLt5er6d+McE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405662; c=relaxed/simple;
	bh=fhdMRmOk4Q6FOwCHCXU6v3fO96yNYmwgmXjvfyYXrGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gg58vUAkPTkvKXI5kxaAVLVBeGejwGpr1DE5meq38FywtK69WtMde9T0V29nbEygSup2xAG+FHoK+lvDL0hiTVFptqYmsgt1UhU0Pn273WmDDjRt/5Z8NWKtWcCjMAANNUgsXF3zje4pgPwR1k6558HrZZw4guA4PxZwbPHYgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfHqYT8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDcVDwx8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfHqYT8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDcVDwx8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1sX2041974
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7cX5WoMt08v+q3mmaPF9DY7v
	vrmsgub8TleiLCh5ftA=; b=AfHqYT8R0RbwSHX1yidcBjunQJuRUfbT/KQDJV5X
	X+Pv8XgQJEihxsrxjXDBvFOnP009A5YDXGWrxV/clpuT2dBokIXhElpcLdKO+gOC
	DVsoq98KZ5QMYHc54H1GJTVXyL/FnP9m+22jSuJ4g2+Lw3jH4NYVfMGScgXSHPxY
	UuOH50v6LbEjvKdPDJoB+5VCO69HqUAIUcaYYQWFUVKJ3gekd8lP09WmWjg40rVj
	CcgKeg4WFrcJg5y+uavLgR+ViUKvkzdmKUae/Bz7c1NNEN+qzOJLexfVlFFjWHMM
	yCvEdVw7bnq5Ak0ERyOQs32FM6f253jB53SGH42tIpsJuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur297m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:27:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so389077785a.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405660; x=1793010460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7cX5WoMt08v+q3mmaPF9DY7vvrmsgub8TleiLCh5ftA=;
        b=KDcVDwx8ep3rtxrFhgfkzo0tSWHuXUOOnO8GfazoOn5paXLMVehOSdItj8WX94U34L
         PH+E5D2QyzAGrO9fTAdMlmdSBV7oIGxt9hE8GQi9jywsKlcynnGyRn6udON0IejOZPmd
         fu1IGDPG6kCX7gaIwBGXPmmFCuyXkPolQrFo66rzjFwErJDjPRDRP+Aob+OJWJiFng25
         l7cRXMCF/S6WyOBU6E7ZVMQc9Q7yGmvdrf+ksXl4sWBL43Jw224zpOIpunuPAcfDbI+n
         SWxaRvy545V51Nc++7XrB7UXmqjiDJ1QrWI5a2+7CUSuu9F3EGxTBb0wNw3QmNNH1PKs
         CUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405660; x=1793010460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cX5WoMt08v+q3mmaPF9DY7vvrmsgub8TleiLCh5ftA=;
        b=OFlK+Z0+mJotGz5Kb5GD1teufoDJ/+U5+8+tAiG+UzSKyn5w3xAzEru83xLufkIszU
         JWkJw0RhCGEJQlLJ21FEtHyHa1WQbkDaxmokhyUkEszaiu84aQGWjypVmWKq2oAZC1lN
         pkO/f0VQs9XHh2C+8i++zK47btwyxpxqSQ9Hk1pYX0aolSxT0j6fI/T5ro8sf4656OUW
         pYmQV19mmpjSQEySLg0F+TmcYgD6dc9i8824rjCOthNC+jqZhv5Pnd7YfxPcZdLhdRm/
         d35abaSusVqzGHB/FTnEnxWAbD0nqApfplJzj4ig1vhuQjxh06u4GzndNq8rscon5CDD
         w54g==
X-Forwarded-Encrypted: i=1; AKwUvBztIAtYTLSeJyXMcVIdetD8T/WFlDJLugSBFPzbHc1tFmSkIS6kcEeviVKnkIOYfFJMt/Y9ngDNZXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK4tStVKSr/eGwC2lE1inEywIFcC7n7FdZMw9kulh+Wg7uhWy3
	7La+jG/WKjwBdHnPsYX7YLp5gErrjnO7jn/Wjt2syiey0S8fE2QAd8Fvep3TGjhWAMTnEgFUwes
	7vQox53cZB1ZB2seksP3MNR0DD3VodhioBQfz3vdaTlOGaWGYiS3vBBS3Qrf0hfY=
X-Gm-Gg: AYBFou1lM27oyY5xXPICsnxuP7bitbvSTR9pvhFi9RtTncNTuyeARTMEL0zqZw6Bhpp
	E/WV8272s/v/+y7RjBlkcqhYLwxw3kMkwzr1thoyjHnhfQZ/3IXYD0ww0RE9CG1XfJcvmGnqQaE
	Pi72Fxr7Y6ewQ/VgKzouX2VaApB72ySVGkzDlq5u7PfTTcZVbGDDCwKFT/W0O3bjnQgK8R7ZuZl
	Fi4nGgmAaRrxoJqkngFarCZAAKs/bZNnQpXEtBxvMtd7QgYrI0yP7dA3CCAUGW1J9b0YOlKeUWP
	M1CtJJy61dz5WJ6+8f+h8nVcGWqznm9nnpIHR1KILYbxa7SHN4R2LzPNMap/yUPdAKHcvlq8Qu+
	ySm2pjxgnoGpcW1AG
X-Received: by 2002:a05:620a:3728:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93f17d67698mr1695359085a.3.1792405659798;
        Mon, 19 Oct 2026 03:27:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93f17d67698mr1695356485a.3.1792405659211;
        Mon, 19 Oct 2026 03:27:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm31633563f8f.16.2026.10.19.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:38 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:27:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
Message-ID: <p6fhbv52asrjghn2fopil22yvg2obg6tjn3nhbytyoav2nv6tw@a3yxwkwvp7vq>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX2gs1TczOWESj
 g/KWkiU66so4I7jhHgDHEQ9IVTJOG+ry9NHOEqONYekPwxEu0+EvIzPeAsPT/y7Y3dE+tYsVDDX
 50auEL7k/GNCojFvwqa6rc6x+PlAqxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX7Zi355JTSvvM
 J9/Uqjgk6rtk0UNzOIHeY9v4R4Qs7GktoM7a054lt3m458XDYOBQtbIX++ekzmF2njd3otuQdvl
 9dgwEg3BEkXp7qTIjtHmy3DTfUTr+O6wEP2e4VXQ7qeohb1nYQ6WF0QDMqj5GKJ5kWN7U+y/DO7
 b8DzThLYJ2eSMYlNU8nI/m3e5SALl3Lfa4JRQdFkB+NQTaz8j+3whi/mmiTKQdzy4WwiqBX5Hec
 AOYhQsU5HvtSWF5cct3H5FUTdOpS2xBQ29VDrfkOX1iFxUIVHEZ04J/Xq3bk5njQy36Zl7ieXrK
 jylBiSd0o99n+Cd0niCyoPoY7WhdWUT4LYlNo050cj+v1fTBqcqiUZutlG15jPgUf3SUNFQVXDd
 jGVrbJgyvChl9tdq8q9+IRwuKR081U/dMYRblMJXRsD9AVr9FiKpOgJNexrQT0n9Yw35dY+LYP1
 dgF9P6g/l7htPrBIlhg==
X-Proofpoint-ORIG-GUID: _W9USKJIxThYZP8GdGb8KdprDa-jl7bF
X-Proofpoint-GUID: _W9USKJIxThYZP8GdGb8KdprDa-jl7bF
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5f09c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VlLPvfKzbJ7SQR9nEpMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-18 19:15:46, Peter Chen wrote:
> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
