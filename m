Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B931E846
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 01:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905348; cv=none; b=EGH98h1uJN7vA3Rp2Tjc3kKpw0nI/Oj9vqAhEcZhLiNft8uJANU2qyLp9fdtTSTEoRfWlsJgYbldL9yjkqr+dwNLUru0CZJoMibfreCuMg0nQ1FQV+M29FGideXLUPNtwPYxZfpTiQw6IUan4RFCFMrAcOyid9/qgVkGHdRTmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905348; c=relaxed/simple;
	bh=MzsXzPrrydw7IiQe5C8qjcV1u07Y4mvpDYA/CRyG4dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqqNthg8a4wYYjvnJlkxOgQnJzYzqHXxjFCyAGTP+Hf+h8n96eArKH0u+KfWn0O+xLetIn1/DwRKj4Bmh5krruqm/XQWgIJud28+cKD4vtY/7xA8rIjJZW6bZsLaSXOYsWp36nHlWjL/Vwbgcx8IXSyFN3vzngveNLwqNObRII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCcE8od0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaXh+inj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCcE8od0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaXh+inj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NFWiC736135
	for <linux-usb@vger.kernel.org>; Fri, 2 Oct 2026 01:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6/g5Dig/y4D43heLCRml/blZ0GrVffiENFzzkVKcb4=; b=KCcE8od0Q/3msmw9
	89nZnhog2TSzrWXXrVxKWRNYWH9sJip/q9/pGwPnH1umWSm9ySijb0XoQ9FkXt4q
	euL1QChifKddQ6I3+uqBTAEQQMVtukkB+uHWCOWzdCRtjfGYRDYxCoS0vJ3eUpBd
	uMmjGnxJ6x+NF4Ou5gXRegwqwgRV70IiV/WX/W5/KRR9fN/m5YjWQovOtb53EFZc
	4sWxXKpLbw6ubjf9adGwT5YPA5tS5G3gJSEUIu/fVud0DTxvd3cWv3suS/Co3/Uk
	XYVeWyG2OW4Yqjz2V7P5G8hEAm753+2l885gQpWjYmfB50WveAw+bkn2cp/eDrR9
	KQHm1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkmjqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 01:42:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d84114044so6805655eec.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 18:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790905346; x=1791510146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6/g5Dig/y4D43heLCRml/blZ0GrVffiENFzzkVKcb4=;
        b=YaXh+inj0zGd4uRY2+GElQnViK+gwm4Mg7jo8tzJGmleltuKRDhlPHutYpfuGUOoN7
         KC0xvQ0KALWr8wQGuZ5pohn61jQldkdCa/MzfuHx2o7fpYc7htm0uXmxORq8jcf2n/ST
         U4iX1I3D9W9GtwnGa3HgWhHghhDWlNR8s6E1URTSHNDdG+OG33c0ZtFpcMrhgaZMTvTC
         c58uTRjEbcCMpYMyUbI8yC+iy6B+ngGiV4u6dfqhyegfTh7IEtenfX1pe1yxzdjkoqes
         1jVTK0amHhs3XyO8QYGqStrcTHrsJaAH6k4ntsE9j6Y0cp5uP0NBtsYVBMMVJq2V26xs
         kB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790905346; x=1791510146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6/g5Dig/y4D43heLCRml/blZ0GrVffiENFzzkVKcb4=;
        b=e58mnTMpSguiHRW96pQGAe0AyT3T0inpyj/CBfk6j8kfWM/tY2uCh24qjRYNJ0ZpWh
         HtaEb5OCpmlSgVcpVCgk/EWoqO7FCDIqsCdGl2Sw8efaE/Gv2lCqoKCiW/Q55q5F1oTl
         6xhkcM024uT7dMQh9/aDnitTyYPDx00tUZWT8pnUJ01KbDN6GDX3WPvoKqKc7xjUlys5
         HSeDFMMkdBJJ1aU0fRIV+WmCqpWlOBBaWjtN9npDcsbvgCtPUxGxTvZ1GZD6osZ2jaTd
         PjfngXFmQrpmAVOT5Ue4hAhC/RJDIdV/HFhLt8Rjx2CwZU9nLI8pm/gsV+ne+/gNWodr
         y37g==
X-Gm-Message-State: AFuF++nLORbFag7gN97xk6OxmOTVx2lksS64758+Tzs+hcgAEZXw9HGG
	8gGuhSPclLS6/9UDRJB/xR6eS2J48hqmg2BgiEzpvmGfxJPdzO3a7B+JFAhbPiwI+r1cWyAXO5s
	XWi/KqZP/Ays6kVentMDntOOhVs4VvGuLjjQH9UFcxFmnQpnpgkEEP9j9b7QoxtY=
X-Gm-Gg: AYBFou3Y/0JgdvZNRNRBrVTPixfvHDEDqO509LSzePvU4FmAE1j7oScw4PuOilJR95h
	al9AXVDcvznVpcBK7RpLuUMPfxkls3LjUR810NI7Tcactd9W1AcYf+HoZDiD7K1pnv3VkC9oWMt
	nkNXeZN+IwkRsn6V5Y1d3WgHNEdK5Dwv9Yi1H5S58ydFT+Zsc6jgpaCg+dheTuLhZudQUl3hHmE
	ijcTYKrov3bBhC1cqJ8jgLE744nV8hMXeWwFHnoot1+D1CBaCQYFZzOKQwQG75+tO2WEIe9AlJQ
	qgAPr+bQFubVnwb+cuHQ6895vWuMv1+7lW8PZ7LwR2E2wSFE7jPra/sPJqABZwS/Le2E3xy5j7W
	kgJw4HROdwlsdrY6peMQhr6JK+E9pokF6Pjs816dniVIDUg==
X-Received: by 2002:a05:7301:4203:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-34f2199dee9mr1149810eec.40.1790905343983;
        Thu, 01 Oct 2026 18:42:23 -0700 (PDT)
X-Received: by 2002:a05:7301:4203:b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-34f2199dee9mr1149627eec.40.1790905338652;
        Thu, 01 Oct 2026 18:42:18 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdfc58sm1759567eec.24.2026.10.01.18.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:42:18 -0700 (PDT)
Message-ID: <b61c4087-3ccd-409e-8b3d-df75795b014d@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:42:17 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <d7ce8b23-64c0-43dd-a8c8-268224b9462c@oss.qualcomm.com>
 <92d80a55-4422-4659-8f2d-e28693d6d9d7@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <92d80a55-4422-4659-8f2d-e28693d6d9d7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfX7aHcIjaXSi4P
 asg8ETIroNo3nFSB6kokfuF8m2pyu7JLQdgIK2nsA3p1+g3CN+pfwrZBJRUteLG2U9L7f1dvJ9M
 yRQRQ72TDXFLabDaC4VdJalD39T9EBE=
X-Proofpoint-ORIG-GUID: VHRgofiLNPqvaSPLQosTxVlWsv5OSg57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfX0p21Ul4VZicY
 eChPUfEN2CQYrmaQB9XKBTDk0vHoyGCnPTWSL6fLbT2XFEKo0K1FAHZRdW2i92uC0ude+zTlFl1
 ZDCyAokWJa1L5H5pLl+N3xNF8rdjKA06GqMxLWWoGxXG7nLHvZsVWQMoedIErhpgGUbxBASj7H7
 SIf/QPC/xDk2fee84kB7fQLWq7pnilCQanv0NDdwCDPOUOI2fw0kcpXWuYdEplM/NKnDdMS6EC3
 96AUq7FizMVfEZeBwinT968jxOG5AF2wohkYQUbWGnF6iHRCRAQ4G/7z+Fw+4pQCVqKdDzn1cUA
 SvRFIjh6Ol+4vKAnBSkXUJ21CuWWxvqDNfplTGh2iQd/7JxNA3933QbKyLl65KxsYAii9+jok6t
 /pLfQXAT6UH+kZkIJHl/7G1dPFav/N1WsXLqHg762vWW3fuYi6nIRn6tkXyubY5jtuIaG05nHsx
 bBnGk1K3sneM5JOWJKg==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abf0c02 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=QyXUC8HyAAAA:8 a=IW5fbvKdXzPv_-dW0WQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: VHRgofiLNPqvaSPLQosTxVlWsv5OSg57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020006



On 10/1/2026 3:33 PM, Mathias Nyman wrote:
> On 10/1/26 01:23, Wesley Cheng wrote:
>>
>> Hi Mathias,
>>
>> Just checking to see if there was anything that we needed to account for 
>> in this series?  I think there was the discussion that came up here:
>> https://lore.kernel.org/all/ 
>> TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/
> 
> Patch v4 1/5: Looks good, is useful even as a standalone patch. Can be 
> taken immediately.
> Patch v4 2/5: Looks good, not useful as standalone patch, can be taken with 
> rest of series.
> Patch v4 3/5: I need to revisit this and look at new dma pool lifetime vs 
> xHC accessing those DMA addresses.
> PAtch v4 Rest:  ALSA, no opinion.
> 

Great, thanks for the inputs.

>>
>> But, I think your suggestion about adding the sideband check in the 
>> xhci_setup_device() would mitigate that problem.  Esp, if we don't want 
>> xHCI core to really know about sideband ops.
> 
> That would be the bandaid in:
> https://lore.kernel.org/all/c6c9890f-46d8-42f1- 
> a7e7-8a5d551fa22c@linux.intel.com/
> 
> I can turn that into a proper patch.
> Lianqin also gave some preliminary positive feedback, but I'm not sure if 
> the code was
> ever properly tested.
> 

I can chime in a bit here.  I did work with Lianqin offline, and I was able 
to reproduce the problem (w/ this series included in the codebase), and 
your suggestion did work.  I provided some feedback to them, so hopefully 
they can convey that on the other thread.

Thanks
Wesley Cheng

