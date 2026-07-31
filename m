Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB781A682A
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495713; cv=none; b=gPlU4dh+hrsIu/B61jVURpz8sqOm3fzaMYea5VcTIv05VwTITtJNMvjrhYzjnNpxEfHz4IaWowlkLisW4PabuCWV7xL6mQfZRO6dponp7kcR7qsDHdH69Btgp0af+uYiPHJNVgb09aINuQIUWylkRgWEdy56AatChQnW93Bsxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495713; c=relaxed/simple;
	bh=lmIlcCPPjfy2tKJPCB5IOMJRdhikECabt3KeCbjuI/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjQjzLRZGriEPgxcO9keFD2ZtkFbd9g8Cj3nbkrv/CbFxsCI/3tC+GgWb5FofC1x6RAC/Qnp7zX95zikZmWSaDywB41ruY/VQOUAQU2sIcUHkEMZ05aq+fzttfKIxEoFKVWgjcyAGs6gjPK863pTA9y9+s9kI5BcTxcX0I7e4iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCjgIpdZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCVnF4iv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCjgIpdZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCVnF4iv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAndSB3263459
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 11:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3e/L0q20ll9U/xUZgEVMkmMsHsy5Op3pRyml4PevRM=; b=lCjgIpdZcmcNs1At
	x/QtXAQXR6yzNjOyJomb2I278fGaQwH3bzcBlaBRTfNdaF/7ZwbEZBDZGhjDBLWZ
	qovyqMwZxZNo5RysjYqeldd0LedeeQZjb4WHbxBFzmCDz7thhKsGeFivfFcKIWnH
	GxWhTdtpRGrdJoYiC89q+PXV32Fl1kGu6vQtl2Bi9q6hafWkV0rBJWJmPBcU0ovx
	sokW7u6kQ5+7nkYWaV8MUGyNbu0zWcx91It9yFHVAhySG9N8kthT7jDNBWCL7fms
	LLJgOZ5uXVmUFqWdL02Iepk2q87TyVw0KXH6gFgwP+yzJgRyJBDz6LLaTJXJZVfM
	aNVETA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frt9xr1dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 11:01:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-74dd1e86d1fso24487137.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785495710; x=1786100510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3e/L0q20ll9U/xUZgEVMkmMsHsy5Op3pRyml4PevRM=;
        b=kCVnF4ivgp6TxPhzA4H+UIgRbR6hAU4xtv1Ud/UhfRIlIf4NP88zbbBjWvOZ9KKclX
         D1gxlDCp76Sk7+G5oZ2gJj63lnaHraTrEbjHHeXXxxuLsslXPmbAXy08+ULurM0aJzXX
         RvFEKKlYYx5TBnUteczZn88mD6c9VdQMio6VUGNkpEntxlIeEuJ97wiwzbArUSCvWwmK
         gWEt8R0n6zaGhK5+dqidJ818grHgB+mGijwVi6M/h7WWVzmFYP4BXr/j2MXrC3ofOyX5
         kbx6ekQAOWaqtrGQk41pFKCvWdYRYK+lm+6nvmFeSdFzodjYDH62uOOhNw30UFk+M5+a
         ImUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785495710; x=1786100510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3e/L0q20ll9U/xUZgEVMkmMsHsy5Op3pRyml4PevRM=;
        b=TwTX/X7mjpYJSvE2XxpomsFSlvNn3sQ7Z6uUT+ikU+VrsGijehsvcW+/q8ozG5JfEH
         d0Ct4dcSGGGEByqP92vHS/v4F4VPwmfgNy8T/uULvWu3GrUuEarZ07sI+LgdfiBSb7jN
         PceQ1V0dNqtpgQmByLobCprngCphWcJkOTSYKkSnVEOaJbClU7ZlHdWQCcXJ1FbVz7Sl
         hOa7UHh4uHCpot9D8wWQ7nsTPVCHycnMQPZuiufuFa0naKyvoNr8J3NYObLvd/acqDj/
         UEBm4o6N48dxj0I+i0jpeRpZcVKSMF6DF5eQI9+TrZghtLLO9tsD/+dleXg3jw6taSaJ
         +Nzw==
X-Gm-Message-State: AOJu0YzJ9j+J/mwxUGO27mxgHqQiDldhF8uPh3VShpRZ12p0Sl+LxXVE
	fwnVV3ckcaa/SwI8KrWOvSEZ4zPSgcjIj+sX1XCKMQDJ9lB18y9N8+Xw4PNAOD5l7NK2IgXuQeC
	hDOwx4pUfPjD7ute3XE0qthnR4HUgQNte9D8TXM6p1R9bMcpFyot/3drh291maAc=
X-Gm-Gg: AR+sD11sp3/gUFfL4RlxLxDRJSGhhVvwynnDOUJJfEyb8Dfb1ANW1wdTY7Q1jpyzso0
	Th1hArFhU/Thzoq7HTlKvuvBIXzcX+9fsoMkb7mSASCJtEMve01HiroCyByAaWLpbe/Y7fKaS+L
	ggkDyk7GiFXEOC6O4au64ewwrHnU/udyBr6ajn6uw3swcFqgGXbgNeBppwF9SGFRpjU2Cee3bIH
	qfN6kDp9SZ5EXuBsCqsDLqxEThtP5apOUEdotbBjaT6rxKW4GqzYwp94Ntz50o2qlBIjZQrD2Qe
	PwgTLD2XYNIUDjXK2SDW1V8N8XrNKNGkYnUqqBl+lFuK4qi8n0Mdz9tgDBWZdn4A0FJhnpECq4/
	EC4xZq4On3d1Vl78OeEPhh7N+
X-Received: by 2002:a05:6102:b0f:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-758f91821bamr297296137.1.1785495709744;
        Fri, 31 Jul 2026 04:01:49 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-758f91821bamr297235137.1.1785495709311;
        Fri, 31 Jul 2026 04:01:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b387sm111840566b.2.2026.07.31.04.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:01:47 -0700 (PDT)
Message-ID: <51346b78-3fd8-4426-a7ce-fb46052c591a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:01:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
 <7f0618ed-d2da-42a1-a605-0660439255d7@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f0618ed-d2da-42a1-a605-0660439255d7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4MyBTYWx0ZWRfX9fufjFe/Gbg2
 MO7E4V4yTnckptbsQvolw/otBE7CkPn1bIVlrGkErwWn1bzbt/bVMM4s9J+wmnlJAeziHIWJ1fS
 IKH+veYmv/Dy03dM4hKfeu6vO2f3p/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4MyBTYWx0ZWRfX2sV8uxweKGZE
 VMqNpjt+NUSh3ZbD/a/XYu6gjwNxPGIy3xwknqNAZlLGWbFWaulLF8XTRSJPYa8uk8BCoPavcXj
 JAtLN6BuOtGLTpdE69yPbcyjimjr7pW/nwLgmAzZkrIraVqnoR2Io5mvfDszO43oZnL0J2M8WTX
 aET22/QfHsZcNkXBtB48rTycUX5xU7KjjJ6dSs1G/2YDPvSl48pTRQaWKNnEbNM/hmYlO8i75A/
 GXb79OeXkdo78r+EDco7NUuDag5qCFXt3p8rGoq+PLKE9WKXEVgCaYYCFRObzJBEWnHU/dRVrJY
 7zYbbit9wgmC+Vk6QeL8KpYA1XMl5x2NPXkKfGhAOg324v5yZ+WcP17Fisjm8/gHcels1uobcDC
 w9VIxZrS3VLdUULMYwrWlRu3Bs6OBY1omVOCvyJSNb66jmWRJEjOjHhwPosLM+z0iDTF1AGG/fU
 wXmWCDDwTIDh93wxuOA==
X-Proofpoint-GUID: hyuU-17uC0RZCg4KEaHQ6r-uwVF-HbuY
X-Authority-Analysis: v=2.4 cv=Q8/iJY2a c=1 sm=1 tr=0 ts=6a6c809f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T39ctT4NTyHGGofNco4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: hyuU-17uC0RZCg4KEaHQ6r-uwVF-HbuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310083

On 7/31/26 12:51 PM, Mathias Nyman wrote:
> On 7/15/26 15:29, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Currently, the only way for the USB core to determine whether the link
>> is native or tunneled is via an Intel vendor-specific Extended
>> Capability.

[...]

>>   -    /* Don't try and probe this capability for non-Intel hosts */
>> +    /* Prefer the XHCI v1.2 ext_cap if advertised */
>> +    offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
>> +    if (offset) {
>> +        if (!(readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED))
>> +            return USB_LINK_NATIVE;
>> +
> 
> The extcap 18 value won't change.
> We can read it once in xhci_gen_setup()/xhci_setup_port_arrays() and cache it.
> 
> here we would just check:
> 
> if  (xhci->portsc_tunnel_reporting) {
>     ..read portsc and return, as you do below

Got it

Konrad
