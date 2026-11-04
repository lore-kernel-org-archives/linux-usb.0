Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801476;
	b=Jz1mbw1yE4qjgRum2M64AYjISwvpBKCMrZ1CSzWeFPFFR2XuG/gpt8vsXhJuYV4T0CsT
	 i7pNvCBlylTNqpynSS9iFS+aEeqo5H77bNivSZNjR8kKkxJwVQnf5pBR/DBRtkycZlaI3
	 vxLxrWSrbIspc6NKG867Z96UJWrW38gNKXn3eW/1pHumv1+lnFjLhCms4ECPzJJLLPFjy
	 xj0haU2rLyF87e/1jdMF8VtPE2j4pN/kC9Bjw1LMhSfEWvcE0QbR0mszhlEWhCfpmsDHB
	 ImYeL2uulLjQSw2jIm5Oi6ok0r6v4vopc5pZ08bxAcUEiJFS6Z4MvMf0oeAjgJik3fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=;
	b=RvC596Ar9kd9eFKqh0CR0qLYiZRCtdoLuG7T6rYXNWP8HFQeHYmZcYQo5ptCrDhRmnDm
	 7ZVtqIpCmf5MWmdrcJ5YzCTFihIP39FSy3uC8FUVHMfzfHyYoJgLJFNiCqYh/noGmcjfm
	 OLthVAI867gn6MpVHl7rwuBxumTeOTDvmt/s1Iz7qy6DpTFpa8W4f5xAnFVU0y+V1GHxc
	 IPBnjzPwF1QFKjaDRE6f5cOznVjQ9InOFQbTtmjj1wJaWk/OX3wLMg5wunrX5slcjV+5i
	 cBR9Bld4Fs7rmr6DTguqaf63NuH2G0VkqedD1m++SPZFtN4gdsYmdod5BJYReT+bK9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb1F15OH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kLJpyCFb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874C606D808
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 14:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7874C606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb1F15OH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kLJpyCFb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsHk2284167
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 14:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=; b=fb1F15OHIyxjqnI2
	B1AVC2UzHx49xheCQUsJRjmGX0wCu0DPOG8GDvB/B6ydN+7s0zae9V6p7WgQBGqI
	SxGsSXZk55rwdjnBvb2epitvOKEGtqAbWytXFne2Dn4OMxyjp0CiB6S5SByuI68u
	9wRBWvlC/HGhd4HVb/Avs/RCVW09wvRXOSUrxjZnKH3YZkem5hwBYbwQmxdHnszJ
	OxSjp8DewqEDBScTMQ7mcZOMWbOswTrGio3QrUXHOOUNqp7m1yge7xCF+gFc9ajt
	pc2y6yZQAQ1j51Ny1DS8MI/r/r8dBwGsQcbTtHkW0xKaZ2YHU7CXzEdzv+DodCaX
	hZVIMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s14w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 14:11:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so9367395ad.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 06:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801473; x=1794406273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=;
        b=kLJpyCFbkNNMBdl/XJl+qxbjwCEesgtdAyEOr9F7oE4LpE9WeRi7jLqoif+C9ZjFIn
         Q7Zi4wZxt4FGwjUuKc8Ii0ItsYERHLAsIQ27fXm8Jw6/ZC8+skxvFRGNS3c7fxJrvop3
         Gehy7zuc5cjR0qmc8jUxMaGdGuThtaw4UqA57DbLhqv8xcK6qb/BFKyauhvxBRKGIZk3
         MZn64Y4Rf/8/zyblMa+CwX+pkw6KMeIGnm4+vQwtXBqKHVODvN3bUSXz+I0OA/9lNmJD
         pJyaNy1sqidMSVNXLpTB5FAUXfrnmm8W53/UcSU62M+94PO/VBB+JulDjFYOEMa5Ksnt
         PClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801473; x=1794406273;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uF5ryn8Iftp4OJ1P9rbWQ0MW+5o+I98321Jd9dFZUmo=;
        b=DhZlqSHb8Yqy+hycgY0D3Yq4U526mpznzpqOjtsrk3XQ2Ii+RRLOLgJkSdjj9GXZ9h
         gX/YGOo73lBPvFk4IfdRk8k6o/2xCM2z2olYp1Jv80GQis7cM9t/LvtB2m4eh2Ow4rNa
         GCnNe0cnMzAIas+89BVM+/gU85STMnd1QV9WaVI+17qK6cV5OLlVsbBs+hnBBdUqiNXR
         Pj6QcsBTKbm27BM1yk57tlTaD8eZ7NUh8B4m2f6HnLBWREJ1GZwPZyc3oiDmg4jqPfzZ
         gFEhxr1skc11wmKCDpDljw5x1E/ibqyuo6ZEO3MVW7xZHc/ZO5wsjT2tIgk33Ku8wPbL
         bwnA==
X-Gm-Message-State: APuU4Z+Fqhnx5rrpqeBKDmEcMaDrMqjEsRRjEA6meVJtOR2jfYnVO/uN
	nAT6288IQmWmuIzKndatuHbKL8pHVwjq2Cg5Ju4ApOllkMnm3S4DgtpoUtVM7LfbgL3d67/RyUP
	DdrIFNPSlE2sIa7raW6xsumhFz2XL5o95JnGolHp1isydNMedf6DdXDgD1O6PIYU=
X-Gm-Gg: AYBFou1hp+7XKIi04qzffmh+obEdGOA6CG5n1QaRT3bDwcWr348oTdHQMG2S/hfDVuM
	29acHKiMZXLaTFFEzis8Ssru9lXmD9a84uVmC4So+5VUCg6uq1zE2A3mv+eiTaDI5/eWrmkiMRW
	+4yb7MSk3rIsA8o6I12U8pocN4Q6ZyqBNsH4lr7NtVBIoTuyFe0DDcyYXUvB1LYt2PPw2ndtxmv
	f2aQS73U7do5ABVx8tbuaE2zFAqCPqBANnvSh2o4NwTbT+2c/a9XYvyVNzatqL4n22+9axDQcBX
	Rifa2m2pYoMDU7tAyJ3EnSp5c1l9dDbsW+gtvIbVeg20kzd6TWcd7kHG2itiZ0WDqrpO1GYTYBz
	+Ie/KNjybpp6tFPVHoDhh21bI2Vrnu8QJ14geYu4mA526uEvKGvudXK6/4JYNR2Z5tqOS1gOFuH
	7jG8A6ZWmElRuFnE7QrpjqMNtmQO3XAB3YvsCYQsc=
X-Received: by 2002:a17:902:e5d2:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2eb364bcec2mr173883055ad.31.1793801472968;
        Wed, 04 Nov 2026 06:11:12 -0800 (PST)
X-Received: by 2002:a17:902:e5d2:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2eb364bcec2mr173882865ad.31.1793801472460;
        Wed, 04 Nov 2026 06:11:12 -0800 (PST)
Received: from [192.168.1.2] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe4fc8sm8301675ad.16.2026.11.04.06.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:11:11 -0800 (PST)
Message-ID: <52f002c4-9462-479a-b915-149373d6ac46@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:41:08 +0530
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
 <atAuSs9VTveGwzpy@vbox>
 <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
 <atgaF8VoapljDa2f@vbox>
 <138abb5c-b1cb-44e5-a103-dccb022f3102@oss.qualcomm.com>
 <auksxKbHVZzUd4G5@vbox>
Content-Language: en-US
In-Reply-To: <auksxKbHVZzUd4G5@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3d02 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3YhyyRXw4QUH7AxPMAEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: OyqVkGqjWLoyngaljOQVdl8LqcXznjeU
X-Proofpoint-GUID: OyqVkGqjWLoyngaljOQVdl8LqcXznjeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX4JhVAgPzJ7FS
 aSKnkpjo2MawY7OLDvhde+d2f+QNctuYrpth2cWaGZJUvUZ/KtvQzwSbxC4sjD5xNR72bTaCWEf
 ViwoJoSV1aXHfarMk/y0K7PvxLFEznR1yZUi+52Onvn5GvsOwE0C5JhDKvhvlAchN+XC+HJ627j
 2T4yX46oelcDeSjObmKtWM3erHp3U5yDArzR4UI6C3qSKxHD9soJezW+YxhwbVqPJbVw0jczEod
 AI59o2vrHswzADwpLe7nOcOfPK/ymE4i/5b4lOdXXNzigmwGtfMBKs7LZAXRZJq3EopXI7lC2TU
 sz1sNpHJhXQm4ycxelRkrea3zwcZzmSylIELrMYoFLQAUHZjUwXTRyX8H+AArtgTbu3l/fIP/hB
 NCe5zriHdr3LDVo++aB2s6gqZ13dUFfbqq2eZ+CEPVfZLrSU6vDK1RrDpSNmXl2s+QWFbhvR597
 kEtjw1ySLnH5RwFyIgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX3AKViIgt9oE1
 t44EJGGSRnaO31auttPIjVg59ZromQPkSTnpHk0HKnbeUGoanHg2uKumI57JEB8EoNRMo8kES7D
 EiEp1XjZq6pM2RSE9UJtdbpHgYmB828=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040056



On 11/3/2026 8:41 AM, Thinh Nguyen wrote:
> Hi,
> 
> Sorry for the delay, I was out of office.
> 
> On Wed, Oct 28, 2026, Krishna Kurapati wrote:
>>
>> On 10/21/2026 7:31 AM, Thinh Nguyen wrote:
>>>
>>> I'd rather not take this without testing. The check adds a register read
>>> to every endpoint command and implies that CSR timeout is expected
>>> during command sending, which it shouldn't be. Without confirmation that
>>> it catches the issue and that recovery works, that cost is not
>>> justified.
>>>
>>
>> I won't be able to test this in my environment. The only PIPO test that
>> easily reproduced it easily was with one faulty cable from (IIRC Xiaomi) and
>> CDP port of AMD based Lenovo laptop (there was a particular variant, I will
>> find out). I don't have that faulty cable for now, but this issue was
>> reported even on Kaanapali as well on 6.12 Kernel (mobile build). Not sure
>> if I can provide this series along with err_recovery_work to OEM and get the
>> results since this is reproducible with very difficulty on their end too.
>>
>> How about we add the Depcmd check and then the GSTS check inside it ? To
>> avoid checking GSTS always.
> 
> Your report shows ENDXFER timing out with CMDACT still set, so the
> DEPCMD read back may not show a mismatch, and GSTS would never be
> checked. To avoid reading GSTS on every command, we could check it
> only when the command times out instead.
> 
> I'm fine with this approach. Since it's hard to reproduce, please note
> in the commit message that it's untested against the failure, and add
> a dev_err when it triggers so we can confirm it when it does happen.
> 
>>
>>> Also, looking at the original report again, the stuck state could start
>>> without an endpoint command being issued. Unplugging the cable then gave
>>> no disconnect event, which blocked suspend. A check only in
>>> dwc3_send_gadget_ep_cmd() wouldn't catch that.
>>>
>>
>> Currently on downstream, the way we work is that if we unplug the cable we
>> expect the controller enter runtime suspend. If that doesn't happen and the
>> controller is stuck, we do a "usb_gadget_disconnect(dwc->gadget)" and then
>> upon re-connect we do a "usb_gadget_connect(dwc->gadget)". So, if upon any
>> plug-in, if enumeration fails and if we encounter this scenario, we are not
>> handling this until plug out is done.
>>
> 
> How do you detect that it's stuck? Soft-connect already does a core soft
> reset, so you could call usb_gadget_connect() right away instead of
> waiting for re-connect.
> 
> Would be great if you have logs showing a consistent symptom (GSTS,
> DSTS, DEPCMD read back) that we can check for.

Will dig up my mails. I remember having logged the registers when 
discussing this issue with synopsys.

Regards,
Krishna,

> 
> BR,
> Thinh

