Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515801;
	b=qYaewM3no7zGX74FeyHXa9l+k7xuVTjWkM01EQBe2cPAovpabvH95YEkhFsQB0/vn2jg
	 7yFSUBdfxWFQZHjQdMmehJt+gB4ntXw9blzYNeYTk9807XDZ2JhdhbE5as+2FGvIK8o86
	 gQ4tNXY35thKPAkrnKOxHDzjyNiYsZNtCHpCac8yE1TWNCfSyUynyuQHd51AFbV8fXSYO
	 mMbyExATVMcj+0KhvJ2TQS216s/cfhhbOYz30AHa9v7yv5hD99N6uth7AZxmtIYO/Ua7E
	 3ZOReA7uAQy4gWpgF5v2ZVObw4I0SydUY577K/5Rl93Q9o7YZYRpv80/8EDSlpUiQFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
	b=VBGqn1gz9qqAgO54I35sPBozYYj79MBCgng2PsU+IKs75NjmYmNPYETOv60Ucjy/QDHG
	 JGd9eZQfKXBiq/qPAwyFX+jkj52GxNdrRtROi0MbSrLZB03C29ZN3r4EjETkwDsqOxqbr
	 EfAqK2ci9fifAZP2nwAFtZQdmDg0P2Typ+bG8A6g+exsJxpKDd4En+r9EtyqCWmn+yJf3
	 4Sss/dRUlqpwa1iN4OWmnPwovfnMFvWpyMtXbkl58fghGvAHp7EsE2wOKvxd88/hHJDVG
	 YrVJju8bQmfrVz7YrH3LsTZl+z76t2RUvj4qr68ZBFGshArLUMurDIv0b3ROCyK5Zpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63822606A322
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63822606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8PmiG646336
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2fQNmv2MnA8jx1BzEazbxTqv
	aPaImMJgZb7CaQywWkU=; b=Ml7LMiltCJncDzctmpREyOgNpLM8VWutEjLBC8XG
	F96Pf7oPqmuQzPabf3TMtiBprar+icB9tJrAXWpfYMc3qYjiEliC4sh1JsDKA1pC
	nwRue456CG/s6wzPW+sAJmpZGcxWtSO52fDYe5onUPFmtgzYNZ5H2l2beKJ+0IDw
	on40G+N9TwWD5fF6koifpC3k/RqBbR9dOmK/6OU9qG0G5ObGPpvsQ40P6SWztwE1
	21l6Oz1IyFp8vVoKntDvlIdEeEnc1hrcwDxilQBUuBvR/kgTTqXo4Z/yQFVnNM/6
	xbcWuk/di6CNxO1dCHcyDPvJub7bj2zayKEdljt2PuLduw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd26q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6164486eec.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515799; x=1796120599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=hTmsE5uNqK+4zartCrrHvMu5pELsf/34GfdpAUJJgVeUq6eMNjBuwNnYEmAiX8UyZK
         Zu5Aj2dZoIdbxrk9D535L8RKhHt3l/4pymBxxKS45OTnHLW8zvsrvpvwvYN0jYNyJhp/
         2twa3Ed136f5yB+/kIi4hvHU5I4MiMd/9aHsLkjBAyNhvrcJCNOmirZKGLQw7mAByZxu
         uUwCWraMUfjClP2Zd5oAs51yX3cle/JA871+i/eqMIbLodpW5NE+crpmYCOIfuDUB/u7
         CVurmdXh5k1ezz41Njkj4FAtUL9WMOKk6P/3kj7gwiBPadBRhp9Jd7Otp40L5sGOXPVw
         7ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515799; x=1796120599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=Zzgxuxce6p+1q4/BUBUWYgsXUWOE+lNGZzGyEr0dJZLv/wiWJSrwlOOccE8umcOiMh
         dPvUeLtA31YtwyQv5f9dWjlZNAjx7YmDAZqF+sG0J6pxV0PLDg/GKLJBIsSj9Lj99lfj
         p8R4eGo7Zd3FKlT0afpdeAa5PC4OBeI9NvysAFZnjWqIb4MCRW9HtcLIxOE8dQ2Vd0pI
         tATJKV4Rw7yvSvBR4WjL5K6tu1AtRG/UKgd/YYUcwPmcGXFyIPIaqvph7ddQ2wMco2IX
         R69CPtcheN5xz72bY1Gg2VxwzVK5PX2DqE4Rk8NEx2pD0QskQQOBvULek+bZdJ01MfDb
         yi4A==
X-Forwarded-Encrypted: i=1; AL+hErGdQ2ijnJKc9InELeyWdlZ5e7b/HESCkKIAMvsFqSxrqaHA7fPJnwi9Lt9jPT/BksQd2rdZ9yP7Iu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PEU9BtO2T0s8pnI1pWLQEUZbA1zwxXyidGz3e1Yrm0LYCbbZR
	sA/pUwuqNC7vIrMiGMfDM2WiHY5hDbUv/xOtQ1ei/tk6gsnZ7I+biB4m5WA7mO/COSFWV5rwIbE
	dtrtiey2/a1Yctr1DNkn3U+aAaWLQGlyIGaLXKUPqlB8B88IDAB7JnGFV9ONfolY=
X-Gm-Gg: AZFdTZd4Ju2RhuqYMkEM4oSxH67GBI00a8iLWAapqsnCTV2JVDN69q6o9rtlKh6rVKn
	lVOH4j6NypxYOaLu2vyZ+n0s6JRxLTOHTmdeZrS5A1ZqIPxR1JZivINyLIkaGYBsEkWP6ifdRQU
	RtAXhzKRhzNCPbGlsMWReIsE3uBwY0i5S/Fns+AIgPvA5EPqm0dgO1vkahW1dRpp77SfMYeVnX3
	0+xASIFJuXofIsiMfk3ijRDFMMBmPLwu56O3cEPIY5Rj4xdoh2mpIpSYlOfSdnHD2Nlt5WWsoxj
	5ROS8qQgj0kkrsTi0d9wmNgZullQFmHY1mb+4DWhEf8/sw8Q/6ssxbglZ5ZPQGdEsK9YcYENM1+
	wKawvLpoPa/gZ3r9p3Ij3gMMG+uKYVHWU/NvgLELcXG9kxmLhbTIjLVYqHc7cwLg7L+iw/nd0vj
	Rq
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919244eec.8.1795515798989;
        Tue, 24 Nov 2026 02:23:18 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919228eec.8.1795515798355;
        Tue, 24 Nov 2026 02:23:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm40252277eec.13.2026.11.24.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:23:17 -0800 (PST)
Date: Tue, 24 Nov 2026 15:53:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
Message-ID: <20261124102310.q2o4ajmvbqddizmj@hu-mojha-hyd.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056598 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mksB-i68-orwwBDzz5QA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX22GitkRzNNCU
 iC8yq3m0nPjkBihwxJO2O4z6ib7KlZdb5PtlPzVzex5Szy07xPGA8Yy7BLlLE2Pp/PxqEFgvRVA
 XO/x0uoDSuN14CMNRh/OPmsRnvH9Le5kuIPcrtJ6W7x/fAu/RgY27iLQKa+0dRg9mxG/twIyZfV
 AHyjNdpI7mS+AoaadBQlGt7mvJkrmQfnCNaPDjyfa1yqnp30QJPCW4d/b1ZTTbCeVpfp0Wy++qk
 04wEhG0Cgu3M9nOtl3nXY/ejrVFGMFWmR7DpcDYvf7tt8Hp06SbNSsrL/IhWbSou2fh7LphYjni
 yQxyd8EasS444uSD4Ed3az/z6NoS0aDyqMbWAfHfftIvz1iV49i0NtV117gZsqyecJAh1pTwZnU
 Qf1Iw+NDVu5FbDa4GBXaz/kc8oFPc7vwnvxYvJnAJ51epgfInLZLUUirdtiPVPQ8liUGgrAgrqC
 v3rTTTkeEUAcGYgfv9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX7Zv14HglQxYO
 WPgSIWVoCWMAJi0YgTAQosBSAzSE+t7vqVZMEHkDpJMF85S/DpFjLH2DbfUD98eF3DzMkg4dRSJ
 Ax81WHNSAg2X9H8neNK5km8DYYLUH6w=
X-Proofpoint-ORIG-GUID: MNaxqTkBrVwnC5oC9U3sOld0EPzjiK6D
X-Proofpoint-GUID: MNaxqTkBrVwnC5oC9U3sOld0EPzjiK6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Mon, Nov 23, 2026 at 05:42:56PM +0100, Igor Opaniuk wrote:
> enable_store() sets chip->enabled when the EUD is enabled but never
> clears it. After a disable the "enable" attribute keeps reading 1, and
> eud_remove() disables the EUD once more.
> 
> Clear it when disable_eud() succeeds.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
