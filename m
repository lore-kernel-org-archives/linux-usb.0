Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6F49D589
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400816; cv=none; b=A0E6e2EVxt2VNPawTS5R5pfGGecoguweR4/WmnsoRY9S4VI6PDjp5GHM8e7bmgpvTiQtqjFh9yrAz5xDJoxh+cJkF0wFrsRq5TsN4JX2I8LfMsVrYc4KsNaA+4j0zk03h1z94HObrEevCU3w5d6IETI2Cb2CI9sUDBq1J2Qt2Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400816; c=relaxed/simple;
	bh=s0I1woyWAu/v2gstIsnhHbgNcnCF3ybxjwh3mK2siFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcK5QGbWCi/Q02k01t5ABxhuJEk2psAyJHCBvtrHuBHCrtpNi8JiU+REOV74KDvc8mOq4hGStCswfiLLqPbGiSuZuJh28hFwgOarJDvzJEVzv7MXtkp32vbxCFzXOrjQh38K1Y0ic3VshIf8sDy7TSK1xvMVnYvwc/8eW1qgPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE8KO298; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQTR/o1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE8KO298";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQTR/o1a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PEjP2193438
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=; b=SE8KO298BCNhxKYh
	GImm5io7xfeBK/SUXunwVOOo1SnGPOqLC4Ef7gfXGyzjrhUTTpQYFGM+vjlqmNvL
	TWqGsHoB6Guu/oD2ayPoL8IRhguCJwR8UtlnY06FphpCcRD4egBfdxzuTBSOrkix
	PLmcY54vNNDEFWTDPBK/6jyjh1Hwmdi7mqErLhSq5vCb5HVrpk4SlBRpVtGFfxnY
	Vp4btWOZlQNR4xjT01AkNlxIAmhiHF/vWMvQtD8Mzrz/0A+8xBVRx/8QNAincQLJ
	hgZT9vCbBvGd5QptFz9vY228QSMnAuri6hhW9AB3gE3FFAPSThhlJAFN/vTgzB19
	s74GCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w19xnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:06:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso7359941cf.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400814; x=1793005614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=;
        b=MQTR/o1akyJhdbv8oA2ZDXthRRo3cOBT+jvT+rgVbZm13Blb6fNFRppZP+DSbTGMrh
         ILKYl1LI3oHF8uTQ4s8durEfKAe4JDb/hGmaIgpejNEnj6QnRth+bQ8VCP/HZZpK3E9Z
         DUcE5PgR3lS7SH+ed3j6sY1fXINGQ1fOQDTpluPPOG6RiFRIHS5xwZsrA5sGHGH/2cbZ
         usk9Aqm4e/0++eFucgWeQQSE5IzQ8aBGvYEiY04q7nAHi25pCNmCwqU8iHff1NNAWBJ7
         O639oXWgjX/wINJTcpoBmeXcoWtVJCxEralYQt2Zk/wk36lBxdlLp1iW4Tu4P60Z9Q4o
         xKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400814; x=1793005614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=;
        b=f8Ds+hhQDY2s13/vo6JepxyMVk3jJKH7AHO2QLB8yZ7Wnv2R6ZstD838hoPffD8IUR
         o1XX+cvsDkQJbIzyBkrMidOJA8xDdqCMNcBsiTGfs9d6qpV+OR68UkoN8KGoYZCTaknT
         vfulk6dnckJLwIhSR84w0Lv0x2SsQ7BBVLEu1V0soWeYbQTyHEzay/4tRrTOQ/VQ9pMC
         70m4sNdMcVsj0E8dhB5ALyLhLRES10GFuMDeNjNIKmHkfc6Whcrp8q9OR57EfJmHEdby
         5a+KWepfnLiIwlnUHSXED1s1PjTw2oGV0KpO7IdQrEn/JJhekoNpCJ6n1BLi5hfjGU0z
         HGFg==
X-Forwarded-Encrypted: i=1; AKwUvBxxcBxRv9NUHwf8UzBIpH9CjOQ7MPJZya1NlsqdaZ77tDmm9AhMwQMysrsITI4NwVeQKLPEOjgRXWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHm4A6sZObs/Yvw90hyMO9HCrQOzmLa6rYdZda+ai4tYUXCgvT
	Yu7HVSzLFHHQsXb7LZOw/J20Cqhr3/jxJW8lO7NkwRXXoJsrI1CriYO39y8FsFNi/8y2IDqOTEH
	BfG9FX4b5bHbY2fuWYSCvCa0x9S3UphvwkHCDtFbNn9TJJT4H7UacH/lv6RgW94k=
X-Gm-Gg: AYBFou3eqR0GIu1wGHBAlVWvv8KxTC334LuX+0Vf7pABkRuMtNgGwiQ0VAitR2WfQfQ
	EmJxi0Tbdn7SgPdfHzQEXJk3VGJFvaA5x8YlKei+wBZjuOPF38DxQctnv1vMW/ocCXc0ArGDxcW
	z7C3ORvxN8j0aoxsaWISbpR/LmnKN1QA0IkPCFBqlTkij4VWzRRFl72KO8FlUkVyspjsqpM1m8W
	+atePgHMSYgEhIHUQMP5yx2cR6L+iZRFHkbnRZ4Fev6gf8W2+BXoJQdo0Xbl5Tqqoqmx6AU4FrS
	GYGOxyo6WSNK1I/xjxNqZHWzvFqBwnxQM12fiB216vrphzfgyNaQ8UqJHVAycGD1+AbmkpssYJZ
	ob7PyqYyM3qKIkickafbEdQ==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1347765585a.0.1792400813865;
        Mon, 19 Oct 2026 02:06:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1347761585a.0.1792400813322;
        Mon, 19 Oct 2026 02:06:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm339806066b.17.2026.10.19.02.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:06:52 -0700 (PDT)
Message-ID: <366ab238-2850-4962-bd01-8ec16f6a0604@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:06:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set
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
 <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8YePDgC9dZcT
 V0k48UFQin0uItTlaa91T3/0vlSisvzyiNdEyrXHWKtH9DriN6NpukcQxRvsMrIN6q4jxcMmg6S
 1Oscpp3aJaZk1nKQytinONGIgqQ3gqg=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5ddae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=puRPeVu9JBWJxywSoHgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8/myT4TM9NIC
 t2A5bPgTIEkZT3kMXyCE/yRlKbQ0YKcepRlSYz1tv0e3LCB+w1YY8wWzZGlOfOow41WEDcMyeAe
 ZmJvTjSahH4nZEp5oYHM+llz16xzgEwPgUPRRymAe3e7t6D3iUYzHVfWvm+pn5LJ2kE7CcwcK71
 Tpu3k5U+xzT0vQ1LI1HaOxQOvDHx2m/n9frKy9snxobNJTIVuuBJt92lCWeHLD7a0Zf48AialJT
 7BViSTnbcpMrM7EFBI5mDDHX6PuWK1TSWdBq9ON/xYUEqrNLmau70BOHWOvJK1qLDmyCDMuM+rv
 BjEhrD9XALndIfHsUAF9FvWnlfy3sEGxqEErN+vsmR/JGABO4c2u7LuLHJhRHQJNLW2tgXU5eMg
 TWusPBoajqjQPXVrpdKW4CwNULbe4pRkJaCpereME/XuW+SEeDemJejl9OB4UMPf/Q6KcYNjU7v
 bWmdTrPFClIeiOM0zNQ==
X-Proofpoint-ORIG-GUID: B_a0qaU_bfE34VZJQ7kCuybOcO7mmyD9
X-Proofpoint-GUID: B_a0qaU_bfE34VZJQ7kCuybOcO7mmyD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
