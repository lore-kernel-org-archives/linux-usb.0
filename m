Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609AB440A26
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786394648; cv=none; b=I1G/LKvZCQwbDoOcTKnVE4m9Pg6+DNkC4dON/z3Utg53yY+OjEubosDFzH2yLlvfkVjCHQhHxtXBXfHvXZJEBagkpC0aFLYJNxJ72lS3fwq4XT//L5r0lI7O7pOdTKnn2Zlq6CF6CmNTysltiIIp3O243y2rmQEgkzjrOV3VWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786394648; c=relaxed/simple;
	bh=cXdfNpIDVoel22eqibDoZ5qO7LMHb651FstPcqPzEzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcTgxmtNTMr9J6RahR1Y0vuEG5Kn3hxYimDPjvUALUrew6Os79fUGNO6dih7z9RanMcmgHcsWl0aOX8aYlvE3lhRNHBojubVrZ7VSjhwOje2I3cy7rpY5HgltROqzwMOFIpSQc3l8fjwVuzDeevhxqRTJp/ibe1O+HC9I887EFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgZQWiCj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDm3WImu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgZQWiCj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDm3WImu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AJlm0L2316576
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WuAtyEdrJILuTbmDWLApc2Rm/QOnF7LFzl3PAVY8JA=; b=WgZQWiCj/QijstyB
	54hfE0gKGttzXWKLRODQjCHUbByD5YuU6X+jRhndq3Egk4QGr8RG+ujcbLO9mSyx
	2zQk0bKQgPflWhN+hNsf+ZWYqh7hn0kGpFhrkHlfAlVHCt3ksMpJvwYCHlrTRALI
	xcMmJFmlSqMaN5ApzCz30w6e4E1UnZlOJc+oEBUEEVBH+arnuPoH5/Oy+ikurxhu
	+9Mq2x2Cl0sixUtsujjsRfb7YyvjAFglVdBOlgeJekpaFW/ke9lwZvfb0evPdTqX
	BHh8rA5zJsOBNXDLvcRCyqJjQ3yFfGye/3DPmbbJAIbkAtM3V4xvlSbGKQmMbZgW
	fLbVjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk60xjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:44:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1731616a12.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786394645; x=1786999445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WuAtyEdrJILuTbmDWLApc2Rm/QOnF7LFzl3PAVY8JA=;
        b=GDm3WImuzX26xN+tJuoM1maDIIjB7asA3doTCb5mskGt3gUmhaYl41nNaHpnoQzVG0
         Mt/e0Xk4/tLf0el+wIp5jN6lT+dxobNTxSotuvB6WZpG6l6c2uRCPzQ4AqsSMxmEavwR
         XsefSvARedlTpLYv6gc6jXVExSGMMGMv/yVvWjiVWMLjiBq4xa1o+r8henfLykHCpow1
         H5SW8OAH1tH6sCU+b/oWcfWTCg+NU+ErjdXIyVrz6xLJxjN6J3lp9NGCgMqlEw6KXEGy
         Fyx56jnB/l0T8AXRaKA9goJJ3wFwpGOvugwADwxuN9Y48M0be7oYGeKIkfjqXS7Coo3G
         BFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786394645; x=1786999445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WuAtyEdrJILuTbmDWLApc2Rm/QOnF7LFzl3PAVY8JA=;
        b=jXdSJpVLHeRk9E8owkg8mY1oYuXu5PF4j0b07m3XWk+KdZfRPhx6kn8jk7aJNfLasO
         Ou7uE0LqkXVqAKD1xgjpMI26E/PpprlI0BUz36TOWXg+fmNT48DHJIIECt0f1p7J1148
         iU8uexqRPDmfSW6XHclr1c+ZnDuBMjcl/ANAWLnT1cfsuoEka/8RGmoV9Y/B0WTK+r1b
         e3PuF+u4adnNCIf80m5aNMlSfRjlgdBBNISYHMQNXyWGPgDQVCAIXcUWWX8hQLLVSfRE
         YuPYG72WoqOccLlaweqFHCpZu8WYrGBqzVjV07vB/DlA+aIi2UguH/x3nS2ftYTYhsB3
         XUXA==
X-Forwarded-Encrypted: i=1; AHgh+RoVwGJq2/RU4FInzaTBNdfsyD3nrBQIOA8a1zZPwa5zsajQssfXa/7Ougx1FuWzETitDbOQ5ijD39o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHsCKJbmOR8PzRxbnwM0lS0OusxJjZJh3cJtWdPBC4NjKp4Mj
	eCkoS/ZRU8nEC/NUo01VGZS5E6RGYJsu8BQ4RevkgkJKuiuqgMbweWgxwIaLN299mkQeapMfNHp
	4JcRRLyAfglSaKLxTM75IQylq06dTQYy6mMoErUgZYRrUTWwylsOmNGNoBgFMiUXyCLN5CAs=
X-Gm-Gg: AR+sD11IeDR5pPnPVc4zoOey1DX9/NoUdcg2djP2H4O5Rw9/e1U93slDcEBT5GgtaJT
	k2oO1j+Miof0h4QBiUOCqfRsY8JkWhHllwW7tISYfKCjGt+N4lHAGjhYRV3cnBYiSehOssDh58B
	l7QxE9A5mdV6YQUzRPwR2PFUc1s1OZI06A0JB1Qa3jX0jK78yo+iYewvi2qcfAzh+wIA3vrk3+9
	HqVEXh/cw1Mb59QZtLiVPjcE6xYIuPeJvsq+0IelvagMuDNcl1H0/CF1ZlJx2QW5yMF06d/Z6vv
	mVFoGCOvSWMvvGV4ho7HmHpTnkRx9QDSlMDQ8/33r6cmC2o7AtpuMU14x40mv7ZzOph8pNnxnI1
	xQiKP6Y118ln1nvsluA566zL86oweIw==
X-Received: by 2002:a05:6300:6cc8:10b0:3c8:e140:63c3 with SMTP id adf61e73a8af0-3cc1c904c60mr2971454637.37.1786394645121;
        Mon, 10 Aug 2026 13:44:05 -0700 (PDT)
X-Received: by 2002:a05:6300:6cc8:10b0:3c8:e140:63c3 with SMTP id adf61e73a8af0-3cc1c904c60mr2971428637.37.1786394644588;
        Mon, 10 Aug 2026 13:44:04 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a754dsm42720054eec.11.2026.08.10.13.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 13:44:04 -0700 (PDT)
Message-ID: <3ae42f16-ead2-4811-9b5e-da42bf81d477@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 13:44:02 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Add version check for setting ForceRM
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260806234035.1078704-1-elson.serrao@oss.qualcomm.com>
 <anUevdJ3ZNaYyB61@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <anUevdJ3ZNaYyB61@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7a3816 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=SZbTn5QKAPGrlT8I5W8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: AfrQ1RXU1l6J5QdRA5zQCF7cxFYl763O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NSBTYWx0ZWRfXz+wNRX5oM9JI
 N2mTdPq+B0PPVLS7J2bHiXLc0/8PuBh4hUQUok3voNqdZf8vP/Ql0FP+KCV1BzORpZOXLxpdYDh
 xbzXtNWKW+hfDpFs6tMSBS1a03VMDhA=
X-Proofpoint-GUID: AfrQ1RXU1l6J5QdRA5zQCF7cxFYl763O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NSBTYWx0ZWRfX5p2Eem6F1noB
 3R7rXjxOfDIDzZpvkU1sGEAMdwaVvP5lESld2zt0+LmDZY2bT8/wBUqZrsBzLWsRJqnAQlABRTu
 j6bQrResTaW+hE3d5/e+m8rV91KPFcnJZaQspkSNr1gHbOZsMz4DN2t3kGPQFE4eQx+vIHgQgZn
 8FPMBhmGDpG61NezeoTV9+j5cRDfXrKFhmAkYnZIs+cgDO+5IQhJXRS9hkNHNzUISdNN7AG/X5i
 N2p6zZKdAb1n6TZwSU2Q9JgXnjPK+KafQF89PdJo5P3HKIoOYMmtTng6h7KsMJja8VN0Aehrb6j
 WhUAqJlcMt9jGL1vJN54lxhwuygqHYwLSlQcgUk9CDjDXJG+ygePyvesxe6c4FZd7bpkJ6VQIZG
 qwnlca+zIfoBW8PomEh2Z2PxGu3KE0y+qK5M3cJHQb8Lx781f1Mh+47ZslHr0KwUvqwj28BNlgR
 1bUKbWLK7xPBd/S88jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100175



On 8/6/2026 5:19 PM, Thinh Nguyen wrote:
> On Thu, Aug 06, 2026, Elson Serrao wrote:
>> Hi Thinh,
>>  
>> We are observing an issue on DWC_usb31 v2.00a and v2.10a controllers where
>> a transfer aborted through the ep_dequeue() path continues to generate
>> writes even after EndTransfer has completed. In our testing, the issue was

[...]
>> Thanks,
>> Elson
>>
>> Elson Serrao (1):
>>   usb: dwc3: gadget: add version check for setting ForceRM
>>
>>  drivers/usb/dwc3/gadget.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> -- 
>> 2.34.1
>>
> 
> Hi Elson,
> 
> Thanks for the patch.
> 
> This new recommendation applies to all 3.2 controllers also.
> 
> I don't recall forceRM=0 causing any issue to previous versions.
> 
> I would suggest applying this change across all IPs and IP versions to
> keep consistent behavior when ending transfers since TRBs are updated on
> completion. Since older IP databooks recommended setting forceRM=1, can
> you also add a note in the code indicating newer programming guideline
> revisions now recommend forceRM=0?
> 

Hi Thinh,

Thanks for the clarification.

Since forceRM should now always be 0, and the reset value of forceRM is
already 0, the  function parameter force=false effectively becomes a
no-op. Would you recommend we drop the 'bool force' argument from stop
active transfers API entirely (documenting the forceRM behavior in a
comment)? 
Or would you prefer we keep the parameter and just have all callers pass
'false' , so the API/framework stays in place in case a future IP/version
needs it again?

Let me know which approach you'd prefer and I'll send an updated patch.

Thanks,
Elson

