Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B43D42E413
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579209; cv=none; b=D2KkrBehvMD1QQCkgtVI6O6DLMaYnL35wVoQyJ4ed9DBXB9mOSGxtwmCWN7wWDTFqEY86xrzCgEOdvX82627f9Mf3K4o1lDUpZH9tEmaVwFYE7EPYDWSTiFUIHyp2f2T/jfKbmlxHRC5yoENpKg/XyJ4UgJ1WOg6dh1ivRxTy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579209; c=relaxed/simple;
	bh=u7ptXGg46h20+ycS2XTm1WSVKz2gZ9zCx+Gra8HyM2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/kp3THRREKHxRdJ+a+dHpr7SV4ON1OB71muzjn37LjYdnTodum0SCUilfgs7giElgOr/XJttB1X1M5TQ91JUUOlGw6ELA8L/DHTLN8w8KYC1/iEjZF9DWGPPOqtcyWsshtGuwCZAr91Hnw+zVmVnlvPe/ZnY1LJhZ17pZBna74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsyQI/ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3hDpFi+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsyQI/ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3hDpFi+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvDSN2006930
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=; b=UsyQI/ZG0RP0lXB2
	C/BDMVKmfhmKljREkvaPmhueQWqkkcO8zS0r/DVK25iHTlV1/o9EM+L78j5Is/Sk
	I/FjcrsnsIino7G3J9hSvjvNSGbey78jL03naR2/PpBLg5fA4DDhzITqQftU4iwa
	uzNK0Ta6emu6QSAc/jUunr6aJzzjb4g4Ja6gEjzGurYg9jioCndfMWrWUhwAUqnE
	cET/sAfYE7HGe4rzjLBY2xZ55FvOtdftGbv5xzx5ZBMAWQfBbe59+OYeRAuXcuFO
	79FGzq5LMEozefIuQegxGqz7o7gq/LaAXRoVcGraIxsY71+JZfS1IfPDYyhjfxFi
	hKZEEg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78vcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 13:46:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7530aaa7212so105945137.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579201; x=1788184001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=;
        b=b3hDpFi+PQ9CHD+UBmF/iaoWvXrwdfZelEFPxwOe9ceEsR8jUsMEjMB3DzN+AgOij3
         uNO0baQYRT9jcETW+wYjtb9Qys9yvSyceGDnDMiW2AfSbs26aVZ2Q8kFf00JTTMRPxIw
         q5cBZ67w88+E3OXjoeFF5mEjvmiKcSkESPHEhehTzifTRboVAY1qwMsAIlwOQzRVdSNR
         /08sHL3HwFRf2btjGbrrh119DUO1I47iryEgp3Eu2DFTEHqkiyDim8KWPhhqxtIIEPKq
         pc9f9a9EBDmAuNOc0Ds4Xmwt884mPdzpWiPuYJFYQswkdBEO/c71d6PX/nne86GoqsOT
         MVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579201; x=1788184001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nns8MPtsNp7ny0utoj3zguksz33o1lq3WNM38Fnh1Kg=;
        b=FCbBjOjOUlKUkbZxXZoE0Vs/eTxEkA9fH6Qj5EvyTnR7IgM61Udf8USlTu9M0YlN0e
         Aa1jCHbxTfuppGHFXAoTlXslbNnciq8usbQAryL1zKJydcnE3vCS8xfpI4cb/NPXQGp6
         MCde7WW5WIn+tdZiSDCqmxMF99qiIiunzUJHMtW5VXqlzk9TG4LSvVTf93HlW3kAEZ4L
         P+Zp6kR0ezNDll2pPrjzzqBWIxWySjjZPCim2ExDh/RDv7mbrhqdIBZQttqcA6LSCmN5
         Opanh5i5GqbfsK/9VxbLsy2bCZXgGlVFye2ugNnpOPSx0NqvAqMdB3bS+0T3+O6WCvCr
         SyXg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx5YLJAjdKkzvi7E7ajUKdjpZfMtpZHFh8i4SBbxXgstgzBTwj7kWjT12Or1mH4IWPxLJdK4PfTqc=@vger.kernel.org
X-Gm-Message-State: AFuF++mNn38X1ce4vkH5Iz8tWPTBf0sHxdRhyD+VKfQhbH+G18HgKKjc
	D0KDhAiXEy7F4Yv1uqS9fMg+vYvt5rAxktw1iL0HJytcGie6v2XTD74J3fhMeJnfZc3lqH/VUhu
	YI+poew4e66BkxxDrd+MabG/PuGIwm19HNXvZt3JThN36CqHtVnsFeKHCkGf6JthTz43LqBk=
X-Gm-Gg: AR+sD12tHFE6Dyp/jOojdbI3anPgaMsGRieLnYUWyc/2lusic+QnMwamp8sQqfabePB
	M5nZxVmFrnoT7O8xUZWueoCgV3wDZuN6SFwT/npksaBourX98jeWvQqkeHCObPHGwC51ypa7P2s
	JRWH38w7QaBaRgmF7W9DiAODC6wvLTiwdWggVRzhRdQ03vWIIyGJfIaLw2R1Ot5Ac0w7qVNZzjm
	2LeemEkfs1ba1NPyY6E316t2qatNZH6qPoCnlaTLoYJaa6yeZcktdJsH0DBK9oaJc9aH+rgnbxB
	jdUifpqWN5LWTgHrNjLl820K88zHeYRax13MepXOKrNPoVov8zGT5/VRHc1Ahy7ksUD/Vj2XOf/
	454Ss9iDGgM8DWkXqot7WLHu0
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3427934137.0.1787579200643;
        Mon, 24 Aug 2026 06:46:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3427912137.0.1787579200146;
        Mon, 24 Aug 2026 06:46:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00108asm13140614a12.2.2026.08.24.06.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:46:39 -0700 (PDT)
Message-ID: <c3b857e7-3f23-40cc-9e6f-c69c7b368e1b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:46:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] usb: misc: qcom_eud: add role-based EUD control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c4b42 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X7E0pNrBJpJ0GBZA2WEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX5Hz+cCdlYORg
 vO4JvwI20pIoXxANH0ZsGr3PZ1JrR9CSPL9QpV5w2AMH64CirPRpcZLc9R/maKQtf2xqk9YRXp3
 v42zDfwRa5LczqKvFOYYvhGCVXhmGLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXyAfj9w2SnV+c
 W3sTfrhE1CjJ0AobE20AGV/XiEFZD5ga9LjlMCYZgAw6XIj85CkUJRDzaUsx839oEO8MBNUAH7g
 jpipdcuF73oBjyJcEwuTf7v1FYefvNo0Km81lK8IKkPmUHrgmure6lcjf7tGPylRz1wY8ccywCC
 87sqFz9xWR4ugRESpo2Px3kAMdfIbMEjEjg4/PirrSvQvxKm1iJMThsvLHMLzstNKklhU0D58It
 GcrW0SwVYgYh39J1fHR+nHiTFO6SHdcQ9+RpMkVsFJsB8n+aHE+VZAQ5VGrWTXSep7zBkYs2u9k
 wYj+KK+7jwJ4Ftcc0zKF2LTjYiahEPZnd69RsMZ3xlHkuy8g8HrU0MyNyQQb3pzV2aZxa2zxZFV
 UZnl3rxVwpegeloPnB/2OzXgnS+pt7OL44WWkWEtqsGLRVWQWaO2/uk0GfH6cJxZhyvMk6ZU8NO
 B7PcRTZCMeUKvpUEhHg==
X-Proofpoint-ORIG-GUID: m98ErpUfsgpN3BbGjJRezxXH0yAMT42A
X-Proofpoint-GUID: m98ErpUfsgpN3BbGjJRezxXH0yAMT42A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240116

On 8/11/26 11:36 PM, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. Keeping
> EUD enabled in other roles provides no benefit and unnecessarily keeps
> the associated PHY resources enabled. Furthermore, enabling EUD in host
> role can cause the USB controller to misbehave because the EUD hub
> supports only a single upstream-facing port.
> 
> Address this by treating EUD as usable only in device role. The
> role-switch callback enables or disables EUD as the port enters or
> leaves device role. A sysfs enable request made outside device role is
> recorded and honored when the port subsequently switches to device role.
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
