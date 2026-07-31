Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A244252D5
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495210; cv=none; b=YfBdK0Do9zhWxc3hjc/TcUnj8RL33U11Z6qTsh8jfCje3qP5po5JOWceyCIIAyPX5oxJSbO262gEt6q6SYRp3F2HGhZXSi2rI/MbraFh/mBmw6coiAKrPwLm/C4OtwqF3Rhd1koemYcZpTadVbrCURt8qj7RLC93wFWf/wVMSTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495210; c=relaxed/simple;
	bh=Y1EfwtiHUODx8PMUP+n5wH2+wc9O5+Vm9OiuvE6+yEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YG1NGs4HsVB3xMBwJadyP6P5Tk6Ch4DOjYDhDgweksL6z6sGQDUOBtlAjLK3byR9bwtMuucIB4ew/nVB98zQG5vCk+bgUrpKIXI3yrTppRs50Lw2Oeclm4gppfjVMzqF+MKp3dvC/HBmK9hX+dPeGadBasnLMAN65t0dC7Szzug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hScdfrmT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAWN6Zvi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hScdfrmT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAWN6Zvi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VApVUJ778780
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sW7EvOLBbmSFxEjiNbpRIF/D92msbj+jLsBeHsdaL34=; b=hScdfrmT6C0TWdmD
	pTW7JJV8J3boD/a4FvDYV8qmg/YmHTi4KeFw4I9XrXxtzak7bLiGTNSWVt5GXuiU
	oHajI6Oy1UwrCuK/pLHXleih9FzrUgaI5WjT8dPSifDj510k2DTZGI40vc9jeHPc
	wdxQ1SrIkvL9D1gXkjNWflbVWjaseSyTnDE/qYZSubKQgmfSHJmBai3jbRCJX95P
	rp6H7SwKmIdV2I3c2nW6HUpGXmBs2/WSgThaBIZHQ005nP+LcdKdF2XPJws4oyRs
	x0CZh68tZ6I/Zzy6uJdZEsg0/YZakxraLyTkXdyNGZDRObLcQMh3uEV+9bOyMTm0
	nLLrbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtau808y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:53:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso2517401cf.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785495200; x=1786100000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sW7EvOLBbmSFxEjiNbpRIF/D92msbj+jLsBeHsdaL34=;
        b=EAWN6Zvio6bOUNaaJvzOQbtXVwkgDPmpvJi1IqU+892SeD8pjjxRGfygi88muuzRNH
         ueKfGacbXfvMR47tqMKO653oHcGcsy+gMAYX6Cnwo9Y+0I65FWulPAoJbCa+EEyJQDFk
         9hRK32xQZYmZoGid1SlJWDN5643fMyBbdpY6/ca7kd3IqPCoRxRMezj8Wj3+i61W8vyZ
         xfEMn9oxWFL6elBsnWKeJ1nA68sfZwfNO8uk3UoEvuZ5BW9t4SOpFMVH0plpy2xoswPI
         XBaIxNEUJB9X82HuU98XEL4qlZkpQ/d2BJQPgXh2am9UvwR8QWcy6GRnfOYdJ4gyVYYe
         7HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785495200; x=1786100000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sW7EvOLBbmSFxEjiNbpRIF/D92msbj+jLsBeHsdaL34=;
        b=X1sQ5WJI6cuHa9E7e1DOlKPBJ1/hmae2S44wBDIB0N/8+n199uSsUlak+HRNlGgelr
         MbsyQd6F5mX5I+14AghDafJS2J2+qvPyGqGeCng/5W0a2W67l6ZYEAIsWQ61g92PyC9s
         JGhF2KGoo6Szz8KUPNV6/uCf9Aa6cX/UAiTgNb1U8GP/RPusrb+DSI3/WqYgC8Bc0uCe
         crUov7tH48qNrl3A14NkXoWWPxNfrlaIKkA+UdUBB1xbkwie1dI1b393K8Tn6FUeJgLa
         T4KYCn48ZjqLHCk5yDR28LcI0+Qr0rOc9+Tmwxd5JyepvCQQY+9dyv/dxkukjpx0UsiP
         vSQA==
X-Forwarded-Encrypted: i=1; AHgh+RotkB+6TBh8G8YwEUlbpKrn7L+dSVOsPdfE4IRpwpWEZZToedXSDyv8OmtzvL1HbCEYy5+fJpNKjd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyN4n3r6IVvcDziVQWb8imaww16coj123dTqFhwfScoCokuM3C
	xt0FvB4Tw/IQ4mBwccmoQhKHMIq210ujFzLCZDwBWnDhS6s1gvmJ1ucxokXSsqsUkOChEQbVDRO
	mherMKhuNdvwehieO8GOXKiv7Tj2B/00ug6oaNDyxlITzZFZTnTIWlLJtfsflD7E=
X-Gm-Gg: AR+sD11a0Dh2u5l/1yH82pGviKY/OkNlq/UaaCYk10X8niy000hLwCMzda7WNcgo/oW
	uHlW8DuYHnRIUlATlRA0obaKWehdNK7WTC5JHd2ZHy1U+YFfx3vQeJO4dQjwp6H2ACHtGws+VYu
	wCXbDbKs4P5VH2fWCLfDQJ4wkApRXyhExrsI+H46EY2g+/LO07oRmc4rV3nsIv7AN7ngye5H1uZ
	rMeel7Glpe/tQQ1DwQ/NHslwqhyRQlrTdKZX6ptsxReckqay63ZLOlsfz/twouYie3VhvVnhJS6
	zjwpUt688+SlkJZBylYkQ+43rzZLpxxSO4uNayhTzfvsNH6FpI03motmKYUWiOQc5eqnO+k5fWA
	OcvdSD1+whMxT64PZakUZ7PT8
X-Received: by 2002:a05:620a:27ce:b0:931:10e:befe with SMTP id af79cd13be357-934963bf7fbmr167093185a.0.1785495199683;
        Fri, 31 Jul 2026 03:53:19 -0700 (PDT)
X-Received: by 2002:a05:620a:27ce:b0:931:10e:befe with SMTP id af79cd13be357-934963bf7fbmr167090385a.0.1785495199175;
        Fri, 31 Jul 2026 03:53:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44542ddsm118014166b.29.2026.07.31.03.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 03:53:18 -0700 (PDT)
Message-ID: <75ea8be5-9426-4fed-a29e-654aac4f2617@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 12:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
 <amFCwDiD-StHHV9c@vbox>
 <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
 <30a8cabf-44db-4023-9b1e-58d7b261bb4e@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30a8cabf-44db-4023-9b1e-58d7b261bb4e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4MSBTYWx0ZWRfXw3OY8j+LlZto
 d3CP6kbmnPdBZXDP60ACC2Aeo8Ek/5SBFz+vJByrRIOn7rmerdg94fnxkN4kdg5qiQJBRYn+j0C
 j/Gs0lBa8rO0bk/+oqaZjHJxDDNYyyA=
X-Authority-Analysis: v=2.4 cv=ZIznX37b c=1 sm=1 tr=0 ts=6a6c7ea0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EiazGOhZt8YqlqeVitwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hYcVccnNLfeA40mFcQKRQKLd9ujJ8Lxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4MSBTYWx0ZWRfX2Gf/DFcRBrN4
 4hfjeqb3uR7BmEXs2L5e2oVbY5zPh7GOTMjG1Y38fqPFa7Zf7hkINZ32KE1jyYlizEw+kKMxEA6
 vg8rqaeggEGTf+lbDbxDyXnEkr+ShL64Ur3nWntQsVj63tpPp31Gd3kL9kcE2CLa7BKrrTV1pCs
 1DF2XoQqaug/oeIuDKbw571KBdQVakTOaMBJwVLrKchFkZJSKT7JO0IXWXMQwWn9i9zW/mV3D8F
 QrVlIjojgbcJvtnORFW5u3TGy7ImfmgXrooXh1i/N68vLcmi9wzraYz1N8ghmDQsxpo0X0WzWZg
 J7hYVwGTpHg88ciaisv22ZzoArWIbB3KlIb58gVyXTjBfIVtizihxNOnh16cnKBxjiC+NDTTmA9
 LQy81N/WMB69lass0dCqzIB1Rv+rfTKx/BtjqzhE0Vsxh0YGQz6HRs0PQ5ni9YKgFf2eCXEBnWF
 FtgviE0YO77z/ctAfmA==
X-Proofpoint-GUID: hYcVccnNLfeA40mFcQKRQKLd9ujJ8Lxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310081

On 7/31/26 12:34 PM, Mathias Nyman wrote:
> On 7/28/26 11:44, Konrad Dybcio wrote:
>> On 7/23/26 12:57 AM, Thinh Nguyen wrote:
>>> On Wed, Jul 15, 2026, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Currently, the only way for the USB core to determine whether the link
>>>> is native or tunneled is via an Intel vendor-specific Extended
>>>> Capability.
>>
>> [...]
>>
>>>> -    /* Don't try and probe this capability for non-Intel hosts */
>>>> +    /* Prefer the XHCI v1.2 ext_cap if advertised */
>>>> +    offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
>>>> +    if (offset) {
>>>> +        if (!(readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED))
>>>> +            return USB_LINK_NATIVE;
>>>
>>> Second, don't return early here. Check if XHCI_EXT_CAPS_USB3_TUNNELING
>>> present and supported:
>>
>> So if the extcap is supported and exposed, but it says "this port
>> is not tunneling-capable", can we not trust that data?
> 
> The extcap 18 bit only states if tunnel mode bit reporting in PORTSC is supported, not if
> port is tunnel capable.
> 
> Supporting tunneling and exposing extended capability ID 18, but not reporting tunneling in PORTSC
> register would be odd, but due to the phrasing it could be possible.

You're right.

Konrad
