Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA621374197
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068985; cv=none; b=NgFW1fhWfWpuYW0DrvOZ7nonjAXmlLLlj29qJDAk7vg2oX8wce8gBkn6jfep68bx8YJC23ENgNq+2rr53qPlJK5URWlCOQNdA6tACh3nHK11zN+tJvnVw7igTrMSTgZLshSI0SxBtSizdIEocMpyLXkL4RjllFRH2vxTOKx4SkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068985; c=relaxed/simple;
	bh=OLFzMuZPdcWNnX5PmC3ua9u6pd2lL8kZlZcWTGaIqkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmHb5dnXhNhJQwp9xTxFjT9ptPn4srZpvebSEDHcKtPp4GKk7no8H8h8HiUpInxGYC1GMb1c65tH98G28LTNo0AA2JU0JS5biNa3JtLn6c8aW9GCWxti30xleQ3kqm0lptvtIaQZIsros8niw4jbOBtsUyZkHJr0FCALXm7Yo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+KYOa2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBpTAjfL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+KYOa2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBpTAjfL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637ZgZa3410056
	for <linux-usb@vger.kernel.org>; Fri, 3 Jul 2026 08:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=; b=R+KYOa2Dc2dM+qws
	fu6KRNuRqdq6Ze/7iE5Yg3glPymA8tU2B97B7UP0dLf4MS03F4gsyh5E2hA6dOun
	4oXc3JwJuFtud4oMrFZRlQqPhHhgMpqe6lybGKFZgUOKa56Rb1GZqNapicFsGEAJ
	ooSYqE0xBoJLM5V4weXEzsQnCMagapxJYgxiWfD53GblZadAiD+unz0ZEq7oOu9N
	Ef8rfDZEYgO/rbkucLROEy/omo3Cp0nC+nVb669v5xsAS+Xgw6bVJqTnA7WX24Bt
	drpaiE0cFnqhbMj7fKj00Rxw7W32xY9V+TPpLnO+NFCEERJyPZVkP1vuGICpUnaA
	6VdiLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u309j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 08:56:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e68cbeb53so6862985a.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068983; x=1783673783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=;
        b=HBpTAjfLeefh+wcNH+rPa50Jvdx1fGDnwHdZE9RN1PzPAuxsSpWTTt0s99SErQww7l
         mv+wKv4vdOWDabmin9Gjluj8DBK5NRNWYaji0nvHK0bbxg20381tq17h3V8IrP6TFkp0
         ep7lxKLjcPuYWmU6cZuCVnWZv3oNPVXeDh0ME1TxMr89zRXSZ1dQNri85PkIToaTJPtV
         gOJ9oQbigB00nSdUIioNL0yUC7lzzb1K6i0GMjUD1TFHNuFWjDtNMiaeq8ZElMQIg/oE
         750LBQn6HmNhcJqgPHsx9jw+9rzyphBjvrJkavuZYXavtdJ6yGFUFuIfby3GEoxQBCxa
         W8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068983; x=1783673783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=;
        b=Cd1AhNeCqshFN1Kkexs/ScjWEr175JJ7siyv1YETrpKd0qvTEYWP2I6wulDzEYmydw
         D/4OSHu6lwdGyMqeFksztnAqqXBrBGDQAmWVLSkw5NV/0e1bUGBoPmHY5jOJktDLYGgW
         uk2dr8wLOJwO6NXfl8e4nWV8v1kmYsMeTvan5K9fvvxI0loUoy9RNidXvlE8Pv4xYuR4
         +Yq5Ju12W/ozl921U/ofpm62wm4XYY7HVDkr2WEDZruONWiXRmgVmwcvUeI9yD+ziVgb
         TD3aLyyruLOJgXBnnRm5nMCN6fbHOiSFX4HFRqMGGXfK3x+oTi8C2+9381+aiS4FBcHY
         Ac/g==
X-Forwarded-Encrypted: i=1; AFNElJ/f6titi9bQfrsc26mef+lM6+khXbcbaAcx3KYjYNyF5PQjvPlLeIy2NWUGxTOc3NbYHmmEOdqptXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzufTLk3sNQBfEW0RU0aEe1Avy11miMhLGvjgOSb8M1FOhP/SL1
	X2iY9kKNaL4nuUd4Mhr9zlPmMU6kjNM4iyFYIPyXq1ZQbGesQc/ARQ5jN/vkUJkC/S4AP5MN/sc
	TAHpiG4FYsUmBGXG+wqYr7l74M23AmySWQxCfl6vLW97G3ophK/G3JWMhYV11J74=
X-Gm-Gg: AfdE7cnVPKdCWnbq4wbtoYdbNdV4JRtsVG8effRJdrYe+ZucNKvauWz+TE3MejsPIRW
	1Lj3pISteo6idwCoiVBTGv1BNRjSVwHkWy/hWHN4eiN3aQQ2PSKkYCsI+qrW1hzuYjOdQ3Ncu1i
	eNDCoc+gcSGUM1q8wHC9Ng5ap+33iGt6T4sf9sDntobJ/NV+XTlDDoUp69U407jPlKGIKsXXOg1
	+3QekqhCBydAHmk+H+j/76Y7yVI38dIh7clXKC7CL94wLI8ywkbP4kvGiXhWWbXTyKjxmnSYMru
	jbmrPLbtPUZZOD0t8waTOf7i76tQni9l1cU9qrmdxVFBOLY5EvBFbQSOWwGE6uDmBCNM9VeGbLk
	3f8dwipUhNtQ0D0Y5QxIm2+gfszgbrLZ4h4U=
X-Received: by 2002:a05:620a:19a3:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e7809ef8cmr769285685a.0.1783068982941;
        Fri, 03 Jul 2026 01:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e7809ef8cmr769284085a.0.1783068982565;
        Fri, 03 Jul 2026 01:56:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629082dsm254187266b.29.2026.07.03.01.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:56:21 -0700 (PDT)
Message-ID: <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:56:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VIMwVgmh8fZMLOk_9aI86w5_aHu4CeFH
X-Proofpoint-ORIG-GUID: VIMwVgmh8fZMLOk_9aI86w5_aHu4CeFH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfXwUKlN61XwsxK
 dmNgULNABYR+mVhh45IAe1rtyk1No8Oea1AS7qJAZGpkNG3dYECTCwjL7bRM/vZ2tfeeT4FwJ/L
 CfbSHktxF/R1dXOnDn3NnsnhCA+r2lk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfXzpTsNJmfCr/j
 TddqZvpzbYJazHsB/HGQ+JiHKe2GLzuwLW7EN2NRRRpYLoXXTWl5PgDnHdwGUPwlSxY+JhJGPA4
 lcsHv4EQSEquG34XQ05U50K2EovI2zaQNenSCaMQn3hL4B5+ly8M079LFqSETf2x3ojU79rS4tv
 Lc4dpJWYDtjua+ttAI9FcMRvZ9PQ9rhoPbBSlbHKPnj1e4VYWaXuLwmPBD03IyzGyxICnSvSgrX
 Ca1TB4usqvu94RudnUXW4TDFvSD+6r8LIHrUK01873pOQqTOLVMqDqM6e7ifFyDLW0erIWfGzii
 kXZrOZSm6Zunpm6Fjiskm0OlxEAqYTxJHTfEp32EUfSDX1wB9pVhiB0CoEMwkGhzVrGKOy7DFtW
 zY4O2pT3k3SjNYbWBKIHDlOawzLVrrXTgXjuR8xnlBYUVhrf032MNP9c60ZBJUV/ohsnp7k01tk
 aZPZigr9gqRY1wrk9DA==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a477937 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=q0dMSk5aKnwmW5Wxa0IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030084

On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
> 
> You miss SoC specific compatibles in the patch. Binding describes ONLY
> SC7280 but you claim here it depends on SoC (not sure what is a
> "configuration" of a SoC).

The hardware configuration - some (older) SoCs don't support muxing
to another port. The binding only says 7280 today, but after some
version of this series lands, we'll wire it up on basically
everything that came out in the past 10 years

Konrad
