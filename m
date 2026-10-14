Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B263D4772BF
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021605; cv=none; b=mrhZTRLrXmkLD5JUWfBn48EaH1ZyAZvHp6tY0MyRdgMUDGott+RcrlVtpvkZoy6gk6aFAN8ZxBAkN9pxu5hCKUSoHtqONRf6YFVV7ji/7JKVcYfmyxrtL+KSSTIQK2NgQVfRZCFsXdp1XaQTbfvs9tLhuQbgpnxA6qlJjVNUONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021605; c=relaxed/simple;
	bh=PD4O8NeXrpVFSdk6A1M/yZB7EiBrEVY5GZoYdPfOTBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTt8+42wu0893cBiTM/GtSY0JkFYN9biiOQrt2eqEteZHZYxNjoDss/93mizj363ggD01hyeS4rxRzTRppmjNkI9DvtyBGDdGPQfAH+cn6uyw2gRA1ii6sREIKhZvh2vzq9bfgMMShkT6pmPFzL3A2jh4jCc4jO6uxqZik5Euyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxiEO0Cr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8Qo3Ien; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxiEO0Cr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8Qo3Ien"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZiMp3468844
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGsSHjvhagPRXiAvKSbTu3/S
	aEhQGd0uTphQRGhmwdI=; b=JxiEO0CryCiXsww03jKFnqlfHqxReTyDdp5kUXLv
	QULPpT3bTqj+lWLIHihri1ovAEzk4GyRNwUyYc/O1WY/L399eRXvkjwpN9Ee8tVu
	nhgkYjZjLiTdRDYUVYMLrSBTFDhmOGT3/Y28aeetbLENcyaTTlVKEuXjH7X/WcEj
	K2IOA8BZL0305lUDw7JTpuHTaDg91pAaoVRygueHQaxER3u2nvoE/fUO4GW53Gss
	j6cJAhqRwH7uSPC6qXxRXstO7FEHXCa34JNB7E20gEeMmSBsyrG7ZttvWpI2iU49
	/nvUSTC4mSVM0y+b4hcbwVhZsv2IkP0fgS2FvCf5K0Xh6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd79es4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:46:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91430af782dso103584836d6.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021603; x=1792626403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=L8Qo3IentWa3J7h0S5kyDB7gScSm+sRcrPvMJLHG2OgJyE2R/5lDfqYWzeoIAWYFJG
         K1kbpeOSYdAfUJ0Verj5BY3LQbbREHLdRJW5qHrcFaUAx5nqjkJtlnqZ+2DRn4mYpK5N
         UOnG618yOnVOvYNIZSMwEM7tlqxfXL0NHg4z+QAzkGp9sqv+BGsQ25TS/0iaumUcaZOA
         Md7bDvvguuEWrW7lKslNFiQ1Lo6hLTTn5EfSIBVsm5B6lZCcm/UA7G0nrL65RT8rC7sD
         GSR8h0k6lqjYrArBfmyrWWK3sUunG0FMXBf/TS+qDDWv6NPBZZbS8eJgMAsTInqq5Gty
         hfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021603; x=1792626403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=oh/LWdFRyEQzgeDYAnyYTUi8wR2fuOe7reFb7vPftjKrWtUDJ3mALcraWwRjUzLQCA
         lS0yNO/la5fXu3KuDWG6D9XA1249P+DesTsfDK2XeqMiKfRaAGOjr9CWzA2xuUyutH+I
         GcSv4kxbYXslZjUJn8ENv2AbM267ZT/p6FRLw2G8/H9qZA1bQD3ryyAkRqfw6Ky6k+e3
         in55YFFRxJMRXkVZ57YmThlitOzdi8VfG0aDSLw9WFrmgzWEZefNAU4Iw3vQk5QTdOcm
         fzO+V92P9HTMKUg83yuOcA96TtvwIiBIuSGOWGto5zF0OodtLNRUkW4xkYqWThGKKvx9
         ER2A==
X-Forwarded-Encrypted: i=1; AKwUvBzqhBhx8HrQIuJNNr9JXNZq2lnIpkBTUzLbjLuH0kcMC4CkE4b1Nk3KnDLnxxEtM0GnU4GeSFgN67g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKACYLNm1mcoOH4Nr4gjqWJP1xpBxgPnoVg7XmCc0Lz9m6Bb1eN
	9HTpTdKukGHzAuB7uIUL+clG8gEl+oyiCZ5utNvfxJhz9CtXbokmGcAo94CAv5VeP61/5FqIS1T
	9+Jmefnil6o+GANB7WKC93Mx0FDJ08FfNX0VVUpQch25IgibiZg5XPT6x4TwD+78=
X-Gm-Gg: AYBFou3h0QCzNJfxYSl/TcFoks4aU8RsKsrtLPR/u8OtoddQEymeVvRFn6AwWiP33GF
	MLy42ia60tbQJrmbbYzUEtrW44UkI87JXbZWzadc6kCXaMdMiBoT5Wy48HVHmApn9JOo2zOkcnc
	8xTkBxlfdzNVhKM48b4bh546MY6wOEQJZo4bkUTQlDE090PvzB9kjZgKEmwStYEmmT/ANB/cYqt
	D8jwVUx+r5YeiKjrT7ZcXdQXLbV026aWtgLP5BvpIZvwEGarISozNZwB98pBVCBRviRtvjpi+oM
	y3ZzNUejB70SYKU72Vvm1TO6PmP90lqAajfYt71IesN9yWIUhA818VHbKeDms5rPmEr1fbuiWmw
	jPLFQ/KDp2X9t/w+PsAUg1paH3RZYMPlBAG5FkZmGqUigSHq4F6nSYEk+gq1extpQpb+QgdIl2n
	TtcrGvwKa4tT6V
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871711185a.2.1792021602939;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871707385a.2.1792021602398;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm939809e87.66.2026.10.14.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Message-ID: <qgkw2qvqwmchclsdf3k5omanjd7qvm6wyxfjy7bb66w4koarnz@6s5k35dmqvai>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad01463 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oov9_tbh0Q946gG9V5gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: _EWlX7Ldh94R5dR-ZxVCv9NdLKew0AVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXxyBzbq0BMx2E
 crCbeFNca1k5kG/b5LIn8Es43DYT0Y3WW2+xT7xXZcUHAY4eBD2xE+h+MwLDhqMjZkJ1o+ZIqjp
 TBu5B/bryjn42w1dA9BCIhifGdETQix2HqhOpq51e2YtzOfeHDT7f5K1oXm0CiBR8QGrV65kcno
 kuzfeXG8iUmOUHGdjq/JfEMgbpPchtmjLEVGE/8vXKmGfD8kLA7vPyQ6erkGD3hbiUcYMqVs6My
 mcPe3ESr2qY1Y2zp4FffES1rbZ4Q+cxM2unvQ2szHZ+t6EJ4lYhDCmKkkPGEW9wZIUPIrtRVYQh
 eOj0kq4ZL0FV96otnW/z7MCOVBs/yw++xkfUO8doWUt6LnwGyNkWL7cSmnytvQhGxBUouDFeX96
 NoL++HK06ODMtkTYiNsTSn25isFH13q5q7nuQxpGpP90IOGC9CkLJZL/at2i2+1FnxF0AZt58j2
 VwatUgN+WGOgCOBT72g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXzAi6vy44j2hE
 OeiH68PHqmZqSsefH72YE/pQJKcNTO1yZEilgEZ6AWlLAwNFaTLXGpVqYPKl2ckLJy8XNCveHHB
 wu4tdOo/Gc/LHbumm3urbEubbUG4CWo=
X-Proofpoint-ORIG-GUID: _EWlX7Ldh94R5dR-ZxVCv9NdLKew0AVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:50PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
