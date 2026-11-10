Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297240;
	b=3NDePzbQ3l3DArW7c+oRkCygAU8vizOY5057wSgVW01bLUeaCIH/CXiZ2h5aGFeHmJiL
	 JwN0cK3V2o8q4IYRKJI0MNNGBXSPbbMcmGGaHR7NWpIPQKJtyNQY3vzX44PaZ7hjhgeHZ
	 OC77FEIi2KRGnQukb5xCsDxAfTOdozRPnTi8z0t0XtOQ97kCIx8hfiaMJbmnE0zCYb8rd
	 aBN8ZUOnBinY8BAH4c7vatkfvyg0Qe0mYZrSLxj+9pkzDeXm1H1HNNpiadMOMKRlFUDdw
	 Wb1OLF8SfFHd6qu54Yu6WvuQvtNHwkayOBSVZhcBStdpuggjmc6W5A5fdROzHevXA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
	b=wlCZYmTbyVzTi2q56IqS7JzVpZUC4HaESf2oUqhZPV4BUdnjAEKdpKnAeJqXiN5/qucQ
	 wrzFQF5D8CfT0ozNix+vcKAqmOIQncN+14EMolCDa/Q8RjU1oNGdHW71b+f62x+5knXLh
	 Esy6ViNpkaiPtdjo0ZD4VSr9fNerEM8Hoh0Gwh6bINKAChUWQ0+VqbjnKF5P2n49aRLE9
	 gQOjiVDN37obMVq1YH3j+/hVtJEumUWNt1A5G8FmKT8PJ8Bp76yuewzmjtfK2cwo+cJnV
	 4rm9b8z15XfHhUSoMYVGls84odJgKXk7Rzz8UjKfi6rpcXcLrfPK++SSIM4fuUr6t0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDj1jSP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QposB1Qj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FA606A33D
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2FA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDj1jSP6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QposB1Qj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4141155041
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k40nDh/DlGtTF2XbNI2TG8kn
	C7Im/kFKhYdaLoOlitg=; b=VDj1jSP6Kx57MAyoqGynoI6DZIi1eMpV4I3D5PCT
	Y8OrPUOmNfA7IYtea0LpZf0cEdIq0RlZBDmBKI0uyVkPlON6WnPpLYW/xrzd4FLK
	P9L70rL+NplPFkyaccPVHpf/CSQWIv9mLJBoKAZSZeTu9pv3GZFbak1yebUZ1YoD
	vSQziQzMhn0HTPTv/cS/QsGpSllOKPNglnRfW8dlEtvuWEeaquMnmPjjKKOZv1U/
	s4t0/e2SGPTd0hd5PLmafOz6SKBv8mfseWU1PL059TUanlLrqXiLDavzeJJ/HlQA
	TCbmPiqRaY9Jr9jLceGVskvzhMaP/jPpSAUWKGw7SUhhpQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49398-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:53:58 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1401076c88.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 23:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297238; x=1794902038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
        b=QposB1QjII3lL3fzvW6h4wIEP+05RkZ4QSU0mdx+ymeq/4PRw6t+oJhe9DJY69ZxfU
         48wtFImqGKLrJvNs39fPvcqYWmVqpWdaKrJWgbbighTYM4nwAxNfaV66yD4KFwCYB5t0
         7jQvDUxMVKy72GIZFVgviE0XItKeUJ/czqqPnlx1Y5WkJqxSzL2czgnoaFliTuldKf72
         Ogxno8iBdGwIlBmXBnCZOUzsHrDktsRGfPkl9QCgsfVUKex+sdeH9KLIg8gk8vOTzhmS
         sp+T/QtLm6zQ1b4r44SeqLC9mxkTDEjIE4kxJ7W5+j2cSFeESjrsgFu58a0P1WWhi0wT
         AEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297238; x=1794902038;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
        b=fE4wSMsvYWYxaXUVgdvPpiWcP4wOO+w4IujtTviOVRSFckjhXQMMS0zomvy6/1EX2E
         EB4sOLe0IxcoWtGjmANFDi8Co6t2Mts7UBTWrtM3Jzsh4Kf/01zFG5anlzYTWYwS40E9
         r3CzoaE1vVSGKPRRf71gjuPbviRLD+a1ROBuVu5VjKhpGvjckneRxWxm9HpFr9Ourhik
         rpK3+zAdTFBabrGxHCIWTPNAsCm2jO4Qt+9fdEG+wORJLB4R6gYJSxVA/Wf+ywLp1Lay
         WIXGukq/rk9m0JPweuQDTj/bKBFgW2k2zNClD3Z0TUq5X77FpmusR3eWoha7TVPgtQsj
         5x7Q==
X-Forwarded-Encrypted: i=1; AL+hErH8NLe00nBWzoW7bbXIDcHNy7tzNGlJJyqOfHr11dH48L+asSzMmtKiLKen9xR3nxUprt8exSqHHbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z982UUjDbWmiQ/MQo3B3bMNhD/0MtRxu2opVqsfnT5iWtX9yV+m
	gTQ8LsFcMHPU8WvtasnOeTKx0aXEuHqcLiQ3/97xVSQPpjyab+TH4Ty0Ma+W2KOUJnNyFxcCArH
	IcA74o5ILYHarJAtv0abKsCMGYz9nmAPox6v+Zd6Oq8jUN7KAacRVOZir2IkPS8U=
X-Gm-Gg: AYBFou33rZW4saCeje9/+gQXpAfqRnARxW2xZPm4h3AKgCDmf8/TiSe1zdWrSTWgFSc
	p5I1TTMcrqnRCV47PPgK3+c+dxi9onbSVS2/rnZODFf+cfp5m8YpKAUd9Knc3KzPtvIiBT4CsHB
	INhI7joxJevtXM6u7UyFUbe/H9OetQr1GmO1zhqNPb6EhHpzuB7VNFTgo1X0VhwHOn9RJYaXhU9
	hhAhBFCOGKSzkkeBA7LXXRcNrp2q1Xo9Es7d98i9rdweJlNBJLQWyf86BMQj/HDckT7FIEYfGRg
	3tWlhwRGrP+1PaXwKvMjbfpkFkM+OQXTyD0zGT0QJafCzZO21eFSTQQPVFkSvEENm+tx7soNYB7
	HhzGxqtYm1rrddqkFJxJDxxs5L0CI7VQ0vGSclMQfMnagnAkSXL7u5q/sC4zHewYXKeVeN49eRR
	qYmILBp644/xTqj+lv4Dm7qA==
X-Received: by 2002:a05:7022:b052:20b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b3b6025b98mr2771615c88.23.1794297238087;
        Mon, 09 Nov 2026 23:53:58 -0800 (PST)
X-Received: by 2002:a05:7022:b052:20b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b3b6025b98mr2771573c88.23.1794297237340;
        Mon, 09 Nov 2026 23:53:57 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm7259850c88.5.2026.11.09.23.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:53:56 -0800 (PST)
Date: Mon, 9 Nov 2026 23:53:53 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without growing
 enum phy_mode
Message-ID: <avLNkT-UPTsFeqsb@hu-petche-lv.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX0ou8DFckmEWL
 7j8sdVoXV6mQGqOauoRMaMBbxyfb42txngDH+UG0CTzEwle+b0y9zOzlgZNrihklgl+TieEI5oc
 1QI7iW28k1jYh18P/B/KJ4FQnVe6CFg=
X-Proofpoint-ORIG-GUID: iHNfVYfW5woKbOWQuI9QYCIMXM9NQVYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX0UjVHV+VdgFZ
 pUL8W7Z2KEneRIjOK+8x/clp+9oiuiOnrnHQdmaX27hARV3Gz20SL/VzfIM9vnXXg5mlayGI2Qa
 VqGOJZyEe/D8J5cQMLrJP2qw1yUyzj9N2jF7JW8Q8aBxzo5RW5ejWDxlnChxQB4fx20WBeonlnT
 lsfeKHIh96rYrFjCqL39H7pfqzIGSOnyaqWyMghGn1rhZONjSYaUO0UsUvwVjICQl0hlhFijHqU
 aPQ4aQcaW7UU4d64CeOshzkTDjDmP9SCmHX/2SOL7L8t51bmDH+50KQLIS/IDwDp14e+5Cx2eIx
 eCxNsOYCAL50kCxdW9l+bDr5Z7k2yPGNrzZ6oVdwPQ2q+x8QmZ7jlVlPUIqjA+//hp8Tbefo68s
 gTYaw4/N770gvFWdXMFRhURRyqr/o1qCbaxDjFMJLkbUF8T3DhKF1ODkMLRtMvzpvR+7nQ/WexT
 FJfTxLozInObF4wPWQg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2cd96 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=8fdUJlHZo7_b61wjJHwA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: iHNfVYfW5woKbOWQuI9QYCIMXM9NQVYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100031

On 26-11-06 13:57:13, Tapas Rana wrote:
> QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> when a SuperSpeed link is present; otherwise they fall back to
> receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> made by comparing phy_mode against
> PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> calls phy_set_mode()/phy_set_mode_ext() with the base
> PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> submodes. As a result, the comparison is always false and the PHY
> always falls back to ARCVR_DTCT_EVENT_SEL, the legacy USB2
> receiver-detect path, regardless of actual link state.
> 
> Add a dedicated qcom_usb_ss_state submode and carry it through the
> generic submode argument phy_set_mode_ext() already defines for this
> purpose, instead of adding more values to the already-overloaded
> phy_mode USB host/device submode list.
> 
> Patch 1 adds the shared enum qcom_usb_ss_state (UNKNOWN/PRESENT/
> ABSENT) as the submode contract. Patch 2 makes
> phy-qcom-qmp-combo.c switch on it instead of on phy_mode. Patch 3
> makes dwc3-qcom.c sample live SuperSpeed child-device presence at
> suspend entry and pass it down.
> 
> The contract is intentionally generic so phy-qcom-qmp-usb.c can adopt
> it the same way for the gadget-side case in a follow-up series,
> without a second mechanism.
> 
> Tested on an x1e80100 CRD. On a host port with a SuperSpeed hub
> attached, suspended the system and then connected a SuperSpeed USB
> pendrive to the hub; confirmed ALFPS_DTCT_EN is set instead of the
> legacy ARCVR_DTCT_EVENT_SEL mask. Repeated the same sequence on the
> USB-OTG capable port with the same result. As a cross-check, repeated
> both suspend scenarios with a High-Speed-only pendrive attached, and
> again with nothing attached, and confirmed the PHY falls back to
> ARCVR_DTCT_EVENT_SEL in both cases, as expected when no SuperSpeed
> device is present.
> 
> This series spans both the generic PHY framework tree and the USB/DWC3
> tree: patch 1 adds a new header, patch 2 depends on patch 1 and touches
> drivers/phy/qualcomm/, patch 3 depends on patches 1-2 and touches
> drivers/usb/dwc3/. All three should be merged in order and ideally
> through the same tree (or with an immutable branch) to avoid a window
> where dwc3-qcom.c references a submode phy-qcom-qmp-combo.c doesn't
> yet switch on. ARM/QUALCOMM MAILING LIST (linux-arm-msm@vger.kernel.org)
> is Cc'd on all three patches since it covers both directories.
> 

Is it really we need to do such complicated, why not just call phy_set_mode
before suspend according to existed downstream port speed under root hub,
it is normal requirement to finalize PHY setting according to connection speed.

Peter


> Tapas Rana (3):
>   phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
>   phy: qcom: qmp-combo: Select LFPS detect only when SS link is
>     confirmed present
>   usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 +++++++++++++++--
>  drivers/usb/dwc3/dwc3-qcom.c              | 36 ++++++++++++++++++++++-
>  include/linux/phy/phy-qcom-qmp-usb-ss.h   | 17 +++++++++++
>  3 files changed, 76 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h
> 
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
