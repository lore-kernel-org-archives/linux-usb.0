Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795284460;
	b=IB6QcpK9uXFXU9/dGeWU9UUrxIE4cy7MfaN2ugEnh7883UExlmvNw2p/4XSD/fT7wvHR
	 rwN4jNsuz3pAt5jYIh4Jz0rNc4+ugf1964o27oEyrHjt/hmgljcpy5t1skNR1jO0pMJZY
	 OUhhd8rbAmf5lUF7DDGnEpfrEXTK7cuOJeXhwl1SEAw1g0fX2TH0iL2Zir4riTe1dP61O
	 1Sq8LaPYAXoowJ9S0qAIMk4Gqy9Wfj7bUnmzNyc2VvJIWMfOueL1j5t7Ds1Csyy4WyCYT
	 W/a1lSNh1ZjX6AYgF4dUW8IFapOvR6yFhKlKxIF8Am5rnm1CkiTM6yktXO9IkmZuYkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
	b=tXRHb8eubtjNyCHxjNGyDTxVJG6Ph/5osHcCEpkgWVfHThkZduBEx4tUdH5KnrLtJih3
	 Z3GkFgCdylqO9Sbe2dbmqxXnZobJ4Ws4/hzymmz6ECpYVlu23/C/vOLx5xhUTfr+NLTEi
	 ZpBTY1JooJ+oyv5Ky1vwzLkOZ2hoVpfZ8+U+h4FnPxueRhE9XvakN7V0Re218dyu3UzFS
	 yDSvaG01a4kn0S/Oyj31w/zb5IvsoO8v8zXGOU8sgSSNSe5orVvaCxAHxvlMajm6N23dI
	 Lqoy2DE+Vl3vQBPpIWbuqoKkXMGBfP5Xcz1YpK2rqsjR2eqP/53/m2Ysa0wd0deY2zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQcb4RcP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBodHEvk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF0606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 18:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQcb4RcP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBodHEvk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFaAUX909237
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 18:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=; b=BQcb4RcPrA0xZ41T
	fJdYhnPNOIyBOdONBtGs2qXOwobbAkIQNULTlAp7Y73DLrfL/jX6t6fE1qndJD6i
	fL73upTrQtUY0p+sq36y5oP6+7wGb/4b/jqEfllxHYJ77GZ/IT6rjd2vvIK9xtZC
	zGHz39sdMakafwjEv9aoexfTEXZH6si6t45INfUWih94fgzyorvYnrOX2LqJ6PAu
	N0kv4bzLPjWSsqIRSuP5ImTVDbc+VXTCQBFD+LFE/4A7t39DeW+5T/9/FrStRKbS
	19CSSmmDF87zaUeTduodl9vPYxOLlbu0oae/+7vEwDYwPoYNiiStUWralHfBm2+C
	wAyccQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h31q1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 18:07:38 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so27746177b3.3
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 10:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795284458; cv=none;
        d=google.com; s=arc-20260327;
        b=NSTYtXY2SGiVMDQxgoAnGI98ec8o66a1lrgOUJWW6Nn+2055Z2FpprpdeIh2Ec1gbH
         Oq1dKQ9MEIdm8ApE0uLXqpt24j/kbHUQOQnN/bUO+tAbShg9vhLrLpCsVmfdBGDmLd6Q
         N30GYcuDr8bOZbYJsfrjndGB9bhxkphHnv66uaan4IqC81fHV1YhIai4x++m7wpMWRzU
         mvLfLb1TlkgaU6w5lF7fqR92mem377RrVA+1blIC4T716m2rPs1z0eGOr2egrSv/W9+O
         9UgLXeED+DFeL5SiPMqVi6BLutWtrjjO5C9MjCtNGiwjsvkLyu9NLXMNzVXeDI05bVd5
         9EfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        fh=0TEK/4pMUqw4RB+uOk74nkKi2Bti+JlRzJqV0KM1B80=;
        b=KixdHV75U4mprklMnalqkw+WuSwXoowjuIzc2NrScmqU1HxJrRQJIljk3sc/O/z1Jg
         zuV9MwOgJb1WsWIcBaddidsKabsRifH9BTF4EmMb3HNxeP7qyM1fG43yM2rzcRsE1WuB
         F4YU4AClq74cXLmQ+sb1x2Vp2WOmKB/WTWy2N9jCVnGEDAaA1b09P29vm8L0n+ySK9jZ
         wtdMN3EDckIhtwNY4oHtZajzktncU2qcRVb44yKUUAYH1wrrZY1slDPPocuxjlV6PQeK
         1uf45K1Kpa8bd1HuviSd5aYU4YcHzkPDp9J+WTE/NIXBlNO2jLHU1WFmpabI71Q9BSfO
         KHcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795284458; x=1795889258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        b=WBodHEvk0BZVjo5i8swxkPj0JUd004VxJVFvWlfaZJAax4OfUv7X9WeUkZ2WB1i57x
         2TlA6ThLF2oi1nuGAl0QMyIVZlDWnVuBHvN9h7unro3uy3pPlYXSpF0/ABe6sdDWMRPu
         4NmGrewt3nJsSJkTh2N7Z3LZ4E+j1J0PSnoC2kUn71NLBol/m+aBOE0SQ7xfh+uj9qGJ
         5HTQXejiVCGGzhAm5k458MBI6Sqb2xVX/C9XfLML1eiupQqn+jf+YGcAf/Pt71aMZNip
         fU2GZR+Te+9ocUxE514NJKJV6dSLtizKm7ZJ2z1fyc7rQI0YDuYnBWNMXNdF/f7zninW
         59Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795284458; x=1795889258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        b=FN7uMBRaiXLSCrNCjpg3hWD0gAXffW+rTfmsm2lgdJIVyYt6Z2OAms8FnbIt9bNl74
         C4HzYEr3P4ILbOKF8duOYLEeYCzcEYb+PwZIB4RMkdjz6J8/7VCaykJO31XkGKYYA5nF
         e1hUaxW0mJ1jUDGFYi89uZtIWzCbELefmta99E7wr9fWWnesJRImGGLPLISpsK8hkCuf
         C4DDljlMinIqtX4k2jdqG0OkdFzGPJlRCG/Wk4IZ52jriZWnrFcsthMQTil2IyGY4qVq
         PIxU8V1djOijEP0GeV9lw5uXSRkdClhOa+Fp3KHcgGVZyzoZe5nA58I8Kms0ZVrwfWQm
         TLug==
X-Forwarded-Encrypted: i=1; AL+hErGjqK3hhsfBK7kuuvWv+05PjR1YkOmbM07API+9YZHobrYkaRqQMmCwehjX7AtBPaD7ygXikNW5g2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Le4tNHajI5wXX4vxtuKY1hkwFZqm2SsUry52Ws9WtWb5G02Mb
	rTdaAswXMAI/r8YomweujUbbmHsyMfsjx117Wh5vjBXXJmpn91Ag6I6IsC4lqPoaI06CndH6qv3
	A7zPBDDgtXtWg0Ltglz15c/1p7aqbkD5ScB421sN2HWAYjOLLJs7aw1SMpTNTyISEzSn/M4vbAc
	WRK+KxlqWEbC5Zv8lWu6ptRJNgn4IfoMDL86k02A==
X-Gm-Gg: AZFdTZcVgQo2RrGENFZuad2lipVhPp6SYvG/fJPSz7N3ePfSOmQWU86vgb+p35hejjl
	mBbBXQfq3OYx97lXJenep7kLO0slnRu7DuzbKZun7/1cV7XunoSyVVSJAm5oWadQcpRLC784YQz
	d155/NZN65JCF8UzrwnF3jlDOhVkJguoGvBz/ZPPWpgjAat7TVwKFjp4Wbm0XUMcYDlGcfloyDo
	+FUDI8pGClX4MGTdMA=
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id 00721157ae682-8b52032707amr33625617b3.4.1795284457671;
        Sat, 21 Nov 2026 10:07:37 -0800 (PST)
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id
 00721157ae682-8b52032707amr33625497b3.4.1795284457246; Sat, 21 Nov 2026
 10:07:37 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com> <arMcL9HjfkCDNOHS@vbox>
In-Reply-To: <arMcL9HjfkCDNOHS@vbox>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 23:37:25 +0530
X-Gm-Features: Aa3M54rmkiqihd_IxYxjTdXdYkS2xbqhpvjtR45jB_zIKbtCgVo1zmRXKHlos1o
Message-ID: <CAEiyvpoeJbWJ_nLuf3Ws1SnGR7Kxg2QN75ruN5YKyMBLc53ZqQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b01ddea cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8
 a=xEoOTTLnucjJTz5eKE4A:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: 31Am9K5YoTr31zFDPSqca5cewdtncaZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA3MiBTYWx0ZWRfX0uNTuU3iSBe0
 M6AuZ9psLB7aozjS05eeQamJLE6bkQtGktEfPj/zaghxoo0FMx6K4aktmvQEPsQ1B93Zg8Pa17u
 2r0zcX79b1e++fyu9DaqkWl3R9JeTS2hUHP6mcvOBoJ0S1RGCX5gE0/FEOwRs6TcA/M7Uchv9cy
 WxWHkx8yFnJiuvdWs78nqZmZhO/JI6IQomo/sdnGTXJe9UcM1LWmIvJHHLMH9VO2sxfcif3LiJC
 wWxYtv9nbN7AL2w09kPLZAfoP4bIci+u8MlFhB6+LfvR8akO8oYNpGHugKbcaKr6FEq3+oUj7uo
 v4AUZGPi44iaaeHmta3MfYBPIKhJI52p+RbX+NjurWO+aDD9IjyVNIef1amXL2wBPHPJIq/Z8BU
 FM5itOWaVtOvzKsgLlXfrysdZGPnd1IGXZKMUUonPKjfnz/ZlU7/SO9ObuYXXn6CcXTy2E5RuBO
 C0USGThEqrmSSV4FVqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA3MiBTYWx0ZWRfX+utHFTReUP3L
 9aimpXxa5khxcRhx2qtEvDC/LsSHpWUZBRXo0UYw0FTyrEd53gkF9JhUEb3YP06lFdMmnSRnTTq
 AUYkR8UvFok5fmLUC82x9YuqdsHSLeE=
X-Proofpoint-GUID: 31Am9K5YoTr31zFDPSqca5cewdtncaZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210072

On Wed, Sep 23, 2026 at 5:54=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Sep 14, 2026, Krishna Kurapati wrote:
> > DWC3 driver does manage phys itself sufficiently for Qualcomm platforms=
.
> > If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
> > exit is done only when roothub is being destroyed. Due to this, during
> > system suspend in host mode, although phy_exit is done by DWC3 core, th=
e
> > init_count on phy is never down to zero since HCD core also did an init=
.
> > consequently causing phy's exit routine to not be called. Hence, add
> > support to skip phy management by USB core.
> >
> > Some Exynos platforms still do rely on USB core for phy_calibrate calls=
,
> > hence disable USB core management for Qualcomm platforms only.
> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---

Gentle Ping!

Hi Greg,

 Can you help pick this patch into your queue.

Regards,
Krishna,
