Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7D49A3A0
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400865; cv=none; b=WWMw0nLbt+w9FSL4rR25AnTGY8Y3CYVAJ0NArAwVvAvGM0UGqFqgG8ovQl9NRSfldeANL3OoPpuG7BFQoAwoUe8QBsbUmHUbsc9pY5yyNYRihGmJ3NXaAuBMhdXdwNxJtXydnVU5LQIUF0Z6d2NNTmnWVM8GsfWcZelP1v0celg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400865; c=relaxed/simple;
	bh=XEbm8c7un/ubtexMiqmCilOU/M/0muLc3BE5N3+cOHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orFZAfBfuEojjPtu3faFUjA1LZhy5Pu9Of6O9Fu1DU6Yv+xAx1eHeCrGfqRZlLSQJ1RQKaFXgl34dKWJ2rA5Lc81BWX854sFSP+EPvQ/4X61zmuK2rv3+yPvOuKDmAGUXOIqf2zgxkdWM0ed14+Ec0SMCDsKbAnjqpfYJEbhg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOvs/ARo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMM78dmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOvs/ARo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMM78dmd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5mj1896469
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=; b=hOvs/ARo3bMlI9Vp
	klfDUgexlNsMYfJobkIfYmvLcK0xuYIGh20CxVreq9svF7xUc4+QmRsHd1kov+wW
	KY38iuAAS4wb8daIdU7Qz7SV8sBGZtjjCp/4gormxU3Wkfx3lT879CrJn4BOzhKe
	CGUTTaQflK0oiadZBaHKZlwGsCswV9d382k0ikKPvAI144RRS+OTwWKGIIaXHwRr
	OiXFLvBoqv4xTmk25v+qXWvbKmAkxWaLNY2F8xPEsDTk7XPvvmRWhGke+XdawqbU
	BtqxY1bcxWFUAm2mhp+ZDe4LLr9PdhUoOGzE/wmIOxZF7Qivq7SybtY/aUPbmvkf
	78QjEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr93ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so77650185a.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400862; x=1793005662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=dMM78dmd77JUNZVt3+Hr4kwg2UDxXEqzzNGivwjXdCi/P7YnplB5R92mIe7D4Y+XCl
         Gr662vl9woVFg7KelHmSc20gKN09wxRIWR5G3lcQo3sjGSNG3A0P6tQPbDDbEwl+5g50
         ybjJdk+4cKSks35nwyd/xj8D/ohstTW2YMdfpaO46oqrhImIldyW5oBa6Hgzu2ZvUNxf
         L4wB/+YLU2PKeCTlUzUAO1Py0r+iivzXfkUfzuJ/4Bw++aBRQax1fUMVwXV5FOCP65xo
         4RTVDnY0EJnqkl93IpTMRqrfR2NR0hrwo8VLQvpjBeQpPITK662YbnU1ttl9D95q8exx
         zZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400862; x=1793005662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=k7jD3pKGDHdReREQY+cpkGgyKb8OuogBGCL9cgijr30FB+i6pUVzoym4FAk5QcS6n5
         7GIVcVT/7nIo5CVE6ManWewFJuV+XRsSD4Lj6jdHGmWxjKSahWybicjdHQBCGmkhBr3K
         bf78QIdAi9HDwXvH3Rx3zijfPneatzq/7ioXCJDetpfy64vHDO2fO5ZpH/29Jzcjnp62
         nU2oglygHjPxMKvxRXBI1Ap5OkXGnlj1zTK96cypoROwBw3OyiIGRnhJh+9vd8iZGrJd
         IxVGzwPo6aXpGwl8cCuCCQYXqA5Mtm5nm1knyir40yxgxvNC/r75AJKrxzWC5OPi1K6B
         +xNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrcVlM1hDrCb57+i7KEGqYAlS/RVQQ5WV5ZVdWzvsVOphYG4o8bs0ziew977bo3KdlxiIwiYtzr/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUlxNc4ajPuu3kU/LJ6+tNMSqXOstX9IYwJYShfnkMCQ+5eKY3
	OYqwQX/lULxln5UA6uBEBRhpvdEFUl3tbUjXZ2crG7+HPEz61bPZ64PmkSD37/mUSH5mjyAEzLi
	E3Q0CzzhM06y2aMYahcOFc7mlIGkDuZzIC18YeuXoEpxi+ZGOM81rxCZOD5UiadQ=
X-Gm-Gg: AYBFou1GlI9V5j2FOc/Zc9n0cgib8IERClwp6yqHLDOwuCInFa2h+TLyGvL2hFBkR4l
	7DH+Iyq4h0ExVwMElFXQ0MJvXZ1kVhSffWlr0ixFJq6cvIa0NMcomwNPIDB84tdF8Krz47BYAY4
	ZQRT7h5MkNjGtcf5dc5ZcyCIXnTXKrAjPKu3Bq6Z1FpBIaN9uuNA8T+kPK9ZPViTXm4HndC1tdE
	0yl/3m5cbAvTr6B3P4U3+/DGOHpkN+GZO9YKOlsuhlb6DTUy2geo3xvUZqYovroKBqKsouamAFI
	37QvKuOWWgcy7tJFEJ87yYnraX8BQYYjCB2qZiMCdwbqlCv6u29HJ/RHV0YyCe5SQ3UoUZ8vT2v
	Q4JL4tZzgAPTf/zumYYBxfw==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351060785a.0.1792400861883;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351056585a.0.1792400861324;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm324440966b.64.2026.10.19.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:40 -0700 (PDT)
Message-ID: <d7acfaf2-f416-4e83-85c3-c30aa4e6111b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXzo4X8Tl+aYDW
 x31UcP4mGpUhl9wMQB4r1wgBUiBi3bjsWCuUk+jNur2kbqPeosnZ5T+rldQOq21AhzHLfPeBMcp
 SFhaD1R6MwrMPii44/goa1SrsL9PKBI6yqIWgAWjamTVZCr+6neahnbLVQGRAIZTgwcvmshqEV9
 pvSR5DEaYfdSY3ipUBD4WCLXYvC0Famw1undFrP+gAagsXZjXcC8106iv894QiLPpGRoiDar/pR
 r2pDVlCB6lXBU773+R93+ST/5cxMuKV1IP4UDIGLP1gxYRM2fXVc3VKmp7MDh1BZGW71fUzp0A9
 U9KFtXuSHA37b+7G4bw/ml0Ym3adwua0y5aR+nYOPQiWUG7Vj6NLoy12ljnQMUEqamC0DuH2N/N
 BWBmOb/Ao7442quc6bGxDmPTwTHKMH/mMDwHldWlkWguQOA2nGZo1hNLJJ6Qxh/h1NYM4puxkIe
 CCgot+xX6j6g/15jG8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX/SxKQ78Tm3qD
 WG+KGVHIarmsujdzfbIzq9yjPVvjMEOB2eHtVyxsyIdd/yjADLg+h+KDyEVPeiRo84ONyQslKrC
 1TWZ6sfNW4wtwugbosLN2b83M3BGvBc=
X-Proofpoint-GUID: 7_9kEWc5mZ9CbA3t5WOQ06uumzzXOCqb
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5ddde cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SFmIH4a4ZRYK_P-DvPgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7_9kEWc5mZ9CbA3t5WOQ06uumzzXOCqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
