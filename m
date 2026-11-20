Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169353;
	b=MfgQ+wXQsJYUlcJbKVK17tUufEUaHYiasUUa6YdAXRN7oigcTlt4AdprzQK0iosneq7T
	 0dX85xgTg8zs/1BBJ6B8HVtAIb9NIeADMvK7RnP6jyy9717pHmFOQR/VKLx1UrsA77Not
	 RUNa01Av678GYZzvv8yQfsKudoD73NSuVVvcLEde0SosjfiBaYwZ47EiZu/6fOSh1KKu3
	 AyeZA9ihqckeEZNceR9oYxoWc1vPbTh6A9QucZ3XYnButFse2nrIESLLeo1uuJk38uHnQ
	 ef65lMAOrriWW/ecSOFX1ATgMmbYVk/jiVUUeopaXDv4NmpYpbKAans75GyFQa1Qs3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
	b=wRsVpKm7tok5FAllbNZIsATiVnbOM0Uujju4Xy6i0WhU+wdVvbQq58h1Io08G0Fnps+/
	 j3dHU8ib+ZWWevDEpZlRMu0SATUCpI7XoPzIBGH9LoxPJq0yawcQV24zcSXVsI4JRtMxq
	 BHVMTcdyForr5Bf4xoUOUREa5MZUkHq1ugeIZuH65zlCaVqMryq+IYk2saN+moCJQj+v1
	 j1AU0HggTFswgf9k/mbrrTiwzScPGJb1lxfCY1zIF4m9j7COMTBcN0HC9fBfHFIpzaE8V
	 U2rYM4WgXCzGb1qOC+3Ki0/DP7Zp0RSJGIFZCusMlmBiukhgTwHHqFY8zbyr17tCxTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F8606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9tuAO950484
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xosECkvOuZ/563n8Xxgz2gyD
	sJH59waH8UsNshqhV4s=; b=HBV87Y8iA19w95VMXvBhisXc7CBbCY/9XV5ndlQW
	5pHzxWPk2SX5g7G0UwSYAgTfAW3bm/zZKy0Auw9lpGl3tBd4NWYjH2F2EFJua1aZ
	AObNGfX9l8lktP5X+tFN9CRAeNytHQBdgHU9iSJJPDTuy7rMMJmJ0l6nVvmnC4Rc
	mLCDb5JZKJMPj9uSYHvIQWJXkEGBIzhukomEr2ShJjxTuUXi2ZdvHXoir3IJcQ8L
	K2v8EYWm4goWmnNGT8gCo0QU8j2vxEzS3bwlfW9KGlmZb1x3APQ6rLzHTDgqdH23
	60DbW/+hF69FcPkS/kyyPWrDTEKv3Gl8Qq/BPeL3Orv6UQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk4c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so461007885a.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 02:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169350; x=1795774150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=WgXHO74m1uR46QkdPOO9EpJbTHBWy45ZonesB4l+2OSBKpEYyVXChClj6kNIZlua9w
         1f6BGCkkXNM5zSSolEQBYw6xeBcc96tZRmUHtd/7zJciFjx+vomTWBILrTROnbIEac0v
         biR7N6kRLucVImAa9QaOJLjl52e5UdQCyb+14x1Qm5DwODIclF/fT1hEBV54AbDzzfko
         +QUXW8niMkMT6k6wnXssGDFw7yT8VZsLLRLyDrhegU28MXwSOT1j5fbmOsvpbqkt+Xm6
         U0Dnj3HmZ+lNjv8T/AtdKJXhsxiNxuhhQsvRKuV4oBniKE3m9n+qU/PiNhy+UbHEqrBL
         QybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169350; x=1795774150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=O+bs8i/YzMICb+mMkBPG8311GiIcdkGk+3ksPgnjyg5Q/iWhXlNUcFp0w3c5ZJkSmR
         aIrfDf3Y1L76D0/UDqVT5BAspIQICitrNUChCGZyNaXDBa5g16rLBNKEg+9/FG49T8Zg
         BxGgocMQnw6aLXgo39wfXzmsyLv7tdioH3QWgySs2ceB6KyPStomWLCWRREwf2//Tw+r
         KHn84VSAoWId289fuBs8BdAe63l2h8iiFbSnzqNc7c6DAkQjwcgiVkm4v6ZZPWGaTx5y
         Ml66LAnBFftCQiDuUO8W03UHhDOWLN68n9CcsE5P1qabQXbh+sTDJM/YGxQoRu2fdDf8
         ovyw==
X-Forwarded-Encrypted: i=1; AL+hErGtNACVeDPoTV3bW6cCQDUmTn12fX/72i+23ir6y8Br1z93RnSjhPrkSxwg7+GmdgzXrSFp+Jn1+qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TAWdGoXqIvrBZfvTnY8ejqmA14yczhJgo+tBcsFvtZnuGa9ex
	5DLww34xunQXRYpIvFFuy3lkJiO1i0qyK5HwKpiAkmbXBiBwLj1SF+731hKhCVxZnzr05asrr+Q
	E9eeXA280fbKNYZikMqCVTGlWv8uNI7Qp16FV0vT7YZqKGGCRZftvRWS8r+bj6m8=
X-Gm-Gg: AYBFou1MYQMmPL8JcQwZ3/6VtrCUx/AysOOXkqKufO3fp5iCmE7tplIXyYoyC3EgFp4
	RH0JWYIWs4pzfcm30GsHcdvyEIw4hRGS8pxqFa0ZG4EbroQu4E+ZEbGXpWuTcT+XB3DAdRxjY3e
	08Zx4ZgZ/n1dcPmWvaW/r0FDxACuwRmXJdtdU3jTt6JDM0xb6uITbcb9DcIP8inS7CyqIYY+Mtc
	iqgr0NW10B/hY3czWHV+xCm8gSuiWDJUoiVxItZKkzQgumjwpVB6l3Yd+ZBO/LmXYb1YAv1hvkZ
	ErzL5pN/+E/tutM0fZ6hwelRQiiG71nHpYCYBedvd2Cupz1gihX9pmbZEv0gFj3DEINr+pzsRXX
	LgwUi7gfBniktJKBcXRMvyrOyK+4eDs6j+Z7i+G7sTE0NvY1KwPXZ/9nOZlGecA0/
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618413285a.4.1795169350100;
        Fri, 20 Nov 2026 02:09:10 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618408885a.4.1795169349463;
        Fri, 20 Nov 2026 02:09:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm4714314f8f.16.2026.11.20.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:09:08 -0800 (PST)
Date: Fri, 20 Nov 2026 12:09:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power
 domains
Message-ID: <yxdwoaan2qd7pwe7ueyxur4nu7zr4fjxix4blqr6qwbw3razg4@si6qol36qa5r>
References: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX5bK6BFM8yrnp
 ZONIo+Rjv6Uq2ZXWpgZOg/ktAZ77KCvbPCBPB+YXzogds6VnlxU9+s47x/0jP9h4y3TEg7KsUBX
 rdm2tSsR8SS6afgNj2+il9kUkEal7zE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX9nWiIBCSW6kq
 lsPP1Ovo1IRiNd1YWhKlJ3N91Hss0UVNwxdPLzxgXVEwHBOECF3SPogyl7h6CfBXgIGuUSGO/pZ
 OfVbYQpodHlIDUwJHLKG+sTPZXSjyYm0OioM6k7/VMUFcHkWW0cdoDEsP526bP7KBaRVZfH4yly
 QGmovdA3d/cNyl2/WZP77nZXeNrFkLAg8e0+AbN4MErCrQqGuBL76Q3+zVB6HTWgdfHQvKZS9X2
 U+gMd4S4NW8g+sz6OQkI+/76qsCpr1DAhgeMkbWVzdobLyEffTaV+y1PhMXFyN3Pi1rNig+JmX8
 5CysLhsL/EsHd50NGYo8expwYn+pvzbklhC07zIIeWxB3su48327auWDrbAP0rw2Q364t/hFdWi
 BbxAVdGRJwMBOBymznnQpZaRZn14oYfZ1r1LyWo9M5POse2ISR6TabnCkOoKuQKj4s+GW6Q0rRa
 XLxqZsOTOdfVyknkrfQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001c47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qsmAfw9a2cmmedO3nsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wEH-zeWV6dd5Esg-NsT_ztf5fcQP3bIS
X-Proofpoint-GUID: wEH-zeWV6dd5Esg-NsT_ztf5fcQP3bIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-17 22:38:30, Akash Kumar wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
