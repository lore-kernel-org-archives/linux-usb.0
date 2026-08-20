Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6992DFA4A
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213832; cv=none; b=FuiZFVcX6I+6pVmXqPY6Ou/hO2yHAlMS7ujLnja1IR3YEidCRmPUPoIypZfIvpdgb3hqaq1BVZlOiiumQP3Nzuu9IRGzuLINYWsu+HxB0rRrTQMAgVGq4n8ARIDB2HJj11dRr9ZsyLyZYYOxUOq/lMrxWaGrLHRees8JeINLCZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213832; c=relaxed/simple;
	bh=azdjVMN3GQau7neihQ/6K+zOum2258xhwA7RSd6+FXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqSc5YJa+aorSOJonIIPiDseCJH9iMdIyhYjYv1Kx7u8363pU2TlMCcGIZCKmJ9nuFnutNDtRWJ8iovhIxtpXUIFLNGuuwAwxbtJjnmz6QHOgu1Ygs2ItSIPD90M9QChucOv2sSuncuezbn0VrTO2vItAzwLDGzc2X4/TKDVtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lScmViJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvnIo7gH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lScmViJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvnIo7gH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6S2xN1354424
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kOKQx9GSDpN8SDqnvj/Olccsae+NtZfsVGGwbJTEyI=; b=lScmViJZvfvcDB5j
	iXaxpckD4fHZ8OeUNmwNYINlb9Q4vcB4yRa8dJuVLDOkLrmhbn+4CZqMNmoeQHCv
	z/MYpXV/1Zt8WEqOGaip83lFyzWmLFt2+jH5mrj6KSL2qa+G94jRuYDRc+kYau9G
	D4rHa94eYPbV5c3c1qeAmkkoKTS76KtzdBfVY4k6D2u+joovijf8gRRItm7X9yF+
	5WcdlApr9hlr3rVyidwFMYXPNuPCtWar/ZLHQxZmpr8+31veQYxdrNTsGAdxXYJP
	JGI/Lz1HBHBnjTMRiFPKgdKmZhgpBA8ttC1W58Y+SSHCxamgo3JaoxRhX2KE8h+6
	hroTjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es5bwgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:17:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so391346d6.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787213829; x=1787818629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kOKQx9GSDpN8SDqnvj/Olccsae+NtZfsVGGwbJTEyI=;
        b=QvnIo7gH6mE16+N6EbmWzgHIyDaQME4Vkd/KSvxilUtVtXX7B1YW5CH3XSdGuvHqre
         iki1U2/Rd1m943NgyF1RNNzi9zSvGlS4yUzaDXNEZ8ESILz9gU65rm6Tmw9AwPNhZEis
         Jw4NXvqZD/VN22/7ahL1rKrrgBqvXNiBbcYOxwWPD7NcoEYa8bkOCU6TVEpOkEwiUn7f
         IXW16q0eb2jvIFrVFo2hmsxplLnv0ETy/Va5vnrZqlOkFrFNeKHwx2P975vmY2uxlUyL
         ojFNFWDNiJUNeWPVW8E0GQfCGTF2FkyufjcNDJ2hw+UfnkRU7LRYNh8qlZ9UjfF65sjs
         pgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787213829; x=1787818629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kOKQx9GSDpN8SDqnvj/Olccsae+NtZfsVGGwbJTEyI=;
        b=QEdor+ivam9KAcew05cCL6RFmuH5mDjrGphv23BmurrT1OqYhoOooe+iPaHGy53Ilh
         HMybAKc3N8DxhCFPAYiYtxHooXwKmhsM+chGr2UdEw1bLTuqBprm8MIc9M4HiltlIyIq
         TvuIYBhdu5RV8D5HRWTSlQsx/58LEuM4M/92Dqxo6yIiZnDp6oCLqLq9ITec46pr89Qs
         IFllzvCjU3G5eJzjqeWcWHFnp8PguSHCGpoddQREEzW0sHjJVujsWsLmef9aWYGYuPKB
         i4fewdCfvcm2qAVIctUu8ce3nEbqN554jLqbAAnuZlwJnVJgLJXa0iHQFer68c/VRDfN
         DqnA==
X-Forwarded-Encrypted: i=1; AHgh+RrnWzWzXl+M1NsJuVKtQoXNajmKI1c07zXNkRJy1tcDuWMtVaCJhRjzgkFag3b952eZEvN4iQjz0r0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ohEDQnILJpd5ynMkZgBPj4b7YAY0M1ww/2TVuLTqobwcvQjV
	rCKeRk2VjBDxDdgaDTujqAcaKnn8EaHinD3dQPHDJKf9v3Tw5Ga1T9EA5dUipUpfGIqmrRj/6j3
	C4LVzuuV5AWnEswz6Hv+LRiZ4J3hd841iWijHiVxETFFJMFdRm0IzAVDvVWhJigg=
X-Gm-Gg: AR+sD11wIF0ulIIZzjk0KBovmcLsTV+afQAsg+SC7Bt3HZ/P+a+txIgBIjvi3+tOrhD
	RpORzXoRsGC/9YD9kAy6DwrNopJgk5reBAbtTpJjMsbw2HgXCONAtPZCW+pemN6VEOWiDcNQAI5
	q8VhrPus/xQL18zvsIFtU+Rz2age1/AMlY8vSZUsC8qqHav6+iMBr7WmcfgJDeXYjOJfCSIOoEq
	BRNeIkKtDSm6wavnuoJuVmVDDHcyTKwrOyozkBwfC+fGEVctvZ4RU/hgYcvOKrnDrKM2kBfTFo+
	xticQpuG2zNizphNRh7RTUZrB3BpNbDZ8Fi0xXizLYrqUJcIqZXETBzDEM/Ul0uyOL3c7mbdYv/
	K9fYJ8vn3mXDqstP7J5Gwzrjc
X-Received: by 2002:a05:622a:588:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52dd579195emr73714201cf.2.1787213829199;
        Thu, 20 Aug 2026 01:17:09 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52dd579195emr73714011cf.2.1787213828773;
        Thu, 20 Aug 2026 01:17:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm41825266b.22.2026.08.20.01.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:17:08 -0700 (PDT)
Message-ID: <79fa9d60-f8e9-4e5b-8c01-9ddb3a86e3fd@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: cancel reset_work on stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819161448.76597-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819161448.76597-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O1vpoH_osqAxTCc0YISbGL3JQ0vpEW6S
X-Proofpoint-GUID: O1vpoH_osqAxTCc0YISbGL3JQ0vpEW6S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX/T2iumJ0PJNk
 SBOAul1W3c1DJf0FIGGn6bxsfzXnYTdTwK/4a1SYj5roq4qmsGLV5nH2KprpAzXzxNFf0PBqvFa
 4Hfo2VZZCrMfo7rgpgu6nkdrP++QOhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX5EeVR2shBDmi
 F2L8LSMlCjQBGReOXXaAjb6GQY48aLUTVdF8rBxLtnxZccGodMEbaIZbOWojtkWlIhTJbk0eOGy
 QwyXNFcoA2nQwH13MZC5809rmMuKaiqfuNlMolAr5Xt6ahNOFJQhxMAPGy+fZGIB+GD6UhXptPv
 bZ6LofCeW1RvQVRRsyev+fQQ04pNedZPwqOeB0z3j8Gpd0zGO6e+3/K+Q+mI/bzKzAxJIlJ+7cL
 QjlH+YBb3PNLwJiQpbWFRUgw6QczGZhNwJptv2Z27+oVjxKSpHBKOXxGxT8J9bv0C/6+l9nkwBW
 pv8I+G1UNbKZ/40x7wUsVukCxEorIoaiu6yvBUo14/vOti66bMT+sF8p1FRDyUgNaYNfG3wtQiv
 IuFZJXRfm30KGksT8zNYrzdQFgsxYIrhbLaQVxvmMvBUJFk3FdY5AAA+3fDonSWwPVBqA01r0qF
 gZZzJkGHvSLGPfeBRhg==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a86b805 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EsPibtQv_QutKtu_k7wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200059

On 8/19/26 6:14 PM, Fan Wu wrote:
> pdphy_stop() disables IRQs but leaves reset_work pending.  If the IRQ
> handler schedules it just before disable_irq(), the work runs after
> remove() frees the struct via devm.
> 
> Call cancel_work_sync() after disabling IRQs to close the window.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
