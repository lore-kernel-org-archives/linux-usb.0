Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B93E5A31
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339396; cv=none; b=JoFU9toirLXobUshidtDP27OgizfqiXFRCaJEevfa3SnFRCUxxkWcdhYSjUb5LC2QSuacmiBzvvWg2GLI6YVQZHGLLu8JjE5ANc43lSeHYrlX53OjvdYy6hftkzPfcOKpwWVnZN3h2NVMAAi4OpfZz97e4N9gyrPQfoRPrqEJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339396; c=relaxed/simple;
	bh=Hkd7WTFmIkuhSa1Lj9Ua/wTrqEfFcr8VgdL7VPdGPqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCG+F+ojnV95frcsfQdKSmsA8Dz6iEKK7DKob4AstJlONeJhyIp8OzCHrwpcbXLlx5zGUgfMV1PPbJ+uuPtSQKlIugKBdxmSyUEoagKDU2YKArs3mDyTlacHTlcg4prC7K8v1Dq6bXXnu8Vo615h8Y+PGJfK1HyA6QrNI6398QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fU4qlX3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGMiDirk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fU4qlX3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGMiDirk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Veda960318
	for <linux-usb@vger.kernel.org>; Wed, 2 Sep 2026 08:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/QOK9WvQe6jUV3BBjRVMVi73
	3JCIvhjtwq+YyPWtdNU=; b=fU4qlX3WW28/3oPqaAGLDrVjbf+XxneHLH91r71y
	Vv7W4MEcQAVA3MJoMlATX8IzXpfmdoPI34TckvUDFFL0A8wmv/wgnbUJxb7fKTkw
	QFkesvN9Zx8IKmmF0GoE+j0ZldC2Bn3ko171H74srFf0eG7VXWIvD0cQI5SQyOth
	S48R8SgNZFXZsPJOM1Sx5jhuKcMzS1wVe/Jv8SwAmHEJav9IJdgLSnNoO6PrrUIm
	c0PEmRnGTAVl1dHe8XhP8FCSWVzXkJOulrI2cpj6MhmYiK7S2FvcT/Teey5tCOZS
	3M1YOD2WQpT+xttxY5ydfSeUhLKIZhsACJVcJiJJwF6DSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0u2v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 08:56:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so188541685a.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339393; x=1788944193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=FGMiDirkQWdC3nSIcmMYo8NYWunM9TEy8Fye977YYt7uA1Xn+7fEaYeAAw/pGhQSB8
         71RSkqzEl4mVpJxhApC7u5ojc1nkAQ7qRJDAwN+5CuyLPpykCxPhTPvGaBMlXrdCucpq
         k1/0aXD50D9KnmDs4kUM7ppN9l0Kf6F9VsKEdvfMl7i38IfV4s4r3QhP9KdE3ZoEndlR
         bfsuq+huIESX33nx1zLVT3TKa55oiqOqpNUjqvMJSYqLdczPi+ZHT1E7TbctGCL0ai0g
         +1eJUFNWWnspdvLV6/TC2OONTBmO/JGbUPFX47A6I0iEE1UTdsazpucZhR4Z8RzS6ZOC
         CGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339393; x=1788944193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=WbcfETMsoU5XG9w+P7ZaRRHYJLAkpB4MQKTg+jLodVprr353roZyhjzzKg5k2TI+am
         /dJK78GBIzL6JfpSpPHl17y0xsDD20VNYGywJ4U0XWJ4mr4IenDzs92asfWYvweCti7h
         HDZ3bcGan+fDAKO7TkaBFqMBD6tEG9O+1DRN5dWgcMe9hVPXla++0HZ9/D8oTIO7rbg+
         MjcSTJyaKwCj1asDVUjLxjNguenwKioOtSJ2YzhOszjQGjwO3JIt5TDNYxx5McVqKg2u
         lm4tLFRBhKEfJom3g2qd6AVQ5hAvJX+MvNb2gbkihGSTTa2rgNVGeqLVnhYdriejwUM+
         TiJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyAwFB4MkSVxERDw5B25ij9RbLYuI/ANTH3ZYo9+T/Bq/3dZOj+U0GHS1cFoLKWVVYmoBwssDDyXw=@vger.kernel.org
X-Gm-Message-State: AFuF++mccY/ZyVMf9cHVmkek/oonxhJHb2vCr6hIEtYUzpweavXb7r5t
	u55fjEAGPA+Et/dVx5SFcfR7X4aTcxF78Dv/RFiD5bURBDF9igS2S7n8wHQABGehHtQd+y2v4Az
	80ma/362ZoQUDx3n0k2E0NRTBWhOhpQWySsLowUl3DmVlnfP/YeKmRb4Jz3udg2I=
X-Gm-Gg: AR+sD13K5e2USO/5MGl6QyIc30SiqTUzml+GiLoIIEWGiSpoRnLZ0xKYEKQR64K4qFg
	liGzUNo3hNqjj5DTIFgFnsTBJRZKdSv2xu6g90gcyY3MXz4FN5CPgmFoNKmhj9COJEQcvrB5NhQ
	xQayP+Yio3ZanPUNXr/HS7HCii9EgL5g0VJ7ofIy33KvlaH89HlZEm/sXZKDyJSzjwBxOTYTzTL
	Cy53QViDUmm3NfIik6+C0HebBJmYQVpfm9GnnVjtQyZk/1TWh1lnFnELC7PXRo/cLDGguUJ3o6G
	sx6bWD3lXCh/XCiM9jRjiQ7xWbBW00Xnzq7f5sqeVbbQ5JS2OgMc7s0S9xGgSQW96JoHYrExoSg
	V9ZTxP1hAhs0fSn8=
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345500785a.33.1788339393014;
        Wed, 02 Sep 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345497285a.33.1788339392514;
        Wed, 02 Sep 2026 01:56:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm6241821f8f.14.2026.09.02.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:56:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:56:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode
 handling and support TYPEC_DP_STATE_F
Message-ID: <yit5hlvrumamlkp653uleqczt534aabcgrw75q4utxpistsnfv@ctd4lu27fndm>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX1E4vfn1CuK3d
 kFLW+PoqAg9Q72PZ/DWK3MjaCnrQ43Z+oqQHd2y7NxycPw9AMX/ergexQgovVOekNcJRZag4Duh
 3AaiaPYD4/Uu1ryZukQ19NKR2gPychG1xgY43HnhIDi2MDIzvJK61Q2m1libi7nuTQdlrTg/D6H
 Vnww+ALcOnnqpTHmfjZR/EXlNGf09Ulys5Vfzm4Y47aknsgwUhr+E1ZWnSPJzixikzkRL+r6MJ8
 XQl1yRzrobsjoIylMNiqNfpGcjpiK7V5Q7DUfFy1wTVpI048hd5iB81EUJplDIC56Owyk+cZ4c6
 HF3a4IjbM1tKaoOxk2Xfgl2unE3uJVEuKsK6AFzLypFXkM5kAIIDo+9kxIjPXYl+JkufPOPSDSk
 6nn9L7pzf92B+O62wwOXuicnbIFQMYdsr0/upz9Ox3kAIr7UMxUA16XgbeGfnRmoQKkcYCuBFY9
 ERTknXre3aEMlW5nCyg==
X-Proofpoint-GUID: DihcTIzPnAN6GiXx-8gP0kbqaHuQG5Ha
X-Proofpoint-ORIG-GUID: DihcTIzPnAN6GiXx-8gP0kbqaHuQG5Ha
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX2dlMBkWyEDN/
 e6F/b0WbZwEoeNCAuocFpZXx92DSpV2fubEN0H6YyETN+GYUccxN7DjfsZkomxAJrsq75PcFT1a
 6VHxIZHDIZxaZWvADIhZAi4pVBmYbrY=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97e4c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Xqxl2qIfDM1Vn1vrR_wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-07-18 19:06:31, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b). Treat it as USB3 + DP altmode (same as
> TYPEC_DP_STATE_D) so that DP altmode works correctly, especially on
> the 40B0 in Type-C fallback mode.
> 
> Extract the state handling into ps883x_apply_dp_altmode() (modelled
> after qmp-combo-phy) for consistency.
> 
> Assisted-by: Grok(xAI):4.3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
