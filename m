Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E42E43FD01
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511819; cv=none; b=a97gwQdUtiPNqoHAgv30fbStiON0hd8+IjPUnC8/htfsbVGnkMY5bo2YyTCIjsTvJInZOAuA+tjJtKTN0/qb65gA52dNXubj9bNzbtFSgZ33vxjW/G/mdcEJ/JDWmJSFjixPUcq3i0wm8OsT3H7ksBAUmD32AFssyjK8130jC1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511819; c=relaxed/simple;
	bh=0pU7V1X2JFjz4M6FXCGBcfn5PGpxipf5EpXyHxXcLXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3wW8QfcPuICmjjnfkNAKaw+B4TVUxxM/ByPEG4bYnC72AziqWG1O70AVFeUyrhZQam7w8z2KmkAZhry4EY0ElR5d5D+TymDJgw5e8e9XAITGk7M/48efkBIFRbBYPosBiSoW3dXAqfYcEl1tXCMVsjron46FolE0Tg8HVHHJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alIDvC5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIjeXoID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alIDvC5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIjeXoID"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOY0s206191
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 15:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kwLCSznxCkL597097bUSklsJ5U8QkIwPpXzyc9BdoXc=; b=alIDvC5jdU4Kuql5
	5YAwagy4zNkf2U/LVigdjy8QkAbAYBhlKpaUFNjQhvHBKrfqpzOTxcqBArer71qZ
	h4VReL6Xhg7VmW80SuIAnO1OJUwniNVnfecED0LTvvaH1r0xn3STN6hu54R6xrPe
	JbceUBKUKsJqCwSv/uvT0akHVwQSE/EO9tY7/AB0+TBwn4uPmu9X2PgxDTSaCntJ
	LLrJKEkiiwHxF8IWxWk8XEr3uezAM1ZNZ5yc94J9tifjPI9JxMCJqu7YM/tDsdoe
	nrZlQDACRBQDo5ow2CWMe3e2Tb4evuyiLhVyj6xD5SoJg+iAYqnI9137egNih+fM
	VR3E7Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dh0nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 15:30:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf9f78f126so24627e0c.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785511817; x=1786116617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwLCSznxCkL597097bUSklsJ5U8QkIwPpXzyc9BdoXc=;
        b=FIjeXoIDbL2gSldz6H2FAj2je39erxLOndy79TjQswY52zbxi1ElRI8cVqxHc9nY9Q
         Ebbo3bXE1tqywiPJPrFfOYCWPe8oMIxNQLDpXHRph6zKj//Vj8THlFZIZbDO/oOxMxiw
         0W1m/93ZE3cI+x4Olv8cnl5QSje57Wen22DX4zDkLxTxm818uDon12rkK3kFvsTRUnFr
         rGvl3LlLeDb1iVSVJVS2Wn5asPvRKftuKVmsuRGWnZX1VUl1VAWv9qrO8u6X2AamsjME
         qTTQVObG/PjYOkGbLxhelERmCfJZd6HT/5Ua3abHew/sUGz83fv8dLFHuD8TgMHd2MlW
         JgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511817; x=1786116617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwLCSznxCkL597097bUSklsJ5U8QkIwPpXzyc9BdoXc=;
        b=Az/ATr3W9sW0myZfSnkoEqTBAzBHmPPJD1n4idC9IP0AQBVMbz2Tx8zhu0+3iz7KWQ
         Kb/cfWrnCuEmUiBz3ePB77AmWnjc2GIxQ1aKLqe4JJh1c9PI3rgE5YgDEB/1uh20rZYl
         6ImojL2s2nLIXy7w6itvBFmoDhjwymUkZJomns9TuPMVFqO51x740hXfHDHRRrNYYkQM
         Ol4vjbA75vT7t8R/iJnRK4/66D5WZP7hBNF8hU56w7YUa1eXSpFIT2Ig7zyRLuPhMGHm
         CR4IdZAhzHu9njZjwk8L9sbHDVCK3wAeiuUDFFOmRVLIvU6qcUNt6Huwx8tfhunyvhDx
         2uzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8qLsWy4VMxnzDXkza2x4J7FF6x717Kvbrc0WUqH3jeF6BxSF5cMdptzG9B+Z7KcEIq71vR/7+wwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy286Rs9etsDrGM9FnHOdpgdsyUNHHazXOliunFmN9A/1YwM2qo
	MJq+YoQb61dgRiwo/zn/mp1T+9kXsCH+mA9zetEFiabbPf/OqduNxJUcdeWV7Wd5ZGapltERD1A
	GxJr+ASnbygrhslDDUel/Wz3M1Hcx4aaOpbwJPMw5tB+z3teAc04Er1zHq+/A1qI=
X-Gm-Gg: AR+sD13+VDM0Q9oBat9wjTh1bQNa92Lakrhf3XGkgBknNKf1yRssH0BbUJLGXizPJzh
	AWdIgQe572p2DLRSLFyYfZrzPmzzzwsG/Q5uzJVXDrhhmwDZrqYbcJAur+LanefZ1oWo211ct17
	zaOTzhMBfX7XfzZltbh3+I2d7P+89XdnZwn6w/A6Cz/KLT6MdcEpxr3P6l+ESuGtPGZUyn+6yLj
	kBrxKNWFfe6mrWRpSzPcJNmSi0FdQIpFoJx+VWItPfRmgCL9RgZ1JpEadMX3lIJ9RAn3tTJVpWl
	b+7W4NZhlDRt8/DeHKiRHeUYT82fr2f8gW5Ea4wFZd6+hja65ZjwrxCy4RzDS45AOq/xLrIZIbO
	qzBUeyvd40pWkqqQBYWKoNyEN
X-Received: by 2002:a05:6102:f8c:b0:74c:551:54d2 with SMTP id ada2fe7eead31-75b2507b572mr356117137.4.1785511816746;
        Fri, 31 Jul 2026 08:30:16 -0700 (PDT)
X-Received: by 2002:a05:6102:f8c:b0:74c:551:54d2 with SMTP id ada2fe7eead31-75b2507b572mr356069137.4.1785511816244;
        Fri, 31 Jul 2026 08:30:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63d9aesm2491006a12.19.2026.07.31.08.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:30:14 -0700 (PDT)
Message-ID: <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 17:30:12 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xjDAeJl1Xd4Ua7TVkIypits3w9ozomVq
X-Proofpoint-GUID: xjDAeJl1Xd4Ua7TVkIypits3w9ozomVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExNyBTYWx0ZWRfX4UFFY0srtr0C
 +3fYVpJLJCMQGaRn/EAXl3rDSyzfvJwBormMAhzvXFQ5Q5QWiMgW8C3kGSSji/atu+GrA+e+vsL
 JVxs4RZ+LW0rlj8C1mhiCDcgAtxPRiJRNP9Hp5EDU+rcvwrhvCf0IrNeqDs79sO+2NbMSM2TjWR
 pqh40/WVh2GnCeYZS1pbKz/xGNQbZci+ELFR69CNDZc3CGEpWfDSIXVUHiyMLJoj2e06W3UbOEr
 hIDGCZQXBmbvRiSDBxPJBL4Tzsq8UTPgL+rf07aTG2SS1hmGh3YEApRm7Oz7Cd1nidhtAcrIPmu
 tFaexzbl6K4YbG7yN6BX+S7b7LSSgDovg1lnr2f4HXTEg/S+dYq7YZnjyNqWiTt1xOBE6va3wKK
 WOA4wdNogOH/LWe/IojodtyPPmfdyYZnMqyA3acPEymPd4P69E3QnOaqstUbxdn2KCXoXazq9Fh
 +2gnFDt39Lclb2sHEJQ==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cbf89 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1c9Td-a2zn6UPMTxHJYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExNyBTYWx0ZWRfX4xb44AyId/7+
 YXsimu65Zj9r+E4JGnp9pIN2XlW4B3snL/mGJ6X1cG/4CVjjCp2WjHk2n4/VW1KXk/K+dJRCY0N
 PA0G8y0OBO6xv4pY+23L9Abmx8ZB8bc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310117

On 7/31/26 4:44 PM, Esteban Urrutia wrote:
> On 7/31/26 5:58 AM, Krzysztof Kozlowski wrote:
>> On Fri, Jul 31, 2026 at 01:00:08AM -0400, Esteban Urrutia wrote:
>>> Due to a different process design, SM8475 (4 nm) SoC takes things from both
>>> SM8450 (4 LPX) and SM8550 (4 nm) SoCs.
>>
>> What things? This is just unspecific and not useful. And I doubt that it
>> is even "different process design", because how one would know that?
> 
> 
> The process design is specified on the corresponding datasheets for
> these SoCs, which are flying somewhere around the internet.
> Also [1].
> 
>>> Add a separate compatible string for this SoC to avoid possible confusions.
>>
>> No, explain the hardware compatibility.
>>
>> Add foo bar, which is not compatible with baz because it uses bam bam in
>> different setup (difference in registers, e.g. XYZ and ABC),
> 
> How does this commit message based on what was said in [1] sound to you?

That made more sense because the electrical differences are what made
the PHY init sequence changes necessary. Here, Krzysztof is trying to
express that the pmic-glink interface found on SM8475 is likely no
different than the one found on SM8450 (and SM8350 and so on)

Then, since it's the same, it can reuse the same driver match data,
so patch 2 is unnecessary, since the driver binds said match data
on the fallback "qcom,pmic-glink" compatible

Konrad
