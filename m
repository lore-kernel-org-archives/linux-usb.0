Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F4414A16
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330043; cv=none; b=kF8SDafg+hmG8KNAGdMAMcCr5/UWX/8K8EaeIBjLDtumPfGboB7Vnyv9xZsQeYI0scGgbVfhKN1xzZN/Kyp7BJxYnK8/Q04FPoIJGv3cEH4xjlqR4avhhQEQcMe8rAxZ6FiqCQWuLIEMsKyncu9KHFxREfjaj2DE1+Ev9v9pBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330043; c=relaxed/simple;
	bh=pVIzRx7/3pDzYwRBGmmo6zbIA5I6GEQY9Wi2ilXolNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kC0KlSJBTaPwwWKrJ1rY2HxuHZnDmyTb5PqYGMF7wxBlqcZN8x0CYasFyWR9nA3M+HzDzl2F06Ygg8CcNo6X+5iZ+gtsV39g8PCZUFkShQdN4VwYfhtpzMOnOps1QvsgBkklArU3S2jGAbOB/Bu3fOhkSWWtzmfEZyBRmbugenc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDp3WOPB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqJtwWlV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDp3WOPB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqJtwWlV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693toM4108055
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 09:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=; b=MDp3WOPBRFA1Ic0G
	hpoo9y2k2jpKfWuOQz3s2HzjAT2oWoyUBmNocOrS24wi48B8US2L1Jud/304G9hr
	ZI763VHSeELLNU+Iqj30SfWi9/Q1N+I7CwRkjjqtAMHSI514DCJPvFqpcKE2axhP
	1D7Si13pxWzZQDbIVj1lkvXEjHsGdvV3GAZehBXAL63MqwDx8NQXFztYsOUn6ap6
	O59v0g972amioxr46itmTskTEB1GM/NjaPvX4Df/h0v8K/x/EU1JpSRAjNfUz3Tl
	O0XPqUeJZD3RwsCq5sFRDxKGaWmZ0aPCrPWo+jp/pWr4/tihBNITEqOBfuPyWoq2
	E2oXFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrhdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 09:27:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso66137485a.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330038; x=1783934838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=;
        b=iqJtwWlVCrqnNSROhnjid/O8CDnAjRJkcGrRRiBALHqt7AiajY0/ampht+eDw19Kcm
         FvSumZXAtFQFQsljoeckyUzqPkOTxdyq6ct6f4JoGDOZtJyF0EZSrw415va0LSzjym89
         0sQtgXdcoy8asfBlKwRIqWUCBCvCMAboPpzv2Mi/RmEmsaZlkMGvQnjYQ+cgjLZvGVPA
         PQ7+OM1LQuC202o6ZbNKWgCdYN/dk8qhTDwNhJjKUuT3Q4wm18IPBjZQY3j+iM2N1MFN
         B1FUCcvk8N82b7ceNCD60IQE9H7ge1i/9YmofMhcS0SpCvKV3coKbzgyEmZM/WRqxvKU
         3xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330038; x=1783934838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=;
        b=qgb5CQcCWsrjeN2roF/ulpmvqZRPJiHcFqP4jgUcH3vPRqWIE8uTISFiG/8U+pglsw
         iBZ8PYhAi8r5ruUbyb0z4LvkwU8VjC804QOpDYRftUBV5Xva0tFr8751RgQx3In6a1Hk
         XdcMgFQiEDae4qYc7tOs3N8srrJwFunJ57j4fjJ9ZBbqqUfWLcdfObIdnz9XB5F/hq+w
         Lme1ovxhD5UX2euP6SqNbN5p0BW13+EZZ/BqJMz98V7TQ4RR55bs52gS66iFUJJfyAGE
         WK2Z8TIvCrUBZAKDa3JPIRVuzwqzOyEmnkKVpz7KY7kOoGDGvYC7U405pGR04S2oGnVD
         UNdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpakUeX585sc7ryXdqz24fLJGw29gIwUGVqpiECXAzLjS194iWRPV23Hm21GJBITlRpr+aai6my4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzblxwT5cellaX+9HT6jo1M7TQ7DXwy3ZPkO5LOgjG61eY0nPur
	gO7oiVOaP9PyGO7Wv5woc1XEwOSrsl7EU1nRmQbTYVv/xVUKkVpWTcK3jGVOMa7CZIEbAspCmpv
	jieSxyon1Si6Y4/aWY+HGhG8wW/Z30nseauMYdd3qmpXp2MkLe5lPfHRljEF74qIU80dyCsA=
X-Gm-Gg: AfdE7cn0L/PsumuQPaISR/5wTVRraWqvmupA200p0GgXbdZn1+CfrWZ0QR/dUWzCeHk
	sDoA1l4Wg+DeiOjg1hKmo8A7CL2jNRyn26a1wysX7HxJsEPaNxWz6Pl5bIYbIGf9Z+gq3Wz+/ap
	iLGCJTptLs45oD57sJT8f10lB7cD6rriqsz8fVUEMwr6AiAvjdOzdzcqnsGACirXytNbRH7qYIS
	zMzm0tdaYwLaDfnh6c7b7logd34H4gjkY2uk5qw+et5FcFpDpJY6EG9MYzGAIQM93xkWlt3/Dsy
	2opWxm/WxgDi76HlkPB57pOPPMYVUdbqsQtvpL/1gG0Qe0E2q6MeRIa+FwewssxxiNkz7hE41ol
	f5rkRzEIvj/nyDRI99dobt2ERFzptaa10Lic=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86597251cf.6.1783330037881;
        Mon, 06 Jul 2026 02:27:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86597101cf.6.1783330037493;
        Mon, 06 Jul 2026 02:27:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b609382esm704610266b.18.2026.07.06.02.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:27:16 -0700 (PDT)
Message-ID: <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Iy29qoY-rE8nACZz2YS-aINOrzNiVNod
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b74f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iAF4dUnUG2d09B6YKoMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX0trij925GmNJ
 RiuNINNxj3lHNI0UmnUQ+nYKGDga8EUUycfmpILEPugHcunoHteflJQtlQkLYA2v6Crs9BPXZML
 /ucqnQF27mDb0xfakG/vAxRzJ4eZq7k=
X-Proofpoint-GUID: Iy29qoY-rE8nACZz2YS-aINOrzNiVNod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX/OT/RLc3J1up
 C/DmKgSGwaL7At62MTvU4WNVZrN2mRt1Z6lcKva7P0SjCGSZa79Ytz0paDALouw/X+mbsABz+iN
 mYnDw374YifqWhCr6XAW5IXLYUK7/WPNCjwAOo/po8mNfBlyaWcI5iAdT4NPmPrqoH1GmX9FHH6
 /npCGRv8oenNh71Er2nP1tGtJZlK5fBlOPEGVh21x7rkdF70KrDPQ2aXLY32ZR2Ui6CoATMCbzH
 HmG4J3oowJ9ibDaHdEBqklTuEHL+4S0BSkLHA3i7i7X95ArC+LDIRc5u4YDgW9dIBtkFdRhmz/v
 VlCED2vhmharQYOH6LBAXkZLTjYk8MPbZa6euiFVYubjKZ2Nhs9z9lDDYMXagWyfp0RTRVpZwuR
 iSZw2oP+4GSf3X+MAOqolse1IvBEJNLZH2qn1S45V658aSEAN53dzLvKhnjxeAqck/dvoSeQYqf
 LFe0JB5f/4ZX239rKoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060095

On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
>>
>> Because the EUD sits between the USB connector and the USB controller,
>> it must relay role changes across the UTMI path. In device role, the
>> EUD inserts its internal hub into the path to enable debug
>> functionality. In host role, the path remains directly connected
>> between the PHY and the USB controller, bypassing the EUD hub. These
>> hardware constraints require per-path role awareness, as UTMI path
>> roles may differ.
>>
>> The existing binding models only a single UTMI path and assumes a
>> uniform routing model. While sufficient for simple device-role-only
>> configurations, this representation does not accurately describe EUD
>> hardware when role switching and/or multiple UTMI paths are involved.
>>
>> To address this limitation, per-path child nodes are introduced to
>> describe individual UTMI paths through the EUD. Each path includes its
>> own ports description, allowing controller and connector associations,
>> as well as role-aware routing.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---

[...]

>> +oneOf:
>> +  - required:
>> +      - ports
>> +  - required:
>> +      - eud-path@0
> 
> Do we really need a separate eud-path node? It doesn't represent any
> particular part of the EUD device. Can we simply add more ports to the
> ports list?
> 
> For example:
> 
> ports {
> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
> };

I think this was originally born out of the role switch framework being
strongly tied to a single OF node (because the way they're found is via
graph traversal and not via a phandle)

Konrad
