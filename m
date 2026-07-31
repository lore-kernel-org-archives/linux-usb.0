Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831424519BC
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516149; cv=none; b=hMdiq0mKjg3kw1GCpt8muyYRVxZkusVnBfUe5UNIxz6ZznfCYG3LmgOTS9g/TzMvPX0I3klvtn6pXSMmxrPobxI9a1w2kbjHZ37/auBF87fBeF/VTLuTQtyOZ3X1j7W3D+fErxuD78iBF2xwxBaGF2J3WkWh/iVUIZvhFmJtEpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516149; c=relaxed/simple;
	bh=j7oNLmRGMB7G6Bknh5UBWwNbKEi6AzTwDDWtWUuYDxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pc8ADVL3LLG1Iz9v5BpZuo2ti3MWl46IgnW5YqH4cgeZoE/jG3xnh1TC+7fLmEPC7SNHw1n2Wvc8Fk1BEQyzcIZbCucs2L32nh0c39hPNprMmykxFPfswdTa0wBHKMxwMCP9580AYAQxIxpcJinKNEVO0v8/cd+hQGZNSn7sa24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWyCUDqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCJM5n8v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWyCUDqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCJM5n8v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFORG4215427
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=; b=iWyCUDqUGRxgqRqB
	soyngGkJSiQdGpu7AqErmbaNNBcysw/bB6MLShY5bKTqsU4cEkZR16GXkC9sOBOK
	fTVxHO0YQ05ExrdftiLGafcaG8ofrf8vS0hGXnCGkLy3e8/DT7H/8P3ynwusJ5VX
	pnnZEKP+dxa5ThpnBSgXesrd25bhil7S83jeSRV6ro8sm9LqSRoEeevJHNPaS4CG
	Vd7GQMzdtyrxWneanaGXQiXxhzoz16KoZVqLj/6qTW08HsH3ijAYI0pbs+MjlV32
	llmGHJqllwbudh3j6591IpekHR0UXi6hByKzjE8Gc3Eq4FXJbIxTiwMgI59UAihG
	k9Vv7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujus75u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:42:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso3494071cf.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516145; x=1786120945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=;
        b=bCJM5n8vUyZY0re/wU4C0VMQ2yv7NSP1JflTB2IC9IL0SyrWFpcxHiEBUbkZ8TD1m9
         KIIobzHzovqpJNsoCYWQ+mEk7nlQuN5qkB479GglwZylRFEETE1vehv2nlkU6n6yw1EV
         FxT8J3zqqNz2gtJMsmSVnHDyPOl/aG5Nwl7ncveZlkBqVH07V/GvROXGEIz30ItHae5J
         OaFtZxsALia2hnjOUQ0uq7nj2H9tqJtzjfM56KuEvlyA5fwcPw6L4HeLSdmE17PnYS33
         1jU/cOXLtGMDiGb8cJRJbFHv/1obIELzkmCIx31DaBRsdhIFln5Lpb6dq9Qz3emfL1Zj
         KNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516145; x=1786120945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=;
        b=NPL/hnlnoEMjRMYRWx48lsnG7OLMphDIXbMttSuwSXuRq7+30C1ZJHYKzNshcVP2dA
         vyjTNzkj3eBA6mq+yNTPWkCeaGNclMvQYJj0FjsV9OkYaaXjmImdAGIxvB1SQChnuMtM
         a4Bu9XTu4w5qO764Id6mPTRCc1pSMZ47b15MnU88HLikTOZMh0+AqynolB5VbsXjxT+S
         KuIqw/DaRbZBsWAt1B2cHI/AJsvKHcZEFUESNY9/wZ83vXQnacDEi/oHjfBF6qdS3om3
         fHUijWoBm90rkrMMQmRM3TQJUpBFzcX93r27JP2/eeXsww364AGUyj79XInzQ4pUr6OA
         ShOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMb8/M3Dg9yCgRNR14LzGBihwTnFFtgKM31EMt81Qzs1QSq2Em1oGxW9gDcqryVIXRHgE0JKRxsXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7pN1kng0SCyGYFQUyJpu1rx21y67l3SvehrlWtmpbS+V3GBU
	DCyiHkqN0mvrT5knYJ4hcbJk83MKRCZlSEKT/Z2W2yswfJxSXK6QW9rFQSFCAa1eC1YgBQba6ky
	yAyZAoEoJ1D4MGLer68icjvGgjrK/x5NQNPTHhJGWg6ZinCJ16hL8nKpPw/EQ5TpleRe53Yc=
X-Gm-Gg: AR+sD13j1G/jrtSa67zxsE5P0Ty+2TziI0WhmCbP9CwQhjo1c3XfU3VoJcbC9i+EzNt
	n1hgeYrhEYYWhkJHGE6K5cQT99uGyXBM6lveuNh5Z2I5dzBiPWn6E3/2ucmYY83BcMF/NzlX1rk
	94wCfjKUqKd1xpkGZhrxHDcrftGL7aBCstLEs9lAcEDdk3E27IITZ48/01ex7CUtkoQ6fxE+VHG
	8EfO3GFrDKqfCHKKxgEcHDvK0nrm9GcmE2PmwaODj/NADc7Ahuoaq14HeZj9SREg9N89OzP0S68
	/zwtFJCoU1z7jPlPm81rzlX8j0Is3FeCojacU6dD6NDP4p5pQnbslFiNKEBDbOoJ3CV8k0tG0hi
	XKofiwceX0+xr+oQg2FhU9Wy4
X-Received: by 2002:a05:622a:aa42:20b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52b56737710mr9634061cf.2.1785516145067;
        Fri, 31 Jul 2026 09:42:25 -0700 (PDT)
X-Received: by 2002:a05:622a:aa42:20b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52b56737710mr9633851cf.2.1785516144687;
        Fri, 31 Jul 2026 09:42:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd450d731sm218741466b.47.2026.07.31.09.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:42:23 -0700 (PDT)
Message-ID: <b300cfc5-b6be-4227-905d-d69200fcf857@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:42:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
To: Esteban Urrutia <esteuwu@proton.me>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
 <20260731-savvy-piquant-chowchow-f516f2@quoll>
 <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
 <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
 <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
 <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
 <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6cd071 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=x51eZAOGJv5k9Dsnt6IA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: K_oOPYNAYJd4iOTsCZzpODmydJcsrCd3
X-Proofpoint-GUID: K_oOPYNAYJd4iOTsCZzpODmydJcsrCd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX3qrIB/WH5Tor
 L8V9sCgdwyHSIJaIoCdg+rUOfeRoEjgQ6cc/9G2/YB82CBPIPcMdlHxT0aAjAYXd8uo1HjJE4qo
 BJk5bBVUxJ6r+vBoW6g/8q7Mhi6m3fJnf6wHtBpSGB6ODLjC/pc+t+RdL/kQ2FM/HE50LXRbxsC
 IpgIGCDEAGuyGJzbcw302U1UYtJYqIz+ku/rM9XMwAZwsyaXlJQD7lXxhyNnqSgbbOkZUpyjG4Q
 ZZT7pE11q2hHTNVvMtI5CpgG22iT8r0jJXi6SQqHl81GEj0JEiQUUQw8aXbbDR3i405lRr1YwkO
 XUyAzERQrGCQEtLNsCbqMShR32MSzWU3C9DCXhCVuKLWwvJ2Am2Sfg2eD4IS7JOZ/EXrIkpIDX7
 u3LrA+GTiKaFQu5oypaZojFLswxjr+snwN4owQXrrqTHFKYvOpIppZ6AWeSLnoovyA2M+m/thUl
 BY+7AB+tPGexh3iaC2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX2PL8ylKOR7zR
 DOUhHso17vFt0UIrc1aK6KqJijGmIVNH2vVOaKsBhoqI8tQB33c3M/q1r0EjitFAxkOP8ERTL9f
 3gf7xlEUaUy3uwHwMj3ZlTgNO8u0q40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310127

On 7/31/26 6:40 PM, Esteban Urrutia wrote:
> On 7/31/26 12:28 PM, Konrad Dybcio wrote:
>> Somehow I confabulated the generic compatible being present in the
>> driver... I was trying to explain that
>>
>> And yes I didn't notice the 8350/8450 difference. But anyway, the
>> resolution will be one of:
>>
>> // 8450 is fully compatible
>> "qcom,sm8475-pmic-glink",
>> "qcom,sm8450-pmic-glink",
>> "qcom,pmic-glink"
>>
>> or
>>
>> // 8475 is special
>> "qcom,sm8475-pmic-glink",
>> "qcom,pmic-glink"
>>
>> depending on what you believe is more correct. I think the first
>> one fits better.
> 
> Yes, I agree the first case fits better, but I believe there is also a
> possible third case:
> 
> // 8550 is fully compatible
> "qcom,sm8475-pmic-glink",
> "qcom,sm8550-pmic-glink",
> "qcom,pmic-glink"
> 
> The reason why I believe this is that I've found SM8475 to include some
> elements such as eUSB or PHY sequences found in more recent SoCs such as
> SM8550.
> I guess that's the case since SM8475 is a respin, but I'm not sure.

pmic-glink provides three main services:

- UCSI (Type-C)
- altmode pin assignment notifications (also Type-C)
- battmgr (battery/power supply)

In that scope, I believe it's no different to 8450

Konrad
