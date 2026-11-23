Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430494;
	b=Ytr1//IaS/3TH53JtdYgFw5YDoeAJ1pYDl4DSVOTK58GRpGR08qdN/je/YxHKXfsr2ta
	 JjpGkNuc59qh8zc5y0l1694667eLuPJ+pxXkyp3eOivsM7Gaa5sExTtpdFK2ht8b8wMCV
	 OZj7seS2+M+eSPrb8d3mXjTM+UcRpjrE8nHo9PpIm1NvbU8UaXYuLDWDZCjuXBEDVJy+3
	 6CqI9QpO26o75gWvhnkDqP1/XhIa9g04zaputhzCGe3EfDWg6VY+YnulTJca+8Lfs3qAN
	 mYy+pvVgwR8zR76j6d7DylkU7XkHeopkDK4PxBdO9nAGImQUSNQxJjugjR7/4gu0arw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
	b=B0sO5l6gdxvpYgMYGSRvVxUViYAQ9VhL5uMJjFewnZYdV4ciQweucC0IhQtjYvZSYt6i
	 FyEUgtM+eS/7yHgiWK6mofxfOtGs4vg7Iz0dSNHXwCkWrCUduGKzdjuE+BImpAFu4A1ux
	 pslGHmDQYnfvklcSubRhIz47VC+r+Q2JTqyV2CpdNZnjl5zY20NKp4Rr8i087QX+IkAUk
	 jZ2i350/iK2Lsmn4jqqf9wRd1H1H2/M9hBoeNAmzqBapja3S9j5FsMbvKSmgOSySMWoMZ
	 p1S5X3FUekl3WDJiyMNiOLjGJLnvvcMG8i3JMlpMZV9Q+LqSOzkzb2rvJod/f1jF4Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXL4C/Tw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B496606A32D
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B496606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXL4C/Tw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FoTS1828363
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=; b=MXL4C/Tw4mJRyCmS
	/3p5pVKnE9YSURx4VBWSffV7NPCsb1eQwGe5wCJGoutqbiPziJG2dOwZ1d1EOmiO
	Fj0e28GKZquYDNB+ixNgS7t5kWFZlT+dicAGFFGH2n26WY2254ET/dxV9tPKsjw8
	tAKJctyF1vXmlEPUOzL/FCv49Ed2MMWEdLQB8U2IripixkCAm0Nf5W4JU12hc0ZD
	eyapXyta1eZz8hQPu4SyeTbBOdVB1utNJVzULLylzLeNjMz5jezX7zVOeBH5X4Xb
	rQd8Ffzj0FFz+VSl3KikyDhJ/DEV5s/I9eNRHPC7HNHRKl0J3mLBHV1rI0DGWOVr
	iR3gNw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8y6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4d1cfe3cdso27737377b3.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430492; cv=none;
        d=google.com; s=arc-20260327;
        b=CqAPIhrUPhGvEMRPxKzTJ3iakt5+hguQ1AfIVIW6SjTfbs3eJ04nqo/JXVz6Lp5BVl
         I7PtpovaA9pMl584m3Kqx6qe9W5tY5/SAOeQekZGR0ajuxplUGW0njOIdbmZJKAQnub7
         NMTFIpQHx/hVdcpqkdiMkpJVwuDbLlyNYYtc5uh2AeXJ2X1JWk6dXpsAWAp5SHD7l4RU
         4hp6q6K5jpWEDfwOuT34UnT0NTH+rTFfbw/h2eYoHRI3yrQlvWPQ6rIrN6C7vJwipDh9
         I51KVVVnJJ32MN8y/lWCqtfU+X++CIxiQqxQ2QmqgVL6GtR7+bvfGC+FBDRQrNi+2k+E
         0PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        fh=PKgBkqcFCQ3xP0tNYKqjzQgjwMtEyJ7YY/5NwlLINcs=;
        b=nAAZJkIB7cL2dD+ggUTF+lnyPL3IwJpuULYzNGI8Z6X7uj19uXYCLQ6QeZNzI0eeLe
         2piB5UHOEIX5baynSjxLaH+MdGzslMgrZ5dMtoAXGpvByT8TRsUbmj9Rw8CPMB9Ek+kR
         gSvRQUBn0AtknnzvPkDBc2v3DcJvC2Kjfy+eMlxAvyy3TTtQZjbp4M+03cUOBWGIoeJb
         z+I5Yv/Z8sbZdN2ZKmJeYg6IdHHHgplOLVzYy+dYBp3ARFmxEpKQHNMBlfnTvYQhN2JJ
         8wEy35EiPPKGVkIPD/gkWBr20MUtsptazm1fg/VCOqh8C97bKZA3Bb22+zmrQ4C+EJdp
         kgaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430492; x=1796035292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=Lv8chtU4egopjHPByugmBHYt68mYV9sT6UnGb8LtCz2Z+tyBUhkJEZCyajUa9z+vne
         DMVUjc2yzgCDUkHb3HpQqMV1kAykX5Mx03SIHESvSfXWWmnyZY7EriripzhkcDTY3m67
         GwzCroB7DEwD2tn/nRKu2Z3y0Rk5JYelYDyp8fDlcZF2roe+9kO3UGVC0E8+oqXp7oWP
         gYMIQCMBpgoRoPKDGniCODt6DhOQpN/CjnMP/j4Mmg7raVXxMT+35Yebv7+ZVzGnv9cP
         OqT2i3Tm5mhs0VOPSSfvhhkVU5PuJhufr5rDqD/Vz15Up8Lq9RWLtRH47dXTAGrz3/h9
         WprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430492; x=1796035292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=OQX0/fbCT/a8Y1H7SlHZ7xFLcWkAokfbtej4L5Fv+zk82x5q5fpedqkj/M5Qli9OIf
         8HK6KEL7Kue5P2kgRrnbIpVJHCB8f2qa6gHsZibY1W4d4DvtCmk1exwSG6i6pDte8KPK
         QiW8wMVEMKRL1rkFieZtBDO1rN+p7pRUgandpeoCIjuTbyec4euYcRk4f2T/1nC1IgnA
         X2FP5CyB7vPqDHX+p6dcxCVRNZuc1PGIE5J4V+wpIBX4hJmWKFjTs6AwlxSyEy91zyC1
         eMAGoJotaxPeNfYYz8xtOnWg9oTXe+4McZZNsHADroFElwqKxHB/2/LbsZvpfVXSLo7o
         of9g==
X-Forwarded-Encrypted: i=1; AL+hErE4LE9g1HZP+YL+J9zJ44X272HUO8R+Ki9l1wBy1F0I4VWQoZSL4WnZb15GAJjjmZRvwjFuvI2G3jY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t8fLb0XHya3WemaVW7crC6OgSKZ3MnklZ5OEpcFiSHueoZDLx
	NsJnl1Ql6YnvlHgLrF6O3ezpORKJ41zcbNHjezk2TfJQWoUtSccIHPMOMXZBNSuDUzxT4jsO2Me
	TbUeM6Pd8EV7yZv7JfZ+Aa9b9TvYCp/M6VdIg6oQOSd9y9bxy420oArD3MgUvIa2N34i5H41C0/
	5GK+Gg1zmV69xg3PhMKqLh3h9T4FBLeTAfGpFALw==
X-Gm-Gg: AZFdTZfH3cBTbXNqgvpRcUC6mC3pXbozhODeJddEq9IWg19a7ILIt0jO+GTApeu8RJl
	m87wDFcWHt9DVqFIG6Ul1Eau3olwTg4NJLSD2hRHDOJohGiyOroCzjZA35xX++yF+myXfUfI54E
	lqyf5lbjZHkZNOULgp/8y1GGcUSgXPecfyzuJ4tmEU1XYIHvEtaciFovM=
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id 00721157ae682-8b520518c27mr42200327b3.67.1795430491892;
        Mon, 23 Nov 2026 02:41:31 -0800 (PST)
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id
 00721157ae682-8b520518c27mr42200177b3.67.1795430491400; Mon, 23 Nov 2026
 02:41:31 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com> <20261123-crayfish-of-splendid-courage-c63931@quoll>
In-Reply-To: <20261123-crayfish-of-splendid-courage-c63931@quoll>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:41:20 +0100
X-Gm-Features: Aa3M54oHmRt3xfqR24IGlW8Kt6ZRAtG-3k_KFIjDV4TNG0tPhafKEYvoA79oUAU
Message-ID: <CAPzfCAary8rkKeF+XFRFShRiy6GZwh_ky9_mo33C8+gGSxRnMg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX+csrE1ZSr/vy
 /Fa+amii8KVlda/kDbt+DlTDaOM4OjOMvak485bg+mSwVOvAYrndiztph5wpxX326k0KMIzPuaI
 0rvZBZJGHoThZIdwHCe5h1Rug7jfMzl8y0CV8NgZQ3JGysUwfiz/GJvR11Zb4Hs2LE5wqyXgAMU
 CoFoBr4PbSen74KFnT+I9RHknXemTpceWlphmemZUiSz2o/jU3Bu5QIH9UTE7EOY0wJzg+X1w1b
 UjgIlTNcq4DzShMqaVXIsSFrdcdXRiZEFoYtIpxs52fqfEyxM26otf3GdQ7gHIyRCANuFQCdk/v
 n320+PkiAVQGqI0aV6FNNEZ5ytdSgr4uES+4TZfPiEEhSO3Y8sytw8qS9pOk0O8wOTLScYplY9D
 8BwZWczttM3DBtCov3c97OdYnNst9igZVR+RPOrEm2r/d4VN/HnDW3NEM2FyNeWv3YPG4aEiSgm
 uD8IGrOUrtjeqq8KyOQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04185d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AX2TNvW1BK4AuF6XdYAA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: nlUPhFkSwAVgoyisbt6JLnkMV92PKOrw
X-Proofpoint-ORIG-GUID: nlUPhFkSwAVgoyisbt6JLnkMV92PKOrw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX9D33GuoHpajd
 B2yp31+oHCLFzrDDCRAj4HJblAHu9rnNTvLBMRcwfxgkzYAGw4eaMng+hTNIW+F7BpLfLoIdCmN
 R84kPvCfgCver6Y/HR0YtjDmssuyIAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

Hi Krzysztof,


On Mon, Nov 23, 2026 at 11:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Nov 14, 2026 at 04:39:04PM +0100, Igor Opaniuk wrote:
> > The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
> > CSRs and the mode manager register that the secure world writes on
> > behalf of the driver. On QCM2290 the mode manager additionally ignores
> > the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
> > the boot firmware does the same before enabling the EUD, and the
> > register is written through the same secure IO service.
> >
> > Add the compatible and describe that register as a third reg entry,
> > required on QCM2290 and not allowed on the other EUDs.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

On Mon, Nov 23, 2026 at 11:22:21AM +0100, Krzysztof Kozlowski wrote:
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

Sorry for the silence. I just silently agreed with the feedback and
took it as is
without replying on the list, I was planning to send v2 with the
sashiko's warnings
addressed.

Is an explicit reply to sashiko's review comment expected as well, even whe=
n I
simply agree and address it in the next version? If so, I will do that
from now on.

Thanks,
Igor
>
> Best regards,
> Krzysztof
>
