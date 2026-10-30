Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356218;
	b=u01s68pwwi6cg+v6gYO5bPckpJekBYEUx7pNolAPsmOqRDLLj13v6kxz8R/mh0s859LE
	 GdAh4T04+RlUYlDd87rCsJj37Qqr0mkMZ5jbknTd7594Hxq53HxUqyKeP8sEW5hlzQBMq
	 /UHHmI3J1v/2D0s4j68F7h+jY8+36lGhVv89tL/ZrefK/Ds5E/+CjFcF+awrJi6p0RSGv
	 0acesc/1EEM7la9vRJPRd1xQNFvCd8Jm2yzWT+zrCmICWpxsBPuwCh9dL8oizIt8CmWLu
	 ASOo5HxaWDc+9chqEA2MFntiVDMD3W1bS0iZlvli4sHOnqrnINiaP9cZcgktA7CrdIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=;
	b=DvMWqUElyVZuHAGxVjxUdwK92sw0oSFgIxZEec9ZM39dhHZd1BbXJDRayvtJjdJtt6KL
	 VOTUQdfBZEg6kpvxQjmX6HHFNurvjOuPOd73iyr/WEsjRa+K0RoIy338NuGDNA1fZB7lW
	 09gkAVU71c69RGO+y7ZTfWAqMButGcrb7KZiZBly+YLh0yCpoojlZGMmx07iVQUhhOIPD
	 RYz8drxY5kiLZfTkpNwr8Qpmgnjb4oFrvY17s+ZXMmpfLpU++BbCx8oa0ARZdtnqOjt+k
	 om29BoOumOk3yZw6uJ5vWNPVWth67VoUGz2DkDTtAFWYH4OpROheHT5CJNtGdZrjkdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JR1lxbQX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZS2m73X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0C606A32D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 10:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF0C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JR1lxbQX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZS2m73X
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8ExxI1761704
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=; b=JR1lxbQXZXrnhbxU
	57vkHtScLHNNopXxhzAvMGgM5QxXtvHX7fJ9Auf/AacaJONPPOSqEb8yyZT8zJ7j
	EXVKr0dGrkAZORafrv6HgrOrK5kwGoIwVsNiicOwDTh0uFwb3HB2ZjX6Cju6HJQW
	kt0dsP0uFT0J2FiZkpQCFiuqrt8Qc36j3MNgDylc6nE/PTUeBTmA2BIRB809GnNr
	/d7LE3Osqra/kV9QYosO9r0cMDxXfvabWUU26H9zNHUvsQVk7VXnpQx7FoMo4aRV
	krcNuIBmvulD/EK5S7i/tluHBRTjDRVFqkcJDdV3KP+lLnADE0Ap6tU9zf1+Otjv
	t8Imug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6paews-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 10:30:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3698bd5392cso594290eec.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793356216; x=1793961016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=;
        b=cZS2m73X2feTYeI7MOVkBuI4231iS5SOSXgy29OMogDHxsN0q2HiNUrTwd6aM5Gf/z
         yeY+BKGCt1kUTekevTX/JX1uTEVchecFT6ePV24Ur7zBn3ME/2mKqgFzRLKUldz9TqtC
         9WJK55pqea64UtQOr+9AZqgopiHF7KpGRLMZHy8YQ1smzs9NkJ+ptqh01IbGnYeIDu3S
         XU0aExvT4eIt4hF51N8Pu9VLT35gbGo6uRNiEhJP39weLWT3l979xYmnErR9ddlDs/rB
         04J2YqnUbpp2JrBbeFu62krgKBJ/fd4ZrA/BujwLrbn2qW9lwKg0o99dEdC5t55WC4b9
         tR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356216; x=1793961016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njzAKX0F/LqqhP1SSU3nTD2Pw0gCqFUikzq6ZlOGbC0=;
        b=yODA1OXgK0vsaCWiAsJke57KC6UmpOke170u463DjI4O4EDllIx1ajOKAjcRzcqm/v
         SPldztV5cnOGxizHrDxNajnf/5Os9NYQnyOqLuiA1HZ4FkFUWKaC5075xfdVmFAlT8tC
         npWrbav8Xa8jML6l8fNgh81FhRk8KP72kLPob6uqoZacc0Wfp1Y/z62yq+nLTSC0m/On
         fAwKOpYwlCeLJoM1nncUyvdskUf9KR/CLPdWzHiZgL61n1QoDvo8UJE8d64/5U14NkTd
         zBk0txusiaArMeMnOn06r7/WYw5hsfGvw50QMuOZNtTUhoeX2hGXsyJGVu4OAqduEW/O
         Ouww==
X-Forwarded-Encrypted: i=1; AKwUvBzrVniV2BXDQXH6WwxOsD+tXfUvqZL74HMahWZbyj3Qj45lhTJgNR9miYKPY4DbVQ8MX1fLNRqx0T0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3bPo6+X+VcnR7dF8w6YNgwxb/DgG8tcLCaD0jGbiHPQmTtnyY
	J8bsDK9ffhvX0CKQJbQtvZszqOZ9sYN9j3DmM0V4ApsnNFoa+W8RnlqXAH4bi5PaM8NlF0+bXlV
	NQVzEoHCaaF6y2Kk8nBkHPEgQHJPTO8YELvIRangzQVjFel2VT3Na0wzQrhNihH+JUlFYkjA=
X-Gm-Gg: AYBFou2m14dzB3JCNadtEzMtX/eun42z08odLjlh5eXM+4Odb59QftZMbItNcNHvktT
	KV5SCQj8l1HZetDb8qkh+WZojV+aZsYB52r4W7mEWYQinRI3VGlifK5v0RguxOG5u0T4A4qgIwi
	ByERKo8Xhgs6rLv/vcGrGCPWKF1RQHs3qJOhyt0G+FZeFNjapxBCZbOA1pBSGltG/IvVxEyE29k
	ncUnikM9W6NqpYt3mZln1iz3oT9GY4OFgnXZF/K4g81ArhmW0rT8BXrvwN6jJyNNJSGpo1NkZqA
	3TYcbiLVZO/6tPlorNwQvzzs3qigsBmkhlGClBq2Fgw+Uc5DAY7NVfzekWH9WzTweSqhNR+A53A
	THD2gvO8MQaIIh/qgmW1eHYlRs51FozIOfueignwz3VQrcFWDfu72dRzYiwuiEXCXug65SdaO0d
	QgFzc=
X-Received: by 2002:a05:7301:4290:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36a4238989dmr2829525eec.7.1793356216382;
        Fri, 30 Oct 2026 03:30:16 -0700 (PDT)
X-Received: by 2002:a05:7301:4290:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36a4238989dmr2829475eec.7.1793356215621;
        Fri, 30 Oct 2026 03:30:15 -0700 (PDT)
Received: from [10.216.63.119] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm7700599eec.2.2026.10.30.03.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:30:15 -0700 (PDT)
Message-ID: <abb9b242-be39-4368-bfca-98a69dc795d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:00:10 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@ti.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>
 <2026102912-iguana-purposely-496d@gregkh>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <2026102912-iguana-purposely-496d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX0pOwHO8OBSMG
 p6HuNGg9HlHAeyfs0XhzMhABU7xEJ4fPFe3rw+VoaRjYKsZ2uj9trMqcs9lCmyDxz9pCdAPwYv+
 cTadIIi3BCnG3DunBz/X2+V8Y185hOcrV6pbyMZjT+M0++OKc1/4OzA35SI0PXkkJBHWHC55vD3
 0fN+7ejU09yQ/iXq8zSZLswoZU4aiWDnxoQF7B9UvYKP+kJhwDDBWp5AXvzo4t7FhKvdE4qjGcf
 +U+nlbLSM9Vo3GwqQoKJcgVvVXXojVKBuT9li58N8q+H/aYMbYV/uIEIgFlpsDU8PC8xnr/2yWB
 E19mTCKjawBWqj7/Fy+H8xfeOn1DpuC8tizQKxKDkTYttQ2BXkASQvd4qk5lfj460+4okz3vGxh
 2Bi8zfimCZFvz90Zq65583FIQJR3lOHlY6p3a3+Dvw1KoRG9gQw+ju0SiZTHDcAXC9wbQYGsS5p
 Rxieq6RBQQCD99ALuYA==
X-Proofpoint-GUID: ehfIAWn_MNnWIkFzcze2Q51OSdUV0EL3
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae471b9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=bRw_O-wRVFlVsUPLYksA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ehfIAWn_MNnWIkFzcze2Q51OSdUV0EL3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX760FA6XEls1g
 RekxMu0hqGcJyYPulJtZfbvXploxn60x+m+FKIra7ZboaNpG3S2xO/or1+NS6CkumL3ANPdNW33
 wDvTPr2mLFdp1pR9PXRSC1giXX9ujE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300041

On 29-10-2026 03:25 pm, Greg Kroah-Hartman wrote:
> On Thu, Oct 29, 2026 at 12:40:06AM +0530, Faisal Hassan wrote:
>> Hi all,
>>
>> A gentle ping on this v2 when you get a chance.
>>
>> It addresses the sashiko review comments on v1: a linearized request is
>> now unmapped before its bounce buffer is freed, and an allocation
>> failure or a short SG list is returned from usb_ep_queue() instead of
>> leaving the request stuck on pending_list.
>>
>> Please let me know if you have any comments, or if you'd like me to
>> change anything.
> 
> You seem to have missed the review comments on this patch:
> 	https://lore.kernel.org/r/sashiko-outbox-162302@kernel.org

Hi Greg,

Sorry for the noise, and thank you for pointing me to the review. I
had read it but should have replied on the list before pinging.

Both comments look pre-existing to me:

1) The unmap/re-map leak of a request that is mapped but gets no TRB
    dates back to cdb55b39fab8 and 4a71fcb8ac5f and affects all
    requests. v2 only unmaps a linearized request before freeing its
    bounce buffer.

2) The isoc error return after the request is on pending_list comes
    from 25abad6a0584. v2 does not change it, as the new failure paths
    return before the request is queued.

I can fix 1) in a separate patch or as a first patch in a v3 series,
whichever you and Thinh prefer. For 2), please let me know if you want
it handled here.

Thanks for your patience, and sorry again for the extra mail.

Faisal
