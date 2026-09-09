Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1554A7E6
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955183; cv=none; b=pY/Cle3K2ZmvR8VKrQZYQGS8XqwYsirIqNvm2n0GyswOXIP0dPFMlAqqa5Bz8HEcNn/FSkAbb7CX50Pi3qErwvz2uEJk83YJhPncGN3CVvQKIV/e0Qn10/5DJMoWilE6fvDwbDp9Lj24F0Nvgbommi5Gf2dB37Odc/IqxwVAGj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955183; c=relaxed/simple;
	bh=mQGo/kM1USYPO495AM57tyk64N4Yg9aWFSY6H2z+lVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAyrAiWwmv/a2dg8ZyNB3ELekcg/E1ir75gn8EztBiC8y+WeXKPJ2FHhXnLf/bnPyjfjgqWagmo5mxZ7PyHCH9vYMD1LOqFmzC2lXkNhTYA+zpU/czZm0yH05J8AvDmWae+2nTLI3VaF0Bocux3E5y89rhMJHCxihg98BqhS8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaXjou8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVUsGJPc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaXjou8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVUsGJPc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4vs1723123
	for <linux-usb@vger.kernel.org>; Wed, 9 Sep 2026 11:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	darzDWxNi93WLtlG8djJeoH4MhmVfYfnz9f+CuHi1rU=; b=RaXjou8UWMWFxPpI
	DNzucp7VqM190ZP8hpxGriIqIKBIR/kzttAp/gANyi38NJRE+0xmawUGRsP28PAb
	eWoGA45DYzVt0I7ytVfU/GuZHgRd14BBxFvqC9TD5Ae4p2xHYlc1kaP2WDNLcDA3
	YPNGewnyQfwqtvJ5XPesqg4Gh4omaz5ho1C+RH9c7aLNSEr3C687uI8T6iRjtpVr
	rSkH8NkFy3dXmS3QDGBNSG7OfFXvFi8K7RhyrX2ypfhY2IbViRAvVtaxA9ot9USc
	TsJdd1bV+QHNAmOm/UTT7c4psN9HYUn6oIwVvjjUD//CkNZI9hcG62Ngk/FcOaZs
	9bgo/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrdwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 11:59:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso73588585a.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955180; x=1789559980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=darzDWxNi93WLtlG8djJeoH4MhmVfYfnz9f+CuHi1rU=;
        b=fVUsGJPcxPBISW+NKH18shFlM22P2JADwPM4LBfSvdnsq5N/oFVXFxuPZz31elzUgZ
         K8JydSXZbo4kw2omj+sQWLwhYsolNHb0htrD3h+NICG8QLo+iNBJiRCC6mgYiLmLN9gp
         6MjS/bo4DYHdKBRqpEfGmFfN8p0F6BWe/BcTluG2MpQY/5ovKlm0TpKovsF4NC7Qyu93
         G+58i2xTZ6jVooJZbnrKC3flwI1CgQ+NTxwKqjXfV5k0qffcOIkBmuK4W88u133Ikxu8
         jQBXcMiBx+tq18vYC4kWgvbQWywzt6c9vLPU9/pfcva4NIg6ERx0gQxBTqnk1t5Av8OQ
         mMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955180; x=1789559980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=darzDWxNi93WLtlG8djJeoH4MhmVfYfnz9f+CuHi1rU=;
        b=P7ltdlw/BkBfRmD8pSEb8siuvPHnq4da4Cddo+h/jTA6USghVuuB9Dh/bwuQC8IWID
         0ozdYuzUlp/XDLodOA6DrD+OpLuuLs47DLZZ13vFG8PuboL8QKbo2BysybyOUzwaY5NT
         9597xRuoGRKjvxTgBknNS0KykEw4RsZB6Ro539GtKP3MURAyKIDw3A4nnQy+tbFEUAvc
         tDsFciDiaD/Wo1srmH/jXzN2GsXYBJakAloR710V0EFEDJauz+kv68j+43YdQNWJ0XIC
         pt9QOUe8jXJ0MyB0G95m9R2h4/kpnXxXxQ5BncSjsVjLuFqAl4N4NOH9UTfhRypykqQP
         J+TQ==
X-Gm-Message-State: AFuF++kqaz3k7N/lRUB4xmrlPMojz6WY9YmBS261DvwgAEwX4U8T1Uwu
	ErfBYchpQxun3PYn8zDnjYQFK/OXRJN4kzM4l4rLZHdYli3wZD6R4inarhLN+WXrX8esYYQfXDE
	0opyFwz7cN6hHtIcbFB8Xz4mrtdONtJU1HUkRPsRgDISY0yzCL94gjTfAOICfWKg=
X-Gm-Gg: AYBFou3LNCpQX9KgG3eymnr5BFJPonbyniE2ov+e8UpdryIZsPA4Buu+xanbhXM4ioP
	7ZOm2vBfcB9XCsjlxnjDuKbHCw2oztgp3De2DyWBEKfglGqH1SNJ13oKeBOmLQIV+aI60Lk6/hc
	KjZ6SHSvnC7ETcb4MNlZ2qhN5q8Q32mmnvKKayVpBBHnaYpW5MA027WKyYEkyOBoU/ZooKGwefS
	JBHl8U6/2u78sDESj/ZrxGAxtHGuwme65XhzvMHFGV9AlKFuACVFa3r4u/IQyBUvgFtrzauvfpz
	+xLGXsdArHb/0UyKtkJ3WAWkPasj5yFplPrLF4J56oK1weA1wOb4EynIKfy2UxGhSk/Nt0CHEHS
	m4sz51C4GL2HDiZbgpgHjMw==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2563685285a.1.1788955179991;
        Wed, 09 Sep 2026 04:59:39 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr2563682285a.1.1788955179576;
        Wed, 09 Sep 2026 04:59:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3f00sm6660059a12.12.2026.09.09.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:59:38 -0700 (PDT)
Message-ID: <12554890-328c-4a47-abb4-f15fa589922d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-3-628885fc1d0e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-3-628885fc1d0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 450_40C_qM1OPxaqeeNp-8nfozapOPnQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX0Ho+zNyzNS7C
 l1MsTNQZu1t01gQjBr/IKeA4VgKa4T+WotMdSIjDTj7KEb8Or7F9tGWPHAXta1SDCYEIQV4JzrC
 Txp+QHh2KkLdMFl2wLKLz/uLNKrj3yE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfXxm2x2myq7T2Z
 HoMDZS0lr7iOB7Ld0mV+f/uAmYs8hks37CFMERri9LGz9IupuQMKNhT4EOn5dwnZmaKWFcmHF9i
 9CCn7tiU/Uf4wx5Z5HSe1Pt8rdrfcStwUL1yhDNZyf+aCGiSB8zoiCVppvAivVi2i6ldB32RCao
 AoI3KRAPI+mkHnyZeCS7X63M/Mo9ZqVF85mRn057t2yCKq53U9dJnT4yjI+2IpvB2ngBJlsb67F
 X5u+bkkL2WSXZxYUUAiM8mDcnB7bAOfsuU0XOouweadTadhdEY2a4t3i+oecVu2Vf+LNPE3jL/+
 u09StslV3AEXrsWLt5OU/rSa0B0DCtkYW4cl0dVod2N7Xi/EFlGmrjiyclt966xsfx3RssPRunE
 yolxcr2ijeSV13WJMB38gBxBdSmOkZUXOUcrWMCDFT38hZ4HFtMVjHylrRhZt2oLUJnTEVZr9kx
 J5SNaWt++ZGnKBNO7ig==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa14a2c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yj6YoaMyUvfbHJFEJfMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 450_40C_qM1OPxaqeeNp-8nfozapOPnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 8/21/26 4:04 PM, Akash Kumar wrote:
> On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
> the primary Type-C port and Cypress PD controller CYPD6129 on the
> second Type-C port. On Shikra IQS platform, usb-role-switch is
> handled by Cypress PD controller CYPD6129 on both Type-C ports.

[...]

> +&usb_1 {
> +	/delete-property/ dr_mode;
> +};

Why is this necessary? It's not even present in any Shikra DT
on linux-next/master

Konrad
